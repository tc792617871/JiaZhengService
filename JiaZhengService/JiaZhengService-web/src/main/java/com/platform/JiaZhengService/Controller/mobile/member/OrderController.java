package com.platform.JiaZhengService.Controller.mobile.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.platform.JiaZhengService.Controller.mobile.AbstractController;

/**
 * Controller - mobile 订单管理
 * 
 */
@Controller("mobileOrderController")
@RequestMapping("/mobile/member/order")
public class OrderController extends AbstractController {

	/**
	 * 订单信息
	 * 
	 * @param model
	 * @param code
	 *            优惠码
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(ModelMap model, String code) {
		return "/mobile/member/order/info";
	}

}
