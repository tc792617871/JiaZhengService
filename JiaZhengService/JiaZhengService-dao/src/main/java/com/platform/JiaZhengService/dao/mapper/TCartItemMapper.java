package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TCartItem;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TCartItemMapper
* @Description: t_cart_item表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TCartItemMapper {
    /**
    * @Title TCartItemMapper.countByExample
    * @Description: 根据查询条件，计算t_cart_item个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TCartItemMapper.deleteByExample
    * @Description: 根据查询条件，删除t_cart_item
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TCartItemMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_cart_item
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TCartItemMapper.insert
    * @Description: 插入一个t_cart_item
    * @param record t_cart_item的bean对象
    * @return int  插入个数
     */
    int insert(TCartItem record);

    /**
    * @Title TCartItemMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_cart_item
    * @param record 只含部分字段的t_cart_item的bean对象
    * @return int  插入个数
     */
    int insertSelective(TCartItem record);

    /**
    * @Title TCartItemMapper.selectByExample
    * @Description: 根据查询条件类，返回t_cart_item结果集
    * @param example 通用查询条件类
    * @return List<TCartItem>t_cart_item结果集
     */
    List<TCartItem> selectByExample(Criteria example);

    /**
    * @Title TCartItemMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_cart_item
    * @param id id
    * @return TCartItem bean对象
     */
    TCartItem selectByPrimaryKey(Long id);

    /**
    * @Title TCartItemMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_cart_item部分字段
    * @param record 要更新成为的TCartItem对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TCartItem record, @Param("example") Criteria criteria);

    /**
    * @Title TCartItemMapper.updateByExample
    * @Description: 根据查询条件更新t_cart_item全表字段
    * @param record 要更新成为的TCartItem对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TCartItem record, @Param("example") Criteria criteria);

    /**
    * @Title TCartItemMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_cart_item部分字段
    * @param record 要更新成为的TCartItem对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TCartItem record);

    /**
    * @Title TCartItemMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_cart_item全部字段
    * @param record 要更新成为的TCartItem对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TCartItem record);
}