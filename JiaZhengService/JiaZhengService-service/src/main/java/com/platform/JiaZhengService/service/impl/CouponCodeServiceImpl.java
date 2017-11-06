package com.platform.JiaZhengService.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.Criteria.Condition;
import com.platform.JiaZhengService.dao.constants.TTCouponCode;
import com.platform.JiaZhengService.dao.entity.TCoupon;
import com.platform.JiaZhengService.dao.entity.TCouponCode;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.mapper.TCouponCodeMapper;
import com.platform.JiaZhengService.service.api.CouponCodeService;

@Service("couponCodeServiceImpl")
public class CouponCodeServiceImpl extends BaseServiceImpl implements CouponCodeService {

	@Resource
	private TCouponCodeMapper couponCodeMapper;

	@Override
	public Long count(Long couponID, Long memberID, Boolean isUsed) {
		Criteria c = new Criteria();
		Condition con = c.createConditon();
		if (couponID != null) {
			con.andEqualTo(TTCouponCode.COUPON, couponID);
		}
		if (memberID != null) {
			con.andEqualTo(TTCouponCode.MEMBER, memberID);
		}
		if (isUsed != null) {
			con.andEqualTo(TTCouponCode.IS_USED, isUsed);
		}
		List<TCouponCode> codes = couponCodeMapper.selectByExample(c);
		if (codes != null && codes.size() > 0) {
			return Long.valueOf(codes.size());
		}
		return 0L;
	}

	@Override
	@Transactional
	public List<TCouponCode> build(TCoupon coupon, TMember member, Integer count) {
		List<TCouponCode> couponCodes = new ArrayList<TCouponCode>();
		for (int i = 0; i < count; i++) {
			TCouponCode couponCode = build(coupon, member);
			couponCodes.add(couponCode);
		}
		return couponCodes;
	}

	private TCouponCode build(TCoupon coupon, TMember member) {
		TCouponCode couponCode = new TCouponCode();
		String uuid = UUID.randomUUID().toString().toUpperCase();
		String regex = "#";
		StringBuffer couponCodeUUID = new StringBuffer();
		couponCodeUUID.append(uuid.substring(0, 4)).append(regex).append(uuid.substring(9, 13)).append(regex)
				.append(uuid.substring(14, 18)).append(regex).append(uuid.substring(19, 23));
		Date dt = new Date();
		couponCode.setCreateDate(dt);
		couponCode.setModifyDate(dt);
		couponCode.setCode(couponCodeUUID.toString());
		couponCode.setIsUsed(false);
		if (coupon != null) {
			couponCode.setCoupon(coupon.getId());
		}
		if (member != null) {
			couponCode.setMember(member.getId());
		}
		couponCodeMapper.insertSelective(couponCode);
		return couponCode;
	}

	@Override
	@Transactional
	public void updateCouponCode(TCouponCode couponCode) {
		couponCodeMapper.updateByPrimaryKeySelective(couponCode);
	}

	@Override
	public TCouponCode findByCode(String code) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTCouponCode.CODE, code);
		List<TCouponCode> codes = couponCodeMapper.selectByExample(c);
		if (codes != null && codes.size() > 0) {
			return codes.get(0);
		}
		return null;
	}

}
