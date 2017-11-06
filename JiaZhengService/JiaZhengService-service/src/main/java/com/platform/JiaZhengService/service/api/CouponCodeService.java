package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.entity.TCoupon;
import com.platform.JiaZhengService.dao.entity.TCouponCode;
import com.platform.JiaZhengService.dao.entity.TMember;

public interface CouponCodeService extends BaseService {

	/**
	 * 查找优惠码数量
	 * 
	 * @param couponID
	 *            优惠券
	 * @param memberID
	 *            会员
	 * @param isUsed
	 *            是否已使用
	 * @return 优惠码数量
	 */
	Long count(Long couponID, Long memberID, Boolean isUsed);

	/**
	 * 生成优惠券码
	 * 
	 * @param coupon
	 * @param member
	 * @param count
	 */
	List<TCouponCode> build(TCoupon coupon, TMember member, Integer count);

	/**
	 * 更新优惠码
	 * 
	 * @param couponCode
	 */
	void updateCouponCode(TCouponCode couponCode);

	/**
	 * 根据优惠券码查询优惠券
	 * 
	 * @param code
	 * @return
	 */
	TCouponCode findByCode(String code);

}
