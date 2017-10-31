package com.platform.JiaZhengService.dao.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;

/**
 * @ClassName: TAdmin
 * @Description: t_admin表对应的java bean类
 * @author: peiyu
 */
public class TAdmin extends StringAndEqualsPojo implements Serializable {
	/**
	 * @Fields serialVersionUID : 自动生成默认序列化ID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields t_admin.id :
	 */
	private Long id;

	/**
	 * @Fields t_admin.create_date :
	 */
	private Date createDate;

	/**
	 * @Fields t_admin.modify_date :
	 */
	private Date modifyDate;

	/**
	 * @Fields t_admin.department :
	 */
	private String department;

	/**
	 * @Fields t_admin.email :
	 */
	private String email;

	/**
	 * @Fields t_admin.is_enabled :
	 */
	private Boolean isEnabled;

	/**
	 * @Fields t_admin.is_locked :
	 */
	private Boolean isLocked;

	/**
	 * @Fields t_admin.locked_date :
	 */
	private Date lockedDate;

	/**
	 * @Fields t_admin.login_date :
	 */
	private Date loginDate;

	/**
	 * @Fields t_admin.login_failure_count :
	 */
	private Integer loginFailureCount;

	/**
	 * @Fields t_admin.login_ip :
	 */
	private String loginIp;

	/**
	 * @Fields t_admin.name :
	 */
	private String name;

	/**
	 * @Fields t_admin.password :
	 */
	private String password;

	/**
	 * @Fields t_admin.username :
	 */
	private String username;

	/** 角色 */
	private Set<TRole> roles = new HashSet<TRole>();

	private Long[] roleIds = null;

	/**
	 * @return t_admin.id : 返回
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            of t_admin : 设置
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return t_admin.create_date : 返回
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            of t_admin : 设置
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return t_admin.modify_date : 返回
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @param modifyDate
	 *            of t_admin : 设置
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @return t_admin.department : 返回
	 */
	public String getDepartment() {
		return department;
	}

	/**
	 * @param department
	 *            of t_admin : 设置
	 */
	public void setDepartment(String department) {
		this.department = department == null ? null : department.trim();
	}

	/**
	 * @return t_admin.email : 返回
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            of t_admin : 设置
	 */
	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	/**
	 * @return t_admin.is_enabled : 返回
	 */
	public Boolean getIsEnabled() {
		return isEnabled;
	}

	/**
	 * @param isEnabled
	 *            of t_admin : 设置
	 */
	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	/**
	 * @return t_admin.is_locked : 返回
	 */
	public Boolean getIsLocked() {
		return isLocked;
	}

	/**
	 * @param isLocked
	 *            of t_admin : 设置
	 */
	public void setIsLocked(Boolean isLocked) {
		this.isLocked = isLocked;
	}

	/**
	 * @return t_admin.locked_date : 返回
	 */
	public Date getLockedDate() {
		return lockedDate;
	}

	/**
	 * @param lockedDate
	 *            of t_admin : 设置
	 */
	public void setLockedDate(Date lockedDate) {
		this.lockedDate = lockedDate;
	}

	/**
	 * @return t_admin.login_date : 返回
	 */
	public Date getLoginDate() {
		return loginDate;
	}

	/**
	 * @param loginDate
	 *            of t_admin : 设置
	 */
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	/**
	 * @return t_admin.login_failure_count : 返回
	 */
	public Integer getLoginFailureCount() {
		return loginFailureCount;
	}

	/**
	 * @param loginFailureCount
	 *            of t_admin : 设置
	 */
	public void setLoginFailureCount(Integer loginFailureCount) {
		this.loginFailureCount = loginFailureCount;
	}

	/**
	 * @return t_admin.login_ip : 返回
	 */
	public String getLoginIp() {
		return loginIp;
	}

	/**
	 * @param loginIp
	 *            of t_admin : 设置
	 */
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp == null ? null : loginIp.trim();
	}

	/**
	 * @return t_admin.name : 返回
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            of t_admin : 设置
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * @return t_admin.password : 返回
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            of t_admin : 设置
	 */
	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	/**
	 * @return t_admin.username : 返回
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            of t_admin : 设置
	 */
	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public Set<TRole> getRoles() {
		return roles;
	}

	public void setRoles(Set<TRole> roles) {
		this.roles = roles;
	}

	public Long[] getRoleIds() {
		if (roles != null && roles.size() > 0) {
			roleIds = new Long[roles.size()];
			int index = 0;
			for (TRole role : roles) {
				roleIds[index] = role.getId();
				index++;
			}
		}
		return roleIds;
	}

	public void setRoleIds(Long[] roleIds) {
		this.roleIds = roleIds;
	}
}