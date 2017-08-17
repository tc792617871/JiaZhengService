package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;

/**
 * @ClassName: TAdminRoleKey
* @Description: t_admin_role表对应的java bean主键类
* @author: peiyu
 */
public class TAdminRoleKey extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_admin_role.admins :
     */
    private Long admins;

    /**
     * @Fields t_admin_role.roles :
     */
    private Long roles;

    /**
     * @return t_admin_role.admins : 返回 
     */
    public Long getAdmins() {
        return admins;
    }

    /**
     * @param admins of t_admin_role : 设置 
     */
    public void setAdmins(Long admins) {
        this.admins = admins;
    }

    /**
     * @return t_admin_role.roles : 返回 
     */
    public Long getRoles() {
        return roles;
    }

    /**
     * @param roles of t_admin_role : 设置 
     */
    public void setRoles(Long roles) {
        this.roles = roles;
    }
}