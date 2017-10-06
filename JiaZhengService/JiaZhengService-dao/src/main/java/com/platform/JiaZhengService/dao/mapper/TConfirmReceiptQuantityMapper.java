package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TConfirmReceiptQuantity;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TConfirmReceiptQuantityMapper
* @Description: t_confirm_receipt_quantity表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TConfirmReceiptQuantityMapper {
    /**
    * @Title TConfirmReceiptQuantityMapper.countByExample
    * @Description: 根据查询条件，计算t_confirm_receipt_quantity个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TConfirmReceiptQuantityMapper.deleteByExample
    * @Description: 根据查询条件，删除t_confirm_receipt_quantity
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TConfirmReceiptQuantityMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_confirm_receipt_quantity
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TConfirmReceiptQuantityMapper.insert
    * @Description: 插入一个t_confirm_receipt_quantity
    * @param record t_confirm_receipt_quantity的bean对象
    * @return int  插入个数
     */
    int insert(TConfirmReceiptQuantity record);

    /**
    * @Title TConfirmReceiptQuantityMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_confirm_receipt_quantity
    * @param record 只含部分字段的t_confirm_receipt_quantity的bean对象
    * @return int  插入个数
     */
    int insertSelective(TConfirmReceiptQuantity record);

    /**
    * @Title TConfirmReceiptQuantityMapper.selectByExample
    * @Description: 根据查询条件类，返回t_confirm_receipt_quantity结果集
    * @param example 通用查询条件类
    * @return List<TConfirmReceiptQuantity>t_confirm_receipt_quantity结果集
     */
    List<TConfirmReceiptQuantity> selectByExample(Criteria example);

    /**
    * @Title TConfirmReceiptQuantityMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_confirm_receipt_quantity
    * @param id id
    * @return TConfirmReceiptQuantity bean对象
     */
    TConfirmReceiptQuantity selectByPrimaryKey(Long id);

    /**
    * @Title TConfirmReceiptQuantityMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_confirm_receipt_quantity部分字段
    * @param record 要更新成为的TConfirmReceiptQuantity对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TConfirmReceiptQuantity record, @Param("example") Criteria criteria);

    /**
    * @Title TConfirmReceiptQuantityMapper.updateByExample
    * @Description: 根据查询条件更新t_confirm_receipt_quantity全表字段
    * @param record 要更新成为的TConfirmReceiptQuantity对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TConfirmReceiptQuantity record, @Param("example") Criteria criteria);

    /**
    * @Title TConfirmReceiptQuantityMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_confirm_receipt_quantity部分字段
    * @param record 要更新成为的TConfirmReceiptQuantity对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TConfirmReceiptQuantity record);

    /**
    * @Title TConfirmReceiptQuantityMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_confirm_receipt_quantity全部字段
    * @param record 要更新成为的TConfirmReceiptQuantity对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TConfirmReceiptQuantity record);
}