package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TPayment;

public interface PaymentService extends BaseService {

	void savePayment(TPayment payment);

	TPayment findBySn(String sn);

	TPayment find(Long paymentId);

	void handle(TPayment payment);

	List<TPayment> findPaymentByOrderId(Long orderId);

	List<TPayment> queryPaymentList(Criteria c);

	void delete(Long[] ids);

}
