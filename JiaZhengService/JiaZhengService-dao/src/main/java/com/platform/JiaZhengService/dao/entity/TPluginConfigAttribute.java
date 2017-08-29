package com.platform.JiaZhengService.dao.entity;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;
import java.io.Serializable;

/**
 * @ClassName: TPluginConfigAttribute
* @Description: t_plugin_config_attribute表对应的java bean类
* @author: peiyu
 */
public class TPluginConfigAttribute extends StringAndEqualsPojo implements Serializable {
    /**
     * @Fields serialVersionUID : 自动生成默认序列化ID
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields t_plugin_config_attribute.id :
     */
    private Long id;

    /**
     * @Fields t_plugin_config_attribute.plugin_config :
     */
    private Long pluginConfig;

    /**
     * @Fields t_plugin_config_attribute.attributes :
     */
    private String attributes;

    /**
     * @Fields t_plugin_config_attribute.name :
     */
    private String name;

    /**
     * @return t_plugin_config_attribute.id : 返回 
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id of t_plugin_config_attribute : 设置 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return t_plugin_config_attribute.plugin_config : 返回 
     */
    public Long getPluginConfig() {
        return pluginConfig;
    }

    /**
     * @param pluginConfig of t_plugin_config_attribute : 设置 
     */
    public void setPluginConfig(Long pluginConfig) {
        this.pluginConfig = pluginConfig;
    }

    /**
     * @return t_plugin_config_attribute.attributes : 返回 
     */
    public String getAttributes() {
        return attributes;
    }

    /**
     * @param attributes of t_plugin_config_attribute : 设置 
     */
    public void setAttributes(String attributes) {
        this.attributes = attributes == null ? null : attributes.trim();
    }

    /**
     * @return t_plugin_config_attribute.name : 返回 
     */
    public String getName() {
        return name;
    }

    /**
     * @param name of t_plugin_config_attribute : 设置 
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}