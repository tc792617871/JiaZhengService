package com.platform.JiaZhengService.dao.entity;

import java.io.Serializable;
import java.util.Date;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;

/**
 * @ClassName: TOrderItem
 * @Description: t_order_item表对应的java bean类
 * @author: peiyu
 */
public class TOrderItem extends StringAndEqualsPojo implements Serializable {
	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_order_item.id :
	 */
	private Long id;

	/**
	 * @Fields t_order_item.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_order_item.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_order_item.full_name :
	 */
	private String fullName;

	/**
	 * @Fields t_order_item.is_gift :
	 */
	private Boolean isGift;

	/**
	 * @Fields t_order_item.name :
	 */
	private String name;

	/**
	 * @Fields t_order_item.price :
	 */
	private Double price;

	/**
	 * @Fields t_order_item.quantity :
	 */
	private Double quantity;

	/**
	 * @Fields t_order_item.return_quantity :
	 */
	private Double returnQuantity;

	/**
	 * @Fields t_order_item.shipped_quantity :
	 */
	private Double shippedQuantity;

	/**
	 * @Fields t_order_item.sn :
	 */
	private String sn;

	/**
	 * @Fields t_order_item.thumbnail :
	 */
	private String thumbnail;

	/**
	 * @Fields t_order_item.weight :
	 */
	private Integer weight;

	/**
	 * @Fields t_order_item.orders :
	 */
	private Long orders;

	/**
	 * @Fields t_order_item.product :
	 */
	private Long product;

	/**
	 * @Fields t_order_item.agree_return_quantity :
	 */
	private Integer agreeReturnQuantity;

	/**
	 * @Fields t_order_item.confirm_receipt_quantity :
	 */
	private Integer confirmReceiptQuantity;

	/**
	 * @Fields t_order_item.specification :
	 */
	private Long specification;

	private TProduct tProduct;

	private TSpecification tSpecification;

	/**
	 * @return t_order_item.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_order_item : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_order_item.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_order_item : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_order_item.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_order_item : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_order_item.full_name : 返回
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName
	 *            of t_order_item : 设置
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName == null ? null : fullName.trim();
	}

	/**
	 * @return t_order_item.is_gift : 返回
	 */
	public Boolean getIsGift() {
		return isGift;
	}

	/**
	 * @param isGift
	 *            of t_order_item : 设置
	 */
	public void setIsGift(Boolean isGift) {
		this.isGift = isGift;
	}

	/**
	 * @return t_order_item.name : 返回
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            of t_order_item : 设置
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * @return t_order_item.price : 返回
	 */
	public Double getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            of t_order_item : 设置
	 */
	public void setPrice(Double price) {
		this.price = price;
	}

	/**
	 * @return t_order_item.quantity : 返回
	 */
	public Double getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity
	 *            of t_order_item : 设置
	 */
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return t_order_item.return_quantity : 返回
	 */
	public Double getReturnQuantity() {
		return returnQuantity;
	}

	/**
	 * @param returnQuantity
	 *            of t_order_item : 设置
	 */
	public void setReturnQuantity(Double returnQuantity) {
		this.returnQuantity = returnQuantity;
	}

	/**
	 * @return t_order_item.shipped_quantity : 返回
	 */
	public Double getShippedQuantity() {
		return shippedQuantity;
	}

	/**
	 * @param shippedQuantity
	 *            of t_order_item : 设置
	 */
	public void setShippedQuantity(Double shippedQuantity) {
		this.shippedQuantity = shippedQuantity;
	}

	/**
	 * @return t_order_item.sn : 返回
	 */
	public String getSn() {
		return sn;
	}

	/**
	 * @param sn
	 *            of t_order_item : 设置
	 */
	public void setSn(String sn) {
		this.sn = sn == null ? null : sn.trim();
	}

	/**
	 * @return t_order_item.thumbnail : 返回
	 */
	public String getThumbnail() {
		return thumbnail;
	}

	/**
	 * @param thumbnail
	 *            of t_order_item : 设置
	 */
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail == null ? null : thumbnail.trim();
	}

	/**
	 * @return t_order_item.weight : 返回
	 */
	public Integer getWeight() {
		return weight;
	}

	/**
	 * @param weight
	 *            of t_order_item : 设置
	 */
	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	/**
	 * @return t_order_item.orders : 返回
	 */
	public Long getOrders() {
		return orders;
	}

	/**
	 * @param orders
	 *            of t_order_item : 设置
	 */
	public void setOrders(Long orders) {
		this.orders = orders;
	}

	/**
	 * @return t_order_item.product : 返回
	 */
	public Long getProduct() {
		return product;
	}

	/**
	 * @param product
	 *            of t_order_item : 设置
	 */
	public void setProduct(Long product) {
		this.product = product;
	}

	/**
	 * @return t_order_item.agree_return_quantity : 返回
	 */
	public Integer getAgreeReturnQuantity() {
		return agreeReturnQuantity;
	}

	/**
	 * @param agreeReturnQuantity
	 *            of t_order_item : 设置
	 */
	public void setAgreeReturnQuantity(Integer agreeReturnQuantity) {
		this.agreeReturnQuantity = agreeReturnQuantity;
	}

	/**
	 * @return t_order_item.confirm_receipt_quantity : 返回
	 */
	public Integer getConfirmReceiptQuantity() {
		return confirmReceiptQuantity;
	}

	/**
	 * @param confirmReceiptQuantity
	 *            of t_order_item : 设置
	 */
	public void setConfirmReceiptQuantity(Integer confirmReceiptQuantity) {
		this.confirmReceiptQuantity = confirmReceiptQuantity;
	}

	/**
	 * @return t_order_item.specification : 返回
	 */
	public Long getSpecification() {
		return specification;
	}

	/**
	 * @param specification
	 *            of t_order_item : 设置
	 */
	public void setSpecification(Long specification) {
		this.specification = specification;
	}

	/**
	 * 获取小计
	 * 
	 * @return 小计
	 */
	public Double getSubtotal() {
		if (getPrice() != null && getQuantity() != null) {
			return getPrice() * getQuantity();
		} else {
			return new Double(0);
		}
	}

	/**
	 * 获取销售价格的
	 * 
	 * @return 价格
	 */
	public Double getSellingPrice() {
		return getPrice();
	}

	/**
	 * 获取销售价格小计
	 * 
	 * @return 小计
	 */
	public Double getSellingSubtotal() {
		if (getQuantity() != null) {
			return getSellingPrice() * (new Double(getQuantity()));
		} else {
			return new Double(0);
		}
	}

	public TProduct gettProduct() {
		return tProduct;
	}

	public void settProduct(TProduct tProduct) {
		this.tProduct = tProduct;
	}

	public TSpecification gettSpecification() {
		return tSpecification;
	}

	public void settSpecification(TSpecification tSpecification) {
		this.tSpecification = tSpecification;
	}
}