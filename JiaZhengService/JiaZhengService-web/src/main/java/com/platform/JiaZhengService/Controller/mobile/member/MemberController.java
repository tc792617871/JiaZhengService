package com.platform.JiaZhengService.Controller.mobile.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.platform.JiaZhengService.Controller.mobile.AbstractController;
import com.platform.JiaZhengService.service.api.MemberService;

@Controller("mobileMemberController")
@RequestMapping("/mobile/member")
public class MemberController extends AbstractController {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String loginIndex(ModelMap model) {
		return "/mobile/member/index";
	}

	@RequestMapping(value = "/myOrder", method = RequestMethod.GET)
	public String myOrder(ModelMap model) {
		return "/mobile/member/myOrder";
	}

	/**
	 * 订单详情页面
	 */
	@RequestMapping(value = "/orderDetails", method = RequestMethod.GET)
	public String listOrderDetails(Long id, ModelMap model) {
		return "/mobile/member/orderDetails";
	}

}
