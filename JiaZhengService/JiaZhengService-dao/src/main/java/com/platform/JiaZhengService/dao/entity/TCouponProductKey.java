package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;

/**
 * @ClassName: TCouponProductKey
* @Description: t_coupon_product表对应的java bean主键类
* @author: peiyu
 */
public class TCouponProductKey extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_coupon_product.coupons :
     */
    private Long coupons;

    /**
     * @Fields t_coupon_product.products :
     */
    private Long products;

    /**
     * @return t_coupon_product.coupons : 返回 
     */
    public Long getCoupons() {
        return coupons;
    }

    /**
     * @param coupons of t_coupon_product : 设置 
     */
    public void setCoupons(Long coupons) {
        this.coupons = coupons;
    }

    /**
     * @return t_coupon_product.products : 返回 
     */
    public Long getProducts() {
        return products;
    }

    /**
     * @param products of t_coupon_product : 设置 
     */
    public void setProducts(Long products) {
        this.products = products;
    }
}