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
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.pojo.Principal;
import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.util.JiaZhengServiceUtil;
import com.platform.JiaZhengService.common.util.RegUtils;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.common.util.SpringUtils;
import com.platform.JiaZhengService.common.util.WebUtils;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.service.api.MemberService;

@Controller("mobileRegisterController")
@RequestMapping("/mobile/register")
public class RegisterController extends AbstractController {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	/**
	 * 注册页面
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String loginIndex(ModelMap model) {
		return "/mobile/register/index";
	}

	/**
	 * 用户注册手机短信验证
	 */
	@RequestMapping(value = "/getRegisterValidateCode", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getValidateCode(String mobile) {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			// 随机生成6位验证码
			Double d = Math.random();
			int validateCodeInt = (int) (d * 900000 + 100000);
			// String validateCode = String.valueOf(validateCodeInt);
			String validateCode = "666666";
			String msg = validateCode + SpringUtils.getMessage("admin.validate.sms.info");
			Setting setting = SettingUtils.get();
			String safeKey = UUID.randomUUID().toString() + DigestUtils.md5Hex(RandomStringUtils.randomAlphabetic(30));
			Date safeKeyExpireTime = setting.getSafeKeyExpiryTime() != 0
					? DateUtils.addMinutes(new Date(), setting.getSafeKeyExpiryTime()) : null;
			// HashMap returnData =
			// SmsCellUtil.getInstance().sendDone(mobile, msg,
			// DateUtil.getCurrentDate());
			System.out.println("-----------validateCode is " + validateCode);
			Map<String, String> returnData = new HashMap<>();
			returnData.put("return", "0");
			if ("0".equals(returnData.get("return"))) {
				data.put("validateCode", validateCode);
				data.put("safeKey", safeKey);
				data.put("safeKeyExpireTime", safeKeyExpireTime);
				data.put("msg", "success");
			} else {
				data.put("validateCode", "");
				data.put("msg", "获取手机短信验证失败");
			}
		} catch (Exception e) {
			data.put("validateCode", "");
			data.put("msg", "获取手机短信验证失败");
		}
		return data;
	}

	/**
	 * 注册提交
	 */
	@RequestMapping(value = "/registSubmit", method = RequestMethod.POST)
	public @ResponseBody Message registSubmit(String password, String email, String name, String address, String mobile,
			Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		String username = mobile;
		Setting setting = SettingUtils.get();
		if (!setting.getIsRegisterEnabled()) {
			return Message.error("shop.register.disabled");
		}
		if (StringUtils.isEmpty(mobile)) {
			return Message.error("手机号码不可以为空");
		}
		if (memberService.mobileUnique(mobile)) {
			return Message.error("手机号码已经被注册，请更换");
		}
		if (memberService.usernameDisabled(username) || memberService.usernameExists(username)) {
			return Message.error("shop.register.disabledExist");
		}
		if (password.length() < setting.getPasswordMinLength() || password.length() > setting.getPasswordMaxLength()) {
			return Message.error("shop.common.passwordLeninvalid");
		}
		if (!RegUtils.isMobileNO(mobile)) {
			return Message.error("手机号格式错误");
		}

		TMember member = new TMember();
		member.setName(name);
		member.setUsername(username.toLowerCase());
		member.setPassword(DigestUtils.md5Hex(password));
		member.setEmail(email);
		member.setPoint(setting.getRegisterPoint());
		member.setLoginFailureCount(0);
		member.setRegisterIp(JiaZhengServiceUtil.getAddr(request));
		member.setLoginIp(JiaZhengServiceUtil.getAddr(request));
		member.setLockedDate(null);
		member.setLoginDate(new Date());
		member.setAddress(address);
		member.setMobile(mobile);
		memberService.addMember(member);

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
		String key = TMember.PRINCIPAL_ATTRIBUTE_NAME;
		if (logger.isInfoEnabled()) {
			logger.info("now login user session key is " + key + ",username is " + member.getUsername());
		}
		System.out.println(key);
		session.setAttribute(key, new Principal(member.getId(), member.getUsername()));
		WebUtils.addCookie(request, response, TMember.USERNAME_COOKIE_NAME, member.getUsername());
		WebUtils.addCookie(request, response, TMember.NAME_COOKIE_NAME, member.getName());

		return Message.success("shop.register.success");
	}
}
