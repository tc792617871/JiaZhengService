package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TOrderCoupon;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TOrderCouponMapper
* @Description: t_order_coupon表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TOrderCouponMapper {
    /**
    * @Title TOrderCouponMapper.countByExample
    * @Description: 根据查询条件，计算t_order_coupon个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TOrderCouponMapper.deleteByExample
    * @Description: 根据查询条件，删除t_order_coupon
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TOrderCouponMapper.insert
    * @Description: 插入一个t_order_coupon
    * @param record t_order_coupon的bean对象
    * @return int  插入个数
     */
    int insert(TOrderCoupon record);

    /**
    * @Title TOrderCouponMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_order_coupon
    * @param record 只含部分字段的t_order_coupon的bean对象
    * @return int  插入个数
     */
    int insertSelective(TOrderCoupon record);

    /**
    * @Title TOrderCouponMapper.selectByExample
    * @Description: 根据查询条件类，返回t_order_coupon结果集
    * @param example 通用查询条件类
    * @return List<TOrderCoupon>t_order_coupon结果集
     */
    List<TOrderCoupon> selectByExample(Criteria example);

    /**
    * @Title TOrderCouponMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_order_coupon部分字段
    * @param record 要更新成为的TOrderCoupon对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TOrderCoupon record, @Param("example") Criteria criteria);

    /**
    * @Title TOrderCouponMapper.updateByExample
    * @Description: 根据查询条件更新t_order_coupon全表字段
    * @param record 要更新成为的TOrderCoupon对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TOrderCoupon record, @Param("example") Criteria criteria);
}