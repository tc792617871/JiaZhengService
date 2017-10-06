package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TConfirmReceiptItem;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TConfirmReceiptItemMapper
* @Description: t_confirm_receipt_item表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TConfirmReceiptItemMapper {
    /**
    * @Title TConfirmReceiptItemMapper.countByExample
    * @Description: 根据查询条件，计算t_confirm_receipt_item个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TConfirmReceiptItemMapper.deleteByExample
    * @Description: 根据查询条件，删除t_confirm_receipt_item
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TConfirmReceiptItemMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_confirm_receipt_item
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TConfirmReceiptItemMapper.insert
    * @Description: 插入一个t_confirm_receipt_item
    * @param record t_confirm_receipt_item的bean对象
    * @return int  插入个数
     */
    int insert(TConfirmReceiptItem record);

    /**
    * @Title TConfirmReceiptItemMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_confirm_receipt_item
    * @param record 只含部分字段的t_confirm_receipt_item的bean对象
    * @return int  插入个数
     */
    int insertSelective(TConfirmReceiptItem record);

    /**
    * @Title TConfirmReceiptItemMapper.selectByExample
    * @Description: 根据查询条件类，返回t_confirm_receipt_item结果集
    * @param example 通用查询条件类
    * @return List<TConfirmReceiptItem>t_confirm_receipt_item结果集
     */
    List<TConfirmReceiptItem> selectByExample(Criteria example);

    /**
    * @Title TConfirmReceiptItemMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_confirm_receipt_item
    * @param id id
    * @return TConfirmReceiptItem bean对象
     */
    TConfirmReceiptItem selectByPrimaryKey(Long id);

    /**
    * @Title TConfirmReceiptItemMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_confirm_receipt_item部分字段
    * @param record 要更新成为的TConfirmReceiptItem对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TConfirmReceiptItem record, @Param("example") Criteria criteria);

    /**
    * @Title TConfirmReceiptItemMapper.updateByExample
    * @Description: 根据查询条件更新t_confirm_receipt_item全表字段
    * @param record 要更新成为的TConfirmReceiptItem对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TConfirmReceiptItem record, @Param("example") Criteria criteria);

    /**
    * @Title TConfirmReceiptItemMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_confirm_receipt_item部分字段
    * @param record 要更新成为的TConfirmReceiptItem对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TConfirmReceiptItem record);

    /**
    * @Title TConfirmReceiptItemMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_confirm_receipt_item全部字段
    * @param record 要更新成为的TConfirmReceiptItem对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TConfirmReceiptItem record);
}