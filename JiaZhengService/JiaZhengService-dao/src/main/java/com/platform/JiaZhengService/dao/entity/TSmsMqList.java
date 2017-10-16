package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TSmsMqList
* @Description: t_sms_mq_list表对应的java bean类
* @author: peiyu
 */
public class TSmsMqList extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_sms_mq_list.id :
     */
    private Long id;

    /**
     * @Fields t_sms_mq_list.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_sms_mq_list.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_sms_mq_list.astatus :
     */
    private String astatus;

    /**
     * @Fields t_sms_mq_list.channel :
     */
    private Integer channel;

    /**
     * @Fields t_sms_mq_list.content :
     */
    private String content;

    /**
     * @Fields t_sms_mq_list.receive_num :
     */
    private String receiveNum;

    /**
     * @Fields t_sms_mq_list.rerr_status :
     */
    private String rerrStatus;

    /**
     * @Fields t_sms_mq_list.rerr_status_content :
     */
    private String rerrStatusContent;

    /**
     * @Fields t_sms_mq_list.rsend_time :
     */
    private Date rsendTime;

    /**
     * @Fields t_sms_mq_list.rstatus :
     */
    private Boolean rstatus;

    /**
     * @Fields t_sms_mq_list.rsubmit_time :
     */
    private Date rsubmitTime;

    /**
     * @Fields t_sms_mq_list.send_num :
     */
    private String sendNum;

    /**
     * @return t_sms_mq_list.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_sms_mq_list : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_sms_mq_list.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_sms_mq_list : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_sms_mq_list.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_sms_mq_list : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_sms_mq_list.astatus : 返回 
     */
    public String getAstatus() {
        return astatus;
    }

    /**
     * @param astatus of t_sms_mq_list : 设置 
     */
    public void setAstatus(String astatus) {
        this.astatus = astatus == null ? null : astatus.trim();
    }

    /**
     * @return t_sms_mq_list.channel : 返回 
     */
    public Integer getChannel() {
        return channel;
    }

    /**
     * @param channel of t_sms_mq_list : 设置 
     */
    public void setChannel(Integer channel) {
        this.channel = channel;
    }

    /**
     * @return t_sms_mq_list.content : 返回 
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content of t_sms_mq_list : 设置 
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * @return t_sms_mq_list.receive_num : 返回 
     */
    public String getReceiveNum() {
        return receiveNum;
    }

    /**
     * @param receiveNum of t_sms_mq_list : 设置 
     */
    public void setReceiveNum(String receiveNum) {
        this.receiveNum = receiveNum == null ? null : receiveNum.trim();
    }

    /**
     * @return t_sms_mq_list.rerr_status : 返回 
     */
    public String getRerrStatus() {
        return rerrStatus;
    }

    /**
     * @param rerrStatus of t_sms_mq_list : 设置 
     */
    public void setRerrStatus(String rerrStatus) {
        this.rerrStatus = rerrStatus == null ? null : rerrStatus.trim();
    }

    /**
     * @return t_sms_mq_list.rerr_status_content : 返回 
     */
    public String getRerrStatusContent() {
        return rerrStatusContent;
    }

    /**
     * @param rerrStatusContent of t_sms_mq_list : 设置 
     */
    public void setRerrStatusContent(String rerrStatusContent) {
        this.rerrStatusContent = rerrStatusContent == null ? null : rerrStatusContent.trim();
    }

    /**
     * @return t_sms_mq_list.rsend_time : 返回 
     */
    public Date getRsendTime() {
        return rsendTime;
    }

    /**
     * @param rsendTime of t_sms_mq_list : 设置 
     */
    public void setRsendTime(Date rsendTime) {
        this.rsendTime = rsendTime;
    }

    /**
     * @return t_sms_mq_list.rstatus : 返回 
     */
    public Boolean getRstatus() {
        return rstatus;
    }

    /**
     * @param rstatus of t_sms_mq_list : 设置 
     */
    public void setRstatus(Boolean rstatus) {
        this.rstatus = rstatus;
    }

    /**
     * @return t_sms_mq_list.rsubmit_time : 返回 
     */
    public Date getRsubmitTime() {
        return rsubmitTime;
    }

    /**
     * @param rsubmitTime of t_sms_mq_list : 设置 
     */
    public void setRsubmitTime(Date rsubmitTime) {
        this.rsubmitTime = rsubmitTime;
    }

    /**
     * @return t_sms_mq_list.send_num : 返回 
     */
    public String getSendNum() {
        return sendNum;
    }

    /**
     * @param sendNum of t_sms_mq_list : 设置 
     */
    public void setSendNum(String sendNum) {
        this.sendNum = sendNum == null ? null : sendNum.trim();
    }
}