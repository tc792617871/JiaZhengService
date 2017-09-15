package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @ClassName: TProduct
 * @Description: t_product表对应的java bean类
 * @author: peiyu
 */
public class TProduct extends StringAndEqualsPojo implements Serializable {
	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_product.id :
	 */
	private Long id;

	/**
	 * @Fields t_product.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_product.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_product.allocated_stock :
	 */
	private Integer allocatedStock;

	/**
	 * @Fields t_product.attribute_value0 :
	 */
	private String attributeValue0;

	/**
	 * @Fields t_product.attribute_value1 :
	 */
	private String attributeValue1;

	/**
	 * @Fields t_product.attribute_value10 :
	 */
	private String attributeValue10;

	/**
	 * @Fields t_product.attribute_value11 :
	 */
	private String attributeValue11;

	/**
	 * @Fields t_product.attribute_value12 :
	 */
	private String attributeValue12;

	/**
	 * @Fields t_product.attribute_value13 :
	 */
	private String attributeValue13;

	/**
	 * @Fields t_product.attribute_value14 :
	 */
	private String attributeValue14;

	/**
	 * @Fields t_product.attribute_value15 :
	 */
	private String attributeValue15;

	/**
	 * @Fields t_product.attribute_value16 :
	 */
	private String attributeValue16;

	/**
	 * @Fields t_product.attribute_value17 :
	 */
	private String attributeValue17;

	/**
	 * @Fields t_product.attribute_value18 :
	 */
	private String attributeValue18;

	/**
	 * @Fields t_product.attribute_value19 :
	 */
	private String attributeValue19;

	/**
	 * @Fields t_product.attribute_value2 :
	 */
	private String attributeValue2;

	/**
	 * @Fields t_product.attribute_value3 :
	 */
	private String attributeValue3;

	/**
	 * @Fields t_product.attribute_value4 :
	 */
	private String attributeValue4;

	/**
	 * @Fields t_product.attribute_value5 :
	 */
	private String attributeValue5;

	/**
	 * @Fields t_product.attribute_value6 :
	 */
	private String attributeValue6;

	/**
	 * @Fields t_product.attribute_value7 :
	 */
	private String attributeValue7;

	/**
	 * @Fields t_product.attribute_value8 :
	 */
	private String attributeValue8;

	/**
	 * @Fields t_product.attribute_value9 :
	 */
	private String attributeValue9;

	/**
	 * @Fields t_product.cost :
	 */
	private String cost;

	/**
	 * @Fields t_product.full_name :
	 */
	private String fullName;

	/**
	 * @Fields t_product.hits :
	 */
	private Long hits;

	/**
	 * @Fields t_product.image :
	 */
	private String image;

	/**
	 * @Fields t_product.is_gift :
	 */
	private Boolean isGift;

	/**
	 * @Fields t_product.is_list :
	 */
	private Boolean isList;

	/**
	 * @Fields t_product.is_marketable :
	 */
	private Boolean isMarketable;

	/**
	 * @Fields t_product.is_top :
	 */
	private Boolean isTop;

	/**
	 * @Fields t_product.keyword :
	 */
	private String keyword;

	/**
	 * @Fields t_product.market_price :
	 */
	private String marketPrice;

	/**
	 * @Fields t_product.memo :
	 */
	private String memo;

	/**
	 * @Fields t_product.month_hits :
	 */
	private Long monthHits;

	/**
	 * @Fields t_product.month_hits_date :
	 */
	private Date monthHitsDate;

	/**
	 * @Fields t_product.month_sales :
	 */
	private Long monthSales;

	/**
	 * @Fields t_product.month_sales_date :
	 */
	private Date monthSalesDate;

	/**
	 * @Fields t_product.name :
	 */
	private String name;

	/**
	 * @Fields t_product.point :
	 */
	private Long point;

	/**
	 * @Fields t_product.price :
	 */
	private String price;

	/**
	 * @Fields t_product.sales :
	 */
	private Long sales;

	/**
	 * @Fields t_product.score :
	 */
	private Float score;

	/**
	 * @Fields t_product.score_count :
	 */
	private Long scoreCount;

	/**
	 * @Fields t_product.seo_description :
	 */
	private String seoDescription;

	/**
	 * @Fields t_product.seo_keywords :
	 */
	private String seoKeywords;

	/**
	 * @Fields t_product.seo_title :
	 */
	private String seoTitle;

	/**
	 * @Fields t_product.sn :
	 */
	private String sn;

	/**
	 * @Fields t_product.stock :
	 */
	private Integer stock;

	/**
	 * @Fields t_product.stock_memo :
	 */
	private String stockMemo;

	/**
	 * @Fields t_product.total_score :
	 */
	private Long totalScore;

	/**
	 * @Fields t_product.unit :
	 */
	private String unit;

	/**
	 * @Fields t_product.week_hits :
	 */
	private Long weekHits;

	/**
	 * @Fields t_product.week_hits_date :
	 */
	private Date weekHitsDate;

	/**
	 * @Fields t_product.week_sales :
	 */
	private Long weekSales;

	/**
	 * @Fields t_product.week_sales_date :
	 */
	private Date weekSalesDate;

	/**
	 * @Fields t_product.weight :
	 */
	private Integer weight;

	/**
	 * @Fields t_product.brand :
	 */
	private Long brand;

	/**
	 * @Fields t_product.goods :
	 */
	private Long goods;

	/**
	 * @Fields t_product.product_category :
	 */
	private Long productCategory;

	/**
	 * @Fields t_product.barcode :
	 */
	private String barcode;

	/**
	 * @Fields t_product.color_image_thumbnail :
	 */
	private String colorImageThumbnail;

	/**
	 * @Fields t_product.merchant_number :
	 */
	private String merchantNumber;

	/**
	 * @Fields t_product.plu_image :
	 */
	private String pluImage;

	/**
	 * @Fields t_product.archived :
	 */
	private String archived;

	/**
	 * @Fields t_product.plu_code :
	 */
	private String pluCode;

	/**
	 * @Fields t_product.timing_marketable_date :
	 */
	private Date timingMarketableDate;

	/**
	 * @Fields t_product.is_square :
	 */
	private Boolean isSquare;

	private List<TSpecification> specifications;

	private Long[] tagIds;

	private List<TTag> tags;

	private TProductCategory category;

	/**
	 * @return t_product.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_product : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_product.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_product : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_product.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_product : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_product.allocated_stock : 返回
	 */
	public Integer getAllocatedStock() {
		return allocatedStock;
	}

	/**
	 * @param allocatedStock
	 *            of t_product : 设置
	 */
	public void setAllocatedStock(Integer allocatedStock) {
		this.allocatedStock = allocatedStock;
	}

	/**
	 * @return t_product.attribute_value0 : 返回
	 */
	public String getAttributeValue0() {
		return attributeValue0;
	}

	/**
	 * @param attributeValue0
	 *            of t_product : 设置
	 */
	public void setAttributeValue0(String attributeValue0) {
		this.attributeValue0 = attributeValue0 == null ? null : attributeValue0.trim();
	}

	/**
	 * @return t_product.attribute_value1 : 返回
	 */
	public String getAttributeValue1() {
		return attributeValue1;
	}

	/**
	 * @param attributeValue1
	 *            of t_product : 设置
	 */
	public void setAttributeValue1(String attributeValue1) {
		this.attributeValue1 = attributeValue1 == null ? null : attributeValue1.trim();
	}

	/**
	 * @return t_product.attribute_value10 : 返回
	 */
	public String getAttributeValue10() {
		return attributeValue10;
	}

	/**
	 * @param attributeValue10
	 *            of t_product : 设置
	 */
	public void setAttributeValue10(String attributeValue10) {
		this.attributeValue10 = attributeValue10 == null ? null : attributeValue10.trim();
	}

	/**
	 * @return t_product.attribute_value11 : 返回
	 */
	public String getAttributeValue11() {
		return attributeValue11;
	}

	/**
	 * @param attributeValue11
	 *            of t_product : 设置
	 */
	public void setAttributeValue11(String attributeValue11) {
		this.attributeValue11 = attributeValue11 == null ? null : attributeValue11.trim();
	}

	/**
	 * @return t_product.attribute_value12 : 返回
	 */
	public String getAttributeValue12() {
		return attributeValue12;
	}

	/**
	 * @param attributeValue12
	 *            of t_product : 设置
	 */
	public void setAttributeValue12(String attributeValue12) {
		this.attributeValue12 = attributeValue12 == null ? null : attributeValue12.trim();
	}

	/**
	 * @return t_product.attribute_value13 : 返回
	 */
	public String getAttributeValue13() {
		return attributeValue13;
	}

	/**
	 * @param attributeValue13
	 *            of t_product : 设置
	 */
	public void setAttributeValue13(String attributeValue13) {
		this.attributeValue13 = attributeValue13 == null ? null : attributeValue13.trim();
	}

	/**
	 * @return t_product.attribute_value14 : 返回
	 */
	public String getAttributeValue14() {
		return attributeValue14;
	}

	/**
	 * @param attributeValue14
	 *            of t_product : 设置
	 */
	public void setAttributeValue14(String attributeValue14) {
		this.attributeValue14 = attributeValue14 == null ? null : attributeValue14.trim();
	}

	/**
	 * @return t_product.attribute_value15 : 返回
	 */
	public String getAttributeValue15() {
		return attributeValue15;
	}

	/**
	 * @param attributeValue15
	 *            of t_product : 设置
	 */
	public void setAttributeValue15(String attributeValue15) {
		this.attributeValue15 = attributeValue15 == null ? null : attributeValue15.trim();
	}

	/**
	 * @return t_product.attribute_value16 : 返回
	 */
	public String getAttributeValue16() {
		return attributeValue16;
	}

	/**
	 * @param attributeValue16
	 *            of t_product : 设置
	 */
	public void setAttributeValue16(String attributeValue16) {
		this.attributeValue16 = attributeValue16 == null ? null : attributeValue16.trim();
	}

	/**
	 * @return t_product.attribute_value17 : 返回
	 */
	public String getAttributeValue17() {
		return attributeValue17;
	}

	/**
	 * @param attributeValue17
	 *            of t_product : 设置
	 */
	public void setAttributeValue17(String attributeValue17) {
		this.attributeValue17 = attributeValue17 == null ? null : attributeValue17.trim();
	}

	/**
	 * @return t_product.attribute_value18 : 返回
	 */
	public String getAttributeValue18() {
		return attributeValue18;
	}

	/**
	 * @param attributeValue18
	 *            of t_product : 设置
	 */
	public void setAttributeValue18(String attributeValue18) {
		this.attributeValue18 = attributeValue18 == null ? null : attributeValue18.trim();
	}

	/**
	 * @return t_product.attribute_value19 : 返回
	 */
	public String getAttributeValue19() {
		return attributeValue19;
	}

	/**
	 * @param attributeValue19
	 *            of t_product : 设置
	 */
	public void setAttributeValue19(String attributeValue19) {
		this.attributeValue19 = attributeValue19 == null ? null : attributeValue19.trim();
	}

	/**
	 * @return t_product.attribute_value2 : 返回
	 */
	public String getAttributeValue2() {
		return attributeValue2;
	}

	/**
	 * @param attributeValue2
	 *            of t_product : 设置
	 */
	public void setAttributeValue2(String attributeValue2) {
		this.attributeValue2 = attributeValue2 == null ? null : attributeValue2.trim();
	}

	/**
	 * @return t_product.attribute_value3 : 返回
	 */
	public String getAttributeValue3() {
		return attributeValue3;
	}

	/**
	 * @param attributeValue3
	 *            of t_product : 设置
	 */
	public void setAttributeValue3(String attributeValue3) {
		this.attributeValue3 = attributeValue3 == null ? null : attributeValue3.trim();
	}

	/**
	 * @return t_product.attribute_value4 : 返回
	 */
	public String getAttributeValue4() {
		return attributeValue4;
	}

	/**
	 * @param attributeValue4
	 *            of t_product : 设置
	 */
	public void setAttributeValue4(String attributeValue4) {
		this.attributeValue4 = attributeValue4 == null ? null : attributeValue4.trim();
	}

	/**
	 * @return t_product.attribute_value5 : 返回
	 */
	public String getAttributeValue5() {
		return attributeValue5;
	}

	/**
	 * @param attributeValue5
	 *            of t_product : 设置
	 */
	public void setAttributeValue5(String attributeValue5) {
		this.attributeValue5 = attributeValue5 == null ? null : attributeValue5.trim();
	}

	/**
	 * @return t_product.attribute_value6 : 返回
	 */
	public String getAttributeValue6() {
		return attributeValue6;
	}

	/**
	 * @param attributeValue6
	 *            of t_product : 设置
	 */
	public void setAttributeValue6(String attributeValue6) {
		this.attributeValue6 = attributeValue6 == null ? null : attributeValue6.trim();
	}

	/**
	 * @return t_product.attribute_value7 : 返回
	 */
	public String getAttributeValue7() {
		return attributeValue7;
	}

	/**
	 * @param attributeValue7
	 *            of t_product : 设置
	 */
	public void setAttributeValue7(String attributeValue7) {
		this.attributeValue7 = attributeValue7 == null ? null : attributeValue7.trim();
	}

	/**
	 * @return t_product.attribute_value8 : 返回
	 */
	public String getAttributeValue8() {
		return attributeValue8;
	}

	/**
	 * @param attributeValue8
	 *            of t_product : 设置
	 */
	public void setAttributeValue8(String attributeValue8) {
		this.attributeValue8 = attributeValue8 == null ? null : attributeValue8.trim();
	}

	/**
	 * @return t_product.attribute_value9 : 返回
	 */
	public String getAttributeValue9() {
		return attributeValue9;
	}

	/**
	 * @param attributeValue9
	 *            of t_product : 设置
	 */
	public void setAttributeValue9(String attributeValue9) {
		this.attributeValue9 = attributeValue9 == null ? null : attributeValue9.trim();
	}

	/**
	 * @return t_product.cost : 返回
	 */
	public String getCost() {
		return cost;
	}

	/**
	 * @param cost
	 *            of t_product : 设置
	 */
	public void setCost(String cost) {
		this.cost = cost == null ? null : cost.trim();
	}

	/**
	 * @return t_product.full_name : 返回
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName
	 *            of t_product : 设置
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName == null ? null : fullName.trim();
	}

	/**
	 * @return t_product.hits : 返回
	 */
	public Long getHits() {
		return hits;
	}

	/**
	 * @param hits
	 *            of t_product : 设置
	 */
	public void setHits(Long hits) {
		this.hits = hits;
	}

	/**
	 * @return t_product.image : 返回
	 */
	public String getImage() {
		return image;
	}

	/**
	 * @param image
	 *            of t_product : 设置
	 */
	public void setImage(String image) {
		this.image = image == null ? null : image.trim();
	}

	/**
	 * @return t_product.is_gift : 返回
	 */
	public Boolean getIsGift() {
		return isGift;
	}

	/**
	 * @param isGift
	 *            of t_product : 设置
	 */
	public void setIsGift(Boolean isGift) {
		this.isGift = isGift;
	}

	/**
	 * @return t_product.is_list : 返回
	 */
	public Boolean getIsList() {
		return isList;
	}

	/**
	 * @param isList
	 *            of t_product : 设置
	 */
	public void setIsList(Boolean isList) {
		this.isList = isList;
	}

	/**
	 * @return t_product.is_marketable : 返回
	 */
	public Boolean getIsMarketable() {
		return isMarketable;
	}

	/**
	 * @param isMarketable
	 *            of t_product : 设置
	 */
	public void setIsMarketable(Boolean isMarketable) {
		this.isMarketable = isMarketable;
	}

	/**
	 * @return t_product.is_top : 返回
	 */
	public Boolean getIsTop() {
		return isTop;
	}

	/**
	 * @param isTop
	 *            of t_product : 设置
	 */
	public void setIsTop(Boolean isTop) {
		this.isTop = isTop;
	}

	/**
	 * @return t_product.keyword : 返回
	 */
	public String getKeyword() {
		return keyword;
	}

	/**
	 * @param keyword
	 *            of t_product : 设置
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword == null ? null : keyword.trim();
	}

	/**
	 * @return t_product.market_price : 返回
	 */
	public String getMarketPrice() {
		return marketPrice;
	}

	/**
	 * @param marketPrice
	 *            of t_product : 设置
	 */
	public void setMarketPrice(String marketPrice) {
		this.marketPrice = marketPrice == null ? null : marketPrice.trim();
	}

	/**
	 * @return t_product.memo : 返回
	 */
	public String getMemo() {
		return memo;
	}

	/**
	 * @param memo
	 *            of t_product : 设置
	 */
	public void setMemo(String memo) {
		this.memo = memo == null ? null : memo.trim();
	}

	/**
	 * @return t_product.month_hits : 返回
	 */
	public Long getMonthHits() {
		return monthHits;
	}

	/**
	 * @param monthHits
	 *            of t_product : 设置
	 */
	public void setMonthHits(Long monthHits) {
		this.monthHits = monthHits;
	}

	/**
	 * @return t_product.month_hits_date : 返回
	 */
	public Date getMonthHitsDate() {
		return monthHitsDate;
	}

	/**
	 * @param monthHitsDate
	 *            of t_product : 设置
	 */
	public void setMonthHitsDate(Date monthHitsDate) {
		this.monthHitsDate = monthHitsDate;
	}

	/**
	 * @return t_product.month_sales : 返回
	 */
	public Long getMonthSales() {
		return monthSales;
	}

	/**
	 * @param monthSales
	 *            of t_product : 设置
	 */
	public void setMonthSales(Long monthSales) {
		this.monthSales = monthSales;
	}

	/**
	 * @return t_product.month_sales_date : 返回
	 */
	public Date getMonthSalesDate() {
		return monthSalesDate;
	}

	/**
	 * @param monthSalesDate
	 *            of t_product : 设置
	 */
	public void setMonthSalesDate(Date monthSalesDate) {
		this.monthSalesDate = monthSalesDate;
	}

	/**
	 * @return t_product.name : 返回
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            of t_product : 设置
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * @return t_product.point : 返回
	 */
	public Long getPoint() {
		return point;
	}

	/**
	 * @param point
	 *            of t_product : 设置
	 */
	public void setPoint(Long point) {
		this.point = point;
	}

	/**
	 * @return t_product.price : 返回
	 */
	public String getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            of t_product : 设置
	 */
	public void setPrice(String price) {
		this.price = price == null ? null : price.trim();
	}

	/**
	 * @return t_product.sales : 返回
	 */
	public Long getSales() {
		return sales;
	}

	/**
	 * @param sales
	 *            of t_product : 设置
	 */
	public void setSales(Long sales) {
		this.sales = sales;
	}

	/**
	 * @return t_product.score : 返回
	 */
	public Float getScore() {
		return score;
	}

	/**
	 * @param score
	 *            of t_product : 设置
	 */
	public void setScore(Float score) {
		this.score = score;
	}

	/**
	 * @return t_product.score_count : 返回
	 */
	public Long getScoreCount() {
		return scoreCount;
	}

	/**
	 * @param scoreCount
	 *            of t_product : 设置
	 */
	public void setScoreCount(Long scoreCount) {
		this.scoreCount = scoreCount;
	}

	/**
	 * @return t_product.seo_description : 返回
	 */
	public String getSeoDescription() {
		return seoDescription;
	}

	/**
	 * @param seoDescription
	 *            of t_product : 设置
	 */
	public void setSeoDescription(String seoDescription) {
		this.seoDescription = seoDescription == null ? null : seoDescription.trim();
	}

	/**
	 * @return t_product.seo_keywords : 返回
	 */
	public String getSeoKeywords() {
		return seoKeywords;
	}

	/**
	 * @param seoKeywords
	 *            of t_product : 设置
	 */
	public void setSeoKeywords(String seoKeywords) {
		this.seoKeywords = seoKeywords == null ? null : seoKeywords.trim();
	}

	/**
	 * @return t_product.seo_title : 返回
	 */
	public String getSeoTitle() {
		return seoTitle;
	}

	/**
	 * @param seoTitle
	 *            of t_product : 设置
	 */
	public void setSeoTitle(String seoTitle) {
		this.seoTitle = seoTitle == null ? null : seoTitle.trim();
	}

	/**
	 * @return t_product.sn : 返回
	 */
	public String getSn() {
		return sn;
	}

	/**
	 * @param sn
	 *            of t_product : 设置
	 */
	public void setSn(String sn) {
		this.sn = sn == null ? null : sn.trim();
	}

	/**
	 * @return t_product.stock : 返回
	 */
	public Integer getStock() {
		return stock;
	}

	/**
	 * @param stock
	 *            of t_product : 设置
	 */
	public void setStock(Integer stock) {
		this.stock = stock;
	}

	/**
	 * @return t_product.stock_memo : 返回
	 */
	public String getStockMemo() {
		return stockMemo;
	}

	/**
	 * @param stockMemo
	 *            of t_product : 设置
	 */
	public void setStockMemo(String stockMemo) {
		this.stockMemo = stockMemo == null ? null : stockMemo.trim();
	}

	/**
	 * @return t_product.total_score : 返回
	 */
	public Long getTotalScore() {
		return totalScore;
	}

	/**
	 * @param totalScore
	 *            of t_product : 设置
	 */
	public void setTotalScore(Long totalScore) {
		this.totalScore = totalScore;
	}

	/**
	 * @return t_product.unit : 返回
	 */
	public String getUnit() {
		return unit;
	}

	/**
	 * @param unit
	 *            of t_product : 设置
	 */
	public void setUnit(String unit) {
		this.unit = unit == null ? null : unit.trim();
	}

	/**
	 * @return t_product.week_hits : 返回
	 */
	public Long getWeekHits() {
		return weekHits;
	}

	/**
	 * @param weekHits
	 *            of t_product : 设置
	 */
	public void setWeekHits(Long weekHits) {
		this.weekHits = weekHits;
	}

	/**
	 * @return t_product.week_hits_date : 返回
	 */
	public Date getWeekHitsDate() {
		return weekHitsDate;
	}

	/**
	 * @param weekHitsDate
	 *            of t_product : 设置
	 */
	public void setWeekHitsDate(Date weekHitsDate) {
		this.weekHitsDate = weekHitsDate;
	}

	/**
	 * @return t_product.week_sales : 返回
	 */
	public Long getWeekSales() {
		return weekSales;
	}

	/**
	 * @param weekSales
	 *            of t_product : 设置
	 */
	public void setWeekSales(Long weekSales) {
		this.weekSales = weekSales;
	}

	/**
	 * @return t_product.week_sales_date : 返回
	 */
	public Date getWeekSalesDate() {
		return weekSalesDate;
	}

	/**
	 * @param weekSalesDate
	 *            of t_product : 设置
	 */
	public void setWeekSalesDate(Date weekSalesDate) {
		this.weekSalesDate = weekSalesDate;
	}

	/**
	 * @return t_product.weight : 返回
	 */
	public Integer getWeight() {
		return weight;
	}

	/**
	 * @param weight
	 *            of t_product : 设置
	 */
	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	/**
	 * @return t_product.brand : 返回
	 */
	public Long getBrand() {
		return brand;
	}

	/**
	 * @param brand
	 *            of t_product : 设置
	 */
	public void setBrand(Long brand) {
		this.brand = brand;
	}

	/**
	 * @return t_product.goods : 返回
	 */
	public Long getGoods() {
		return goods;
	}

	/**
	 * @param goods
	 *            of t_product : 设置
	 */
	public void setGoods(Long goods) {
		this.goods = goods;
	}

	/**
	 * @return t_product.product_category : 返回
	 */
	public Long getProductCategory() {
		return productCategory;
	}

	/**
	 * @param productCategory
	 *            of t_product : 设置
	 */
	public void setProductCategory(Long productCategory) {
		this.productCategory = productCategory;
	}

	/**
	 * @return t_product.barcode : 返回
	 */
	public String getBarcode() {
		return barcode;
	}

	/**
	 * @param barcode
	 *            of t_product : 设置
	 */
	public void setBarcode(String barcode) {
		this.barcode = barcode == null ? null : barcode.trim();
	}

	/**
	 * @return t_product.color_image_thumbnail : 返回
	 */
	public String getColorImageThumbnail() {
		return colorImageThumbnail;
	}

	/**
	 * @param colorImageThumbnail
	 *            of t_product : 设置
	 */
	public void setColorImageThumbnail(String colorImageThumbnail) {
		this.colorImageThumbnail = colorImageThumbnail == null ? null : colorImageThumbnail.trim();
	}

	/**
	 * @return t_product.merchant_number : 返回
	 */
	public String getMerchantNumber() {
		return merchantNumber;
	}

	/**
	 * @param merchantNumber
	 *            of t_product : 设置
	 */
	public void setMerchantNumber(String merchantNumber) {
		this.merchantNumber = merchantNumber == null ? null : merchantNumber.trim();
	}

	/**
	 * @return t_product.plu_image : 返回
	 */
	public String getPluImage() {
		return pluImage;
	}

	/**
	 * @param pluImage
	 *            of t_product : 设置
	 */
	public void setPluImage(String pluImage) {
		this.pluImage = pluImage == null ? null : pluImage.trim();
	}

	/**
	 * @return t_product.archived : 返回
	 */
	public String getArchived() {
		return archived;
	}

	/**
	 * @param archived
	 *            of t_product : 设置
	 */
	public void setArchived(String archived) {
		this.archived = archived == null ? null : archived.trim();
	}

	/**
	 * @return t_product.plu_code : 返回
	 */
	public String getPluCode() {
		return pluCode;
	}

	/**
	 * @param pluCode
	 *            of t_product : 设置
	 */
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode == null ? null : pluCode.trim();
	}

	/**
	 * @return t_product.timing_marketable_date : 返回
	 */
	public Date getTimingMarketableDate() {
		return timingMarketableDate;
	}

	/**
	 * @param timingMarketableDate
	 *            of t_product : 设置
	 */
	public void setTimingMarketableDate(Date timingMarketableDate) {
		this.timingMarketableDate = timingMarketableDate;
	}

	/**
	 * @return t_product.is_square : 返回
	 */
	public Boolean getIsSquare() {
		return isSquare;
	}

	/**
	 * @param isSquare
	 *            of t_product : 设置
	 */
	public void setIsSquare(Boolean isSquare) {
		this.isSquare = isSquare;
	}

	public List<TSpecification> getSpecifications() {
		return specifications;
	}

	public void setSpecifications(List<TSpecification> specifications) {
		this.specifications = specifications;
	}

	public Long[] getTagIds() {
		return tagIds;
	}

	public void setTagIds(Long[] tagIds) {
		this.tagIds = tagIds;
	}

	public List<TTag> getTags() {
		return tags;
	}

	public void setTags(List<TTag> tags) {
		this.tags = tags;
	}

	public TProductCategory getCategory() {
		return category;
	}

	public void setCategory(TProductCategory category) {
		this.category = category;
	}
}