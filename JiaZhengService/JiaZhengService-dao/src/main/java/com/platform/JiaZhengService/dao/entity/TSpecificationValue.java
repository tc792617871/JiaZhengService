package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: TSpecificationValue
* @Description: t_specification_value表对应的java bean类
* @author: peiyu
 */
public class TSpecificationValue extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_specification_value.id :
     */
    private Long id;

    /**
     * @Fields t_specification_value.create_date :
     */
    private Date createDate;

    /**
     * @Fields t_specification_value.modify_date :
     */
    private Date modifyDate;

    /**
     * @Fields t_specification_value.orders :
     */
    private Integer orders;

    /**
     * @Fields t_specification_value.image :
     */
    private String image;

    /**
     * @Fields t_specification_value.name :
     */
    private String name;

    /**
     * @Fields t_specification_value.specification :
     */
    private Long specification;

    /**
     * @Fields t_specification_value.code :
     */
    private String code;

    /**
     * @Fields t_specification_value.memo :
     */
    private String memo;

    /**
     * @Fields t_specification_value.main_name :
     */
    private String mainName;

    /**
     * @return t_specification_value.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_specification_value : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_specification_value.create_date : 返回 
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate of t_specification_value : 设置 
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return t_specification_value.modify_date : 返回 
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate of t_specification_value : 设置 
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return t_specification_value.orders : 返回 
     */
    public Integer getOrders() {
        return orders;
    }

    /**
     * @param orders of t_specification_value : 设置 
     */
    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    /**
     * @return t_specification_value.image : 返回 
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image of t_specification_value : 设置 
     */
    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    /**
     * @return t_specification_value.name : 返回 
     */
    public String getName() {
        return name;
    }

    /**
     * @param name of t_specification_value : 设置 
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * @return t_specification_value.specification : 返回 
     */
    public Long getSpecification() {
        return specification;
    }

    /**
     * @param specification of t_specification_value : 设置 
     */
    public void setSpecification(Long specification) {
        this.specification = specification;
    }

    /**
     * @return t_specification_value.code : 返回 
     */
    public String getCode() {
        return code;
    }

    /**
     * @param code of t_specification_value : 设置 
     */
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    /**
     * @return t_specification_value.memo : 返回 
     */
    public String getMemo() {
        return memo;
    }

    /**
     * @param memo of t_specification_value : 设置 
     */
    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    /**
     * @return t_specification_value.main_name : 返回 
     */
    public String getMainName() {
        return mainName;
    }

    /**
     * @param mainName of t_specification_value : 设置 
     */
    public void setMainName(String mainName) {
        this.mainName = mainName == null ? null : mainName.trim();
    }
}