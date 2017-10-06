package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TLog;
import com.platform.JiaZhengService.dao.entity.TLogWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TLogMapper
* @Description: t_log表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TLogMapper {
    /**
    * @Title TLogMapper.countByExample
    * @Description: 根据查询条件，计算t_log个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TLogMapper.deleteByExample
    * @Description: 根据查询条件，删除t_log
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TLogMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_log
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TLogMapper.insert
    * @Description: 插入一个t_log
    * @param record t_log的bean对象
    * @return int  插入个数
     */
    int insert(TLogWithBLOBs record);

    /**
    * @Title TLogMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_log
    * @param record 只含部分字段的t_log的bean对象
    * @return int  插入个数
     */
    int insertSelective(TLogWithBLOBs record);

    List<TLogWithBLOBs> selectByExampleWithBLOBs(Criteria example);

    /**
    * @Title TLogMapper.selectByExample
    * @Description: 根据查询条件类，返回t_log结果集
    * @param example 通用查询条件类
    * @return List<TLog>t_log结果集
     */
    List<TLog> selectByExample(Criteria example);

    /**
    * @Title TLogMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_log
    * @param id id
    * @return TLog bean对象
     */
    TLogWithBLOBs selectByPrimaryKey(Long id);

    /**
    * @Title TLogMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_log部分字段
    * @param record 要更新成为的TLog对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TLogWithBLOBs record, @Param("example") Criteria criteria);

    int updateByExampleWithBLOBs(@Param("record") TLogWithBLOBs record, @Param("example") Criteria criteria);

    /**
    * @Title TLogMapper.updateByExample
    * @Description: 根据查询条件更新t_log全表字段
    * @param record 要更新成为的TLog对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TLog record, @Param("example") Criteria criteria);

    /**
    * @Title TLogMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_log部分字段
    * @param record 要更新成为的TLog对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TLogWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(TLogWithBLOBs record);

    /**
    * @Title TLogMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_log全部字段
    * @param record 要更新成为的TLog对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TLog record);
}