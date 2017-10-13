package com.platform.JiaZhengService.service.api;

import com.platform.JiaZhengService.dao.entity.TCart;
import com.platform.JiaZhengService.dao.entity.TCouponCode;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.entity.TPaymentMethod;
import com.platform.JiaZhengService.dao.entity.TReceiver;

public interface OrderService extends BaseService {

	/**
	 * 生成订单
	 * 
	 * @param cart
	 *            购物车
	 * @param receiver
	 *            收货地址
	 * @param paymentMethod
	 *            支付方式
	 * @param shippingMethod
	 *            配送方式
	 * @param couponCode
	 *            优惠码
	 * @param isInvoice
	 *            是否开据发票
	 * @param invoiceTitle
	 *            发票抬头
	 * @param useBalance
	 *            是否使用余额
	 * @param memo
	 *            附言
	 * @return 订单
	 */
	TOrder build(TCart cart, TReceiver receiver, String paymentPluginId, TPaymentMethod paymentMethod,
			TCouponCode couponCode, boolean useBalance, String memo, String bank, String bankName);
}
