package com.platform.JiaZhengService.Controller.admin;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.pojo.TableAliasConstants;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.Criteria.Condition;
import com.platform.JiaZhengService.dao.Pageable;
import com.platform.JiaZhengService.dao.constants.TTPayment;
import com.platform.JiaZhengService.dao.entity.TPayment;
import com.platform.JiaZhengService.dao.entity.TPayment.Status;
import com.platform.JiaZhengService.service.api.OrderService;
import com.platform.JiaZhengService.service.api.PaymentService;

/**
 * Controller - 收款单
 */
@Controller("adminPaymentController")
@RequestMapping("/admin/payment")
public class PaymentController extends AbstractController {

	/** 订单编号 */
	private final static String ORDERSN_PROPERTY = "orderSn";

	@Resource(name = "paymentServiceImpl")
	private PaymentService paymentService;

	@Resource(name = "orderServiceImpl")
	private OrderService orderService;

	/**
	 * 查看
	 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Long id, ModelMap model) {
		model.addAttribute("payment", paymentService.find(id));
		return "/admin/payment/view";
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model, Status payStatus) {
		Criteria c = createPaginationCriteria(pageable);
		Condition con = c.createConditon();
		if (StringUtils.isNotEmpty(pageable.getSearchProperty()) && StringUtils.isNotEmpty(pageable.getSearchValue())) {
			String searchPropertyString = pageable.getSearchProperty();
			if (ORDERSN_PROPERTY.equals(searchPropertyString)) {
				con.andLike(TableAliasConstants.ALIAS_T_ORDER + pageable.getSearchProperty(),
						pageable.getSearchValue());
			} else {
				con.andLike(TableAliasConstants.ALIAS_T_PAYMNET + pageable.getSearchProperty(),
						pageable.getSearchValue());
			}
		}
		if (payStatus != null) {
			con.andEqualTo(TableAliasConstants.ALIAS_T_PAYMNET + TTPayment.STATUS, payStatus.getCode());
		}
		model.addAttribute("payStatus", payStatus);

		model.addAttribute("pageable", pageable);
		model.addAttribute("page", c.getPage());
		model.addAttribute("content", paymentService.queryPaymentList(c));
		return "/admin/payment/list";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				TPayment payment = paymentService.find(id);
				if (payment != null && payment.getExpire() != null && !payment.hasExpired()) {
					return Message.error("admin.payment.deleteUnexpiredNotAllowed");
				}
			}
			paymentService.delete(ids);
		}
		return SUCCESS_MESSAGE;
	}

}
