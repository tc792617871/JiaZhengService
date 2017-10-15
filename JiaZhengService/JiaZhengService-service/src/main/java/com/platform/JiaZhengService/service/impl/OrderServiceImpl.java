package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.entity.TCart;
import com.platform.JiaZhengService.dao.entity.TCartItem;
import com.platform.JiaZhengService.dao.entity.TCouponCode;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.entity.TOrder.OrderStatus;
import com.platform.JiaZhengService.dao.entity.TOrder.PaymentStatus;
import com.platform.JiaZhengService.dao.entity.TOrderItem;
import com.platform.JiaZhengService.dao.entity.TPaymentMethod;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TReceiver;
import com.platform.JiaZhengService.dao.entity.TSpecification;
import com.platform.JiaZhengService.dao.mapper.TMemberMapper;
import com.platform.JiaZhengService.service.api.OrderService;

@Service("orderServiceImpl")
public class OrderServiceImpl extends BaseServiceImpl implements OrderService {

	@Resource
	private TMemberMapper memberMapper;

	@Transactional(readOnly = true)
	public TOrder build(TCart cart, TReceiver receiver, String paymentPluginId, TPaymentMethod paymentMethod,
			TCouponCode couponCode, boolean useBalance, String memo, String bank, String bankName) {

		TOrder order = new TOrder();
		order.setFee(new Double(0));
		order.setPromotionDiscount(new Double(0));
		order.setCouponDiscount(new Double(0));
		order.setOffsetAmount(new Double(0));
		order.setPoint(0L);
		order.setMemo(memo);
		order.setMember(cart.getMember());
		order.setBankCode(bank);
		order.setBankName(bankName);

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

		// 优惠券平分到每个商品上价格列表数据
		// TODO

		List<TOrderItem> orderItems = order.getOrderItems();
		for (TCartItem cartItem : cart.getCartItems()) {
			if (cartItem != null && cartItem.getProduct() != null && cartItem.getSpecification() != null) {
				TProduct product = cartItem.getTproduct();
				TSpecification specification = cartItem.gettSpecification();
				TOrderItem orderItem = new TOrderItem();
				orderItem.setName(specification.getName());
				orderItem.setPrice(cartItem.getPrice()); // 计算优惠券需要注意下
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
		}

		return order;
	}

}
