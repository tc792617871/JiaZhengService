package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TLog
* @Description: t_log表对应的java bean类
* @author: peiyu
 */
public class TLog extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_log.id :
     */
    private Long id;

    /**
     * @Fields t_log.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_log.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_log.ip :
     */
    private String ip;

    /**
     * @Fields t_log.operation :
     */
    private String operation;

    /**
     * @Fields t_log.operator :
     */
    private String operator;

    /**
     * @return t_log.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_log : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_log.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_log : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_log.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_log : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_log.ip : 返回 
     */
    public String getIp() {
        return ip;
    }

    /**
     * @param ip of t_log : 设置 
     */
    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    /**
     * @return t_log.operation : 返回 
     */
    public String getOperation() {
        return operation;
    }

    /**
     * @param operation of t_log : 设置 
     */
    public void setOperation(String operation) {
        this.operation = operation == null ? null : operation.trim();
    }

    /**
     * @return t_log.operator : 返回 
     */
    public String getOperator() {
        return operator;
    }

    /**
     * @param operator of t_log : 设置 
     */
    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }
}