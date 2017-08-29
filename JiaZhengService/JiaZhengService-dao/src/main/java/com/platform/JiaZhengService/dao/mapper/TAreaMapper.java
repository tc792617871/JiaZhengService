package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TArea;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TAreaMapper
* @Description: t_area表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TAreaMapper {
    /**
    * @Title TAreaMapper.countByExample
    * @Description: 根据查询条件，计算t_area个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TAreaMapper.deleteByExample
    * @Description: 根据查询条件，删除t_area
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TAreaMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_area
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TAreaMapper.insert
    * @Description: 插入一个t_area
    * @param record t_area的bean对象
    * @return int  插入个数
     */
    int insert(TArea record);

    /**
    * @Title TAreaMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_area
    * @param record 只含部分字段的t_area的bean对象
    * @return int  插入个数
     */
    int insertSelective(TArea record);

    List<TArea> selectByExampleWithBLOBs(Criteria example);

    /**
    * @Title TAreaMapper.selectByExample
    * @Description: 根据查询条件类，返回t_area结果集
    * @param example 通用查询条件类
    * @return List<TArea>t_area结果集
     */
    List<TArea> selectByExample(Criteria example);

    /**
    * @Title TAreaMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_area
    * @param id id
    * @return TArea bean对象
     */
    TArea selectByPrimaryKey(Long id);

    /**
    * @Title TAreaMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_area部分字段
    * @param record 要更新成为的TArea对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TArea record, @Param("example") Criteria criteria);

    int updateByExampleWithBLOBs(@Param("record") TArea record, @Param("example") Criteria criteria);

    /**
    * @Title TAreaMapper.updateByExample
    * @Description: 根据查询条件更新t_area全表字段
    * @param record 要更新成为的TArea对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TArea record, @Param("example") Criteria criteria);

    /**
    * @Title TAreaMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_area部分字段
    * @param record 要更新成为的TArea对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TArea record);

    int updateByPrimaryKeyWithBLOBs(TArea record);

    /**
    * @Title TAreaMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_area全部字段
    * @param record 要更新成为的TArea对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TArea record);
}