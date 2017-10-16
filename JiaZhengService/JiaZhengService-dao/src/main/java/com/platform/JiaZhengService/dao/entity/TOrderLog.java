package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TOrderLog
 * @Description: t_order_log表对应的java bean类
 * @author: peiyu
 */
public class TOrderLog extends StringAndEqualsPojo implements Serializable {

	/**
	 * 类型
	 */
	public enum Type {

		/** 订单创建 */
		create(1, "订单创建"),

		/** 订单修改 */
		modify(2, "订单修改"),

		/** 订单确认 */
		confirm(3, "订单确认"),

		/** 订单支付 */
		payment(4, "订单支付"),

		/** 订单退款 */
		refunds(5, "订单退款"),

		/** 订单发货 */
		shipping(6, "订单发货"),

		/** 订单退货 */
		returns(7, "订单退货"),

		/** 订单完成 */
		complete(8, "订单完成"),

		/** 订单取消 */
		cancel(9, "订单取消"),

		/** 其它 */
		other(10, "其它");

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
	};

	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_order_log.id :
	 */
	private Long id;

	/**
	 * @Fields t_order_log.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_order_log.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_order_log.content :
	 */
	private String content;

	/**
	 * @Fields t_order_log.operator :
	 */
	private String operator;

	/**
	 * @Fields t_order_log.type :
	 */
	private Integer type;

	/**
	 * @Fields t_order_log.orders :
	 */
	private Long orders;

	/**
	 * @return t_order_log.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_order_log : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_order_log.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_order_log : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_order_log.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_order_log : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_order_log.content : 返回
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content
	 *            of t_order_log : 设置
	 */
	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	/**
	 * @return t_order_log.operator : 返回
	 */
	public String getOperator() {
		return operator;
	}

	/**
	 * @param operator
	 *            of t_order_log : 设置
	 */
	public void setOperator(String operator) {
		this.operator = operator == null ? null : operator.trim();
	}

	/**
	 * @return t_order_log.type : 返回
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * @param type
	 *            of t_order_log : 设置
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * @return t_order_log.orders : 返回
	 */
	public Long getOrders() {
		return orders;
	}

	/**
	 * @param orders
	 *            of t_order_log : 设置
	 */
	public void setOrders(Long orders) {
		this.orders = orders;
	}
}