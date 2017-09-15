package com.platform.JiaZhengService.dao.entity;

import java.io.Serializable;

public class TProductWithBLOBs extends TProduct implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_product.introduction :
     */
    private String introduction;

    /**
     * @Fields t_product.component :
     */
    private String component;

    /**
     * @Fields t_product.matters_needing_attention :
     */
    private String mattersNeedingAttention;

    /**
     * @return t_product.introduction : 返回 
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * @param introduction of t_product : 设置 
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    /**
     * @return t_product.component : 返回 
     */
    public String getComponent() {
        return component;
    }

    /**
     * @param component of t_product : 设置 
     */
    public void setComponent(String component) {
        this.component = component == null ? null : component.trim();
    }

    /**
     * @return t_product.matters_needing_attention : 返回 
     */
    public String getMattersNeedingAttention() {
        return mattersNeedingAttention;
    }

    /**
     * @param mattersNeedingAttention of t_product : 设置 
     */
    public void setMattersNeedingAttention(String mattersNeedingAttention) {
        this.mattersNeedingAttention = mattersNeedingAttention == null ? null : mattersNeedingAttention.trim();
    }
}