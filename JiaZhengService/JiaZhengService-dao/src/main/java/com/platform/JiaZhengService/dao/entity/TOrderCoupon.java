package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;

/**
 * @ClassName: TOrderCoupon
* @Description: t_order_coupon表对应的java bean类
* @author: peiyu
 */
public class TOrderCoupon extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_order_coupon.orders :
     */
    private Long orders;

    /**
     * @Fields t_order_coupon.coupons :
     */
    private Long coupons;

    /**
     * @return t_order_coupon.orders : 返回 
     */
    public Long getOrders() {
        return orders;
    }

    /**
     * @param orders of t_order_coupon : 设置 
     */
    public void setOrders(Long orders) {
        this.orders = orders;
    }

    /**
     * @return t_order_coupon.coupons : 返回 
     */
    public Long getCoupons() {
        return coupons;
    }

    /**
     * @param coupons of t_order_coupon : 设置 
     */
    public void setCoupons(Long coupons) {
        this.coupons = coupons;
    }
}