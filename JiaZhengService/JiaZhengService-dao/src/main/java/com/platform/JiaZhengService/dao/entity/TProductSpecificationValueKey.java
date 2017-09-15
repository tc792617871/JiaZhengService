package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;

/**
 * @ClassName: TProductSpecificationValueKey
* @Description: t_product_specification_value表对应的java bean主键类
* @author: peiyu
 */
public class TProductSpecificationValueKey extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_product_specification_value.products :
     */
    private Long products;

    /**
     * @Fields t_product_specification_value.specification_values :
     */
    private Long specificationValues;

    /**
     * @return t_product_specification_value.products : 返回 
     */
    public Long getProducts() {
        return products;
    }

    /**
     * @param products of t_product_specification_value : 设置 
     */
    public void setProducts(Long products) {
        this.products = products;
    }

    /**
     * @return t_product_specification_value.specification_values : 返回 
     */
    public Long getSpecificationValues() {
        return specificationValues;
    }

    /**
     * @param specificationValues of t_product_specification_value : 设置 
     */
    public void setSpecificationValues(Long specificationValues) {
        this.specificationValues = specificationValues;
    }
}