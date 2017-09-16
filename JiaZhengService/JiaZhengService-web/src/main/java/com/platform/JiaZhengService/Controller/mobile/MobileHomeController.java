package com.platform.JiaZhengService.Controller.mobile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller - mobile 首页
 */
@Controller("mobileHomeController")
@RequestMapping("/mobile")
public class MobileHomeController extends AbstractController {
	/**
	 * mobile首页
	 */
	@RequestMapping(value = "/mobileIndex", method = RequestMethod.GET)
	public String mobileIndex(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		return "/mobile/index";
	}
}
