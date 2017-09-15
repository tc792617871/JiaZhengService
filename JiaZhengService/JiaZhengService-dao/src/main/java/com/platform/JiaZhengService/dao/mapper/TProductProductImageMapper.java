package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TProductProductImage;
import com.platform.JiaZhengService.dao.entity.TProductProductImageKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TProductProductImageMapper
* @Description: t_product_product_image表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TProductProductImageMapper {
    /**
    * @Title TProductProductImageMapper.countByExample
    * @Description: 根据查询条件，计算t_product_product_image个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TProductProductImageMapper.deleteByExample
    * @Description: 根据查询条件，删除t_product_product_image
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TProductProductImageMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_product_product_image
    * @param key key
    * @return int  删除个数
     */
    int deleteByPrimaryKey(TProductProductImageKey key);

    /**
    * @Title TProductProductImageMapper.insert
    * @Description: 插入一个t_product_product_image
    * @param record t_product_product_image的bean对象
    * @return int  插入个数
     */
    int insert(TProductProductImage record);

    /**
    * @Title TProductProductImageMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_product_product_image
    * @param record 只含部分字段的t_product_product_image的bean对象
    * @return int  插入个数
     */
    int insertSelective(TProductProductImage record);

    /**
    * @Title TProductProductImageMapper.selectByExample
    * @Description: 根据查询条件类，返回t_product_product_image结果集
    * @param example 通用查询条件类
    * @return List<TProductProductImage>t_product_product_image结果集
     */
    List<TProductProductImage> selectByExample(Criteria example);

    /**
    * @Title TProductProductImageMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_product_product_image
    * @param key key
    * @return TProductProductImage bean对象
     */
    TProductProductImage selectByPrimaryKey(TProductProductImageKey key);

    /**
    * @Title TProductProductImageMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_product_product_image部分字段
    * @param record 要更新成为的TProductProductImage对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TProductProductImage record, @Param("example") Criteria criteria);

    /**
    * @Title TProductProductImageMapper.updateByExample
    * @Description: 根据查询条件更新t_product_product_image全表字段
    * @param record 要更新成为的TProductProductImage对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TProductProductImage record, @Param("example") Criteria criteria);

    /**
    * @Title TProductProductImageMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_product_product_image部分字段
    * @param record 要更新成为的TProductProductImage对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TProductProductImage record);

    /**
    * @Title TProductProductImageMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_product_product_image全部字段
    * @param record 要更新成为的TProductProductImage对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TProductProductImage record);
}