package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TRole;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TRoleMapper
* @Description: t_role表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TRoleMapper {
    /**
    * @Title TRoleMapper.countByExample
    * @Description: 根据查询条件，计算t_role个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TRoleMapper.deleteByExample
    * @Description: 根据查询条件，删除t_role
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TRoleMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_role
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TRoleMapper.insert
    * @Description: 插入一个t_role
    * @param record t_role的bean对象
    * @return int  插入个数
     */
    int insert(TRole record);

    /**
    * @Title TRoleMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_role
    * @param record 只含部分字段的t_role的bean对象
    * @return int  插入个数
     */
    int insertSelective(TRole record);

    /**
    * @Title TRoleMapper.selectByExample
    * @Description: 根据查询条件类，返回t_role结果集
    * @param example 通用查询条件类
    * @return List<TRole>t_role结果集
     */
    List<TRole> selectByExample(Criteria example);

    /**
    * @Title TRoleMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_role
    * @param id id
    * @return TRole bean对象
     */
    TRole selectByPrimaryKey(Long id);

    /**
    * @Title TRoleMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_role部分字段
    * @param record 要更新成为的TRole对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TRole record, @Param("example") Criteria criteria);

    /**
    * @Title TRoleMapper.updateByExample
    * @Description: 根据查询条件更新t_role全表字段
    * @param record 要更新成为的TRole对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TRole record, @Param("example") Criteria criteria);

    /**
    * @Title TRoleMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_role部分字段
    * @param record 要更新成为的TRole对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TRole record);

    /**
    * @Title TRoleMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_role全部字段
    * @param record 要更新成为的TRole对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TRole record);
}