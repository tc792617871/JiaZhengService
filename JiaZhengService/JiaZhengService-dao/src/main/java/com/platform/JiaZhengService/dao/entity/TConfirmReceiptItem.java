package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TConfirmReceiptItem
* @Description: t_confirm_receipt_item表对应的java bean类
* @author: peiyu
 */
public class TConfirmReceiptItem extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_confirm_receipt_item.id :
     */
    private Long id;

    /**
     * @Fields t_confirm_receipt_item.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_confirm_receipt_item.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_confirm_receipt_item.confirm_receipt_date :
     */
    private Date confirmReceiptDate;

    /**
     * @Fields t_confirm_receipt_item.confirm_receipt_quantity :
     */
    private Integer confirmReceiptQuantity;

    /**
     * @Fields t_confirm_receipt_item.full_name :
     */
    private String fullName;

    /**
     * @Fields t_confirm_receipt_item.name :
     */
    private String name;

    /**
     * @Fields t_confirm_receipt_item.price :
     */
    private Double price;

    /**
     * @Fields t_confirm_receipt_item.sn :
     */
    private String sn;

    /**
     * @Fields t_confirm_receipt_item.order_item :
     */
    private Long orderItem;

    /**
     * @return t_confirm_receipt_item.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_confirm_receipt_item : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_confirm_receipt_item.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_confirm_receipt_item : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_confirm_receipt_item.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_confirm_receipt_item : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_confirm_receipt_item.confirm_receipt_date : 返回 
     */
    public Date getConfirmReceiptDate() {
        return confirmReceiptDate;
    }

    /**
     * @param confirmReceiptDate of t_confirm_receipt_item : 设置 
     */
    public void setConfirmReceiptDate(Date confirmReceiptDate) {
        this.confirmReceiptDate = confirmReceiptDate;
    }

    /**
     * @return t_confirm_receipt_item.confirm_receipt_quantity : 返回 
     */
    public Integer getConfirmReceiptQuantity() {
        return confirmReceiptQuantity;
    }

    /**
     * @param confirmReceiptQuantity of t_confirm_receipt_item : 设置 
     */
    public void setConfirmReceiptQuantity(Integer confirmReceiptQuantity) {
        this.confirmReceiptQuantity = confirmReceiptQuantity;
    }

    /**
     * @return t_confirm_receipt_item.full_name : 返回 
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * @param fullName of t_confirm_receipt_item : 设置 
     */
    public void setFullName(String fullName) {
        this.fullName = fullName == null ? null : fullName.trim();
    }

    /**
     * @return t_confirm_receipt_item.name : 返回 
     */
    public String getName() {
        return name;
    }

    /**
     * @param name of t_confirm_receipt_item : 设置 
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * @return t_confirm_receipt_item.price : 返回 
     */
    public Double getPrice() {
        return price;
    }

    /**
     * @param price of t_confirm_receipt_item : 设置 
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * @return t_confirm_receipt_item.sn : 返回 
     */
    public String getSn() {
        return sn;
    }

    /**
     * @param sn of t_confirm_receipt_item : 设置 
     */
    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    /**
     * @return t_confirm_receipt_item.order_item : 返回 
     */
    public Long getOrderItem() {
        return orderItem;
    }

    /**
     * @param orderItem of t_confirm_receipt_item : 设置 
     */
    public void setOrderItem(Long orderItem) {
        this.orderItem = orderItem;
    }
}