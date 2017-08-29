package com.platform.JiaZhengService.dao.entity;

import java.beans.Transient;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;

/**
 * @ClassName: TPluginConfig
 * @Description: t_plugin_config表对应的java bean类
 * @author: peiyu
 */
public class TPluginConfig extends StringAndEqualsPojo implements Serializable {

	// 支付宝的公钥，无需修改该值
	public static String ALI_PUBLIC_KEY = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";

	public static String ALI_PRIVATE_KEY = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKRyFJOfaWzpa/5byXUDirfJiLMkDui+zo052tkmii7LcbMZL0BuBncscq9Nln1GiM8fJ4hrxTT+wWfY2PRFBXcP7Y5jkXVUD01lTiGCwUCRKrqhsALK8xvcQpyAYHNJFsHuYxcZY3xf7UWoy/GLgNmQgvwqKeD6QfnbXBNK4xrxAgMBAAECgYBl69r7AAOMoEPx25vKLY7NiFh0h3XCJXjJqUEN88gTZr6qvYI+0bKqLF9Mba9HJ+9lSC7ta7ZHuVnP7mPRSfIvMWSWkcL0V08g+zwRTd7WmAuy5pexRvKXBDJ/GzVO+FHY1CqRl7NxT3D+axoSp/xrc1oKM8UIx9h3fMD03M6ujQJBANmwKfCSacSpmi6FVW+FTyAOgNv3tdF1jCJDeOzZQtx2WWfRVGRcutJbcioTOkpMjooHNB/xjZg5yUnNcE/fv4cCQQDBYxmsrFS2FDA6POEDJ9kSJ8jkriK4AjdN4xwnYaNO3hO4NILBGGv8MEvb5Odq9SiSOAHpD614n/HdKkQUVT/HAkEAzP8MP7RhTgW5YB3HuuF7BeEikALRgZKEiK+pbMGcKSh6QT3rjyeT9wyOkfjRZ654fJsUBxDeGoAwggOoxE8ceQJAWYNEfA+celcn550MTgigym2N6IPN4DxuWuf3vSbNj5DtscLkjvp96VJ1mof+shxeNigkgjtWgVIPgt6wenTnOwJAMCpBjjiqz44ixXQ9ZvAbD5dnyHjS0ym3EtRCh/WYm3vSW1An0/c1fDRM1GyUcNul0pD5sM1ZpeFqZR8WjX5kjQ==";

	public static String INPUT_CHARSET = "utf-8";

	// 签名方式，选择项：0001(RSA)、MD5
	public static String SIGN_TYPE = "MD5";

	/** 属性 */
	private Map<String, String> attributes = new HashMap<String, String>();

	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_plugin_config.id :
	 */
	private Long id;

	/**
	 * @Fields t_plugin_config.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_plugin_config.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_plugin_config.orders :
	 */
	private Integer orders;

	/**
	 * @Fields t_plugin_config.is_enabled :
	 */
	private Boolean isEnabled;

	/**
	 * @Fields t_plugin_config.plugin_id :
	 */
	private String pluginId;

	/**
	 * @return t_plugin_config.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_plugin_config : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_plugin_config.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_plugin_config : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_plugin_config.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_plugin_config : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_plugin_config.orders : 返回
	 */
	public Integer getOrders() {
		return orders;
	}

	/**
	 * @param orders
	 *            of t_plugin_config : 设置
	 */
	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	/**
	 * @return t_plugin_config.is_enabled : 返回
	 */
	public Boolean getIsEnabled() {
		return isEnabled;
	}

	/**
	 * @param isEnabled
	 *            of t_plugin_config : 设置
	 */
	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	/**
	 * @return t_plugin_config.plugin_id : 返回
	 */
	public String getPluginId() {
		return pluginId;
	}

	/**
	 * @param pluginId
	 *            of t_plugin_config : 设置
	 */
	public void setPluginId(String pluginId) {
		this.pluginId = pluginId == null ? null : pluginId.trim();
	}

	public Map<String, String> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}

	/**
	 * 获取属性值
	 * 
	 * @param name
	 *            属性名称
	 * @return 属性值
	 */
	@Transient
	public String getAttribute(String name) {
		if (getAttributes() != null && name != null) {
			return getAttributes().get(name);
		} else {
			return null;
		}
	}

	/**
	 * 设置属性值
	 * 
	 * @param name
	 *            属性名称
	 * @param value
	 *            属性值
	 */
	@Transient
	public void setAttribute(String name, String value) {
		if (getAttributes() != null && name != null) {
			getAttributes().put(name, value);
		}
	}
}