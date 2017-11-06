package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TCoupon;

public interface CouponService extends BaseService {

	/**
	 * 查询优惠券列表
	 * 
	 * @param c
	 * @return
	 */
	List<TCoupon> queryCouponList(Criteria c);

	/**
	 * 保存优惠券
	 * 
	 * @param coupon
	 */
	void saveCoupon(TCoupon coupon);

	/**
	 * 查询优惠券
	 * 
	 * @param id
	 * @return
	 */
	TCoupon find(Long id);

	/**
	 * 更新优惠券
	 * 
	 * @param coupon
	 */
	void updateCoupon(TCoupon coupon);

	/**
	 * 删除优惠券
	 * 
	 * @param ids
	 */
	void delete(Long[] ids);

}
