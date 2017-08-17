package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;

/**
 * @ClassName: TRoleAuthority
* @Description: t_role_authority表对应的java bean类
* @author: peiyu
 */
public class TRoleAuthority extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_role_authority.role :
     */
    private Long role;

    /**
     * @Fields t_role_authority.authorities :
     */
    private String authorities;

    /**
     * @return t_role_authority.role : 返回 
     */
    public Long getRole() {
        return role;
    }

    /**
     * @param role of t_role_authority : 设置 
     */
    public void setRole(Long role) {
        this.role = role;
    }

    /**
     * @return t_role_authority.authorities : 返回 
     */
    public String getAuthorities() {
        return authorities;
    }

    /**
     * @param authorities of t_role_authority : 设置 
     */
    public void setAuthorities(String authorities) {
        this.authorities = authorities == null ? null : authorities.trim();
    }
}