package com.platform.JiaZhengService.Controller.mobile;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.util.JiaZhengServiceUtil;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.service.api.MemberService;

/**
 * Controller - 会员登录
 */
@Controller("mobileLoginController")
@RequestMapping("/mobile/login")
public class LoginController extends AbstractController {
	private static final String authorize = "http://mocovip.sinaapp.com/eshop_authorize.php?";

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	/**
	 * 登录页面
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(String redirectUrl, HttpServletRequest request, ModelMap model) {
		Setting setting = SettingUtils.get();
		String openId = request.getParameter("token");
		System.out.println("openId======" + openId);
		String redirect = authorize + "callback_url=" + setting.getSiteUrl() + "/mobile/login/index.jhtml";
		if (JiaZhengServiceUtil.isEmpty(openId) && JiaZhengServiceUtil.getIsWeChatBrowser(request)) {
			return "redirect:" + redirect;
		}
		TMember member = memberService.getCurrent();
		if (member != null) {
			return "redirect:/mobile/member/index.jhtml";
		}
		if (redirectUrl != null && !redirectUrl.equalsIgnoreCase(setting.getSiteUrl())
				&& !redirectUrl.startsWith(request.getContextPath() + "/")
				&& !redirectUrl.startsWith(setting.getSiteUrl() + "/")) {
			redirectUrl = null;
		}
		model.addAttribute("openId", openId);
		model.addAttribute("redirectUrl", redirectUrl);
		model.addAttribute("captchaId", UUID.randomUUID().toString());
		return "/mobile/login/index";
	}

}
