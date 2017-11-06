package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName: TCart
 * @Description: t_cart表对应的java bean类
 * @author: peiyu
 */
public class TCart extends StringAndEqualsPojo implements Serializable {
	/** 最大商品数 */
	public static final Integer MAX_PRODUCT_COUNT = 100;

	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_cart.id :
	 */
	private Long id;

	/**
	 * @Fields t_cart.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_cart.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_cart.cart_key :
	 */
	private String cartKey;

	/**
	 * @Fields t_cart.member :
	 */
	private Long member;

	private List<TCartItem> cartItems = new ArrayList<>();

	/**
	 * @return t_cart.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_cart : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_cart.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_cart : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_cart.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_cart : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_cart.cart_key : 返回
	 */
	public String getCartKey() {
		return cartKey;
	}

	/**
	 * @param cartKey
	 *            of t_cart : 设置
	 */
	public void setCartKey(String cartKey) {
		this.cartKey = cartKey == null ? null : cartKey.trim();
	}

	/**
	 * @return t_cart.member : 返回
	 */
	public Long getMember() {
		return member;
	}

	/**
	 * @param member
	 *            of t_cart : 设置
	 */
	public void setMember(Long member) {
		this.member = member;
	}

	public boolean contains(TSpecification specification) {
		if (specification != null && getCartItems() != null) {
			for (TCartItem cartItem : getCartItems()) {
				if (cartItem != null && cartItem.getSpecification() != null
						&& cartItem.getSpecification().equals(specification.getId())) {
					return true;
				}
			}
		}
		return false;
	}

	public List<TCartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<TCartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public TCartItem getCartItem(TSpecification specification) {
		if (specification != null && getCartItems() != null) {
			for (TCartItem cartItem : getCartItems()) {
				if (cartItem != null && cartItem.getSpecification() != null
						&& cartItem.getSpecification().equals(specification.getId())) {
					return cartItem;
				}
			}
		}
		return null;
	}

	public Double getQuantity() {
		Double quantity = new Double(0);
		if (getCartItems() != null && getCartItems().size() > 0) {
			for (TCartItem cartItem : getCartItems()) {
				if (cartItem != null && cartItem.getQuantity() != null) {
					quantity += cartItem.getQuantity();
				}
			}
		}
		return quantity;
	}

	public Boolean isAreaSquare() {
		if (getCartItems() != null && getCartItems().size() > 0) {
			for (TCartItem cartItem : getCartItems()) {
				TProduct product = cartItem.getTproduct();
				if (cartItem != null && product != null && product.getIsSquare()) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 获取有效商品价格
	 * 
	 * @return 有效商品价格
	 */
	public Double getEffectivePrice() {
		Double effectivePrice = getPrice() - getDiscount();
		return effectivePrice.compareTo(new Double(0)) > 0 ? effectivePrice : new Double(0);
	}

	/**
	 * 获取折扣
	 * 
	 * @return 折扣
	 */
	public Double getDiscount() {
		return new Double(0);
	}

	/**
	 * 获取商品价格
	 * 
	 * @return 商品价格
	 */
	public Double getPrice() {
		Double price = new Double(0);
		if (getCartItems() != null) {
			for (TCartItem cartItem : getCartItems()) {
				if (cartItem != null && cartItem.getSubtotal() != null) {
					price = price + cartItem.getSubtotal();
				}
			}
		}
		return price;
	}

	/**
	 * 判断优惠券是否有效
	 * 
	 * @param coupon
	 *            优惠券
	 * @return 优惠券是否有效
	 */
	public boolean isValid(TCoupon coupon) {
		if (coupon == null || !coupon.getIsEnabled() || !coupon.hasBegun() || coupon.hasExpired()) {
			return false;
		}
		if ((coupon.getMinimumQuantity() != null && coupon.getMinimumQuantity() > getQuantity())
				|| (coupon.getMaximumQuantity() != null && coupon.getMaximumQuantity() < getQuantity())) {
			return false;
		}
		if ((coupon.getMinimumPrice() != null && coupon.getMinimumPrice().compareTo(getEffectivePrice()) > 0)
				|| (coupon.getMaximumPrice() != null && coupon.getMaximumPrice().compareTo(getEffectivePrice()) < 0)) {
			return false;
		}
		return true;
	}
}