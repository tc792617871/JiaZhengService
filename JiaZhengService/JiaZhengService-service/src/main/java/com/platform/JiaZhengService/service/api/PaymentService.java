package com.platform.JiaZhengService.service.api;

import com.platform.JiaZhengService.dao.entity.TPayment;

public interface PaymentService extends BaseService {

	void savePayment(TPayment payment);

	TPayment findBySn(String sn);

	TPayment find(Long paymentId);

	void handle(TPayment payment);

}
