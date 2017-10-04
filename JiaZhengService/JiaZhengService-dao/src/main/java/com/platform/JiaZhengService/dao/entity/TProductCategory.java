package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @ClassName: TProductCategory
 * @Description: t_product_category表对应的java bean类
 * @author: peiyu
 */
public class TProductCategory extends StringAndEqualsPojo implements Serializable {
	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_product_category.id :
	 */
	private Long id;

	/**
	 * @Fields t_product_category.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_product_category.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_product_category.orders :
	 */
	private Integer orders;

	/**
	 * @Fields t_product_category.grade :
	 */
	private Integer grade;

	/**
	 * @Fields t_product_category.name_zh :
	 */
	private String nameZh;

	/**
	 * @Fields t_product_category.seo_description :
	 */
	private String seoDescription;

	/**
	 * @Fields t_product_category.seo_keywords :
	 */
	private String seoKeywords;

	/**
	 * @Fields t_product_category.seo_title :
	 */
	private String seoTitle;

	/**
	 * @Fields t_product_category.tree_path :
	 */
	private String treePath;

	/**
	 * @Fields t_product_category.parent :
	 */
	private Long parent;

	/**
	 * @Fields t_product_category.name_en :
	 */
	private String nameEn;

	/**
	 * @Fields t_product_category.logo_image :分类展示图
	 */
	private String logoImage;

	private List<TProduct> products;

	/**
	 * @return t_product_category.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_product_category : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_product_category.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_product_category : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_product_category.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_product_category : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_product_category.orders : 返回
	 */
	public Integer getOrders() {
		return orders;
	}

	/**
	 * @param orders
	 *            of t_product_category : 设置
	 */
	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	/**
	 * @return t_product_category.grade : 返回
	 */
	public Integer getGrade() {
		return grade;
	}

	/**
	 * @param grade
	 *            of t_product_category : 设置
	 */
	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	/**
	 * @return t_product_category.name_zh : 返回
	 */
	public String getNameZh() {
		return nameZh;
	}

	/**
	 * @param nameZh
	 *            of t_product_category : 设置
	 */
	public void setNameZh(String nameZh) {
		this.nameZh = nameZh == null ? null : nameZh.trim();
	}

	/**
	 * @return t_product_category.seo_description : 返回
	 */
	public String getSeoDescription() {
		return seoDescription;
	}

	/**
	 * @param seoDescription
	 *            of t_product_category : 设置
	 */
	public void setSeoDescription(String seoDescription) {
		this.seoDescription = seoDescription == null ? null : seoDescription.trim();
	}

	/**
	 * @return t_product_category.seo_keywords : 返回
	 */
	public String getSeoKeywords() {
		return seoKeywords;
	}

	/**
	 * @param seoKeywords
	 *            of t_product_category : 设置
	 */
	public void setSeoKeywords(String seoKeywords) {
		this.seoKeywords = seoKeywords == null ? null : seoKeywords.trim();
	}

	/**
	 * @return t_product_category.seo_title : 返回
	 */
	public String getSeoTitle() {
		return seoTitle;
	}

	/**
	 * @param seoTitle
	 *            of t_product_category : 设置
	 */
	public void setSeoTitle(String seoTitle) {
		this.seoTitle = seoTitle == null ? null : seoTitle.trim();
	}

	/**
	 * @return t_product_category.tree_path : 返回
	 */
	public String getTreePath() {
		return treePath;
	}

	/**
	 * @param treePath
	 *            of t_product_category : 设置
	 */
	public void setTreePath(String treePath) {
		this.treePath = treePath == null ? null : treePath.trim();
	}

	/**
	 * @return t_product_category.parent : 返回
	 */
	public Long getParent() {
		return parent;
	}

	/**
	 * @param parent
	 *            of t_product_category : 设置
	 */
	public void setParent(Long parent) {
		this.parent = parent;
	}

	/**
	 * @return t_product_category.name_en : 返回
	 */
	public String getNameEn() {
		return nameEn;
	}

	/**
	 * @param nameEn
	 *            of t_product_category : 设置
	 */
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn == null ? null : nameEn.trim();
	}

	/**
	 * @return t_product_category.logo_image : 返回 分类展示图
	 */
	public String getLogoImage() {
		return logoImage;
	}

	/**
	 * @param logoImage
	 *            of t_product_category : 设置 分类展示图
	 */
	public void setLogoImage(String logoImage) {
		this.logoImage = logoImage == null ? null : logoImage.trim();
	}

	public List<TProduct> getProducts() {
		return products;
	}

	public void setProducts(List<TProduct> products) {
		this.products = products;
	}
}