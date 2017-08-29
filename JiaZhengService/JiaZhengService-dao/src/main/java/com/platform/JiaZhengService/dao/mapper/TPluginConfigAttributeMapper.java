package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TPluginConfigAttribute;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TPluginConfigAttributeMapper
* @Description: t_plugin_config_attribute表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TPluginConfigAttributeMapper {
    /**
    * @Title TPluginConfigAttributeMapper.countByExample
    * @Description: 根据查询条件，计算t_plugin_config_attribute个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TPluginConfigAttributeMapper.deleteByExample
    * @Description: 根据查询条件，删除t_plugin_config_attribute
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TPluginConfigAttributeMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_plugin_config_attribute
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TPluginConfigAttributeMapper.insert
    * @Description: 插入一个t_plugin_config_attribute
    * @param record t_plugin_config_attribute的bean对象
    * @return int  插入个数
     */
    int insert(TPluginConfigAttribute record);

    /**
    * @Title TPluginConfigAttributeMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_plugin_config_attribute
    * @param record 只含部分字段的t_plugin_config_attribute的bean对象
    * @return int  插入个数
     */
    int insertSelective(TPluginConfigAttribute record);

    /**
    * @Title TPluginConfigAttributeMapper.selectByExample
    * @Description: 根据查询条件类，返回t_plugin_config_attribute结果集
    * @param example 通用查询条件类
    * @return List<TPluginConfigAttribute>t_plugin_config_attribute结果集
     */
    List<TPluginConfigAttribute> selectByExample(Criteria example);

    /**
    * @Title TPluginConfigAttributeMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_plugin_config_attribute
    * @param id id
    * @return TPluginConfigAttribute bean对象
     */
    TPluginConfigAttribute selectByPrimaryKey(Long id);

    /**
    * @Title TPluginConfigAttributeMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_plugin_config_attribute部分字段
    * @param record 要更新成为的TPluginConfigAttribute对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TPluginConfigAttribute record, @Param("example") Criteria criteria);

    /**
    * @Title TPluginConfigAttributeMapper.updateByExample
    * @Description: 根据查询条件更新t_plugin_config_attribute全表字段
    * @param record 要更新成为的TPluginConfigAttribute对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TPluginConfigAttribute record, @Param("example") Criteria criteria);

    /**
    * @Title TPluginConfigAttributeMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_plugin_config_attribute部分字段
    * @param record 要更新成为的TPluginConfigAttribute对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TPluginConfigAttribute record);

    /**
    * @Title TPluginConfigAttributeMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_plugin_config_attribute全部字段
    * @param record 要更新成为的TPluginConfigAttribute对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TPluginConfigAttribute record);
}