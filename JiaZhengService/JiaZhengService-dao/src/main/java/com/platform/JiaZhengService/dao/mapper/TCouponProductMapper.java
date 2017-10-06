package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TCouponProductKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TCouponProductMapper
* @Description: t_coupon_product表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TCouponProductMapper {
    /**
    * @Title TCouponProductMapper.countByExample
    * @Description: 根据查询条件，计算t_coupon_product个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TCouponProductMapper.deleteByExample
    * @Description: 根据查询条件，删除t_coupon_product
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TCouponProductMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_coupon_product
    * @param key key
    * @return int  删除个数
     */
    int deleteByPrimaryKey(TCouponProductKey key);

    /**
    * @Title TCouponProductMapper.insert
    * @Description: 插入一个t_coupon_product
    * @param record t_coupon_product的bean对象
    * @return int  插入个数
     */
    int insert(TCouponProductKey record);

    /**
    * @Title TCouponProductMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_coupon_product
    * @param record 只含部分字段的t_coupon_product的bean对象
    * @return int  插入个数
     */
    int insertSelective(TCouponProductKey record);

    /**
    * @Title TCouponProductMapper.selectByExample
    * @Description: 根据查询条件类，返回t_coupon_product结果集
    * @param example 通用查询条件类
    * @return List<TCouponProduct>t_coupon_product结果集
     */
    List<TCouponProductKey> selectByExample(Criteria example);

    /**
    * @Title TCouponProductMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_coupon_product部分字段
    * @param record 要更新成为的TCouponProduct对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TCouponProductKey record, @Param("example") Criteria criteria);

    /**
    * @Title TCouponProductMapper.updateByExample
    * @Description: 根据查询条件更新t_coupon_product全表字段
    * @param record 要更新成为的TCouponProduct对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TCouponProductKey record, @Param("example") Criteria criteria);
}