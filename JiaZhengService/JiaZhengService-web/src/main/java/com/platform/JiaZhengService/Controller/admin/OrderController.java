package com.platform.JiaZhengService.Controller.admin;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.pojo.TableAliasConstants;
import com.platform.JiaZhengService.common.util.OrderSnUtil;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.Criteria.Condition;
import com.platform.JiaZhengService.dao.Pageable;
import com.platform.JiaZhengService.dao.constants.TTOrder;
import com.platform.JiaZhengService.dao.entity.TAdmin;
import com.platform.JiaZhengService.dao.entity.TArea;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.entity.TOrder.OrderStatus;
import com.platform.JiaZhengService.dao.entity.TOrder.PaymentStatus;
import com.platform.JiaZhengService.dao.entity.TOrder.ShippingStatus;
import com.platform.JiaZhengService.dao.entity.TOrderItem;
import com.platform.JiaZhengService.dao.entity.TOrderLog;
import com.platform.JiaZhengService.dao.entity.TPayment;
import com.platform.JiaZhengService.dao.entity.TPayment.Status;
import com.platform.JiaZhengService.dao.entity.TPayment.Type;
import com.platform.JiaZhengService.dao.entity.TPaymentMethod;
import com.platform.JiaZhengService.dao.entity.TPluginConfig;
import com.platform.JiaZhengService.service.api.AdminService;
import com.platform.JiaZhengService.service.api.AreaService;
import com.platform.JiaZhengService.service.api.MemberService;
import com.platform.JiaZhengService.service.api.OrderItemService;
import com.platform.JiaZhengService.service.api.OrderLogService;
import com.platform.JiaZhengService.service.api.OrderService;
import com.platform.JiaZhengService.service.api.PaymentMethodService;
import com.platform.JiaZhengService.service.api.PaymentService;
import com.platform.JiaZhengService.service.api.PluginConfigService;
import com.platform.JiaZhengService.service.api.ProductService;
import com.platform.JiaZhengService.service.api.SmsMqListService;
import com.platform.JiaZhengService.service.api.SpecificationService;

/**
 * Controller - 订单
 */
@Controller("adminOrderController")
@RequestMapping("/admin/order")
public class OrderController extends AbstractController {

	/** 会员名 */
	private final static String USERNAME_PROPERTY = "username";

	/** 筛选状态为全部 */
	private final static String ALLSTATUS = "allStatus";

	@Resource(name = "adminServiceImpl")
	private AdminService adminService;

	@Resource(name = "areaServiceImpl")
	private AreaService areaService;

	@Resource(name = "productServiceImpl")
	private ProductService productService;

	@Resource(name = "specificationServiceImpl")
	private SpecificationService specificationService;

	@Resource(name = "orderServiceImpl")
	private OrderService orderService;

	@Resource(name = "orderLogServiceImpl")
	private OrderLogService orderLogService;

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@Resource(name = "paymentServiceImpl")
	private PaymentService paymentService;

	@Resource(name = "orderItemServiceImpl")
	private OrderItemService orderItemService;

	@Resource(name = "paymentMethodServiceImpl")
	private PaymentMethodService paymentMethodService;

	@Resource(name = "pluginConfigServiceImpl")
	private PluginConfigService pluginConfigService;

	@Resource(name = "smsMqListServiceImpl")
	private SmsMqListService smsMqListService;

	/**
	 * 检查锁定
	 */
	@RequestMapping(value = "/check_lock", method = RequestMethod.POST)
	public @ResponseBody Message checkLock(Long id) {
		TOrder order = orderService.findById(id);
		if (order == null) {
			return Message.warn("admin.common.invalid");
		}
		TAdmin admin = adminService.getCurrent();
		if (order.isLocked(admin)) {
			if (order.getOperator() != null) {
				return Message.warn("admin.order.adminLocked", "");
			} else {
				return Message.warn("admin.order.memberLocked");
			}
		} else {
			order.setLockExpire(DateUtils.addSeconds(new Date(), 20));
			order.setOperator(admin.getId());
			orderService.updateOrder(order);
			return SUCCESS_MESSAGE;
		}
	}

	/**
	 * 查看
	 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(String paymentPluginId, Long id, ModelMap model) {
		String paymentName;
		TPluginConfig pluginConfig = pluginConfigService.findByPluginId(paymentPluginId);
		if (pluginConfig == null) {
			paymentName = null;
		} else {
			paymentName = pluginConfig.getAttribute("paymentName");
		}
		model.addAttribute("paymentPluginAttribute", paymentName);
		model.addAttribute("methods", TPayment.Method.values());
		model.addAttribute("paymentMethods", paymentMethodService.queryPaymentMethodList(new Criteria()));
		TOrder order = orderService.findById(id);
		List<TPayment> payments = paymentService.findPaymentByOrderId(order.getId());
		order.setPayments(payments);
		List<TOrderItem> orderItems = orderItemService.findOrderItemsByOrderId(order.getId());
		order.setOrderItems(orderItems);
		TMember member = memberService.find(order.getMember());
		order.settMember(member);
		TArea area = areaService.find(order.getArea());
		order.settArea(area);
		List<TOrderLog> orderLogs = orderLogService.findOrderLogsByOrderId(order.getId());
		model.addAttribute("orderLogs", orderLogs);
		model.addAttribute("order", order);
		return "/admin/order/view";
	}

	/**
	 * 确认
	 */
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public String confirm(Long id, RedirectAttributes redirectAttributes) {
		TOrder order = orderService.findById(id);
		TAdmin admin = adminService.getCurrent();
		if (order != null && !order.isExpired() && order.getOrderStatus() == OrderStatus.unconfirmed.getCode()
				&& !order.isLocked(admin)) {
			orderService.confirm(order, admin);
			addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		} else {
			addFlashMessage(redirectAttributes, Message.warn("admin.common.invalid"));
		}
		return "redirect:view.jhtml?id=" + id;
	}

	/**
	 * 完成
	 */
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public String complete(Long id, RedirectAttributes redirectAttributes) {
		TOrder order = orderService.findById(id);
		TAdmin admin = adminService.getCurrent();
		if (order != null && !order.isExpired() && (order.getOrderStatus() == OrderStatus.confirmed.getCode()
				|| order.getOrderStatus() == OrderStatus.receipt.getCode()) && !order.isLocked(admin)) {
			orderService.complete(order, admin);
			addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		} else {
			addFlashMessage(redirectAttributes, Message.warn("admin.common.invalid"));
		}
		return "redirect:view.jhtml?id=" + id;
	}

	/**
	 * 取消
	 */
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String cancel(Long id, RedirectAttributes redirectAttributes, Long[] ids) {
		TOrder order = orderService.findById(id);
		TAdmin admin = adminService.getCurrent();
		if (order != null && !order.isExpired() && order.getOrderStatus() == OrderStatus.unconfirmed.getCode()
				&& !order.isLocked(admin)) {
			orderService.cancel(order, admin);
			addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		} else {
			addFlashMessage(redirectAttributes, Message.warn("admin.common.invalid"));
		}
		return "redirect:view.jhtml?id=" + id;
	}

	/**
	 * 支付
	 */
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String payment(Long orderId, Long paymentMethodId, TPayment payment, RedirectAttributes redirectAttributes) {
		TOrder order = orderService.findById(orderId);
		List<TOrderItem> orderItems = orderItemService.findOrderItemsByOrderId(orderId);
		order.setOrderItems(orderItems);
		payment.setOrder(order);
		TPaymentMethod paymentMethod = paymentMethodService.find(paymentMethodId);
		payment.setPaymentMethod(paymentMethod != null ? paymentMethod.getName() : null);
		if (!isValid(payment)) {
			return ERROR_VIEW;
		}
		if (order.isExpired() || order.getOrderStatus() != OrderStatus.confirmed.getCode()) {
			return ERROR_VIEW;
		}
		if (order.getPaymentStatus() != PaymentStatus.unpaid.getCode()
				&& order.getPaymentStatus() != PaymentStatus.partialPayment.getCode()) {
			return ERROR_VIEW;
		}
		if (payment.getAmount().compareTo(new Double(0)) <= 0
				|| payment.getAmount().compareTo(order.getAmountPayable()) > 0) {
			return ERROR_VIEW;
		}
		TMember member = memberService.find(order.getMember());
		if (payment.getMethod() == TPayment.Method.deposit.getCode()
				&& payment.getAmount().compareTo(member.getBalance()) > 0) {
			return ERROR_VIEW;
		}
		TAdmin admin = adminService.getCurrent();
		if (order.isLocked(admin)) {
			return ERROR_VIEW;
		}
		payment.setSn(OrderSnUtil.getSnByUUId());
		payment.setType(Type.payment.getCode());
		payment.setStatus(Status.success.getCode());
		payment.setFee(new Double(0));
		payment.setOperator(admin.getUsername());
		payment.setPaymentDate(new Date());
		payment.setPaymentPluginId(null);
		payment.setExpire(null);
		payment.setMember(null);
		payment.setOrders(order.getId());
		paymentService.savePayment(payment);
		orderService.payment(order, payment, admin);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:view.jhtml?id=" + orderId;
	}

	/**
	 * 发货
	 */
	@RequestMapping(value = "/shipping", method = RequestMethod.POST)
	public String shipping(Long orderId, RedirectAttributes redirectAttributes) {
		TOrder order = orderService.findById(orderId);
		if (order == null) {
			return ERROR_VIEW;
		}
		if (order.isExpired() || order.getOrderStatus() != OrderStatus.confirmed.getCode()) {
			return ERROR_VIEW;
		}
		if (order.getShippingStatus() != ShippingStatus.unshipped.getCode()
				&& order.getShippingStatus() != ShippingStatus.partialShipment.getCode()) {
			return ERROR_VIEW;
		}
		TAdmin admin = adminService.getCurrent();
		if (order.isLocked(admin)) {
			return ERROR_VIEW;
		}
		orderService.shipping(order, admin);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:view.jhtml?id=" + orderId;
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("paymentMethods", paymentMethodService.queryPaymentMethodList(new Criteria()));
		model.addAttribute("order", orderService.findById(id));
		return "/admin/order/edit";
	}

	/**
	 * 根据订单号查询内容
	 */
	@RequestMapping(value = "/orderItemTooltip", method = RequestMethod.GET)
	public @ResponseBody TOrder orderItemTooltip(String orderSn) {
		TOrder order = orderService.findBySn(orderSn);
		return order;
	}

	/**
	 * 更新订单状态
	 */
	@RequestMapping(value = "/updateOrserStatus", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> updateOrserStatus(Long id, String currentOrdersn,
			Integer currentOrderorderStatus, Integer currentOrderpaymentStatus, RedirectAttributes redirectAttributes) {
		Map<String, Object> data = new HashMap<String, Object>();
		TOrder order = orderService.findById(id);
		order.setOrderStatus(currentOrderorderStatus);
		order.setPaymentStatus(currentOrderpaymentStatus);
		orderService.updateOrder(order);
		data.put("message", SUCCESS_MESSAGE);
		return data;
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(String status, Date beginDate, Date endDate, Integer orderStatus, Integer paymentStatus,
			Boolean hasExpired, Pageable pageable, ModelMap model) {
		Criteria c = createPaginationCriteria(pageable);
		Condition con = c.createConditon();

		if (beginDate != null) {
			Calendar calendar = DateUtils.toCalendar(beginDate);
			calendar.set(Calendar.HOUR_OF_DAY, calendar.getActualMinimum(Calendar.HOUR_OF_DAY));
			calendar.set(Calendar.MINUTE, calendar.getActualMinimum(Calendar.MINUTE));
			calendar.set(Calendar.SECOND, calendar.getActualMinimum(Calendar.SECOND));
			beginDate = calendar.getTime();
			con.andGreaterThanOrEqualTo(TableAliasConstants.ALIAS_T_ORDER + TTOrder.CREATE_DATE, beginDate);
		}
		if (endDate != null) {
			Calendar calendar = DateUtils.toCalendar(endDate);
			calendar.set(Calendar.HOUR_OF_DAY, calendar.getActualMaximum(Calendar.HOUR_OF_DAY));
			calendar.set(Calendar.MINUTE, calendar.getActualMaximum(Calendar.MINUTE));
			calendar.set(Calendar.SECOND, calendar.getActualMaximum(Calendar.SECOND));
			endDate = calendar.getTime();
			con.andLessThanOrEqualTo(TableAliasConstants.ALIAS_T_ORDER + TTOrder.CREATE_DATE, endDate);
		}

		if (StringUtils.isNotEmpty(pageable.getSearchProperty()) && StringUtils.isNotEmpty(pageable.getSearchValue())) {
			String searchPropertyString = pageable.getSearchProperty();
			if (USERNAME_PROPERTY.equals(searchPropertyString)) {
				con.andLike(TableAliasConstants.ALIAS_T_MEMBER + pageable.getSearchProperty(),
						pageable.getSearchValue());
			} else {
				con.andLike(TableAliasConstants.ALIAS_T_ORDER + pageable.getSearchProperty(),
						pageable.getSearchValue());
			}
		}
		if (ALLSTATUS.equals(status)) {
			orderStatus = null;
			paymentStatus = null;
			hasExpired = null;
		}
		if (orderStatus != null) {
			con.andEqualTo(TableAliasConstants.ALIAS_T_ORDER + TTOrder.ORDER_STATUS, orderStatus);
		}
		if (paymentStatus != null) {
			con.andEqualTo(TableAliasConstants.ALIAS_T_ORDER + TTOrder.PAYMENT_STATUS, paymentStatus);
		}
		if (hasExpired != null) {
			if (hasExpired) {
				con.andLessThan(TableAliasConstants.ALIAS_T_ORDER + TTOrder.EXPIRE, new Date());
			} else {
				con.andGreaterThanOrEqualTo(TableAliasConstants.ALIAS_T_ORDER + TTOrder.EXPIRE, new Date());
			}
		}
		if (StringUtils.isNotEmpty(pageable.getOrderProperty()) && pageable.getOrderDirection() != null) {
			c.setOrderByClause(TableAliasConstants.ALIAS_T_ORDER + pageable.getOrderProperty() + " "
					+ pageable.getOrderDirection());
		}
		model.addAttribute("beginDate", beginDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("status", status);
		model.addAttribute("orderStatus", orderStatus);
		model.addAttribute("paymentStatus", paymentStatus);
		model.addAttribute("orderStatusList", OrderStatus.values());
		model.addAttribute("paymentStatusList", PaymentStatus.values());
		model.addAttribute("hasExpired", hasExpired);

		model.addAttribute("pageable", pageable);
		model.addAttribute("page", c.getPage());
		model.addAttribute("content", orderService.queryOrderList(c));
		return "/admin/order/list";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long[] ids) {
		if (ids != null) {
			TAdmin admin = adminService.getCurrent();
			for (Long id : ids) {
				TOrder order = orderService.findById(id);
				if (order != null && order.isLocked(admin)) {
					return Message.error("admin.order.deleteLockedNotAllowed", order.getSn());
				}
			}
			orderService.delete(ids);
		}
		return SUCCESS_MESSAGE;
	}
}
