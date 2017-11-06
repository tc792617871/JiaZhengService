package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTCouponCode;
import com.platform.JiaZhengService.dao.entity.TCoupon;
import com.platform.JiaZhengService.dao.entity.TCouponCode;
import com.platform.JiaZhengService.dao.mapper.TCouponCodeMapper;
import com.platform.JiaZhengService.dao.mapper.TCouponMapper;
import com.platform.JiaZhengService.service.api.CouponService;

@Service("couponServiceImpl")
public class CouponServiceImpl extends BaseServiceImpl implements CouponService {

	@Resource
	private TCouponMapper couponMapper;

	@Resource
	private TCouponCodeMapper couponCodeMapper;

	@Override
	public List<TCoupon> queryCouponList(Criteria c) {
		List<TCoupon> coupons = couponMapper.selectByExample(c);
		return coupons;
	}

	@Override
	@Transactional
	public void saveCoupon(TCoupon coupon) {
		Date dt = new Date();
		coupon.setCreateDate(dt);
		coupon.setModifyDate(dt);
		couponMapper.insertSelective(coupon);
	}

	@Override
	public TCoupon find(Long id) {
		if (id != null) {
			TCoupon coupon = couponMapper.selectByPrimaryKey(id);
			Criteria c = new Criteria();
			c.createConditon().andEqualTo(TTCouponCode.ID, id);
			List<TCouponCode> codes = couponCodeMapper.selectByExample(c);
			coupon.setCouponCodes(codes);
			return coupon;
		}
		return null;
	}

	@Override
	@Transactional
	public void updateCoupon(TCoupon coupon) {
		coupon.setModifyDate(new Date());
		couponMapper.updateByPrimaryKeySelective(coupon);
	}

	@Override
	@Transactional
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				Criteria c = new Criteria();
				c.createConditon().andEqualTo(TTCouponCode.COUPON, id);
				couponCodeMapper.deleteByExample(c);
				couponMapper.deleteByPrimaryKey(id);
			}
		}
	}

}
