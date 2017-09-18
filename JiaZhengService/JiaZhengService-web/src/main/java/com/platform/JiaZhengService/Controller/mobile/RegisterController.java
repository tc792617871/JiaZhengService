package com.platform.JiaZhengService.Controller.mobile;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
