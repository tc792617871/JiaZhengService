package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TProductWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TProductMapper
* @Description: t_product表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TProductMapper {
    /**
    * @Title TProductMapper.countByExample
    * @Description: 根据查询条件，计算t_product个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TProductMapper.deleteByExample
    * @Description: 根据查询条件，删除t_product
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TProductMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_product
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TProductMapper.insert
    * @Description: 插入一个t_product
    * @param record t_product的bean对象
    * @return int  插入个数
     */
    int insert(TProductWithBLOBs record);

    /**
    * @Title TProductMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_product
    * @param record 只含部分字段的t_product的bean对象
    * @return int  插入个数
     */
    int insertSelective(TProductWithBLOBs record);

    List<TProductWithBLOBs> selectByExampleWithBLOBs(Criteria example);

    /**
    * @Title TProductMapper.selectByExample
    * @Description: 根据查询条件类，返回t_product结果集
    * @param example 通用查询条件类
    * @return List<TProduct>t_product结果集
     */
    List<TProduct> selectByExample(Criteria example);

    /**
    * @Title TProductMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_product
    * @param id id
    * @return TProduct bean对象
     */
    TProductWithBLOBs selectByPrimaryKey(Long id);

    /**
    * @Title TProductMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_product部分字段
    * @param record 要更新成为的TProduct对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TProductWithBLOBs record, @Param("example") Criteria criteria);

    int updateByExampleWithBLOBs(@Param("record") TProductWithBLOBs record, @Param("example") Criteria criteria);

    /**
    * @Title TProductMapper.updateByExample
    * @Description: 根据查询条件更新t_product全表字段
    * @param record 要更新成为的TProduct对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TProduct record, @Param("example") Criteria criteria);

    /**
    * @Title TProductMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_product部分字段
    * @param record 要更新成为的TProduct对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TProductWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(TProductWithBLOBs record);

    /**
    * @Title TProductMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_product全部字段
    * @param record 要更新成为的TProduct对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TProduct record);

    /**
     * multi table join select
     * @param c
     * @return
     */
	List<TProduct> selectMutilTableByExample(Criteria c);
}