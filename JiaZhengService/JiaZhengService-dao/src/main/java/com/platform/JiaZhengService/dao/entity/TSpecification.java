package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.CompareToBuilder;

/**
 * @ClassName: TSpecification
 * @Description: t_specification表对应的java bean类
 * @author: peiyu
 */
public class TSpecification extends StringAndEqualsPojo implements Serializable, Comparable<TSpecification> {
	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_specification.id :
	 */
	private Long id;

	/**
	 * @Fields t_specification.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_specification.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_specification.orders :
	 */
	private Integer orders;

	/**
	 * @Fields t_specification.memo :
	 */
	private String memo;

	/**
	 * @Fields t_specification.name :
	 */
	private String name;

	/**
	 * @Fields t_specification.type :
	 */
	private Integer type;

	/**
	 * @Fields t_specification.code :
	 */
	private String code;

	/**
	 * @Fields t_specification.price :
	 */
	private String price;

	/**
	 * @Fields t_specification.min_num :
	 */
	private Double minNum;

	/**
	 * @Fields t_specification.max_num :
	 */
	private Double maxNum;

	/**
	 * @Fields t_specification.is_enable :
	 */
	private Boolean isEnable;

	/**
	 * @return t_specification.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_specification : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_specification.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_specification : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_specification.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_specification : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_specification.orders : 返回
	 */
	public Integer getOrders() {
		return orders;
	}

	/**
	 * @param orders
	 *            of t_specification : 设置
	 */
	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	/**
	 * @return t_specification.memo : 返回
	 */
	public String getMemo() {
		return memo;
	}

	/**
	 * @param memo
	 *            of t_specification : 设置
	 */
	public void setMemo(String memo) {
		this.memo = memo == null ? null : memo.trim();
	}

	/**
	 * @return t_specification.name : 返回
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            of t_specification : 设置
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * @return t_specification.type : 返回
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * @param type
	 *            of t_specification : 设置
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * @return t_specification.code : 返回
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code
	 *            of t_specification : 设置
	 */
	public void setCode(String code) {
		this.code = code == null ? null : code.trim();
	}

	/**
	 * @return t_specification.price : 返回
	 */
	public String getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            of t_specification : 设置
	 */
	public void setPrice(String price) {
		this.price = price == null ? null : price.trim();
	}

	/**
	 * @return t_specification.min_num : 返回
	 */
	public Double getMinNum() {
		return minNum;
	}

	/**
	 * @param minNum
	 *            of t_specification : 设置
	 */
	public void setMinNum(Double minNum) {
		this.minNum = minNum;
	}

	/**
	 * @return t_specification.max_num : 返回
	 */
	public Double getMaxNum() {
		return maxNum;
	}

	/**
	 * @param maxNum
	 *            of t_specification : 设置
	 */
	public void setMaxNum(Double maxNum) {
		this.maxNum = maxNum;
	}

	/**
	 * @return t_specification.is_enable : 返回
	 */
	public Boolean getIsEnable() {
		return isEnable;
	}

	/**
	 * @param isEnable
	 *            of t_specification : 设置
	 */
	public void setIsEnable(Boolean isEnable) {
		this.isEnable = isEnable;
	}

	@Override
	public int compareTo(TSpecification o) {
		return new CompareToBuilder().append(getOrders(), o.getOrders()).toComparison();
	}

	public boolean isEmpty() {
		return StringUtils.isEmpty(getCode()) || StringUtils.isEmpty(getName()) || StringUtils.isEmpty(getPrice())
				|| getMinNum() == null || getMaxNum() == null;
	}
}