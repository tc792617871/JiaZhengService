package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TAdmin;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TAdminMapper
* @Description: t_admin表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TAdminMapper {
    /**
    * @Title TAdminMapper.countByExample
    * @Description: 根据查询条件，计算t_admin个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TAdminMapper.deleteByExample
    * @Description: 根据查询条件，删除t_admin
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TAdminMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_admin
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TAdminMapper.insert
    * @Description: 插入一个t_admin
    * @param record t_admin的bean对象
    * @return int  插入个数
     */
    int insert(TAdmin record);

    /**
    * @Title TAdminMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_admin
    * @param record 只含部分字段的t_admin的bean对象
    * @return int  插入个数
     */
    int insertSelective(TAdmin record);

    /**
    * @Title TAdminMapper.selectByExample
    * @Description: 根据查询条件类，返回t_admin结果集
    * @param example 通用查询条件类
    * @return List<TAdmin>t_admin结果集
     */
    List<TAdmin> selectByExample(Criteria example);

    /**
    * @Title TAdminMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_admin
    * @param id id
    * @return TAdmin bean对象
     */
    TAdmin selectByPrimaryKey(Long id);

    /**
    * @Title TAdminMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_admin部分字段
    * @param record 要更新成为的TAdmin对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TAdmin record, @Param("example") Criteria criteria);

    /**
    * @Title TAdminMapper.updateByExample
    * @Description: 根据查询条件更新t_admin全表字段
    * @param record 要更新成为的TAdmin对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TAdmin record, @Param("example") Criteria criteria);

    /**
    * @Title TAdminMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_admin部分字段
    * @param record 要更新成为的TAdmin对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TAdmin record);

    /**
    * @Title TAdminMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_admin全部字段
    * @param record 要更新成为的TAdmin对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TAdmin record);
}