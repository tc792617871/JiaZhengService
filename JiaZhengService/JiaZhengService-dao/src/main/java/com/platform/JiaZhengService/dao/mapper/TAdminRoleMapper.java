package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TAdminRoleKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TAdminRoleMapper
* @Description: t_admin_role表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TAdminRoleMapper {
    /**
    * @Title TAdminRoleMapper.countByExample
    * @Description: 根据查询条件，计算t_admin_role个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TAdminRoleMapper.deleteByExample
    * @Description: 根据查询条件，删除t_admin_role
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TAdminRoleMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_admin_role
    * @param key key
    * @return int  删除个数
     */
    int deleteByPrimaryKey(TAdminRoleKey key);

    /**
    * @Title TAdminRoleMapper.insert
    * @Description: 插入一个t_admin_role
    * @param record t_admin_role的bean对象
    * @return int  插入个数
     */
    int insert(TAdminRoleKey record);

    /**
    * @Title TAdminRoleMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_admin_role
    * @param record 只含部分字段的t_admin_role的bean对象
    * @return int  插入个数
     */
    int insertSelective(TAdminRoleKey record);

    /**
    * @Title TAdminRoleMapper.selectByExample
    * @Description: 根据查询条件类，返回t_admin_role结果集
    * @param example 通用查询条件类
    * @return List<TAdminRole>t_admin_role结果集
     */
    List<TAdminRoleKey> selectByExample(Criteria example);

    /**
    * @Title TAdminRoleMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_admin_role部分字段
    * @param record 要更新成为的TAdminRole对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TAdminRoleKey record, @Param("example") Criteria criteria);

    /**
    * @Title TAdminRoleMapper.updateByExample
    * @Description: 根据查询条件更新t_admin_role全表字段
    * @param record 要更新成为的TAdminRole对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TAdminRoleKey record, @Param("example") Criteria criteria);
}