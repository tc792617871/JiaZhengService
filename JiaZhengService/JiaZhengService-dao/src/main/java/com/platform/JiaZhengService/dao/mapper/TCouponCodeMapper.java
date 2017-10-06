package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TCouponCode;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TCouponCodeMapper
* @Description: t_coupon_code表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TCouponCodeMapper {
    /**
    * @Title TCouponCodeMapper.countByExample
    * @Description: 根据查询条件，计算t_coupon_code个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TCouponCodeMapper.deleteByExample
    * @Description: 根据查询条件，删除t_coupon_code
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TCouponCodeMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_coupon_code
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TCouponCodeMapper.insert
    * @Description: 插入一个t_coupon_code
    * @param record t_coupon_code的bean对象
    * @return int  插入个数
     */
    int insert(TCouponCode record);

    /**
    * @Title TCouponCodeMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_coupon_code
    * @param record 只含部分字段的t_coupon_code的bean对象
    * @return int  插入个数
     */
    int insertSelective(TCouponCode record);

    /**
    * @Title TCouponCodeMapper.selectByExample
    * @Description: 根据查询条件类，返回t_coupon_code结果集
    * @param example 通用查询条件类
    * @return List<TCouponCode>t_coupon_code结果集
     */
    List<TCouponCode> selectByExample(Criteria example);

    /**
    * @Title TCouponCodeMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_coupon_code
    * @param id id
    * @return TCouponCode bean对象
     */
    TCouponCode selectByPrimaryKey(Long id);

    /**
    * @Title TCouponCodeMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_coupon_code部分字段
    * @param record 要更新成为的TCouponCode对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TCouponCode record, @Param("example") Criteria criteria);

    /**
    * @Title TCouponCodeMapper.updateByExample
    * @Description: 根据查询条件更新t_coupon_code全表字段
    * @param record 要更新成为的TCouponCode对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TCouponCode record, @Param("example") Criteria criteria);

    /**
    * @Title TCouponCodeMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_coupon_code部分字段
    * @param record 要更新成为的TCouponCode对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TCouponCode record);

    /**
    * @Title TCouponCodeMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_coupon_code全部字段
    * @param record 要更新成为的TCouponCode对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TCouponCode record);
}