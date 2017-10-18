package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TAdmin;
import com.platform.JiaZhengService.dao.entity.TCart;
import com.platform.JiaZhengService.dao.entity.TCouponCode;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.entity.TPayment;
import com.platform.JiaZhengService.dao.entity.TPaymentMethod;
import com.platform.JiaZhengService.dao.entity.TReceiver;

public interface OrderService extends BaseService {

	/**
	 * 生成订单
	 */
	TOrder build(TCart cart, TReceiver receiver, String paymentPluginId, TPaymentMethod paymentMethod,
			TCouponCode couponCode, boolean useBalance, String memo);

	/**
	 * 创建订单
	 */
	TOrder create(TCart cart, TReceiver receiver, String paymentPluginId, TPaymentMethod paymentMethod,
			TCouponCode couponCode, boolean useBalance, String weekdays, String timearea, String time,
			String areaSquare, String memo);

	/**
	 * 根据订单编号查找订单
	 * 
	 * @param sn
	 *            订单编号(忽略大小写)
	 * @return 若不存在则返回null
	 */
	TOrder findBySn(String sn);

	/**
	 * 更新订单
	 * 
	 * @param order
	 */
	void updateOrder(TOrder order);

	/**
	 * 订单支付
	 * 
	 * @param order
	 *            订单
	 * @param payment
	 *            收款单
	 * @param operator
	 *            操作员
	 */
	void payment(TOrder order, TPayment payment, TAdmin operator);

	TOrder findById(Long orderId);

	/**
	 * 删除
	 * 
	 * @param ids
	 */
	void delete(Long[] ids);

	/**
	 * 订单确认
	 * 
	 * @param order
	 * @param admin
	 */
	void confirm(TOrder order, TAdmin admin);

	/**
	 * 订单完成
	 * 
	 * @param order
	 * @param admin
	 */
	void complete(TOrder order, TAdmin admin);

	/**
	 * 取消订单
	 * 
	 * @param order
	 * @param admin
	 */
	void cancel(TOrder order, TAdmin admin);

	/**
	 * 查询订单列表
	 * 
	 * @param c
	 * @return
	 */
	List<TOrder> queryOrderList(Criteria c);

}
