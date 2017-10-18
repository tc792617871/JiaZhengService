package com.platform.JiaZhengService.Controller.mobile;

import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.pojo.Principal;
import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.pojo.Setting.AccountLockType;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.common.util.SpringUtils;
import com.platform.JiaZhengService.common.util.WebUtils;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.service.api.MemberService;
import com.platform.JiaZhengService.service.api.RSAService;

/**
 * Controller - 会员登录
 */
@Controller("mobileLoginController")
@RequestMapping("/mobile/login")
public class LoginController extends AbstractController {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@Resource(name = "rsaServiceImpl")
	private RSAService rsaService;

	/**
	 * 登录页面
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(String redirectUrl, HttpServletRequest request, ModelMap model) {
		Setting setting = SettingUtils.get();
		TMember member = memberService.getCurrent();
		if (member != null) {
			return "redirect:/mobile/member/index.jhtml";
		}
		if (redirectUrl != null && !redirectUrl.equalsIgnoreCase(setting.getSiteUrl())
				&& !redirectUrl.startsWith(request.getContextPath() + "/")
				&& !redirectUrl.startsWith(setting.getSiteUrl() + "/")) {
			redirectUrl = null;
		}
		model.addAttribute("redirectUrl", redirectUrl);
		return "/mobile/login/index";
	}

	/**
	 * 登录提交
	 */
	@RequestMapping(value = "/loginSubmit", method = RequestMethod.POST)
	public @ResponseBody Message loginSubmit(String username, String openId, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		String password = rsaService.decryptParameter("enPassword", request);
		rsaService.removePrivateKey(request);
		if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
			return Message.error("shop.common.invalid");
		}
		Setting setting = SettingUtils.get();
		TMember member = memberService.findByUsername(username);
		if (member == null) {
			return Message.error("shop.login.unknownAccount");
		}
		if (!member.getIsEnabled()) {
			return Message.error("shop.login.disabledAccount");
		}
		boolean locked = memberService.checkLockedStatus(member, setting);
		if (locked) {
			return Message.error("shop.login.lockedAccount", setting.getAccountLockTime());
		}
		String lowerPassword = DigestUtils.md5Hex(password).toLowerCase();
		if (!lowerPassword.equals(member.getPassword().toLowerCase())) {
			int loginFailureCount = member.getLoginFailureCount() + 1;
			if (loginFailureCount >= setting.getAccountLockCount()) {
				member.setIsLocked(true);
				member.setLockedDate(new Date());
			}
			member.setLoginFailureCount(loginFailureCount);
			memberService.updateMember(member);
			if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.member)) {
				return Message.error("shop.login.accountLockCount", setting.getAccountLockCount());
			} else {
				return Message.error("shop.login.incorrectCredentials");
			}
		}
		member.setWeChatOpenId(openId);
		memberService.updateLoginStatus(request, member);
		syncCart(request, response, session, member);
		return SUCCESS_MESSAGE;
	}

	/**
	 * 同步登录信息
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param member
	 */
	protected void syncCart(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			TMember member) {

		Map<String, Object> attributes = new HashMap<String, Object>();
		Enumeration<?> keys = session.getAttributeNames();
		while (keys.hasMoreElements()) {
			String key = (String) keys.nextElement();
			attributes.put(key, session.getAttribute(key));
		}
		session.invalidate();
		session = request.getSession();
		for (Entry<String, Object> entry : attributes.entrySet()) {
			session.setAttribute(entry.getKey(), entry.getValue());
		}
		session.setAttribute(TMember.PRINCIPAL_ATTRIBUTE_NAME, new Principal(member.getId(), member.getUsername()));
		WebUtils.addCookie(request, response, TMember.USERNAME_COOKIE_NAME, member.getUsername());
		WebUtils.addCookie(request, response, TMember.NAME_COOKIE_NAME, member.getName());
	}

	/**
	 * 忘记密码
	 */
	@RequestMapping(value = "/forgetPwd", method = RequestMethod.GET)
	public String forgetPwd(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return "/mobile/login/forgetPwd";
	}

	/**
	 * 手机短信验证
	 */
	@RequestMapping(value = "/getValidateCode", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getValidateCode(String phoneNumber) {
		Map<String, Object> data = new HashMap<String, Object>();
		TMember member = memberService.findByUsername(phoneNumber);
		try {
			if (member != null) {
				// 随机生成6位验证码
				Double d = Math.random();
				int validateCodeInt = (int) (d * 900000 + 100000);
				String validateCode = String.valueOf(validateCodeInt);
				String msg = validateCode + SpringUtils.getMessage("admin.validate.sms.info");
				member.setValidateCode(validateCode);
				Setting setting = SettingUtils.get();
				member.setSafeKeyValue(
						UUID.randomUUID().toString() + DigestUtils.md5Hex(RandomStringUtils.randomAlphabetic(30)));
				member.setSafeKeyExpire(setting.getSafeKeyExpiryTime() != 0
						? DateUtils.addMinutes(new Date(), setting.getSafeKeyExpiryTime()) : null);
				// HashMap returnData =
				// SmsCellUtil.getInstance().sendDone(phoneNumber, msg,
				// DateUtil.getCurrentDate());
				System.out.println(validateCode);
				Map<String, String> returnData = new HashMap<>();
				returnData.put("return", "0");
				if ("0".equals(returnData.get("return"))) {
					memberService.updateMember(member);
					data.put("validateCode", validateCode);
					data.put("msg", "success");
				} else {
					data.put("validateCode", "");
					data.put("msg", "获取手机短信验证失败");
				}
			} else {
				data.put("validateCode", "");
				data.put("msg", "手机号码系统中不存在");
			}
		} catch (Exception e) {
			data.put("validateCode", "");
			data.put("msg", "获取手机短信验证失败");
		}
		return data;
	}

	/**
	 * 重置密码
	 */
	@RequestMapping(value = "/resetPwd", method = RequestMethod.GET)
	public String resetPwd(String phoneNumber, String validateCode, ModelMap model) {
		TMember member = memberService.findByUsername(phoneNumber);
		model.addAttribute("phoneNumber", phoneNumber);
		model.addAttribute("validateCode", validateCode);
		model.addAttribute("member", member);
		model.addAttribute("key", member.getSafeKeyValue());
		return "/mobile/login/resetPwd";
	}

	/**
	 * 注销
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.removeAttribute(TMember.PRINCIPAL_ATTRIBUTE_NAME);
		WebUtils.removeCookie(request, response, TMember.USERNAME_COOKIE_NAME);
		WebUtils.removeCookie(request, response, TMember.NAME_COOKIE_NAME);
		return "redirect:/mobile/mobileIndex.jhtml";
	}

	/**
	 * 重置密码提交
	 */
	@RequestMapping(value = "/resetPasswordSubmit", method = RequestMethod.POST)
	public @ResponseBody Message resetPasswordSubmit(Long uid, String key, String newPassword,
			HttpServletRequest request, ModelMap model) {
		TMember member = memberService.find(uid);
		String password = rsaService.decryptParameter("newPassword", request);
		if (member == null) {
			return Message.warn("admin.password.invalidMember");
		}
		Setting setting = SettingUtils.get();
		if (password.length() < setting.getPasswordMinLength() || password.length() > setting.getPasswordMaxLength()) {
			return Message.warn("admin.password.invalidPassword");
		}
		String safeKey = member.getSafeKeyValue();
		Date safeKeyExpire = member.getSafeKeyExpire();
		if (StringUtils.isEmpty(safeKey) || !safeKey.equals(key)) {
			return Message.error("admin.password.hasExpired");
		}
		if (safeKeyExpire != null && new Date().after(safeKeyExpire)) {
			return Message.error("admin.password.hasExpired");
		}
		member.setPassword(DigestUtils.md5Hex(password));
		member.setSafeKeyExpire(new Date());
		member.setSafeKeyValue(null);
		memberService.updateMember(member);
		return SUCCESS_MESSAGE;
	}

}
