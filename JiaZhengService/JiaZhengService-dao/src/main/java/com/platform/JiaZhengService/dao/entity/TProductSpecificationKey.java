package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;

/**
 * @ClassName: TProductSpecificationKey
* @Description: t_product_specification表对应的java bean主键类
* @author: peiyu
 */
public class TProductSpecificationKey extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_product_specification.products :
     */
    private Long products;

    /**
     * @Fields t_product_specification.specifications :
     */
    private Long specifications;

    /**
     * @return t_product_specification.products : 返回 
     */
    public Long getProducts() {
        return products;
    }

    /**
     * @param products of t_product_specification : 设置 
     */
    public void setProducts(Long products) {
        this.products = products;
    }

    /**
     * @return t_product_specification.specifications : 返回 
     */
    public Long getSpecifications() {
        return specifications;
    }

    /**
     * @param specifications of t_product_specification : 设置 
     */
    public void setSpecifications(Long specifications) {
        this.specifications = specifications;
    }
}