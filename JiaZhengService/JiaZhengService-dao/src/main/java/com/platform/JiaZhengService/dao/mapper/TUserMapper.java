package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TUser;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TUserMapper
* @Description: t_user表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TUserMapper {
    /**
    * @Title TUserMapper.countByExample
    * @Description: 根据查询条件，计算t_user个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TUserMapper.deleteByExample
    * @Description: 根据查询条件，删除t_user
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TUserMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_user
    * @param userid userid
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long userid);

    /**
    * @Title TUserMapper.insert
    * @Description: 插入一个t_user
    * @param record t_user的bean对象
    * @return int  插入个数
     */
    int insert(TUser record);

    /**
    * @Title TUserMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_user
    * @param record 只含部分字段的t_user的bean对象
    * @return int  插入个数
     */
    int insertSelective(TUser record);

    /**
    * @Title TUserMapper.selectByExample
    * @Description: 根据查询条件类，返回t_user结果集
    * @param example 通用查询条件类
    * @return List<TUser>t_user结果集
     */
    List<TUser> selectByExample(Criteria example);

    /**
    * @Title TUserMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_user
    * @param userid userid
    * @return TUser bean对象
     */
    TUser selectByPrimaryKey(Long userid);

    /**
    * @Title TUserMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_user部分字段
    * @param record 要更新成为的TUser对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TUser record, @Param("example") Criteria criteria);

    /**
    * @Title TUserMapper.updateByExample
    * @Description: 根据查询条件更新t_user全表字段
    * @param record 要更新成为的TUser对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TUser record, @Param("example") Criteria criteria);

    /**
    * @Title TUserMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_user部分字段
    * @param record 要更新成为的TUser对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TUser record);

    /**
    * @Title TUserMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_user全部字段
    * @param record 要更新成为的TUser对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TUser record);
}