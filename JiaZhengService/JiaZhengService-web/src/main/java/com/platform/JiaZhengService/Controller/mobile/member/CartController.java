package com.platform.JiaZhengService.Controller.mobile.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.platform.JiaZhengService.Controller.mobile.AbstractController;

@Controller("mobileCartController")
@RequestMapping("/mobile/member/cart")
public class CartController extends AbstractController {

	/**
	 * 购物篮列表
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		return "/mobile/member/cart/index";
	}
}
