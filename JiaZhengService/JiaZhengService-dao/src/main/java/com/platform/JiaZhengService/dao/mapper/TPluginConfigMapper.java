package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TPluginConfig;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TPluginConfigMapper
* @Description: t_plugin_config表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TPluginConfigMapper {
    /**
    * @Title TPluginConfigMapper.countByExample
    * @Description: 根据查询条件，计算t_plugin_config个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TPluginConfigMapper.deleteByExample
    * @Description: 根据查询条件，删除t_plugin_config
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TPluginConfigMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_plugin_config
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TPluginConfigMapper.insert
    * @Description: 插入一个t_plugin_config
    * @param record t_plugin_config的bean对象
    * @return int  插入个数
     */
    int insert(TPluginConfig record);

    /**
    * @Title TPluginConfigMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_plugin_config
    * @param record 只含部分字段的t_plugin_config的bean对象
    * @return int  插入个数
     */
    int insertSelective(TPluginConfig record);

    /**
    * @Title TPluginConfigMapper.selectByExample
    * @Description: 根据查询条件类，返回t_plugin_config结果集
    * @param example 通用查询条件类
    * @return List<TPluginConfig>t_plugin_config结果集
     */
    List<TPluginConfig> selectByExample(Criteria example);

    /**
    * @Title TPluginConfigMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_plugin_config
    * @param id id
    * @return TPluginConfig bean对象
     */
    TPluginConfig selectByPrimaryKey(Long id);

    /**
    * @Title TPluginConfigMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_plugin_config部分字段
    * @param record 要更新成为的TPluginConfig对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TPluginConfig record, @Param("example") Criteria criteria);

    /**
    * @Title TPluginConfigMapper.updateByExample
    * @Description: 根据查询条件更新t_plugin_config全表字段
    * @param record 要更新成为的TPluginConfig对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TPluginConfig record, @Param("example") Criteria criteria);

    /**
    * @Title TPluginConfigMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_plugin_config部分字段
    * @param record 要更新成为的TPluginConfig对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TPluginConfig record);

    /**
    * @Title TPluginConfigMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_plugin_config全部字段
    * @param record 要更新成为的TPluginConfig对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TPluginConfig record);
}