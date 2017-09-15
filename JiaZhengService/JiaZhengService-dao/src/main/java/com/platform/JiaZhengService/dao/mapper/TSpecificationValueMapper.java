package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TSpecificationValue;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TSpecificationValueMapper
* @Description: t_specification_value表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TSpecificationValueMapper {
    /**
    * @Title TSpecificationValueMapper.countByExample
    * @Description: 根据查询条件，计算t_specification_value个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TSpecificationValueMapper.deleteByExample
    * @Description: 根据查询条件，删除t_specification_value
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TSpecificationValueMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_specification_value
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TSpecificationValueMapper.insert
    * @Description: 插入一个t_specification_value
    * @param record t_specification_value的bean对象
    * @return int  插入个数
     */
    int insert(TSpecificationValue record);

    /**
    * @Title TSpecificationValueMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_specification_value
    * @param record 只含部分字段的t_specification_value的bean对象
    * @return int  插入个数
     */
    int insertSelective(TSpecificationValue record);

    /**
    * @Title TSpecificationValueMapper.selectByExample
    * @Description: 根据查询条件类，返回t_specification_value结果集
    * @param example 通用查询条件类
    * @return List<TSpecificationValue>t_specification_value结果集
     */
    List<TSpecificationValue> selectByExample(Criteria example);

    /**
    * @Title TSpecificationValueMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_specification_value
    * @param id id
    * @return TSpecificationValue bean对象
     */
    TSpecificationValue selectByPrimaryKey(Long id);

    /**
    * @Title TSpecificationValueMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_specification_value部分字段
    * @param record 要更新成为的TSpecificationValue对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TSpecificationValue record, @Param("example") Criteria criteria);

    /**
    * @Title TSpecificationValueMapper.updateByExample
    * @Description: 根据查询条件更新t_specification_value全表字段
    * @param record 要更新成为的TSpecificationValue对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TSpecificationValue record, @Param("example") Criteria criteria);

    /**
    * @Title TSpecificationValueMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_specification_value部分字段
    * @param record 要更新成为的TSpecificationValue对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TSpecificationValue record);

    /**
    * @Title TSpecificationValueMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_specification_value全部字段
    * @param record 要更新成为的TSpecificationValue对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TSpecificationValue record);
}