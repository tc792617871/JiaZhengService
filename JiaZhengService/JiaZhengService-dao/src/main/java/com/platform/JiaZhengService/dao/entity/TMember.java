package com.platform.JiaZhengService.dao.entity;

import java.io.Serializable;
import java.util.Date;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;

/**
 * @ClassName: TMember
 * @Description: t_member表对应的java bean类
 * @author: peiyu
 */
public class TMember extends StringAndEqualsPojo implements Serializable {

	/** "身份信息"参数名称 */
	public static final String PRINCIPAL_ATTRIBUTE_NAME = TMember.class.getName() + ".PRINCIPAL";

	/** "用户名"Cookie名称 */
	public static final String USERNAME_COOKIE_NAME = "username";

	/** "用户名"Cookie名称 */
	public static final String NAME_COOKIE_NAME = "name";

	/** "用户email"Cookie名称 */
	public static final String EMAIL_COOKIE_NAME = "email";

	/** "微信OPENID" Cookie名称 */
	public static final String WECHAT_OPENTID = "USER_TOKEN_ID";

	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_member.id :
	 */
	private Long id;

	/**
	 * @Fields t_member.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_member.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_member.address :
	 */
	private String address;

	/**
	 * @Fields t_member.amount :
	 */
	private Double amount;

	/**
	 * @Fields t_member.attribute_value0 :
	 */
	private String attributeValue0;

	/**
	 * @Fields t_member.attribute_value1 :
	 */
	private String attributeValue1;

	/**
	 * @Fields t_member.attribute_value2 :
	 */
	private String attributeValue2;

	/**
	 * @Fields t_member.attribute_value3 :
	 */
	private String attributeValue3;

	/**
	 * @Fields t_member.attribute_value4 :
	 */
	private String attributeValue4;

	/**
	 * @Fields t_member.attribute_value5 :
	 */
	private String attributeValue5;

	/**
	 * @Fields t_member.attribute_value6 :
	 */
	private String attributeValue6;

	/**
	 * @Fields t_member.attribute_value7 :
	 */
	private String attributeValue7;

	/**
	 * @Fields t_member.attribute_value8 :
	 */
	private String attributeValue8;

	/**
	 * @Fields t_member.attribute_value9 :
	 */
	private String attributeValue9;

	/**
	 * @Fields t_member.balance :
	 */
	private Double balance;

	/**
	 * @Fields t_member.birth :
	 */
	private Date birth;

	/**
	 * @Fields t_member.email :
	 */
	private String email;

	/**
	 * @Fields t_member.gender :
	 */
	private Integer gender;

	/**
	 * @Fields t_member.is_enabled :
	 */
	private Boolean isEnabled;

	/**
	 * @Fields t_member.is_locked :
	 */
	private Boolean isLocked;

	/**
	 * @Fields t_member.locked_date :
	 */
	private Date lockedDate;

	/**
	 * @Fields t_member.login_date :
	 */
	private Date loginDate;

	/**
	 * @Fields t_member.login_failure_count :
	 */
	private Integer loginFailureCount;

	/**
	 * @Fields t_member.login_ip :
	 */
	private String loginIp;

	/**
	 * @Fields t_member.mobile :
	 */
	private String mobile;

	/**
	 * @Fields t_member.name :
	 */
	private String name;

	/**
	 * @Fields t_member.password :
	 */
	private String password;

	/**
	 * @Fields t_member.vip_code :会员号(绑定 ERP的VIP会员号)
	 */
	private String vipCode;

	/**
	 * @Fields t_member.vip_number :会员VIP卡号
	 */
	private String vipNumber;

	/**
	 * @Fields t_member.phone :
	 */
	private String phone;

	/**
	 * @Fields t_member.point :
	 */
	private Long point;

	/**
	 * @Fields t_member.register_ip :
	 */
	private String registerIp;

	/**
	 * @Fields t_member.safe_key_expire :
	 */
	private Date safeKeyExpire;

	/**
	 * @Fields t_member.safe_key_value :
	 */
	private String safeKeyValue;

	/**
	 * @Fields t_member.username :
	 */
	private String username;

	/**
	 * @Fields t_member.zip_code :
	 */
	private String zipCode;

	/**
	 * @Fields t_member.area :
	 */
	private Long area;

	/**
	 * @Fields t_member.member_rank :
	 */
	private Long memberRank;

	/**
	 * @Fields t_member.validate_code :手机验证码
	 */
	private String validateCode;

	/**
	 * @Fields t_member.card_number :
	 */
	private String cardNumber;

	/**
	 * @Fields t_member.country :
	 */
	private String country;

	/**
	 * @Fields t_member.language_preference :
	 */
	private Long languagePreference;

	/**
	 * @Fields t_member.height :
	 */
	private Double height;

	/**
	 * @Fields t_member.weight :
	 */
	private Double weight;

	/**
	 * @Fields t_member.bust :
	 */
	private Double bust;

	/**
	 * @Fields t_member.hip :
	 */
	private Double hip;

	/**
	 * @Fields t_member.waist :
	 */
	private Double waist;

	/**
	 * @Fields t_member.occupation :
	 */
	private Long occupation;

	/**
	 * @Fields t_member.member_label :
	 */
	private String memberLabel;

	/**
	 * @Fields t_member.we_chat_open_id :
	 */
	private String weChatOpenId;

	/**
	 * @return t_member.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_member : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_member.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_member : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_member.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_member : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_member.address : 返回
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            of t_member : 设置
	 */
	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	/**
	 * @return t_member.amount : 返回
	 */
	public Double getAmount() {
		return amount;
	}

	/**
	 * @param amount
	 *            of t_member : 设置
	 */
	public void setAmount(Double amount) {
		this.amount = amount;
	}

	/**
	 * @return t_member.attribute_value0 : 返回
	 */
	public String getAttributeValue0() {
		return attributeValue0;
	}

	/**
	 * @param attributeValue0
	 *            of t_member : 设置
	 */
	public void setAttributeValue0(String attributeValue0) {
		this.attributeValue0 = attributeValue0 == null ? null : attributeValue0.trim();
	}

	/**
	 * @return t_member.attribute_value1 : 返回
	 */
	public String getAttributeValue1() {
		return attributeValue1;
	}

	/**
	 * @param attributeValue1
	 *            of t_member : 设置
	 */
	public void setAttributeValue1(String attributeValue1) {
		this.attributeValue1 = attributeValue1 == null ? null : attributeValue1.trim();
	}

	/**
	 * @return t_member.attribute_value2 : 返回
	 */
	public String getAttributeValue2() {
		return attributeValue2;
	}

	/**
	 * @param attributeValue2
	 *            of t_member : 设置
	 */
	public void setAttributeValue2(String attributeValue2) {
		this.attributeValue2 = attributeValue2 == null ? null : attributeValue2.trim();
	}

	/**
	 * @return t_member.attribute_value3 : 返回
	 */
	public String getAttributeValue3() {
		return attributeValue3;
	}

	/**
	 * @param attributeValue3
	 *            of t_member : 设置
	 */
	public void setAttributeValue3(String attributeValue3) {
		this.attributeValue3 = attributeValue3 == null ? null : attributeValue3.trim();
	}

	/**
	 * @return t_member.attribute_value4 : 返回
	 */
	public String getAttributeValue4() {
		return attributeValue4;
	}

	/**
	 * @param attributeValue4
	 *            of t_member : 设置
	 */
	public void setAttributeValue4(String attributeValue4) {
		this.attributeValue4 = attributeValue4 == null ? null : attributeValue4.trim();
	}

	/**
	 * @return t_member.attribute_value5 : 返回
	 */
	public String getAttributeValue5() {
		return attributeValue5;
	}

	/**
	 * @param attributeValue5
	 *            of t_member : 设置
	 */
	public void setAttributeValue5(String attributeValue5) {
		this.attributeValue5 = attributeValue5 == null ? null : attributeValue5.trim();
	}

	/**
	 * @return t_member.attribute_value6 : 返回
	 */
	public String getAttributeValue6() {
		return attributeValue6;
	}

	/**
	 * @param attributeValue6
	 *            of t_member : 设置
	 */
	public void setAttributeValue6(String attributeValue6) {
		this.attributeValue6 = attributeValue6 == null ? null : attributeValue6.trim();
	}

	/**
	 * @return t_member.attribute_value7 : 返回
	 */
	public String getAttributeValue7() {
		return attributeValue7;
	}

	/**
	 * @param attributeValue7
	 *            of t_member : 设置
	 */
	public void setAttributeValue7(String attributeValue7) {
		this.attributeValue7 = attributeValue7 == null ? null : attributeValue7.trim();
	}

	/**
	 * @return t_member.attribute_value8 : 返回
	 */
	public String getAttributeValue8() {
		return attributeValue8;
	}

	/**
	 * @param attributeValue8
	 *            of t_member : 设置
	 */
	public void setAttributeValue8(String attributeValue8) {
		this.attributeValue8 = attributeValue8 == null ? null : attributeValue8.trim();
	}

	/**
	 * @return t_member.attribute_value9 : 返回
	 */
	public String getAttributeValue9() {
		return attributeValue9;
	}

	/**
	 * @param attributeValue9
	 *            of t_member : 设置
	 */
	public void setAttributeValue9(String attributeValue9) {
		this.attributeValue9 = attributeValue9 == null ? null : attributeValue9.trim();
	}

	/**
	 * @return t_member.balance : 返回
	 */
	public Double getBalance() {
		return balance;
	}

	/**
	 * @param balance
	 *            of t_member : 设置
	 */
	public void setBalance(Double balance) {
		this.balance = balance;
	}

	/**
	 * @return t_member.birth : 返回
	 */
	public Date getBirth() {
		return birth;
	}

	/**
	 * @param birth
	 *            of t_member : 设置
	 */
	public void setBirth(Date birth) {
		this.birth = birth;
	}

	/**
	 * @return t_member.email : 返回
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            of t_member : 设置
	 */
	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	/**
	 * @return t_member.gender : 返回
	 */
	public Integer getGender() {
		return gender;
	}

	/**
	 * @param gender
	 *            of t_member : 设置
	 */
	public void setGender(Integer gender) {
		this.gender = gender;
	}

	/**
	 * @return t_member.is_enabled : 返回
	 */
	public Boolean getIsEnabled() {
		return isEnabled;
	}

	/**
	 * @param isEnabled
	 *            of t_member : 设置
	 */
	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	/**
	 * @return t_member.is_locked : 返回
	 */
	public Boolean getIsLocked() {
		return isLocked;
	}

	/**
	 * @param isLocked
	 *            of t_member : 设置
	 */
	public void setIsLocked(Boolean isLocked) {
		this.isLocked = isLocked;
	}

	/**
	 * @return t_member.locked_date : 返回
	 */
	public Date getLockedDate() {
		return lockedDate;
	}

	/**
	 * @param lockedDate
	 *            of t_member : 设置
	 */
	public void setLockedDate(Date lockedDate) {
		this.lockedDate = lockedDate;
	}

	/**
	 * @return t_member.login_date : 返回
	 */
	public Date getLoginDate() {
		return loginDate;
	}

	/**
	 * @param loginDate
	 *            of t_member : 设置
	 */
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	/**
	 * @return t_member.login_failure_count : 返回
	 */
	public Integer getLoginFailureCount() {
		return loginFailureCount;
	}

	/**
	 * @param loginFailureCount
	 *            of t_member : 设置
	 */
	public void setLoginFailureCount(Integer loginFailureCount) {
		this.loginFailureCount = loginFailureCount;
	}

	/**
	 * @return t_member.login_ip : 返回
	 */
	public String getLoginIp() {
		return loginIp;
	}

	/**
	 * @param loginIp
	 *            of t_member : 设置
	 */
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp == null ? null : loginIp.trim();
	}

	/**
	 * @return t_member.mobile : 返回
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile
	 *            of t_member : 设置
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile == null ? null : mobile.trim();
	}

	/**
	 * @return t_member.name : 返回
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            of t_member : 设置
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * @return t_member.password : 返回
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            of t_member : 设置
	 */
	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	/**
	 * @return t_member.vip_code : 返回 会员号(绑定 ERP的VIP会员号)
	 */
	public String getVipCode() {
		return vipCode;
	}

	/**
	 * @param vipCode
	 *            of t_member : 设置 会员号(绑定 ERP的VIP会员号)
	 */
	public void setVipCode(String vipCode) {
		this.vipCode = vipCode == null ? null : vipCode.trim();
	}

	/**
	 * @return t_member.vip_number : 返回 会员VIP卡号
	 */
	public String getVipNumber() {
		return vipNumber;
	}

	/**
	 * @param vipNumber
	 *            of t_member : 设置 会员VIP卡号
	 */
	public void setVipNumber(String vipNumber) {
		this.vipNumber = vipNumber == null ? null : vipNumber.trim();
	}

	/**
	 * @return t_member.phone : 返回
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone
	 *            of t_member : 设置
	 */
	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	/**
	 * @return t_member.point : 返回
	 */
	public Long getPoint() {
		return point;
	}

	/**
	 * @param point
	 *            of t_member : 设置
	 */
	public void setPoint(Long point) {
		this.point = point;
	}

	/**
	 * @return t_member.register_ip : 返回
	 */
	public String getRegisterIp() {
		return registerIp;
	}

	/**
	 * @param registerIp
	 *            of t_member : 设置
	 */
	public void setRegisterIp(String registerIp) {
		this.registerIp = registerIp == null ? null : registerIp.trim();
	}

	/**
	 * @return t_member.safe_key_expire : 返回
	 */
	public Date getSafeKeyExpire() {
		return safeKeyExpire;
	}

	/**
	 * @param safeKeyExpire
	 *            of t_member : 设置
	 */
	public void setSafeKeyExpire(Date safeKeyExpire) {
		this.safeKeyExpire = safeKeyExpire;
	}

	/**
	 * @return t_member.safe_key_value : 返回
	 */
	public String getSafeKeyValue() {
		return safeKeyValue;
	}

	/**
	 * @param safeKeyValue
	 *            of t_member : 设置
	 */
	public void setSafeKeyValue(String safeKeyValue) {
		this.safeKeyValue = safeKeyValue == null ? null : safeKeyValue.trim();
	}

	/**
	 * @return t_member.username : 返回
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            of t_member : 设置
	 */
	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	/**
	 * @return t_member.zip_code : 返回
	 */
	public String getZipCode() {
		return zipCode;
	}

	/**
	 * @param zipCode
	 *            of t_member : 设置
	 */
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode == null ? null : zipCode.trim();
	}

	/**
	 * @return t_member.area : 返回
	 */
	public Long getArea() {
		return area;
	}

	/**
	 * @param area
	 *            of t_member : 设置
	 */
	public void setArea(Long area) {
		this.area = area;
	}

	/**
	 * @return t_member.member_rank : 返回
	 */
	public Long getMemberRank() {
		return memberRank;
	}

	/**
	 * @param memberRank
	 *            of t_member : 设置
	 */
	public void setMemberRank(Long memberRank) {
		this.memberRank = memberRank;
	}

	/**
	 * @return t_member.validate_code : 返回 手机验证码
	 */
	public String getValidateCode() {
		return validateCode;
	}

	/**
	 * @param validateCode
	 *            of t_member : 设置 手机验证码
	 */
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode == null ? null : validateCode.trim();
	}

	/**
	 * @return t_member.card_number : 返回
	 */
	public String getCardNumber() {
		return cardNumber;
	}

	/**
	 * @param cardNumber
	 *            of t_member : 设置
	 */
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber == null ? null : cardNumber.trim();
	}

	/**
	 * @return t_member.country : 返回
	 */
	public String getCountry() {
		return country;
	}

	/**
	 * @param country
	 *            of t_member : 设置
	 */
	public void setCountry(String country) {
		this.country = country == null ? null : country.trim();
	}

	/**
	 * @return t_member.language_preference : 返回
	 */
	public Long getLanguagePreference() {
		return languagePreference;
	}

	/**
	 * @param languagePreference
	 *            of t_member : 设置
	 */
	public void setLanguagePreference(Long languagePreference) {
		this.languagePreference = languagePreference;
	}

	/**
	 * @return t_member.height : 返回
	 */
	public Double getHeight() {
		return height;
	}

	/**
	 * @param height
	 *            of t_member : 设置
	 */
	public void setHeight(Double height) {
		this.height = height;
	}

	/**
	 * @return t_member.weight : 返回
	 */
	public Double getWeight() {
		return weight;
	}

	/**
	 * @param weight
	 *            of t_member : 设置
	 */
	public void setWeight(Double weight) {
		this.weight = weight;
	}

	/**
	 * @return t_member.bust : 返回
	 */
	public Double getBust() {
		return bust;
	}

	/**
	 * @param bust
	 *            of t_member : 设置
	 */
	public void setBust(Double bust) {
		this.bust = bust;
	}

	/**
	 * @return t_member.hip : 返回
	 */
	public Double getHip() {
		return hip;
	}

	/**
	 * @param hip
	 *            of t_member : 设置
	 */
	public void setHip(Double hip) {
		this.hip = hip;
	}

	/**
	 * @return t_member.waist : 返回
	 */
	public Double getWaist() {
		return waist;
	}

	/**
	 * @param waist
	 *            of t_member : 设置
	 */
	public void setWaist(Double waist) {
		this.waist = waist;
	}

	/**
	 * @return t_member.occupation : 返回
	 */
	public Long getOccupation() {
		return occupation;
	}

	/**
	 * @param occupation
	 *            of t_member : 设置
	 */
	public void setOccupation(Long occupation) {
		this.occupation = occupation;
	}

	/**
	 * @return t_member.member_label : 返回
	 */
	public String getMemberLabel() {
		return memberLabel;
	}

	/**
	 * @param memberLabel
	 *            of t_member : 设置
	 */
	public void setMemberLabel(String memberLabel) {
		this.memberLabel = memberLabel == null ? null : memberLabel.trim();
	}

	/**
	 * @return t_member.we_chat_open_id : 返回
	 */
	public String getWeChatOpenId() {
		return weChatOpenId;
	}

	/**
	 * @param weChatOpenId
	 *            of t_member : 设置
	 */
	public void setWeChatOpenId(String weChatOpenId) {
		this.weChatOpenId = weChatOpenId == null ? null : weChatOpenId.trim();
	}
}