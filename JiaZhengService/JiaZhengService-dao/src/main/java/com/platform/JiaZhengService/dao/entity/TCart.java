package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TCart
* @Description: t_cart表对应的java bean类
* @author: peiyu
 */
public class TCart extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_cart.id :
     */
    private Long id;

    /**
     * @Fields t_cart.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_cart.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_cart.cart_key :
     */
    private String cartKey;

    /**
     * @Fields t_cart.member :
     */
    private Long member;

    /**
     * @return t_cart.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_cart : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_cart.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_cart : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_cart.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_cart : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_cart.cart_key : 返回 
     */
    public String getCartKey() {
        return cartKey;
    }

    /**
     * @param cartKey of t_cart : 设置 
     */
    public void setCartKey(String cartKey) {
        this.cartKey = cartKey == null ? null : cartKey.trim();
    }

    /**
     * @return t_cart.member : 返回 
     */
    public Long getMember() {
        return member;
    }

    /**
     * @param member of t_cart : 设置 
     */
    public void setMember(Long member) {
        this.member = member;
    }
}