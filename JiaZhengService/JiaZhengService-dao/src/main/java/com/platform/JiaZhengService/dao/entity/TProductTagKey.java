package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;

/**
 * @ClassName: TProductTagKey
* @Description: t_product_tag表对应的java bean主键类
* @author: peiyu
 */
public class TProductTagKey extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_product_tag.products :
     */
    private Long products;

    /**
     * @Fields t_product_tag.tags :
     */
    private Long tags;

    /**
     * @return t_product_tag.products : 返回 
     */
    public Long getProducts() {
        return products;
    }

    /**
     * @param products of t_product_tag : 设置 
     */
    public void setProducts(Long products) {
        this.products = products;
    }

    /**
     * @return t_product_tag.tags : 返回 
     */
    public Long getTags() {
        return tags;
    }

    /**
     * @param tags of t_product_tag : 设置 
     */
    public void setTags(Long tags) {
        this.tags = tags;
    }
}