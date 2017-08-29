package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TArea
 * @Description: t_area表对应的java bean类
 * @author: peiyu
 */
public class TArea extends StringAndEqualsPojo implements Serializable {
	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/** 树路径分隔符 */
	public static final String TREE_PATH_SEPARATOR = ",";

	/**
	 * @Fields t_area.id :
	 */
	private Long id;

	/**
	 * @Fields t_area.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_area.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_area.orders :
	 */
	private Integer orders;

	/**
	 * @Fields t_area.name :
	 */
	private String name;

	/**
	 * @Fields t_area.tree_path :
	 */
	private String treePath;

	/**
	 * @Fields t_area.parent :
	 */
	private Long parent;

	/**
	 * @Fields t_area.abbreviation :
	 */
	private String abbreviation;

	/**
	 * @Fields t_area.phone_code :
	 */
	private String phoneCode;

	/**
	 * @Fields t_area.zh_name :
	 */
	private String zhName;

	/**
	 * @Fields t_area.full_name :
	 */
	private String fullName;

	/**
	 * @return t_area.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_area : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_area.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_area : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_area.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_area : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_area.orders : 返回
	 */
	public Integer getOrders() {
		return orders;
	}

	/**
	 * @param orders
	 *            of t_area : 设置
	 */
	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	/**
	 * @return t_area.name : 返回
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            of t_area : 设置
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * @return t_area.tree_path : 返回
	 */
	public String getTreePath() {
		return treePath;
	}

	/**
	 * @param treePath
	 *            of t_area : 设置
	 */
	public void setTreePath(String treePath) {
		this.treePath = treePath == null ? null : treePath.trim();
	}

	/**
	 * @return t_area.parent : 返回
	 */
	public Long getParent() {
		return parent;
	}

	/**
	 * @param parent
	 *            of t_area : 设置
	 */
	public void setParent(Long parent) {
		this.parent = parent;
	}

	/**
	 * @return t_area.abbreviation : 返回
	 */
	public String getAbbreviation() {
		return abbreviation;
	}

	/**
	 * @param abbreviation
	 *            of t_area : 设置
	 */
	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation == null ? null : abbreviation.trim();
	}

	/**
	 * @return t_area.phone_code : 返回
	 */
	public String getPhoneCode() {
		return phoneCode;
	}

	/**
	 * @param phoneCode
	 *            of t_area : 设置
	 */
	public void setPhoneCode(String phoneCode) {
		this.phoneCode = phoneCode == null ? null : phoneCode.trim();
	}

	/**
	 * @return t_area.zh_name : 返回
	 */
	public String getZhName() {
		return zhName;
	}

	/**
	 * @param zhName
	 *            of t_area : 设置
	 */
	public void setZhName(String zhName) {
		this.zhName = zhName == null ? null : zhName.trim();
	}

	/**
	 * @return t_area.full_name : 返回
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName
	 *            of t_area : 设置
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName == null ? null : fullName.trim();
	}
}