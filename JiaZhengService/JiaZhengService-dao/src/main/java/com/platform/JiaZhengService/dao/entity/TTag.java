package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TTag
* @Description: t_tag表对应的java bean类
* @author: peiyu
 */
public class TTag extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_tag.id :
     */
    private Long id;

    /**
     * @Fields t_tag.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_tag.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_tag.orders :
     */
    private Integer orders;

    /**
     * @Fields t_tag.icon :
     */
    private String icon;

    /**
     * @Fields t_tag.memo :
     */
    private String memo;

    /**
     * @Fields t_tag.name :
     */
    private String name;

    /**
     * @Fields t_tag.type :
     */
    private Integer type;

    /**
     * @Fields t_tag.mobile_cover :
     */
    private String mobileCover;

    /**
     * @Fields t_tag.ed_mobile_cover :
     */
    private String edMobileCover;

    /**
     * @Fields t_tag.mo_mobile_cover :
     */
    private String moMobileCover;

    /**
     * @Fields t_tag.is_enabled :
     */
    private Boolean isEnabled;

    /**
     * @Fields t_tag.code :
     */
    private String code;

    /**
     * @return t_tag.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_tag : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_tag.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_tag : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_tag.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_tag : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_tag.orders : 返回 
     */
    public Integer getOrders() {
        return orders;
    }

    /**
     * @param orders of t_tag : 设置 
     */
    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    /**
     * @return t_tag.icon : 返回 
     */
    public String getIcon() {
        return icon;
    }

    /**
     * @param icon of t_tag : 设置 
     */
    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    /**
     * @return t_tag.memo : 返回 
     */
    public String getMemo() {
        return memo;
    }

    /**
     * @param memo of t_tag : 设置 
     */
    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    /**
     * @return t_tag.name : 返回 
     */
    public String getName() {
        return name;
    }

    /**
     * @param name of t_tag : 设置 
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * @return t_tag.type : 返回 
     */
    public Integer getType() {
        return type;
    }

    /**
     * @param type of t_tag : 设置 
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * @return t_tag.mobile_cover : 返回 
     */
    public String getMobileCover() {
        return mobileCover;
    }

    /**
     * @param mobileCover of t_tag : 设置 
     */
    public void setMobileCover(String mobileCover) {
        this.mobileCover = mobileCover == null ? null : mobileCover.trim();
    }

    /**
     * @return t_tag.ed_mobile_cover : 返回 
     */
    public String getEdMobileCover() {
        return edMobileCover;
    }

    /**
     * @param edMobileCover of t_tag : 设置 
     */
    public void setEdMobileCover(String edMobileCover) {
        this.edMobileCover = edMobileCover == null ? null : edMobileCover.trim();
    }

    /**
     * @return t_tag.mo_mobile_cover : 返回 
     */
    public String getMoMobileCover() {
        return moMobileCover;
    }

    /**
     * @param moMobileCover of t_tag : 设置 
     */
    public void setMoMobileCover(String moMobileCover) {
        this.moMobileCover = moMobileCover == null ? null : moMobileCover.trim();
    }

    /**
     * @return t_tag.is_enabled : 返回 
     */
    public Boolean getIsEnabled() {
        return isEnabled;
    }

    /**
     * @param isEnabled of t_tag : 设置 
     */
    public void setIsEnabled(Boolean isEnabled) {
        this.isEnabled = isEnabled;
    }

    /**
     * @return t_tag.code : 返回 
     */
    public String getCode() {
        return code;
    }

    /**
     * @param code of t_tag : 设置 
     */
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }
}