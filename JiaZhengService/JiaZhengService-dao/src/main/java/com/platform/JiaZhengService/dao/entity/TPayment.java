package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TPayment
 * @Description: t_payment表对应的java bean类
 * @author: peiyu
 */
public class TPayment extends StringAndEqualsPojo implements Serializable {

	/** 支付方式分隔符 */
	public static final String PAYMENT_METHOD_SEPARATOR = " - ";

	/**
	 * 支付状态
	 */
	public enum Type {
		payment(1, "订单支付"), recharge(2, "预存款充值");
		private Integer code;
		private String desc;

		Type(Integer code, String desc) {
			this.setCode(code);
			this.setDesc(desc);
		}

		public Integer getCode() {
			return code;
		}

		public void setCode(Integer code) {
			this.code = code;
		}

		public String getDesc() {
			return desc;
		}

		public void setDesc(String desc) {
			this.desc = desc;
		}
	}

	/**
	 * 方式
	 */
	public enum Method {
		online(1, "订单支付"), offline(2, "线下支付"), deposit(3, "预存款支付");
		private Integer code;
		private String desc;

		Method(Integer code, String desc) {
			this.setCode(code);
			this.setDesc(desc);
		}

		public Integer getCode() {
			return code;
		}

		public void setCode(Integer code) {
			this.code = code;
		}

		public String getDesc() {
			return desc;
		}

		public void setDesc(String desc) {
			this.desc = desc;
		}
	}

	/**
	 * 状态
	 */
	public enum Status {
		wait(1, "等待支付"), success(2, "支付成功"), failure(3, "支付失败");
		private Integer code;
		private String desc;

		Status(Integer code, String desc) {
			this.setCode(code);
			this.setDesc(desc);
		}

		public Integer getCode() {
			return code;
		}

		public void setCode(Integer code) {
			this.code = code;
		}

		public String getDesc() {
			return desc;
		}

		public void setDesc(String desc) {
			this.desc = desc;
		}
	}

	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_payment.id :
	 */
	private Long id;

	/**
	 * @Fields t_payment.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_payment.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_payment.account :
	 */
	private String account;

	/**
	 * @Fields t_payment.amount :
	 */
	private Double amount;

	/**
	 * @Fields t_payment.bank :
	 */
	private String bank;

	/**
	 * @Fields t_payment.expire :
	 */
	private Date expire;

	/**
	 * @Fields t_payment.fee :
	 */
	private Double fee;

	/**
	 * @Fields t_payment.memo :
	 */
	private String memo;

	/**
	 * @Fields t_payment.method :
	 */
	private Integer method;

	/**
	 * @Fields t_payment.operator :
	 */
	private String operator;

	/**
	 * @Fields t_payment.payer :
	 */
	private String payer;

	/**
	 * @Fields t_payment.payment_date :
	 */
	private Date paymentDate;

	/**
	 * @Fields t_payment.payment_method :
	 */
	private String paymentMethod;

	/**
	 * @Fields t_payment.payment_plugin_id :
	 */
	private String paymentPluginId;

	/**
	 * @Fields t_payment.sn :
	 */
	private String sn;

	/**
	 * @Fields t_payment.status :
	 */
	private Integer status;

	/**
	 * @Fields t_payment.type :
	 */
	private Integer type;

	/**
	 * @Fields t_payment.member :
	 */
	private Long member;

	/**
	 * @Fields t_payment.orders :
	 */
	private Long orders;

	private TOrder order;

	private TMember tmember;

	/**
	 * @return t_payment.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_payment : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_payment.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_payment : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_payment.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_payment : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_payment.account : 返回
	 */
	public String getAccount() {
		return account;
	}

	/**
	 * @param account
	 *            of t_payment : 设置
	 */
	public void setAccount(String account) {
		this.account = account == null ? null : account.trim();
	}

	/**
	 * @return t_payment.amount : 返回
	 */
	public Double getAmount() {
		return amount;
	}

	/**
	 * @param amount
	 *            of t_payment : 设置
	 */
	public void setAmount(Double amount) {
		this.amount = amount;
	}

	/**
	 * @return t_payment.bank : 返回
	 */
	public String getBank() {
		return bank;
	}

	/**
	 * @param bank
	 *            of t_payment : 设置
	 */
	public void setBank(String bank) {
		this.bank = bank == null ? null : bank.trim();
	}

	/**
	 * @return t_payment.expire : 返回
	 */
	public Date getExpire() {
		return expire;
	}

	/**
	 * @param expire
	 *            of t_payment : 设置
	 */
	public void setExpire(Date expire) {
		this.expire = expire;
	}

	/**
	 * @return t_payment.fee : 返回
	 */
	public Double getFee() {
		return fee;
	}

	/**
	 * @param fee
	 *            of t_payment : 设置
	 */
	public void setFee(Double fee) {
		this.fee = fee;
	}

	/**
	 * @return t_payment.memo : 返回
	 */
	public String getMemo() {
		return memo;
	}

	/**
	 * @param memo
	 *            of t_payment : 设置
	 */
	public void setMemo(String memo) {
		this.memo = memo == null ? null : memo.trim();
	}

	/**
	 * @return t_payment.method : 返回
	 */
	public Integer getMethod() {
		return method;
	}

	/**
	 * @param method
	 *            of t_payment : 设置
	 */
	public void setMethod(Integer method) {
		this.method = method;
	}

	/**
	 * @return t_payment.operator : 返回
	 */
	public String getOperator() {
		return operator;
	}

	/**
	 * @param operator
	 *            of t_payment : 设置
	 */
	public void setOperator(String operator) {
		this.operator = operator == null ? null : operator.trim();
	}

	/**
	 * @return t_payment.payer : 返回
	 */
	public String getPayer() {
		return payer;
	}

	/**
	 * @param payer
	 *            of t_payment : 设置
	 */
	public void setPayer(String payer) {
		this.payer = payer == null ? null : payer.trim();
	}

	/**
	 * @return t_payment.payment_date : 返回
	 */
	public Date getPaymentDate() {
		return paymentDate;
	}

	/**
	 * @param paymentDate
	 *            of t_payment : 设置
	 */
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	/**
	 * @return t_payment.payment_method : 返回
	 */
	public String getPaymentMethod() {
		return paymentMethod;
	}

	/**
	 * @param paymentMethod
	 *            of t_payment : 设置
	 */
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod == null ? null : paymentMethod.trim();
	}

	/**
	 * @return t_payment.payment_plugin_id : 返回
	 */
	public String getPaymentPluginId() {
		return paymentPluginId;
	}

	/**
	 * @param paymentPluginId
	 *            of t_payment : 设置
	 */
	public void setPaymentPluginId(String paymentPluginId) {
		this.paymentPluginId = paymentPluginId == null ? null : paymentPluginId.trim();
	}

	/**
	 * @return t_payment.sn : 返回
	 */
	public String getSn() {
		return sn;
	}

	/**
	 * @param sn
	 *            of t_payment : 设置
	 */
	public void setSn(String sn) {
		this.sn = sn == null ? null : sn.trim();
	}

	/**
	 * @return t_payment.status : 返回
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            of t_payment : 设置
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * @return t_payment.type : 返回
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * @param type
	 *            of t_payment : 设置
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * @return t_payment.member : 返回
	 */
	public Long getMember() {
		return member;
	}

	/**
	 * @param member
	 *            of t_payment : 设置
	 */
	public void setMember(Long member) {
		this.member = member;
	}

	/**
	 * @return t_payment.orders : 返回
	 */
	public Long getOrders() {
		return orders;
	}

	/**
	 * @param orders
	 *            of t_payment : 设置
	 */
	public void setOrders(Long orders) {
		this.orders = orders;
	}

	public TOrder getOrder() {
		return order;
	}

	public void setOrder(TOrder order) {
		this.order = order;
	}

	public TMember getTmember() {
		return tmember;
	}

	public void setTmember(TMember tmember) {
		this.tmember = tmember;
	}
}