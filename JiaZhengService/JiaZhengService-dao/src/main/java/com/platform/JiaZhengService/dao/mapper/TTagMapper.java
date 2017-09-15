package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TTag;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TTagMapper
* @Description: t_tag表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TTagMapper {
    /**
    * @Title TTagMapper.countByExample
    * @Description: 根据查询条件，计算t_tag个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TTagMapper.deleteByExample
    * @Description: 根据查询条件，删除t_tag
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TTagMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_tag
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TTagMapper.insert
    * @Description: 插入一个t_tag
    * @param record t_tag的bean对象
    * @return int  插入个数
     */
    int insert(TTag record);

    /**
    * @Title TTagMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_tag
    * @param record 只含部分字段的t_tag的bean对象
    * @return int  插入个数
     */
    int insertSelective(TTag record);

    /**
    * @Title TTagMapper.selectByExample
    * @Description: 根据查询条件类，返回t_tag结果集
    * @param example 通用查询条件类
    * @return List<TTag>t_tag结果集
     */
    List<TTag> selectByExample(Criteria example);

    /**
    * @Title TTagMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_tag
    * @param id id
    * @return TTag bean对象
     */
    TTag selectByPrimaryKey(Long id);

    /**
    * @Title TTagMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_tag部分字段
    * @param record 要更新成为的TTag对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TTag record, @Param("example") Criteria criteria);

    /**
    * @Title TTagMapper.updateByExample
    * @Description: 根据查询条件更新t_tag全表字段
    * @param record 要更新成为的TTag对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TTag record, @Param("example") Criteria criteria);

    /**
    * @Title TTagMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_tag部分字段
    * @param record 要更新成为的TTag对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TTag record);

    /**
    * @Title TTagMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_tag全部字段
    * @param record 要更新成为的TTag对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TTag record);
}