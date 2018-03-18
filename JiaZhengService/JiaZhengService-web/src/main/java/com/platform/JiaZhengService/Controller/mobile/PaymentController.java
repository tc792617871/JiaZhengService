package com.platform.JiaZhengService.Controller.mobile;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.util.OrderSnUtil;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.entity.TOrder.PaymentStatus;
import com.platform.JiaZhengService.dao.entity.TPayment;
import com.platform.JiaZhengService.dao.entity.TPayment.Method;
import com.platform.JiaZhengService.dao.entity.TPayment.Status;
import com.platform.JiaZhengService.dao.entity.TPayment.Type;
import com.platform.JiaZhengService.dao.entity.TPaymentMethod;
import com.platform.JiaZhengService.pluginService.PaymentPlugin;
import com.platform.JiaZhengService.pluginService.PaymentPlugin.NotifyMethod;
import com.platform.JiaZhengService.service.api.MemberService;
import com.platform.JiaZhengService.service.api.OrderService;
import com.platform.JiaZhengService.service.api.PaymentMethodService;
import com.platform.JiaZhengService.service.api.PaymentService;
import com.platform.JiaZhengService.service.api.PluginService;
import com.platform.JiaZhengService.service.api.SmsMqListService;

/**
 * Controller - 支付
 * 
 */
@Controller("mobilePaymentController")
@RequestMapping("/mobile/payment")
public class PaymentController extends AbstractController {

	@Resource(name = "orderServiceImpl")
	private OrderService orderService;

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@Resource(name = "pluginServiceImpl")
	private PluginService pluginService;

	@Resource(name = "paymentServiceImpl")
	private PaymentService paymentService;

	@Resource(name = "smsMqListServiceImpl")
	private SmsMqListService smsMqListService;

	@Resource(name = "paymentMethodServiceImpl")
	private PaymentMethodService paymentMethodService;

	/**
	 * 提交
	 */
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public String submit(Type type, String paymentPluginId, String sn, Double amount, String bank, String bankName,
			HttpServletRequest request, HttpServletResponse response, ModelMap model,
			RedirectAttributes redirectAttributes) {
		TMember member = memberService.getCurrent();
		if (member == null) {
			model.addAttribute("content", Message.warn("shop.order.member.notLogin"));
			return ERROR_VIEW;
		}
		PaymentPlugin paymentPlugin = pluginService.getPaymentPlugin(paymentPluginId);
		if (paymentPlugin == null || !paymentPlugin.getIsEnabled()) {
			model.addAttribute("content", Message.warn("shop.order.paymentPlugin.isEnabled"));
			return ERROR_VIEW;
		}
		TPayment payment = new TPayment();
		String description = null;
		type = Type.payment;
		if (type.equals(Type.payment)) {
			TOrder order = orderService.findBySn(sn);
			if (order != null) {
				order.setBankCode(bank);
				order.setBankName(bankName);
				order.setPaymentPluginId(paymentPluginId);
				orderService.updateOrder(order);
				if (order.isExpired()) {
					model.addAttribute("content", Message.warn("shop.order.orderIsExpired"));
					return ERROR_VIEW;
				}
				if (order == null || order.isLocked(null)) {
					model.addAttribute("content", Message.warn("shop.order.orderNotFound"));
					return ERROR_VIEW;
				}
				if (order.getPaymentMethod() == null || paymentMethodService.find(order.getPaymentMethod())
						.getMethod() != TPaymentMethod.Method.online.getCode()) {
					model.addAttribute("content", Message.warn("shop.order.paymentMethod.notEmpty"));
					return ERROR_VIEW;
				}
				if (order.getPaymentStatus() != PaymentStatus.unpaid.getCode()
						&& order.getPaymentStatus() != PaymentStatus.partialPayment.getCode()) {
					model.addAttribute("content", Message.warn("shop.order.orderIsPaid", order.getSn()));
					return ERROR_VIEW;
				}
				if (order.getAmountPayable().compareTo(new Double(0)) <= 0) {
					model.addAttribute("content", Message.warn("shop.order.payment.payAmountNotEmpty"));
					return ERROR_VIEW;
				}
				payment.setPaymentMethod(order.getPaymentMethodName() + TPayment.PAYMENT_METHOD_SEPARATOR
						+ paymentPlugin.getPaymentName());
				payment.setFee(paymentPlugin.calculateFee(order.getAmountPayable()));
				payment.setAmount(paymentPlugin.calculateAmount(order.getAmountPayable()));
				description = order.getName();
			}
			payment.setSn(OrderSnUtil.getSnByUUId());
			payment.setType(Type.payment.getCode());
			payment.setMethod(Method.online.getCode());
			payment.setStatus(Status.wait.getCode());
			payment.setPaymentPluginId(paymentPluginId);
			payment.setExpire(paymentPlugin.getTimeout() != null
					? DateUtils.addMinutes(new Date(), paymentPlugin.getTimeout()) : null);
			payment.setOrders(order.getId());
			payment.setMember(member.getId());
			paymentService.savePayment(payment);

		} else {
			model.addAttribute("content", Message.warn("shop.order.paymentType.notFound"));
			return ERROR_VIEW;
		}
		model.addAttribute("requestUrl", paymentPlugin.getRequestUrl());
		model.addAttribute("requestMethod", paymentPlugin.getRequestMethod());
		model.addAttribute("requestCharset", paymentPlugin.getRequestCharset());
		model.addAttribute("parameterMap", paymentPlugin.getParameterMap(payment.getSn(), description, request));
		if (StringUtils.isNotEmpty(paymentPlugin.getRequestCharset())) {
			response.setContentType("text/html; charset=" + paymentPlugin.getRequestCharset());
		}
		return "mobile/payment/submit";
	}

	/**
	 * 微信jsapi支付
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/wxJsApiPay", method = RequestMethod.POST)
	public String wxJsApiPay(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			RedirectAttributes redirectAttributes, String showwxpaytitle) {
		String appid = request.getParameter("appid");
		String nonceStr = request.getParameter("nonceStr");
		String packageValue = request.getParameter("packageValue");
		String timestamp = request.getParameter("timestamp");
		String paySign = request.getParameter("paySign");
		String signType = request.getParameter("signType");
		String orderSn = request.getParameter("orderSn");
		String paymentSn = request.getParameter("paymentSn");
		model.addAttribute("appid", appid);
		model.addAttribute("nonceStr", nonceStr);
		model.addAttribute("packageValue", packageValue);
		model.addAttribute("timestamp", timestamp);
		model.addAttribute("paySign", paySign);
		model.addAttribute("signType", signType);
		model.addAttribute("orderSn", orderSn);
		model.addAttribute("paymentSn", paymentSn);
		return "mobile/payment/wxJsApiPay";
	}

	/**
	 * 微信支付成功页面
	 */
	@RequestMapping("/wxJsApiNotify/{notifyMethod}/{sn}")
	public String wxJsApiNotify(@PathVariable NotifyMethod notifyMethod, @PathVariable String sn,
			HttpServletRequest request, ModelMap model) {
		TPayment payment = paymentService.findBySn(sn);
		if (payment != null) {
			PaymentPlugin paymentPlugin = pluginService.getPaymentPlugin(payment.getPaymentPluginId());
			if (paymentPlugin != null) {
				if (paymentPlugin.verifyMobileNotify(sn, notifyMethod, request)) {
					paymentService.handle(payment);
				}
				model.addAttribute("notifyMessage", paymentPlugin.getNotifyMessage(sn, notifyMethod, request));
			}
			model.addAttribute("payment", payment);
		} else {
			model.addAttribute("content", Message.warn("shop.order.payment.notFound"));
			return ERROR_VIEW;
		}
		return "mobile/payment/mobileNotify";
	}

	/**
	 * 手机端通知
	 */
	@RequestMapping("/mobileNotify/{notifyMethod}/{sn}")
	public String mobileNotify(@PathVariable NotifyMethod notifyMethod, @PathVariable String sn,
			HttpServletRequest request, ModelMap model) {
		TPayment payment = paymentService.findBySn(sn);
		if (payment != null) {
			PaymentPlugin paymentPlugin = pluginService.getPaymentPlugin(payment.getPaymentPluginId());
			if (paymentPlugin != null) {
				if (paymentPlugin.verifyMobileNotify(sn, notifyMethod, request)) {
					paymentService.handle(payment);
				}
				model.addAttribute("notifyMessage", paymentPlugin.getNotifyMessage(sn, notifyMethod, request));
			}
			model.addAttribute("payment", payment);
		}
		return "mobile/payment/mobileNotify";
	}
}
