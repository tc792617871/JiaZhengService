package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.common.util.DateUtil;
import com.platform.JiaZhengService.common.util.JiaZhengServiceUtil;
import com.platform.JiaZhengService.common.util.OrderSnUtil;
import com.platform.JiaZhengService.common.util.SpringUtils;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTOrder;
import com.platform.JiaZhengService.dao.constants.TTOrderItem;
import com.platform.JiaZhengService.dao.constants.TTPayment;
import com.platform.JiaZhengService.dao.entity.TAdmin;
import com.platform.JiaZhengService.dao.entity.TCart;
import com.platform.JiaZhengService.dao.entity.TCartItem;
import com.platform.JiaZhengService.dao.entity.TCoupon;
import com.platform.JiaZhengService.dao.entity.TCouponCode;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.entity.TOrder.OrderSource;
import com.platform.JiaZhengService.dao.entity.TOrder.OrderStatus;
import com.platform.JiaZhengService.dao.entity.TOrder.PaymentStatus;
import com.platform.JiaZhengService.dao.entity.TOrder.ShippingStatus;
import com.platform.JiaZhengService.dao.entity.TOrderItem;
import com.platform.JiaZhengService.dao.entity.TOrderLog;
import com.platform.JiaZhengService.dao.entity.TOrderLog.Type;
import com.platform.JiaZhengService.dao.entity.TPayment;
import com.platform.JiaZhengService.dao.entity.TPaymentMethod;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TReceiver;
import com.platform.JiaZhengService.dao.entity.TSpecification;
import com.platform.JiaZhengService.dao.mapper.TCartMapper;
import com.platform.JiaZhengService.dao.mapper.TCouponCodeMapper;
import com.platform.JiaZhengService.dao.mapper.TCouponMapper;
import com.platform.JiaZhengService.dao.mapper.TMemberMapper;
import com.platform.JiaZhengService.dao.mapper.TOrderItemMapper;
import com.platform.JiaZhengService.dao.mapper.TOrderLogMapper;
import com.platform.JiaZhengService.dao.mapper.TOrderMapper;
import com.platform.JiaZhengService.dao.mapper.TPaymentMapper;
import com.platform.JiaZhengService.service.api.CartService;
import com.platform.JiaZhengService.service.api.OrderService;
import com.platform.JiaZhengService.service.api.SmsMqListService;

@Service("orderServiceImpl")
public class OrderServiceImpl extends BaseServiceImpl implements OrderService {

	@Resource
	private TMemberMapper memberMapper;

	@Resource
	private TOrderMapper orderMapper;

	@Resource
	private TOrderItemMapper orderItemMapper;

	@Resource
	private TOrderLogMapper orderLogMapper;

	@Resource
	private TCartMapper cartMapper;

	@Resource
	private TCouponMapper couponMapper;

	@Resource
	private TCouponCodeMapper couponCodeMapper;

	@Resource
	private TPaymentMapper paymentMapper;

	@Resource(name = "smsMqListServiceImpl")
	private SmsMqListService smsMqListService;

	@Resource(name = "cartServiceImpl")
	private CartService cartService;

	@Transactional
	public TOrder build(TCart cart, TReceiver receiver, String paymentPluginId, TPaymentMethod paymentMethod,
			TCouponCode couponCode, boolean useBalance, String memo) {

		TOrder order = new TOrder();
		order.setShippingStatus(ShippingStatus.unshipped.getCode());
		order.setFee(new Double(0));
		order.setPromotionDiscount(new Double(0));
		order.setCouponDiscount(new Double(0));
		order.setOffsetAmount(new Double(0));
		order.setPoint(0L);
		order.setMemo(memo);
		order.setMember(cart.getMember());

		if (receiver != null) {
			order.setConsignee(receiver.getConsignee());
			order.setAreaName(receiver.getAreaName());
			order.setAddress(receiver.getAddress());
			order.setZipCode(receiver.getZipCode());
			order.setPhone(receiver.getPhone());
			order.setArea(receiver.getArea());
		}

		order.setPaymentPluginId(paymentPluginId);
		order.setPaymentMethod(paymentMethod != null ? paymentMethod.getId() : null);

		// 计算优惠券折扣
		if (couponCode != null) {
			TCoupon coupon = null;
			if (couponCode.getCoupon() != null) {
				coupon = couponMapper.selectByPrimaryKey(couponCode.getCoupon());
			}
			if (!couponCode.getIsUsed() && coupon != null && cart.isValid(coupon)) {
				Double couponDiscount = cart.getEffectivePrice()
						- coupon.calculatePrice(cart.getQuantity(), cart.getEffectivePrice());
				couponDiscount = couponDiscount.compareTo(new Double(0)) > 0 ? couponDiscount : new Double(0);
				couponCode.setMember(cart.getMember());
				order.setCouponDiscount(couponDiscount);
				order.setCouponCode(couponCode.getId());
			}
		}

		List<TOrderItem> orderItems = order.getOrderItems();
		for (TCartItem cartItem : cart.getCartItems()) {
			if (cartItem != null && cartItem.getProduct() != null && cartItem.getSpecification() != null) {
				TProduct product = cartItem.getTproduct();
				TSpecification specification = cartItem.gettSpecification();
				TOrderItem orderItem = new TOrderItem();
				orderItem.setSn(product.getSn());
				orderItem.setName(specification.getName());
				orderItem.setPrice(cartItem.getPrice());
				orderItem.setThumbnail(product.getImage());
				orderItem.setQuantity(cartItem.getQuantity());
				orderItem.setShippedQuantity(new Double(0));
				orderItem.setReturnQuantity(new Double(0));
				orderItem.setProduct(product.getId());
				orderItem.setSpecification(specification.getId());
				orderItems.add(orderItem);
			}
		}

		if (useBalance) {
			TMember member = memberMapper.selectByPrimaryKey(cart.getMember());
			if (member.getBalance().compareTo(order.getAmount()) >= 0) {
				order.setAmountPaid(order.getAmount());
			} else {
				order.setAmountPaid(member.getBalance());
			}
		} else {
			order.setAmountPaid(new Double(0));
		}

		if (order.getAmountPayable().compareTo(new Double(0)) == 0) {
			order.setOrderStatus(OrderStatus.confirmed.getCode());
			order.setPaymentStatus(PaymentStatus.paid.getCode());
		} else if (order.getAmountPayable().compareTo(new Double(0)) > 0
				&& order.getAmountPaid().compareTo(new Double(0)) > 0) {
			order.setOrderStatus(OrderStatus.confirmed.getCode());
			order.setPaymentStatus(PaymentStatus.partialPayment.getCode());
		} else {
			order.setOrderStatus(OrderStatus.unconfirmed.getCode());
			order.setPaymentStatus(PaymentStatus.unpaid.getCode());
		}

		if (paymentMethod != null && paymentMethod.getTimeout() != null
				&& order.getPaymentStatus() == PaymentStatus.unpaid.getCode()) {
			order.setExpire(DateUtils.addMinutes(new Date(), paymentMethod.getTimeout()));
			order.setPaymentMethodName(paymentMethod.getName());
		}

		return order;
	}

	@Transactional
	public TOrder create(TCart cart, TReceiver receiver, String paymentPluginId, TPaymentMethod paymentMethod,
			TCouponCode couponCode, boolean useBalance, String weekdays, String timearea, String time,
			String areaSquare, String memo) {

		TOrder order = build(cart, receiver, paymentPluginId, paymentMethod, couponCode, useBalance, memo);
		Date dt = new Date();
		order.setSn(OrderSnUtil.getSnByUUId());
		order.setOrderSource(OrderSource.wap.toString());
		order.setCreateDate(dt);
		order.setModifyDate(dt);
		order.setWeekDays(weekdays);
		order.setTimeArea(timearea);
		order.setTime(time);
		order.setAreaSquare(areaSquare);

		TMember member = memberMapper.selectByPrimaryKey(cart.getMember());

		if (paymentMethod.getMethod() == TPaymentMethod.Method.online.getCode()) {
			order.setLockExpire(DateUtils.addSeconds(new Date(), 20));
		}
		orderMapper.insertSelective(order);
		if (order.getCouponCode() != null) {
			couponCode.setIsUsed(true);
			couponCode.setUsedDate(new Date());
			couponCode.setMember(cart.getMember());
			couponCode.setOrders(order.getId());
			couponCodeMapper.updateByPrimaryKeySelective(couponCode);
		}

		List<TOrderItem> orderItems = order.getOrderItems();
		if (orderItems != null && orderItems.size() > 0) {
			for (TOrderItem orderItem : orderItems) {
				orderItem.setOrders(order.getId());
				orderItem.setCreateDate(dt);
				orderItem.setModifyDate(dt);
				orderItemMapper.insertSelective(orderItem);
			}
		}

		TOrderLog orderLog = new TOrderLog();
		orderLog.setCreateDate(new Date());
		orderLog.setModifyDate(new Date());
		orderLog.setType(Type.create.getCode());
		orderLog.setOperator(member.getUsername());
		orderLog.setOrders(order.getId());
		orderLogMapper.insertSelective(orderLog);

		cartService.mergeCart(cart);
		if (null != member && null != member.getMobile()) {
			// 您于{0}在家政平台微信商城提交了订单（{1}），请尽快在{2}内完成支付！
			smsMqListService.sendSms(member.getMobile(), SpringUtils.getMessage("shop.message.send.createOrderReminds",
					DateUtil.date2String(new Date(), -1), order.getSn(),
					JiaZhengServiceUtil.getOrderTimeOut(paymentMethod != null ? paymentMethod.getTimeout() : null)));
		}
		return order;
	}

	@Override
	public TOrder findBySn(String sn) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTOrder.SN, sn);
		List<TOrder> orders = orderMapper.selectByExample(c);
		if (orders != null && orders.size() > 0) {
			TOrder order = orders.get(0);
			Criteria oic = new Criteria();
			oic.createConditon().andEqualTo(TTOrderItem.ORDERS, order.getId());
			List<TOrderItem> orderItems = orderItemMapper.selectByExample(oic);
			if (orderItems != null && orderItems.size() > 0) {
				order.setOrderItems(orderItems);
			}
			return order;
		}
		return null;
	}

	@Override
	@Transactional
	public void updateOrder(TOrder order) {
		order.setModifyDate(new Date());
		orderMapper.updateByPrimaryKeySelective(order);
	}

	@Override
	@Transactional
	public void payment(TOrder order, TPayment payment, TAdmin operator) {
		Date date = new Date();
		order.setAmountPaid(order.getAmountPaid() + payment.getAmount());
		order.setFee(payment.getFee());
		order.setExpire(null);
		order.setModifyDate(date);
		if (order.getAmountPaid().compareTo(order.getAmount()) >= 0) {
			order.setOrderStatus(OrderStatus.confirmed.getCode());
			order.setPaymentStatus(PaymentStatus.paid.getCode());
		} else if (order.getAmountPaid().compareTo(new Double(0)) > 0) {
			order.setOrderStatus(OrderStatus.confirmed.getCode());
			order.setPaymentStatus(PaymentStatus.partialPayment.getCode());
		}
		orderMapper.updateByPrimaryKeySelective(order);

		TOrderLog orderLog = new TOrderLog();
		orderLog.setType(Type.payment.getCode());
		orderLog.setOperator(operator != null ? operator.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(date);
		orderLog.setModifyDate(date);
		orderLogMapper.insertSelective(orderLog);
	}

	@Override
	public TOrder findById(Long orderId) {
		if (orderId != null) {
			TOrder order = orderMapper.selectByPrimaryKey(orderId);
			return order;
		}
		return null;
	}

	@Override
	@Transactional
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				orderMapper.deleteByPrimaryKey(id);
			}
		}
	}

	@Override
	@Transactional
	public void confirm(TOrder order, TAdmin admin) {
		Date date = new Date();
		order.setOrderStatus(OrderStatus.confirmed.getCode());
		order.setModifyDate(date);
		orderMapper.updateByPrimaryKeySelective(order);

		TOrderLog orderLog = new TOrderLog();
		orderLog.setType(Type.confirm.getCode());
		orderLog.setOperator(admin != null ? admin.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(date);
		orderLog.setModifyDate(date);
		orderLogMapper.insertSelective(orderLog);
	}

	@Override
	@Transactional
	public void complete(TOrder order, TAdmin operator) {
		Date date = new Date();
		TMember member = memberMapper.selectByPrimaryKey(order.getMember());
		// 这边需不要要锁定member，保证原子性

		// 订单完成后需要更新优惠券状态

		/**
		 * 消费金额
		 */
		Double amountPaid = order.getAmountPaid();
		if (null != member.getAmount()) {
			member.setAmount(member.getAmount() + amountPaid);
		} else {
			member.setAmount(amountPaid);
		}
		memberMapper.updateByPrimaryKeySelective(member);

		order.setOrderStatus(OrderStatus.completed.getCode());
		order.setExpire(null);
		order.setModifyDate(date);
		orderMapper.updateByPrimaryKeySelective(order);

		TOrderLog orderLog = new TOrderLog();
		orderLog.setType(Type.complete.getCode());
		orderLog.setOperator(operator != null ? operator.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(date);
		orderLog.setModifyDate(date);
		orderLogMapper.insertSelective(orderLog);
	}

	@Override
	@Transactional
	public void cancel(TOrder order, TAdmin operator) {
		Date date = new Date();
		TMember member = memberMapper.selectByPrimaryKey(order.getMember());
		if (order.getCouponCode() != null) {
			TCouponCode couponCode = couponCodeMapper.selectByPrimaryKey(order.getCouponCode());
			if (couponCode != null) {
				couponCode.setIsUsed(false);
				couponCode.setUsedDate(null);
				couponCodeMapper.updateByPrimaryKeySelective(couponCode);
			}
			order.setCouponCode(null);
		}
		order.setOrderStatus(OrderStatus.cancelled.getCode());
		order.setExpire(null);
		order.setModifyDate(date);
		orderMapper.updateByPrimaryKeySelective(order);

		TOrderLog orderLog = new TOrderLog();
		orderLog.setType(Type.cancel.getCode());
		orderLog.setOperator(operator != null ? operator.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(date);
		orderLog.setModifyDate(date);
		orderLogMapper.insertSelective(orderLog);
		if (order != null) {
			smsMqListService.sendSms(member.getMobile(), SpringUtils.getMessage("shop.message.send.cancelOrderReminds",
					DateUtil.date2String(order.getModifyDate(), -1), order.getSn()));
		}
	}

	@Override
	public List<TOrder> queryOrderList(Criteria c) {
		List<TOrder> orders = orderMapper.selectMutilTableByExample(c);
		if (orders != null && orders.size() > 0) {
			for (TOrder order : orders) {
				if (order.getMember() != null) {
					order.settMember(memberMapper.selectByPrimaryKey(order.getMember()));
				}
				Criteria criteria = new Criteria();
				criteria.createConditon().andEqualTo(TTPayment.ORDERS, order.getId());
				List<TPayment> payments = paymentMapper.selectByExample(criteria);
				if (payments != null && payments.size() > 0) {
					order.setPayments(payments);
				}
				Criteria oic = new Criteria();
				oic.createConditon().andEqualTo(TTOrderItem.ORDERS, order.getId());
				List<TOrderItem> orderItems = orderItemMapper.selectByExample(oic);
				if (orderItems != null && orderItems.size() > 0) {
					order.setOrderItems(orderItems);
				}
			}
		}
		return orders;
	}

	@Override
	@Transactional
	public void shipping(TOrder order, TAdmin operator) {
		Date date = new Date();
		order.setShippingStatus(ShippingStatus.shipped.getCode());
		order.setExpire(null);
		order.setModifyDate(date);
		orderMapper.updateByPrimaryKeySelective(order);

		TOrderLog orderLog = new TOrderLog();
		orderLog.setType(Type.shipping.getCode());
		orderLog.setOperator(operator != null ? operator.getUsername() : null);
		orderLog.setOrders(order.getId());
		orderLog.setCreateDate(date);
		orderLog.setModifyDate(date);
		orderLogMapper.insertSelective(orderLog);

	}

}
