package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TConfirmReceiptQuantity
* @Description: t_confirm_receipt_quantity表对应的java bean类
* @author: peiyu
 */
public class TConfirmReceiptQuantity extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_confirm_receipt_quantity.id :行序号
     */
    private Long id;

    /**
     * @Fields t_confirm_receipt_quantity.sn :商品编号
     */
    private String sn;

    /**
     * @Fields t_confirm_receipt_quantity.name :商品名称
     */
    private String name;

    /**
     * @Fields t_confirm_receipt_quantity.full_name : 商品全称
     */
    private String fullName;

    /**
     * @Fields t_confirm_receipt_quantity.price : 商品价格 
     */
    private Double price;

    /**
     * @Fields t_confirm_receipt_quantity.confirm_receipt_quantity :单次已确认收货数量
     */
    private Integer confirmReceiptQuantity;

    /**
     * @Fields t_confirm_receipt_quantity.confirm_receipt_date :确认收货时间
     */
    private Date confirmReceiptDate;

    /**
     * @Fields t_confirm_receipt_quantity.orderItem :
     */
    private Long orderitem;

    /**
     * @Fields t_confirm_receipt_quantity.create_date :创建时间
     */
    private Date createDate;

    /**
     * @Fields t_confirm_receipt_quantity.modify_date :修改日期
     */
    private Date modifyDate;

    /**
     * @return t_confirm_receipt_quantity.id : 返回 行序号
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_confirm_receipt_quantity : 设置 行序号
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_confirm_receipt_quantity.sn : 返回 商品编号
     */
    public String getSn() {
        return sn;
    }

    /**
     * @param sn of t_confirm_receipt_quantity : 设置 商品编号
     */
    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    /**
     * @return t_confirm_receipt_quantity.name : 返回 商品名称
     */
    public String getName() {
        return name;
    }

    /**
     * @param name of t_confirm_receipt_quantity : 设置 商品名称
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * @return t_confirm_receipt_quantity.full_name : 返回  商品全称
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * @param fullName of t_confirm_receipt_quantity : 设置  商品全称
     */
    public void setFullName(String fullName) {
        this.fullName = fullName == null ? null : fullName.trim();
    }

    /**
     * @return t_confirm_receipt_quantity.price : 返回  商品价格 
     */
    public Double getPrice() {
        return price;
    }

    /**
     * @param price of t_confirm_receipt_quantity : 设置  商品价格 
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * @return t_confirm_receipt_quantity.confirm_receipt_quantity : 返回 单次已确认收货数量
     */
    public Integer getConfirmReceiptQuantity() {
        return confirmReceiptQuantity;
    }

    /**
     * @param confirmReceiptQuantity of t_confirm_receipt_quantity : 设置 单次已确认收货数量
     */
    public void setConfirmReceiptQuantity(Integer confirmReceiptQuantity) {
        this.confirmReceiptQuantity = confirmReceiptQuantity;
    }

    /**
     * @return t_confirm_receipt_quantity.confirm_receipt_date : 返回 确认收货时间
     */
    public Date getConfirmReceiptDate() {
        return confirmReceiptDate;
    }

    /**
     * @param confirmReceiptDate of t_confirm_receipt_quantity : 设置 确认收货时间
     */
    public void setConfirmReceiptDate(Date confirmReceiptDate) {
        this.confirmReceiptDate = confirmReceiptDate;
    }

    /**
     * @return t_confirm_receipt_quantity.orderItem : 返回 
     */
    public Long getOrderitem() {
        return orderitem;
    }

    /**
     * @param orderitem of t_confirm_receipt_quantity : 设置 
     */
    public void setOrderitem(Long orderitem) {
        this.orderitem = orderitem;
    }

    /**
     * @return t_confirm_receipt_quantity.create_date : 返回 创建时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_confirm_receipt_quantity : 设置 创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_confirm_receipt_quantity.modify_date : 返回 修改日期
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_confirm_receipt_quantity : 设置 修改日期
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }
}