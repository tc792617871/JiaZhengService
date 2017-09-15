package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TProductSpecificationKey;
import com.platform.JiaZhengService.dao.entity.TSpecification;

import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TProductSpecificationMapper
* @Description: t_product_specification表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TProductSpecificationMapper {
    /**
    * @Title TProductSpecificationMapper.countByExample
    * @Description: 根据查询条件，计算t_product_specification个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TProductSpecificationMapper.deleteByExample
    * @Description: 根据查询条件，删除t_product_specification
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TProductSpecificationMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_product_specification
    * @param key key
    * @return int  删除个数
     */
    int deleteByPrimaryKey(TProductSpecificationKey key);

    /**
    * @Title TProductSpecificationMapper.insert
    * @Description: 插入一个t_product_specification
    * @param record t_product_specification的bean对象
    * @return int  插入个数
     */
    int insert(TProductSpecificationKey record);

    /**
    * @Title TProductSpecificationMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_product_specification
    * @param record 只含部分字段的t_product_specification的bean对象
    * @return int  插入个数
     */
    int insertSelective(TProductSpecificationKey record);

    /**
    * @Title TProductSpecificationMapper.selectByExample
    * @Description: 根据查询条件类，返回t_product_specification结果集
    * @param example 通用查询条件类
    * @return List<TProductSpecification>t_product_specification结果集
     */
    List<TProductSpecificationKey> selectByExample(Criteria example);

    /**
    * @Title TProductSpecificationMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_product_specification部分字段
    * @param record 要更新成为的TProductSpecification对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TProductSpecificationKey record, @Param("example") Criteria criteria);

    /**
    * @Title TProductSpecificationMapper.updateByExample
    * @Description: 根据查询条件更新t_product_specification全表字段
    * @param record 要更新成为的TProductSpecification对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TProductSpecificationKey record, @Param("example") Criteria criteria);

	List<TSpecification> selectByProductID(Long productId);
}