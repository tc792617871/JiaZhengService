package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.common.util.SpringUtils;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTPayment;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.entity.TPayment;
import com.platform.JiaZhengService.dao.entity.TPayment.Status;
import com.platform.JiaZhengService.dao.entity.TPayment.Type;
import com.platform.JiaZhengService.dao.mapper.TMemberMapper;
import com.platform.JiaZhengService.dao.mapper.TOrderMapper;
import com.platform.JiaZhengService.dao.mapper.TPaymentMapper;
import com.platform.JiaZhengService.service.api.OrderService;
import com.platform.JiaZhengService.service.api.PaymentService;
import com.platform.JiaZhengService.service.api.SmsMqListService;

@Service("paymentServiceImpl")
public class PaymentServiceImpl extends BaseServiceImpl implements PaymentService {

	@Resource
	private TPaymentMapper paymentMapper;

	@Resource
	private TOrderMapper orderMapper;

	@Resource
	private TMemberMapper memberMapper;

	@Resource(name = "smsMqListServiceImpl")
	private SmsMqListService smsMqListService;

	@Resource(name = "orderServiceImpl")
	private OrderService orderService;

	@Override
	public void savePayment(TPayment payment) {
		payment.setCreateDate(new Date());
		payment.setModifyDate(new Date());
		paymentMapper.insertSelective(payment);
	}

	@Override
	public TPayment findBySn(String sn) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTPayment.SN, sn);
		List<TPayment> payments = paymentMapper.selectByExample(c);
		if (payments != null && payments.size() > 0) {
			return payments.get(0);
		}
		return null;
	}

	@Override
	public TPayment find(Long paymentId) {
		if (paymentId != null) {
			return paymentMapper.selectByPrimaryKey(paymentId);
		}
		return null;
	}

	@Override
	public void handle(TPayment payment) {
		if (payment != null && payment.getStatus() == Status.wait.getCode()) {
			TOrder order = orderMapper.selectByPrimaryKey(payment.getOrders());
			TMember member = memberMapper.selectByPrimaryKey(payment.getMember());
			if (payment.getType() == Type.payment.getCode()) {
				if (order != null) {
					orderService.payment(order, payment, null);
				}
			}
			payment.setStatus(Status.success.getCode());
			payment.setPaymentDate(new Date());
			paymentMapper.updateByPrimaryKeySelective(payment);
			if (member != null && member.getMobile() != null) {
				Setting setting = SettingUtils.get();
				smsMqListService.sendSms(member.getMobile(), SpringUtils.getMessage("shop.message.send.payOrderReminds",
						payment.getPaymentDate(), order.getSn(), setting.getPhone()));
			}
		}
	}

}
