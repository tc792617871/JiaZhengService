package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TOrderItem;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TOrderItemMapper
* @Description: t_order_item表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TOrderItemMapper {
    /**
    * @Title TOrderItemMapper.countByExample
    * @Description: 根据查询条件，计算t_order_item个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TOrderItemMapper.deleteByExample
    * @Description: 根据查询条件，删除t_order_item
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TOrderItemMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_order_item
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TOrderItemMapper.insert
    * @Description: 插入一个t_order_item
    * @param record t_order_item的bean对象
    * @return int  插入个数
     */
    int insert(TOrderItem record);

    /**
    * @Title TOrderItemMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_order_item
    * @param record 只含部分字段的t_order_item的bean对象
    * @return int  插入个数
     */
    int insertSelective(TOrderItem record);

    /**
    * @Title TOrderItemMapper.selectByExample
    * @Description: 根据查询条件类，返回t_order_item结果集
    * @param example 通用查询条件类
    * @return List<TOrderItem>t_order_item结果集
     */
    List<TOrderItem> selectByExample(Criteria example);

    /**
    * @Title TOrderItemMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_order_item
    * @param id id
    * @return TOrderItem bean对象
     */
    TOrderItem selectByPrimaryKey(Long id);

    /**
    * @Title TOrderItemMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_order_item部分字段
    * @param record 要更新成为的TOrderItem对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TOrderItem record, @Param("example") Criteria criteria);

    /**
    * @Title TOrderItemMapper.updateByExample
    * @Description: 根据查询条件更新t_order_item全表字段
    * @param record 要更新成为的TOrderItem对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TOrderItem record, @Param("example") Criteria criteria);

    /**
    * @Title TOrderItemMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_order_item部分字段
    * @param record 要更新成为的TOrderItem对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TOrderItem record);

    /**
    * @Title TOrderItemMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_order_item全部字段
    * @param record 要更新成为的TOrderItem对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TOrderItem record);
}