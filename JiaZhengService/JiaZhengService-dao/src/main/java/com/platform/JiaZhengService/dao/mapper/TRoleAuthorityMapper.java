package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TRoleAuthority;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TRoleAuthorityMapper
* @Description: t_role_authority表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TRoleAuthorityMapper {
    /**
    * @Title TRoleAuthorityMapper.countByExample
    * @Description: 根据查询条件，计算t_role_authority个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TRoleAuthorityMapper.deleteByExample
    * @Description: 根据查询条件，删除t_role_authority
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TRoleAuthorityMapper.insert
    * @Description: 插入一个t_role_authority
    * @param record t_role_authority的bean对象
    * @return int  插入个数
     */
    int insert(TRoleAuthority record);

    /**
    * @Title TRoleAuthorityMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_role_authority
    * @param record 只含部分字段的t_role_authority的bean对象
    * @return int  插入个数
     */
    int insertSelective(TRoleAuthority record);

    /**
    * @Title TRoleAuthorityMapper.selectByExample
    * @Description: 根据查询条件类，返回t_role_authority结果集
    * @param example 通用查询条件类
    * @return List<TRoleAuthority>t_role_authority结果集
     */
    List<TRoleAuthority> selectByExample(Criteria example);

    /**
    * @Title TRoleAuthorityMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_role_authority部分字段
    * @param record 要更新成为的TRoleAuthority对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TRoleAuthority record, @Param("example") Criteria criteria);

    /**
    * @Title TRoleAuthorityMapper.updateByExample
    * @Description: 根据查询条件更新t_role_authority全表字段
    * @param record 要更新成为的TRoleAuthority对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TRoleAuthority record, @Param("example") Criteria criteria);
}