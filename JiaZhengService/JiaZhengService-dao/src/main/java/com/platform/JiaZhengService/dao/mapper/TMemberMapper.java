package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TMember;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TMemberMapper
* @Description: t_member表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TMemberMapper {
    /**
    * @Title TMemberMapper.countByExample
    * @Description: 根据查询条件，计算t_member个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TMemberMapper.deleteByExample
    * @Description: 根据查询条件，删除t_member
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TMemberMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_member
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TMemberMapper.insert
    * @Description: 插入一个t_member
    * @param record t_member的bean对象
    * @return int  插入个数
     */
    int insert(TMember record);

    /**
    * @Title TMemberMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_member
    * @param record 只含部分字段的t_member的bean对象
    * @return int  插入个数
     */
    int insertSelective(TMember record);

    /**
    * @Title TMemberMapper.selectByExample
    * @Description: 根据查询条件类，返回t_member结果集
    * @param example 通用查询条件类
    * @return List<TMember>t_member结果集
     */
    List<TMember> selectByExample(Criteria example);

    /**
    * @Title TMemberMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_member
    * @param id id
    * @return TMember bean对象
     */
    TMember selectByPrimaryKey(Long id);

    /**
    * @Title TMemberMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_member部分字段
    * @param record 要更新成为的TMember对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TMember record, @Param("example") Criteria criteria);

    /**
    * @Title TMemberMapper.updateByExample
    * @Description: 根据查询条件更新t_member全表字段
    * @param record 要更新成为的TMember对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TMember record, @Param("example") Criteria criteria);

    /**
    * @Title TMemberMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_member部分字段
    * @param record 要更新成为的TMember对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TMember record);

    /**
    * @Title TMemberMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_member全部字段
    * @param record 要更新成为的TMember对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TMember record);
}