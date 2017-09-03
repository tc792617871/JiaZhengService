package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TPaymentMethod
 * @Description: t_payment_method表对应的java bean类
 * @author: peiyu
 */
public class TPaymentMethod extends StringAndEqualsPojo implements Serializable {

	public enum Method {
		online(0, "在线支付"), offline(1, "线下支付");
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
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_payment_method.id :
	 */
	private Long id;

	/**
	 * @Fields t_payment_method.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_payment_method.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_payment_method.orders :
	 */
	private Integer orders;

	/**
	 * @Fields t_payment_method.description :
	 */
	private String description;

	/**
	 * @Fields t_payment_method.icon :
	 */
	private String icon;

	/**
	 * @Fields t_payment_method.method :
	 */
	private Integer method;

	/**
	 * @Fields t_payment_method.name :
	 */
	private String name;

	/**
	 * @Fields t_payment_method.timeout :
	 */
	private Integer timeout;

	/**
	 * @Fields t_payment_method.content :
	 */
	private String content;

	/**
	 * @return t_payment_method.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_payment_method : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_payment_method.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_payment_method : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_payment_method.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_payment_method : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_payment_method.orders : 返回
	 */
	public Integer getOrders() {
		return orders;
	}

	/**
	 * @param orders
	 *            of t_payment_method : 设置
	 */
	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	/**
	 * @return t_payment_method.description : 返回
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            of t_payment_method : 设置
	 */
	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	/**
	 * @return t_payment_method.icon : 返回
	 */
	public String getIcon() {
		return icon;
	}

	/**
	 * @param icon
	 *            of t_payment_method : 设置
	 */
	public void setIcon(String icon) {
		this.icon = icon == null ? null : icon.trim();
	}

	/**
	 * @return t_payment_method.method : 返回
	 */
	public Integer getMethod() {
		return method;
	}

	/**
	 * @param method
	 *            of t_payment_method : 设置
	 */
	public void setMethod(Integer method) {
		this.method = method;
	}

	/**
	 * @return t_payment_method.name : 返回
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            of t_payment_method : 设置
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * @return t_payment_method.timeout : 返回
	 */
	public Integer getTimeout() {
		return timeout;
	}

	/**
	 * @param timeout
	 *            of t_payment_method : 设置
	 */
	public void setTimeout(Integer timeout) {
		this.timeout = timeout;
	}

	/**
	 * @return t_payment_method.content : 返回
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content
	 *            of t_payment_method : 设置
	 */
	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}
}