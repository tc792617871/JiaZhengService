package com.platform.JiaZhengService.dao.entity;

import java.io.Serializable;

/**
 * @ClassName: TProductProductImage
* @Description: t_product_product_image表对应的java bean类
* @author: peiyu
 */
public class TProductProductImage extends TProductProductImageKey implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_product_product_image.large :
     */
    private String large;

    /**
     * @Fields t_product_product_image.medium :
     */
    private String medium;

    /**
     * @Fields t_product_product_image.orders :
     */
    private Integer orders;

    /**
     * @Fields t_product_product_image.thumbnail :
     */
    private String thumbnail;

    /**
     * @Fields t_product_product_image.title :
     */
    private String title;

    /**
     * @return t_product_product_image.large : 返回 
     */
    public String getLarge() {
        return large;
    }

    /**
     * @param large of t_product_product_image : 设置 
     */
    public void setLarge(String large) {
        this.large = large == null ? null : large.trim();
    }

    /**
     * @return t_product_product_image.medium : 返回 
     */
    public String getMedium() {
        return medium;
    }

    /**
     * @param medium of t_product_product_image : 设置 
     */
    public void setMedium(String medium) {
        this.medium = medium == null ? null : medium.trim();
    }

    /**
     * @return t_product_product_image.orders : 返回 
     */
    public Integer getOrders() {
        return orders;
    }

    /**
     * @param orders of t_product_product_image : 设置 
     */
    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    /**
     * @return t_product_product_image.thumbnail : 返回 
     */
    public String getThumbnail() {
        return thumbnail;
    }

    /**
     * @param thumbnail of t_product_product_image : 设置 
     */
    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail == null ? null : thumbnail.trim();
    }

    /**
     * @return t_product_product_image.title : 返回 
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title of t_product_product_image : 设置 
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }
}