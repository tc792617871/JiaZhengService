package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TDeposit
* @Description: t_deposit表对应的java bean类
* @author: peiyu
 */
public class TDeposit extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_deposit.id :
     */
    private Long id;

    /**
     * @Fields t_deposit.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_deposit.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_deposit.balance :
     */
    private Double balance;

    /**
     * @Fields t_deposit.credit :
     */
    private Double credit;

    /**
     * @Fields t_deposit.debit :
     */
    private Double debit;

    /**
     * @Fields t_deposit.memo :
     */
    private String memo;

    /**
     * @Fields t_deposit.operator :
     */
    private String operator;

    /**
     * @Fields t_deposit.type :
     */
    private Integer type;

    /**
     * @Fields t_deposit.member :
     */
    private Long member;

    /**
     * @Fields t_deposit.orders :
     */
    private Long orders;

    /**
     * @Fields t_deposit.payment :
     */
    private Long payment;

    /**
     * @return t_deposit.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_deposit : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_deposit.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_deposit : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_deposit.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_deposit : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_deposit.balance : 返回 
     */
    public Double getBalance() {
        return balance;
    }

    /**
     * @param balance of t_deposit : 设置 
     */
    public void setBalance(Double balance) {
        this.balance = balance;
    }

    /**
     * @return t_deposit.credit : 返回 
     */
    public Double getCredit() {
        return credit;
    }

    /**
     * @param credit of t_deposit : 设置 
     */
    public void setCredit(Double credit) {
        this.credit = credit;
    }

    /**
     * @return t_deposit.debit : 返回 
     */
    public Double getDebit() {
        return debit;
    }

    /**
     * @param debit of t_deposit : 设置 
     */
    public void setDebit(Double debit) {
        this.debit = debit;
    }

    /**
     * @return t_deposit.memo : 返回 
     */
    public String getMemo() {
        return memo;
    }

    /**
     * @param memo of t_deposit : 设置 
     */
    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    /**
     * @return t_deposit.operator : 返回 
     */
    public String getOperator() {
        return operator;
    }

    /**
     * @param operator of t_deposit : 设置 
     */
    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    /**
     * @return t_deposit.type : 返回 
     */
    public Integer getType() {
        return type;
    }

    /**
     * @param type of t_deposit : 设置 
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * @return t_deposit.member : 返回 
     */
    public Long getMember() {
        return member;
    }

    /**
     * @param member of t_deposit : 设置 
     */
    public void setMember(Long member) {
        this.member = member;
    }

    /**
     * @return t_deposit.orders : 返回 
     */
    public Long getOrders() {
        return orders;
    }

    /**
     * @param orders of t_deposit : 设置 
     */
    public void setOrders(Long orders) {
        this.orders = orders;
    }

    /**
     * @return t_deposit.payment : 返回 
     */
    public Long getPayment() {
        return payment;
    }

    /**
     * @param payment of t_deposit : 设置 
     */
    public void setPayment(Long payment) {
        this.payment = payment;
    }
}