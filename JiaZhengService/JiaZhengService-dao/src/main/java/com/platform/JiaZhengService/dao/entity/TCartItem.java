package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TCartItem
* @Description: t_cart_item表对应的java bean类
* @author: peiyu
 */
public class TCartItem extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_cart_item.id :
     */
    private Long id;

    /**
     * @Fields t_cart_item.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_cart_item.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_cart_item.quantity :
     */
    private Integer quantity;

    /**
     * @Fields t_cart_item.cart :
     */
    private Long cart;

    /**
     * @Fields t_cart_item.product :
     */
    private Long product;

    /**
     * @Fields t_cart_item.specification :
     */
    private Long specification;

    /**
     * @return t_cart_item.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_cart_item : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_cart_item.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_cart_item : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_cart_item.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_cart_item : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_cart_item.quantity : 返回 
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * @param quantity of t_cart_item : 设置 
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    /**
     * @return t_cart_item.cart : 返回 
     */
    public Long getCart() {
        return cart;
    }

    /**
     * @param cart of t_cart_item : 设置 
     */
    public void setCart(Long cart) {
        this.cart = cart;
    }

    /**
     * @return t_cart_item.product : 返回 
     */
    public Long getProduct() {
        return product;
    }

    /**
     * @param product of t_cart_item : 设置 
     */
    public void setProduct(Long product) {
        this.product = product;
    }

    /**
     * @return t_cart_item.specification : 返回 
     */
    public Long getSpecification() {
        return specification;
    }

    /**
     * @param specification of t_cart_item : 设置 
     */
    public void setSpecification(Long specification) {
        this.specification = specification;
    }
}