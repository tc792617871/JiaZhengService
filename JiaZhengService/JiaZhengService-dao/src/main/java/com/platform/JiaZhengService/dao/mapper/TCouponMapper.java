package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TCoupon;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TCouponMapper
* @Description: t_coupon表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TCouponMapper {
    /**
    * @Title TCouponMapper.countByExample
    * @Description: 根据查询条件，计算t_coupon个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TCouponMapper.deleteByExample
    * @Description: 根据查询条件，删除t_coupon
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TCouponMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_coupon
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TCouponMapper.insert
    * @Description: 插入一个t_coupon
    * @param record t_coupon的bean对象
    * @return int  插入个数
     */
    int insert(TCoupon record);

    /**
    * @Title TCouponMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_coupon
    * @param record 只含部分字段的t_coupon的bean对象
    * @return int  插入个数
     */
    int insertSelective(TCoupon record);

    List<TCoupon> selectByExampleWithBLOBs(Criteria example);

    /**
    * @Title TCouponMapper.selectByExample
    * @Description: 根据查询条件类，返回t_coupon结果集
    * @param example 通用查询条件类
    * @return List<TCoupon>t_coupon结果集
     */
    List<TCoupon> selectByExample(Criteria example);

    /**
    * @Title TCouponMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_coupon
    * @param id id
    * @return TCoupon bean对象
     */
    TCoupon selectByPrimaryKey(Long id);

    /**
    * @Title TCouponMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_coupon部分字段
    * @param record 要更新成为的TCoupon对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TCoupon record, @Param("example") Criteria criteria);

    int updateByExampleWithBLOBs(@Param("record") TCoupon record, @Param("example") Criteria criteria);

    /**
    * @Title TCouponMapper.updateByExample
    * @Description: 根据查询条件更新t_coupon全表字段
    * @param record 要更新成为的TCoupon对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TCoupon record, @Param("example") Criteria criteria);

    /**
    * @Title TCouponMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_coupon部分字段
    * @param record 要更新成为的TCoupon对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TCoupon record);

    int updateByPrimaryKeyWithBLOBs(TCoupon record);

    /**
    * @Title TCouponMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_coupon全部字段
    * @param record 要更新成为的TCoupon对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TCoupon record);
}