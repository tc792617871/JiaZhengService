package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TOrderLog
* @Description: t_order_log表对应的java bean类
* @author: peiyu
 */
public class TOrderLog extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_order_log.id :
     */
    private Long id;

    /**
     * @Fields t_order_log.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_order_log.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_order_log.content :
     */
    private String content;

    /**
     * @Fields t_order_log.operator :
     */
    private String operator;

    /**
     * @Fields t_order_log.type :
     */
    private Integer type;

    /**
     * @Fields t_order_log.orders :
     */
    private Long orders;

    /**
     * @return t_order_log.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_order_log : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_order_log.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_order_log : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_order_log.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_order_log : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_order_log.content : 返回 
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content of t_order_log : 设置 
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * @return t_order_log.operator : 返回 
     */
    public String getOperator() {
        return operator;
    }

    /**
     * @param operator of t_order_log : 设置 
     */
    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    /**
     * @return t_order_log.type : 返回 
     */
    public Integer getType() {
        return type;
    }

    /**
     * @param type of t_order_log : 设置 
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * @return t_order_log.orders : 返回 
     */
    public Long getOrders() {
        return orders;
    }

    /**
     * @param orders of t_order_log : 设置 
     */
    public void setOrders(Long orders) {
        this.orders = orders;
    }
}