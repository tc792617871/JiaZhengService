package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TPaymentMethod;
import com.platform.JiaZhengService.dao.mapper.TPaymentMethodMapper;
import com.platform.JiaZhengService.service.api.PaymentMethodService;

/**
 * Service - 支付方式
 */
@Service("paymentMethodServiceImpl")
public class PaymentMethodServiceImpl extends BaseServiceImpl implements PaymentMethodService {

	@Resource
	private TPaymentMethodMapper paymentMethodMapper;

	@Override
	public List<TPaymentMethod> queryPaymentMethodList(Criteria c) {
		return paymentMethodMapper.selectByExample(c);
	}

	@Override
	public int count() {
		Criteria c = new Criteria();
		List<TPaymentMethod> paymentMethods = paymentMethodMapper.selectByExample(c);
		return paymentMethods.size();
	}

	@Override
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				paymentMethodMapper.deleteByPrimaryKey(id);
			}
		}
	}

	@Override
	public void update(TPaymentMethod paymentMethod) {
		paymentMethod.setModifyDate(new Date());
		paymentMethodMapper.updateByPrimaryKeySelective(paymentMethod);
	}

	@Override
	public void save(TPaymentMethod paymentMethod) {
		paymentMethod.setCreateDate(new Date());
		paymentMethod.setModifyDate(new Date());
		paymentMethodMapper.insertSelective(paymentMethod);
	}

	@Override
	public TPaymentMethod find(Long id) {
		if (id != null) {
			return paymentMethodMapper.selectByPrimaryKey(id);
		}
		return null;
	}

}