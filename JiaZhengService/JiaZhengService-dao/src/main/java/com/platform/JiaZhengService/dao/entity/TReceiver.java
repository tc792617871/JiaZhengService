package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TReceiver
 * @Description: t_receiver表对应的java bean类
 * @author: peiyu
 */
public class TReceiver extends StringAndEqualsPojo implements Serializable {

	/** 收货地址最大保存数 */
	public static final Integer MAX_RECEIVER_COUNT = 8;
	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_receiver.id :
	 */
	private Long id;

	/**
	 * @Fields t_receiver.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_receiver.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_receiver.address :
	 */
	private String address;

	/**
	 * @Fields t_receiver.area_name :
	 */
	private String areaName;

	/**
	 * @Fields t_receiver.consignee :
	 */
	private String consignee;

	/**
	 * @Fields t_receiver.is_default :
	 */
	private Boolean isDefault;

	/**
	 * @Fields t_receiver.phone :
	 */
	private String phone;

	/**
	 * @Fields t_receiver.zip_code :
	 */
	private String zipCode;

	/**
	 * @Fields t_receiver.area :
	 */
	private Long area;

	/**
	 * @Fields t_receiver.member :
	 */
	private Long member;

	/**
	 * @Fields t_receiver.address2 :
	 */
	private String address2;

	/**
	 * @Fields t_receiver.city :
	 */
	private String city;

	/**
	 * @Fields t_receiver.country_code :
	 */
	private String countryCode;

	/**
	 * @Fields t_receiver.province :
	 */
	private String province;

	/**
	 * @return t_receiver.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_receiver : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_receiver.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_receiver : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_receiver.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_receiver : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_receiver.address : 返回
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            of t_receiver : 设置
	 */
	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	/**
	 * @return t_receiver.area_name : 返回
	 */
	public String getAreaName() {
		return areaName;
	}

	/**
	 * @param areaName
	 *            of t_receiver : 设置
	 */
	public void setAreaName(String areaName) {
		this.areaName = areaName == null ? null : areaName.trim();
	}

	/**
	 * @return t_receiver.consignee : 返回
	 */
	public String getConsignee() {
		return consignee;
	}

	/**
	 * @param consignee
	 *            of t_receiver : 设置
	 */
	public void setConsignee(String consignee) {
		this.consignee = consignee == null ? null : consignee.trim();
	}

	/**
	 * @return t_receiver.is_default : 返回
	 */
	public Boolean getIsDefault() {
		return isDefault;
	}

	/**
	 * @param isDefault
	 *            of t_receiver : 设置
	 */
	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}

	/**
	 * @return t_receiver.phone : 返回
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone
	 *            of t_receiver : 设置
	 */
	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	/**
	 * @return t_receiver.zip_code : 返回
	 */
	public String getZipCode() {
		return zipCode;
	}

	/**
	 * @param zipCode
	 *            of t_receiver : 设置
	 */
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode == null ? null : zipCode.trim();
	}

	/**
	 * @return t_receiver.area : 返回
	 */
	public Long getArea() {
		return area;
	}

	/**
	 * @param area
	 *            of t_receiver : 设置
	 */
	public void setArea(Long area) {
		this.area = area;
	}

	/**
	 * @return t_receiver.member : 返回
	 */
	public Long getMember() {
		return member;
	}

	/**
	 * @param member
	 *            of t_receiver : 设置
	 */
	public void setMember(Long member) {
		this.member = member;
	}

	/**
	 * @return t_receiver.address2 : 返回
	 */
	public String getAddress2() {
		return address2;
	}

	/**
	 * @param address2
	 *            of t_receiver : 设置
	 */
	public void setAddress2(String address2) {
		this.address2 = address2 == null ? null : address2.trim();
	}

	/**
	 * @return t_receiver.city : 返回
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city
	 *            of t_receiver : 设置
	 */
	public void setCity(String city) {
		this.city = city == null ? null : city.trim();
	}

	/**
	 * @return t_receiver.country_code : 返回
	 */
	public String getCountryCode() {
		return countryCode;
	}

	/**
	 * @param countryCode
	 *            of t_receiver : 设置
	 */
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode == null ? null : countryCode.trim();
	}

	/**
	 * @return t_receiver.province : 返回
	 */
	public String getProvince() {
		return province;
	}

	/**
	 * @param province
	 *            of t_receiver : 设置
	 */
	public void setProvince(String province) {
		this.province = province == null ? null : province.trim();
	}
}