package com.platform.JiaZhengService.Controller.mobile.member;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.platform.JiaZhengService.Controller.mobile.AbstractController;
import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.pojo.ServiceTime;
import com.platform.JiaZhengService.common.util.JiaZhengServiceUtil;
import com.platform.JiaZhengService.dao.entity.TCart;
import com.platform.JiaZhengService.dao.entity.TCartItem;
import com.platform.JiaZhengService.dao.entity.TCouponCode;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.entity.TOrder.PaymentStatus;
import com.platform.JiaZhengService.dao.entity.TPaymentMethod;
import com.platform.JiaZhengService.dao.entity.TPluginConfig;
import com.platform.JiaZhengService.dao.entity.TReceiver;
import com.platform.JiaZhengService.pluginService.PaymentPlugin;
import com.platform.JiaZhengService.service.api.CartItemService;
import com.platform.JiaZhengService.service.api.CartService;
import com.platform.JiaZhengService.service.api.CouponCodeService;
import com.platform.JiaZhengService.service.api.MemberService;
import com.platform.JiaZhengService.service.api.OrderService;
import com.platform.JiaZhengService.service.api.PaymentMethodService;
import com.platform.JiaZhengService.service.api.PluginConfigService;
import com.platform.JiaZhengService.service.api.PluginService;
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

	@Resource(name = "paymentMethodServiceImpl")
	private PaymentMethodService paymentMethodService;

	@Resource(name = "pluginServiceImpl")
	private PluginService pluginService;

	@Resource(name = "pluginConfigServiceImpl")
	private PluginConfigService pluginConfigService;

	@Resource(name = "couponCodeServiceImpl")
	private CouponCodeService couponCodeService;

	/**
	 * 订单锁定
	 * 
	 * @param sn
	 *            订单编号
	 * @return
	 */
	@RequestMapping(value = "/lock", method = RequestMethod.POST)
	public @ResponseBody boolean lock(String sn) {
		TOrder order = orderService.findBySn(sn);
		if (order != null && memberService.getCurrent().equals(order.getMember()) && !order.isExpired()
				&& !order.isLocked(null) && order.getPaymentMethod() != null
				&& paymentMethodService.find(order.getPaymentMethod()).getMethod() == TPaymentMethod.Method.online
						.getCode()
				&& (order.getPaymentStatus() == PaymentStatus.unpaid.getCode()
						|| order.getPaymentStatus() == PaymentStatus.partialPayment.getCode())) {
			order.setLockExpire(DateUtils.addSeconds(new Date(), 20));
			order.setOperator(null);
			orderService.updateOrder(order);
			return true;
		}
		return false;
	}

	/**
	 * 检查支付
	 * 
	 * @param sn
	 *            订单编号
	 * @return
	 */
	@RequestMapping(value = "/check_payment", method = RequestMethod.POST)
	public @ResponseBody boolean checkPayment(String sn) {
		TOrder order = orderService.findBySn(sn);
		if (order != null && memberService.getCurrent().equals(order.getMember())
				&& order.getPaymentStatus() == PaymentStatus.paid.getCode()) {
			return true;
		}
		return false;
	}

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
			if (cartItem != null) {
				cartItem.setQuantity(quantity);
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
		List<ServiceTime> times = JiaZhengServiceUtil.formLastServiceTimes(7);
		List<TCouponCode> couponCodes = couponCodeService.findCouponCodes(cart, member.getId(), false);
		model.addAttribute("couponCodes", couponCodes);
		model.addAttribute("times", times);
		model.addAttribute("cartItemIds", cartItemIds);
		model.addAttribute("productId", productId);
		model.addAttribute("specificationId", specificationId);
		model.addAttribute("quantity", quantity);
		model.addAttribute("isSquare", cart.isAreaSquare());
		model.addAttribute("defaultReceiver", defaultReceiver);
		model.addAttribute("receivers", receivers);
		TOrder order = orderService.build(cart, null, "", null, null, false, null);
		model.addAttribute("order", order);
		return "/mobile/member/order/info";
	}

	/**
	 * 计算
	 */
	@RequestMapping(value = "/calculate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> calculate(String cartItemIds, Long productId, Long specificationId,
			Double quantity, String code, String memo) {
		Map<String, Object> data = new HashMap<String, Object>();
		TMember member = memberService.getCurrent();
		TCart cart = cartService.findByMember(member.getId());
		List<TCartItem> cartItems = new ArrayList<>();
		if (StringUtils.isEmpty(cartItemIds)) {
			TCartItem cartItem = cartItemService.findByParams(cart.getId(), productId, specificationId);
			if (cartItem != null) {
				cartItem.setQuantity(quantity);
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
		cart.setCartItems(cartItems);
		TCouponCode couponCode = null;
		if (code != null) {
			couponCode = this.couponCodeService.findByCode(code);
		}
		TOrder order = orderService.build(cart, null, "", null, couponCode, false, null);
		data.put("message", SUCCESS_MESSAGE);
		data.put("couponDiscount", order.getCouponDiscount());
		data.put("amountPayable", order.getAmountPayable());
		return data;
	}

	/**
	 * 订单完成创建操作
	 * 
	 * @return
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody Message create(ModelMap model, String paymentPluginId, Long receiverId, String weekdays,
			String timearea, String time, String areaSquare, String memo, String code, String cartItemIds,
			Long productId, Long specificationId, Double quantity) {
		TMember member = memberService.getCurrent();
		TCart cart = cartService.findByMember(member.getId());
		if (cart == null) {
			return Message.warn("shop.order.cartNotEmpty");
		}
		List<TCartItem> cartItems = new ArrayList<>();
		if (StringUtils.isEmpty(cartItemIds)) {
			TCartItem cartItem = cartItemService.findByParams(cart.getId(), productId, specificationId);
			if (cartItem != null) {
				cartItem.setQuantity(quantity);
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
			return Message.warn("shop.order.cartNotEmpty");
		}
		cart.setCartItems(cartItems);
		TReceiver receiver = receiverService.find(receiverId);
		if (receiver == null) {
			return Message.error("shop.order.receiverNotExsit");
		}
		TPaymentMethod paymentMethod = paymentMethodService.find(1L);
		if (paymentMethod == null) {
			return Message.error("shop.order.paymentMethodNotExsit");
		}
		TCouponCode couponCode = null;
		if (code != null) {
			couponCode = this.couponCodeService.findByCode(code);
		}
		TOrder order = orderService.create(cart, receiver, paymentPluginId, paymentMethod, couponCode, false, weekdays,
				timearea, time, areaSquare, memo);
		return Message.success(order.getSn());
	}

	/**
	 * 订单支付
	 * 
	 * @param model
	 * @param sn
	 *            订单编号
	 * @return
	 */
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment(ModelMap model, String sn, HttpServletRequest request) {
		TOrder order = orderService.findBySn(sn);
		if (order == null) {
			model.addAttribute("content", Message.warn("shop.order.orderNotFound"));
			return ERROR_VIEW;
		}
		TPaymentMethod paymentMethod = paymentMethodService.find(order.getPaymentMethod());
		List<PaymentPlugin> paymentPlugins = pluginService.getPaymentPlugins(true);
		// 即时交易
		PaymentPlugin paymentPlugin = pluginService.getPaymentPlugin("alipayDirectPlugin");
		// 纯网关交易
		TPluginConfig pluginConfig = pluginConfigService.findByPluginId(order.getPaymentPluginId());
		if (pluginConfig != null) {
			String paymentName = pluginConfig.getAttribute("paymentName");
			model.addAttribute("paymentName", paymentName);
			model.addAttribute("pluginConfig", pluginConfig);
		}
		String timeoutStr = JiaZhengServiceUtil
				.getOrderTimeOut(paymentMethod != null ? paymentMethod.getTimeout() : null);
		model.addAttribute("paymentPlugin", paymentPlugin);
		model.addAttribute("order", order);
		model.addAttribute("paymentMethod", paymentMethod);
		model.addAttribute("timeoutStr", timeoutStr);
		model.addAttribute("paymentPlugins", paymentPlugins);
		model.addAttribute("isWeChatBrowser", JiaZhengServiceUtil.getIsWeChatBrowser(request));
		return "/mobile/member/order/payment";
	}

}
