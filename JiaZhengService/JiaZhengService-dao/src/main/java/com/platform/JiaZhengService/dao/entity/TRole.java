package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TRole
* @Description: t_role表对应的java bean类
* @author: peiyu
 */
public class TRole extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_role.id :
     */
    private Long id;

    /**
     * @Fields t_role.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_role.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_role.description :
     */
    private String description;

    /**
     * @Fields t_role.is_system :
     */
    private Boolean isSystem;

    /**
     * @Fields t_role.name :
     */
    private String name;

    /**
     * @return t_role.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_role : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_role.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_role : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_role.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_role : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_role.description : 返回 
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description of t_role : 设置 
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    /**
     * @return t_role.is_system : 返回 
     */
    public Boolean getIsSystem() {
        return isSystem;
    }

    /**
     * @param isSystem of t_role : 设置 
     */
    public void setIsSystem(Boolean isSystem) {
        this.isSystem = isSystem;
    }

    /**
     * @return t_role.name : 返回 
     */
    public String getName() {
        return name;
    }

    /**
     * @param name of t_role : 设置 
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}