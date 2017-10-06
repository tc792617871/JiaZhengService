package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TCouponCode
* @Description: t_coupon_code表对应的java bean类
* @author: peiyu
 */
public class TCouponCode extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_coupon_code.id :
     */
    private Long id;

    /**
     * @Fields t_coupon_code.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_coupon_code.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_coupon_code.code :
     */
    private String code;

    /**
     * @Fields t_coupon_code.is_used :
     */
    private Boolean isUsed;

    /**
     * @Fields t_coupon_code.used_date :
     */
    private Date usedDate;

    /**
     * @Fields t_coupon_code.coupon :
     */
    private Long coupon;

    /**
     * @Fields t_coupon_code.member :
     */
    private Long member;

    /**
     * @Fields t_coupon_code.orders :
     */
    private Long orders;

    /**
     * @return t_coupon_code.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_coupon_code : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_coupon_code.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_coupon_code : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_coupon_code.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_coupon_code : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_coupon_code.code : 返回 
     */
    public String getCode() {
        return code;
    }

    /**
     * @param code of t_coupon_code : 设置 
     */
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    /**
     * @return t_coupon_code.is_used : 返回 
     */
    public Boolean getIsUsed() {
        return isUsed;
    }

    /**
     * @param isUsed of t_coupon_code : 设置 
     */
    public void setIsUsed(Boolean isUsed) {
        this.isUsed = isUsed;
    }

    /**
     * @return t_coupon_code.used_date : 返回 
     */
    public Date getUsedDate() {
        return usedDate;
    }

    /**
     * @param usedDate of t_coupon_code : 设置 
     */
    public void setUsedDate(Date usedDate) {
        this.usedDate = usedDate;
    }

    /**
     * @return t_coupon_code.coupon : 返回 
     */
    public Long getCoupon() {
        return coupon;
    }

    /**
     * @param coupon of t_coupon_code : 设置 
     */
    public void setCoupon(Long coupon) {
        this.coupon = coupon;
    }

    /**
     * @return t_coupon_code.member : 返回 
     */
    public Long getMember() {
        return member;
    }

    /**
     * @param member of t_coupon_code : 设置 
     */
    public void setMember(Long member) {
        this.member = member;
    }

    /**
     * @return t_coupon_code.orders : 返回 
     */
    public Long getOrders() {
        return orders;
    }

    /**
     * @param orders of t_coupon_code : 设置 
     */
    public void setOrders(Long orders) {
        this.orders = orders;
    }
}