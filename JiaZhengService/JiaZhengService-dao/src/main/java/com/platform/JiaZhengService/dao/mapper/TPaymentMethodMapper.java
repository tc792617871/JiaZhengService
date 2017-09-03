package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TPaymentMethod;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TPaymentMethodMapper
* @Description: t_payment_method表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TPaymentMethodMapper {
    /**
    * @Title TPaymentMethodMapper.countByExample
    * @Description: 根据查询条件，计算t_payment_method个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TPaymentMethodMapper.deleteByExample
    * @Description: 根据查询条件，删除t_payment_method
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TPaymentMethodMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_payment_method
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TPaymentMethodMapper.insert
    * @Description: 插入一个t_payment_method
    * @param record t_payment_method的bean对象
    * @return int  插入个数
     */
    int insert(TPaymentMethod record);

    /**
    * @Title TPaymentMethodMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_payment_method
    * @param record 只含部分字段的t_payment_method的bean对象
    * @return int  插入个数
     */
    int insertSelective(TPaymentMethod record);

    List<TPaymentMethod> selectByExampleWithBLOBs(Criteria example);

    /**
    * @Title TPaymentMethodMapper.selectByExample
    * @Description: 根据查询条件类，返回t_payment_method结果集
    * @param example 通用查询条件类
    * @return List<TPaymentMethod>t_payment_method结果集
     */
    List<TPaymentMethod> selectByExample(Criteria example);

    /**
    * @Title TPaymentMethodMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_payment_method
    * @param id id
    * @return TPaymentMethod bean对象
     */
    TPaymentMethod selectByPrimaryKey(Long id);

    /**
    * @Title TPaymentMethodMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_payment_method部分字段
    * @param record 要更新成为的TPaymentMethod对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TPaymentMethod record, @Param("example") Criteria criteria);

    int updateByExampleWithBLOBs(@Param("record") TPaymentMethod record, @Param("example") Criteria criteria);

    /**
    * @Title TPaymentMethodMapper.updateByExample
    * @Description: 根据查询条件更新t_payment_method全表字段
    * @param record 要更新成为的TPaymentMethod对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TPaymentMethod record, @Param("example") Criteria criteria);

    /**
    * @Title TPaymentMethodMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_payment_method部分字段
    * @param record 要更新成为的TPaymentMethod对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TPaymentMethod record);

    int updateByPrimaryKeyWithBLOBs(TPaymentMethod record);

    /**
    * @Title TPaymentMethodMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_payment_method全部字段
    * @param record 要更新成为的TPaymentMethod对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TPaymentMethod record);
}