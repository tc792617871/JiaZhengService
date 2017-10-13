package com.platform.JiaZhengService.dao.entity;

import java.io.Serializable;
import java.util.Date;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;

/**
 * @ClassName: TCartItem
 * @Description: t_cart_item表对应的java bean类
 * @author: peiyu
 */
public class TCartItem extends StringAndEqualsPojo implements Serializable {

	/** 最大数量 */
	public static final Integer MAX_QUANTITY = 10000;

	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_cart_item.id :
	 */
	private Long id;

	/**
	 * @Fields t_cart_item.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_cart_item.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_cart_item.quantity :
	 */
	private Double quantity;

	/**
	 * @Fields t_cart_item.cart :
	 */
	private Long cart;

	/**
	 * @Fields t_cart_item.product :
	 */
	private Long product;

	/**
	 * @Fields t_cart_item.specification :
	 */
	private Long specification;

	private TProduct tproduct;

	private TSpecification tSpecification;

	/**
	 * @return t_cart_item.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_cart_item : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_cart_item.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_cart_item : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_cart_item.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_cart_item : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_cart_item.quantity : 返回
	 */
	public Double getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity
	 *            of t_cart_item : 设置
	 */
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return t_cart_item.cart : 返回
	 */
	public Long getCart() {
		return cart;
	}

	/**
	 * @param cart
	 *            of t_cart_item : 设置
	 */
	public void setCart(Long cart) {
		this.cart = cart;
	}

	/**
	 * @return t_cart_item.product : 返回
	 */
	public Long getProduct() {
		return product;
	}

	/**
	 * @param product
	 *            of t_cart_item : 设置
	 */
	public void setProduct(Long product) {
		this.product = product;
	}

	/**
	 * @return t_cart_item.specification : 返回
	 */
	public Long getSpecification() {
		return specification;
	}

	/**
	 * @param specification
	 *            of t_cart_item : 设置
	 */
	public void setSpecification(Long specification) {
		this.specification = specification;
	}

	public TProduct getTproduct() {
		return tproduct;
	}

	public void setTproduct(TProduct tproduct) {
		this.tproduct = tproduct;
	}

	public TSpecification gettSpecification() {
		return tSpecification;
	}

	public void settSpecification(TSpecification tSpecification) {
		this.tSpecification = tSpecification;
	}

	/**
	 * 获取价格
	 * 
	 * @return 价格
	 */
	public Double getPrice() {
		if (getTproduct() != null && gettSpecification() != null && gettSpecification().getPrice() != null) {
			return gettSpecification().getPrice();
		} else {
			return new Double(0);
		}
	}
}