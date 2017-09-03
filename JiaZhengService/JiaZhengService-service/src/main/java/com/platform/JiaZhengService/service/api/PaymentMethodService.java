package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TPaymentMethod;

/**
 * Service - 支付方式
 */
public interface PaymentMethodService extends BaseService {

	List<TPaymentMethod> queryPaymentMethodList(Criteria c);

	int count();

	void delete(Long[] ids);

	void update(TPaymentMethod paymentMethod);

	void save(TPaymentMethod paymentMethod);

	TPaymentMethod find(Long id);

}