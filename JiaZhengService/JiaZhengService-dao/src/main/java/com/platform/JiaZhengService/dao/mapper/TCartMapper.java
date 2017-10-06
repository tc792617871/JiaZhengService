package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TCart;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TCartMapper
* @Description: t_cart表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TCartMapper {
    /**
    * @Title TCartMapper.countByExample
    * @Description: 根据查询条件，计算t_cart个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TCartMapper.deleteByExample
    * @Description: 根据查询条件，删除t_cart
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TCartMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_cart
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TCartMapper.insert
    * @Description: 插入一个t_cart
    * @param record t_cart的bean对象
    * @return int  插入个数
     */
    int insert(TCart record);

    /**
    * @Title TCartMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_cart
    * @param record 只含部分字段的t_cart的bean对象
    * @return int  插入个数
     */
    int insertSelective(TCart record);

    /**
    * @Title TCartMapper.selectByExample
    * @Description: 根据查询条件类，返回t_cart结果集
    * @param example 通用查询条件类
    * @return List<TCart>t_cart结果集
     */
    List<TCart> selectByExample(Criteria example);

    /**
    * @Title TCartMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_cart
    * @param id id
    * @return TCart bean对象
     */
    TCart selectByPrimaryKey(Long id);

    /**
    * @Title TCartMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_cart部分字段
    * @param record 要更新成为的TCart对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TCart record, @Param("example") Criteria criteria);

    /**
    * @Title TCartMapper.updateByExample
    * @Description: 根据查询条件更新t_cart全表字段
    * @param record 要更新成为的TCart对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TCart record, @Param("example") Criteria criteria);

    /**
    * @Title TCartMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_cart部分字段
    * @param record 要更新成为的TCart对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TCart record);

    /**
    * @Title TCartMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_cart全部字段
    * @param record 要更新成为的TCart对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TCart record);
}