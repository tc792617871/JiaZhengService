package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TProductCategory;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TProductCategoryMapper
* @Description: t_product_category表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TProductCategoryMapper {
    /**
    * @Title TProductCategoryMapper.countByExample
    * @Description: 根据查询条件，计算t_product_category个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TProductCategoryMapper.deleteByExample
    * @Description: 根据查询条件，删除t_product_category
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TProductCategoryMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_product_category
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TProductCategoryMapper.insert
    * @Description: 插入一个t_product_category
    * @param record t_product_category的bean对象
    * @return int  插入个数
     */
    int insert(TProductCategory record);

    /**
    * @Title TProductCategoryMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_product_category
    * @param record 只含部分字段的t_product_category的bean对象
    * @return int  插入个数
     */
    int insertSelective(TProductCategory record);

    /**
    * @Title TProductCategoryMapper.selectByExample
    * @Description: 根据查询条件类，返回t_product_category结果集
    * @param example 通用查询条件类
    * @return List<TProductCategory>t_product_category结果集
     */
    List<TProductCategory> selectByExample(Criteria example);

    /**
    * @Title TProductCategoryMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_product_category
    * @param id id
    * @return TProductCategory bean对象
     */
    TProductCategory selectByPrimaryKey(Long id);

    /**
    * @Title TProductCategoryMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_product_category部分字段
    * @param record 要更新成为的TProductCategory对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TProductCategory record, @Param("example") Criteria criteria);

    /**
    * @Title TProductCategoryMapper.updateByExample
    * @Description: 根据查询条件更新t_product_category全表字段
    * @param record 要更新成为的TProductCategory对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TProductCategory record, @Param("example") Criteria criteria);

    /**
    * @Title TProductCategoryMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_product_category部分字段
    * @param record 要更新成为的TProductCategory对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TProductCategory record);

    /**
    * @Title TProductCategoryMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_product_category全部字段
    * @param record 要更新成为的TProductCategory对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TProductCategory record);
}