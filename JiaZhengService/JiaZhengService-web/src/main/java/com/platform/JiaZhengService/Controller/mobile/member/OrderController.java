package com.platform.JiaZhengService.Controller.mobile.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.platform.JiaZhengService.Controller.mobile.AbstractController;
import com.platform.JiaZhengService.dao.entity.TCart;
import com.platform.JiaZhengService.dao.entity.TCartItem;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.entity.TReceiver;
import com.platform.JiaZhengService.service.api.CartItemService;
import com.platform.JiaZhengService.service.api.CartService;
import com.platform.JiaZhengService.service.api.MemberService;
import com.platform.JiaZhengService.service.api.OrderService;
import com.platform.JiaZhengService.service.api.ReceiverService;

/**
 * Controller - mobile 订单管理
 * 
 */
@Controller("mobileOrderController")
@RequestMapping("/mobile/member/order")
public class OrderController extends AbstractController {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@Resource(name = "receiverServiceImpl")
	private ReceiverService receiverService;

	@Resource(name = "cartItemServiceImpl")
	private CartItemService cartItemService;

	@Resource(name = "cartServiceImpl")
	private CartService cartService;

	@Resource(name = "orderServiceImpl")
	private OrderService orderService;

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
	public String info(ModelMap model, String cartItemIds, Long productId, Long specificationId, Double quantity) {
		TMember member = memberService.getCurrent();
		TCart cart = cartService.findByMember(member.getId());
		if (cart == null) {
			return "redirect:/mobile/member/cart/index.jhtml";
		}
		List<TCartItem> cartItems = new ArrayList<>();
		if (StringUtils.isEmpty(cartItemIds)) {
			TCartItem cartItem = cartItemService.findByParams(cart.getId(), productId, specificationId);
			cartItem.setQuantity(quantity);
			if (cartItem != null) {
				cartItems.add(cartItem);
			}
		} else {
			String[] cartItemIdsArr = cartItemIds.split("-");
			for (String id : cartItemIdsArr) {
				TCartItem cartItem = cartItemService.find(Long.valueOf(id));
				if (cartItem != null) {
					cartItems.add(cartItem);
				}
			}
		}
		if (cartItems == null || cartItems.size() == 0) {
			return "redirect:/mobile/member/cart/index.jhtml";
		}
		cart.setCartItems(cartItems);
		TReceiver defaultReceiver = receiverService.findDefault(member.getId());
		List<TReceiver> receivers = receiverService.findReceiversByMemberID(member.getId());
		model.addAttribute("defaultReceiver", defaultReceiver);
		model.addAttribute("receivers", receivers);
		TOrder order = orderService.build(cart, null, "", null, null, false, null, "", "");
		model.addAttribute("order", order);
		return "/mobile/member/order/info";
	}

}
