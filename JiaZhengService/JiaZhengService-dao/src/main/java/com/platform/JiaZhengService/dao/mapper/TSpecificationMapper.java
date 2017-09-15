package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TSpecification;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TSpecificationMapper
* @Description: t_specification表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TSpecificationMapper {
    /**
    * @Title TSpecificationMapper.countByExample
    * @Description: 根据查询条件，计算t_specification个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TSpecificationMapper.deleteByExample
    * @Description: 根据查询条件，删除t_specification
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TSpecificationMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_specification
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TSpecificationMapper.insert
    * @Description: 插入一个t_specification
    * @param record t_specification的bean对象
    * @return int  插入个数
     */
    int insert(TSpecification record);

    /**
    * @Title TSpecificationMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_specification
    * @param record 只含部分字段的t_specification的bean对象
    * @return int  插入个数
     */
    int insertSelective(TSpecification record);

    /**
    * @Title TSpecificationMapper.selectByExample
    * @Description: 根据查询条件类，返回t_specification结果集
    * @param example 通用查询条件类
    * @return List<TSpecification>t_specification结果集
     */
    List<TSpecification> selectByExample(Criteria example);

    /**
    * @Title TSpecificationMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_specification
    * @param id id
    * @return TSpecification bean对象
     */
    TSpecification selectByPrimaryKey(Long id);

    /**
    * @Title TSpecificationMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_specification部分字段
    * @param record 要更新成为的TSpecification对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TSpecification record, @Param("example") Criteria criteria);

    /**
    * @Title TSpecificationMapper.updateByExample
    * @Description: 根据查询条件更新t_specification全表字段
    * @param record 要更新成为的TSpecification对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TSpecification record, @Param("example") Criteria criteria);

    /**
    * @Title TSpecificationMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_specification部分字段
    * @param record 要更新成为的TSpecification对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TSpecification record);

    /**
    * @Title TSpecificationMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_specification全部字段
    * @param record 要更新成为的TSpecification对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TSpecification record);
}