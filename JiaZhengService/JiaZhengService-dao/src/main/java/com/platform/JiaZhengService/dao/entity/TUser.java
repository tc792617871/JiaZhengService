package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;

/**
 * @ClassName: TUser
* @Description: t_user表对应的java bean类
* @author: peiyu
 */
public class TUser extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_user.userID :
     */
    private Long userid;

    /**
     * @Fields t_user.userName :
     */
    private String username;

    /**
     * @Fields t_user.password :
     */
    private String password;

    /**
     * @Fields t_user.age :
     */
    private Integer age;

    /**
     * @return t_user.userID : 返回 
     */
    public Long getUserid() {
        return userid;
    }

    /**
     * @param userid of t_user : 设置 
     */
    public void setUserid(Long userid) {
        this.userid = userid;
    }

    /**
     * @return t_user.userName : 返回 
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username of t_user : 设置 
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * @return t_user.password : 返回 
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password of t_user : 设置 
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * @return t_user.age : 返回 
     */
    public Integer getAge() {
        return age;
    }

    /**
     * @param age of t_user : 设置 
     */
    public void setAge(Integer age) {
        this.age = age;
    }
}