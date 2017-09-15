package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TProductSpecificationValueKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TProductSpecificationValueMapper
* @Description: t_product_specification_value表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TProductSpecificationValueMapper {
    /**
    * @Title TProductSpecificationValueMapper.countByExample
    * @Description: 根据查询条件，计算t_product_specification_value个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TProductSpecificationValueMapper.deleteByExample
    * @Description: 根据查询条件，删除t_product_specification_value
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TProductSpecificationValueMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_product_specification_value
    * @param key key
    * @return int  删除个数
     */
    int deleteByPrimaryKey(TProductSpecificationValueKey key);

    /**
    * @Title TProductSpecificationValueMapper.insert
    * @Description: 插入一个t_product_specification_value
    * @param record t_product_specification_value的bean对象
    * @return int  插入个数
     */
    int insert(TProductSpecificationValueKey record);

    /**
    * @Title TProductSpecificationValueMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_product_specification_value
    * @param record 只含部分字段的t_product_specification_value的bean对象
    * @return int  插入个数
     */
    int insertSelective(TProductSpecificationValueKey record);

    /**
    * @Title TProductSpecificationValueMapper.selectByExample
    * @Description: 根据查询条件类，返回t_product_specification_value结果集
    * @param example 通用查询条件类
    * @return List<TProductSpecificationValue>t_product_specification_value结果集
     */
    List<TProductSpecificationValueKey> selectByExample(Criteria example);

    /**
    * @Title TProductSpecificationValueMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_product_specification_value部分字段
    * @param record 要更新成为的TProductSpecificationValue对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TProductSpecificationValueKey record, @Param("example") Criteria criteria);

    /**
    * @Title TProductSpecificationValueMapper.updateByExample
    * @Description: 根据查询条件更新t_product_specification_value全表字段
    * @param record 要更新成为的TProductSpecificationValue对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TProductSpecificationValueKey record, @Param("example") Criteria criteria);
}