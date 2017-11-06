package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import com.platform.JiaZhengService.common.util.FreemarkerUtils;

import freemarker.template.TemplateException;

import java.io.IOException;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

/**
 * @ClassName: TCoupon
 * @Description: t_coupon表对应的java bean类
 * @author: peiyu
 */
public class TCoupon extends StringAndEqualsPojo implements Serializable {
	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_coupon.id :
	 */
	private Long id;

	/**
	 * @Fields t_coupon.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_coupon.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_coupon.begin_date :
	 */
	private Date beginDate;

	/**
	 * @Fields t_coupon.end_date :
	 */
	private Date endDate;

	/**
	 * @Fields t_coupon.is_enabled :
	 */
	private Boolean isEnabled;

	/**
	 * @Fields t_coupon.is_exchange :
	 */
	private Boolean isExchange;

	/**
	 * @Fields t_coupon.maximum_price :
	 */
	private Double maximumPrice;

	/**
	 * @Fields t_coupon.maximum_quantity :
	 */
	private Integer maximumQuantity;

	/**
	 * @Fields t_coupon.minimum_price :
	 */
	private Double minimumPrice;

	/**
	 * @Fields t_coupon.minimum_quantity :
	 */
	private Integer minimumQuantity;

	/**
	 * @Fields t_coupon.name :
	 */
	private String name;

	/**
	 * @Fields t_coupon.point :
	 */
	private Long point;

	/**
	 * @Fields t_coupon.prefix :
	 */
	private String prefix;

	/**
	 * @Fields t_coupon.price_expression :
	 */
	private String priceExpression;

	/**
	 * @Fields t_coupon.circulation :
	 */
	private Long circulation;

	/**
	 * @Fields t_coupon.limited :
	 */
	private Long limited;

	/**
	 * @Fields t_coupon.is_market_price :
	 */
	private Boolean isMarketPrice;

	/**
	 * @Fields t_coupon.introduction :
	 */
	private String introduction;

	private List<TCouponCode> couponCodes;

	/**
	 * @return t_coupon.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_coupon : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_coupon.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_coupon : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_coupon.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_coupon : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_coupon.begin_date : 返回
	 */
	public Date getBeginDate() {
		return beginDate;
	}

	/**
	 * @param beginDate
	 *            of t_coupon : 设置
	 */
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	/**
	 * @return t_coupon.end_date : 返回
	 */
	public Date getEndDate() {
		return endDate;
	}

	/**
	 * @param endDate
	 *            of t_coupon : 设置
	 */
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	/**
	 * @return t_coupon.is_enabled : 返回
	 */
	public Boolean getIsEnabled() {
		return isEnabled;
	}

	/**
	 * @param isEnabled
	 *            of t_coupon : 设置
	 */
	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	/**
	 * @return t_coupon.is_exchange : 返回
	 */
	public Boolean getIsExchange() {
		return isExchange;
	}

	/**
	 * @param isExchange
	 *            of t_coupon : 设置
	 */
	public void setIsExchange(Boolean isExchange) {
		this.isExchange = isExchange;
	}

	/**
	 * @return t_coupon.maximum_price : 返回
	 */
	public Double getMaximumPrice() {
		return maximumPrice;
	}

	/**
	 * @param maximumPrice
	 *            of t_coupon : 设置
	 */
	public void setMaximumPrice(Double maximumPrice) {
		this.maximumPrice = maximumPrice;
	}

	/**
	 * @return t_coupon.maximum_quantity : 返回
	 */
	public Integer getMaximumQuantity() {
		return maximumQuantity;
	}

	/**
	 * @param maximumQuantity
	 *            of t_coupon : 设置
	 */
	public void setMaximumQuantity(Integer maximumQuantity) {
		this.maximumQuantity = maximumQuantity;
	}

	/**
	 * @return t_coupon.minimum_price : 返回
	 */
	public Double getMinimumPrice() {
		return minimumPrice;
	}

	/**
	 * @param minimumPrice
	 *            of t_coupon : 设置
	 */
	public void setMinimumPrice(Double minimumPrice) {
		this.minimumPrice = minimumPrice;
	}

	/**
	 * @return t_coupon.minimum_quantity : 返回
	 */
	public Integer getMinimumQuantity() {
		return minimumQuantity;
	}

	/**
	 * @param minimumQuantity
	 *            of t_coupon : 设置
	 */
	public void setMinimumQuantity(Integer minimumQuantity) {
		this.minimumQuantity = minimumQuantity;
	}

	/**
	 * @return t_coupon.name : 返回
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            of t_coupon : 设置
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * @return t_coupon.point : 返回
	 */
	public Long getPoint() {
		return point;
	}

	/**
	 * @param point
	 *            of t_coupon : 设置
	 */
	public void setPoint(Long point) {
		this.point = point;
	}

	/**
	 * @return t_coupon.prefix : 返回
	 */
	public String getPrefix() {
		return prefix;
	}

	/**
	 * @param prefix
	 *            of t_coupon : 设置
	 */
	public void setPrefix(String prefix) {
		this.prefix = prefix == null ? null : prefix.trim();
	}

	/**
	 * @return t_coupon.price_expression : 返回
	 */
	public String getPriceExpression() {
		return priceExpression;
	}

	/**
	 * @param priceExpression
	 *            of t_coupon : 设置
	 */
	public void setPriceExpression(String priceExpression) {
		this.priceExpression = priceExpression == null ? null : priceExpression.trim();
	}

	/**
	 * @return t_coupon.circulation : 返回
	 */
	public Long getCirculation() {
		return circulation;
	}

	/**
	 * @param circulation
	 *            of t_coupon : 设置
	 */
	public void setCirculation(Long circulation) {
		this.circulation = circulation;
	}

	/**
	 * @return t_coupon.limited : 返回
	 */
	public Long getLimited() {
		return limited;
	}

	/**
	 * @param limited
	 *            of t_coupon : 设置
	 */
	public void setLimited(Long limited) {
		this.limited = limited;
	}

	/**
	 * @return t_coupon.is_market_price : 返回
	 */
	public Boolean getIsMarketPrice() {
		return isMarketPrice;
	}

	/**
	 * @param isMarketPrice
	 *            of t_coupon : 设置
	 */
	public void setIsMarketPrice(Boolean isMarketPrice) {
		this.isMarketPrice = isMarketPrice;
	}

	/**
	 * @return t_coupon.introduction : 返回
	 */
	public String getIntroduction() {
		return introduction;
	}

	/**
	 * @param introduction
	 *            of t_coupon : 设置
	 */
	public void setIntroduction(String introduction) {
		this.introduction = introduction == null ? null : introduction.trim();
	}

	public List<TCouponCode> getCouponCodes() {
		return couponCodes;
	}

	public void setCouponCodes(List<TCouponCode> couponCodes) {
		this.couponCodes = couponCodes;
	}

	/**
	 * 计算优惠价格
	 * 
	 * @param quantity
	 *            商品数量
	 * @param price
	 *            商品价格
	 * @return 优惠价格
	 */
	public Double calculatePrice(Double quantity, Double price) {
		if (price == null || StringUtils.isEmpty(getPriceExpression())) {
			return price;
		}
		Double result = new Double(0);
		try {
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("quantity", quantity);
			model.put("price", price);
			result = new Double(FreemarkerUtils.process("#{(" + getPriceExpression() + ");M50}", model));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		if (result.compareTo(price) > 0) {
			return price;
		}
		return result.compareTo(new Double(0)) > 0 ? result : new Double(0);
	}

	/**
	 * 判断是否已开始
	 * 
	 * @return 是否已开始
	 */
	public boolean hasBegun() {
		return getBeginDate() == null || new Date().after(getBeginDate());
	}

	/**
	 * 判断是否已过期
	 * 
	 * @return 是否已过期
	 */
	public boolean hasExpired() {
		return getEndDate() != null && new Date().after(getEndDate());
	}
}