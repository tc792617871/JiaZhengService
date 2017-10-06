package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TOrderLog;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TOrderLogMapper
* @Description: t_order_log表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TOrderLogMapper {
    /**
    * @Title TOrderLogMapper.countByExample
    * @Description: 根据查询条件，计算t_order_log个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TOrderLogMapper.deleteByExample
    * @Description: 根据查询条件，删除t_order_log
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TOrderLogMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_order_log
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TOrderLogMapper.insert
    * @Description: 插入一个t_order_log
    * @param record t_order_log的bean对象
    * @return int  插入个数
     */
    int insert(TOrderLog record);

    /**
    * @Title TOrderLogMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_order_log
    * @param record 只含部分字段的t_order_log的bean对象
    * @return int  插入个数
     */
    int insertSelective(TOrderLog record);

    /**
    * @Title TOrderLogMapper.selectByExample
    * @Description: 根据查询条件类，返回t_order_log结果集
    * @param example 通用查询条件类
    * @return List<TOrderLog>t_order_log结果集
     */
    List<TOrderLog> selectByExample(Criteria example);

    /**
    * @Title TOrderLogMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_order_log
    * @param id id
    * @return TOrderLog bean对象
     */
    TOrderLog selectByPrimaryKey(Long id);

    /**
    * @Title TOrderLogMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_order_log部分字段
    * @param record 要更新成为的TOrderLog对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TOrderLog record, @Param("example") Criteria criteria);

    /**
    * @Title TOrderLogMapper.updateByExample
    * @Description: 根据查询条件更新t_order_log全表字段
    * @param record 要更新成为的TOrderLog对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TOrderLog record, @Param("example") Criteria criteria);

    /**
    * @Title TOrderLogMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_order_log部分字段
    * @param record 要更新成为的TOrderLog对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TOrderLog record);

    /**
    * @Title TOrderLogMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_order_log全部字段
    * @param record 要更新成为的TOrderLog对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TOrderLog record);
}