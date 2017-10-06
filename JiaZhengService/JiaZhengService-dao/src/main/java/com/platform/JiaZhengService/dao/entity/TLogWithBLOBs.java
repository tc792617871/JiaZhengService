package com.platform.JiaZhengService.dao.entity;

import java.io.Serializable;

public class TLogWithBLOBs extends TLog implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_log.content :
     */
    private String content;

    /**
     * @Fields t_log.parameter :
     */
    private String parameter;

    /**
     * @return t_log.content : 返回 
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content of t_log : 设置 
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * @return t_log.parameter : 返回 
     */
    public String getParameter() {
        return parameter;
    }

    /**
     * @param parameter of t_log : 设置 
     */
    public void setParameter(String parameter) {
        this.parameter = parameter == null ? null : parameter.trim();
    }
}