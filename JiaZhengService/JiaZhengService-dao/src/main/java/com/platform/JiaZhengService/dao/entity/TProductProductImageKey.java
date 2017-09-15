package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;

/**
 * @ClassName: TProductProductImageKey
* @Description: t_product_product_image表对应的java bean主键类
* @author: peiyu
 */
public class TProductProductImageKey extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_product_product_image.product :
     */
    private Long product;

    /**
     * @Fields t_product_product_image.source :
     */
    private String source;

    /**
     * @return t_product_product_image.product : 返回 
     */
    public Long getProduct() {
        return product;
    }

    /**
     * @param product of t_product_product_image : 设置 
     */
    public void setProduct(Long product) {
        this.product = product;
    }

    /**
     * @return t_product_product_image.source : 返回 
     */
    public String getSource() {
        return source;
    }

    /**
     * @param source of t_product_product_image : 设置 
     */
    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }
}