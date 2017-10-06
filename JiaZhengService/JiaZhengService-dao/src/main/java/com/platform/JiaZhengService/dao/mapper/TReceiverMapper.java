package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TReceiver;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TReceiverMapper
* @Description: t_receiver表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TReceiverMapper {
    /**
    * @Title TReceiverMapper.countByExample
    * @Description: 根据查询条件，计算t_receiver个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TReceiverMapper.deleteByExample
    * @Description: 根据查询条件，删除t_receiver
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TReceiverMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_receiver
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TReceiverMapper.insert
    * @Description: 插入一个t_receiver
    * @param record t_receiver的bean对象
    * @return int  插入个数
     */
    int insert(TReceiver record);

    /**
    * @Title TReceiverMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_receiver
    * @param record 只含部分字段的t_receiver的bean对象
    * @return int  插入个数
     */
    int insertSelective(TReceiver record);

    /**
    * @Title TReceiverMapper.selectByExample
    * @Description: 根据查询条件类，返回t_receiver结果集
    * @param example 通用查询条件类
    * @return List<TReceiver>t_receiver结果集
     */
    List<TReceiver> selectByExample(Criteria example);

    /**
    * @Title TReceiverMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_receiver
    * @param id id
    * @return TReceiver bean对象
     */
    TReceiver selectByPrimaryKey(Long id);

    /**
    * @Title TReceiverMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_receiver部分字段
    * @param record 要更新成为的TReceiver对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TReceiver record, @Param("example") Criteria criteria);

    /**
    * @Title TReceiverMapper.updateByExample
    * @Description: 根据查询条件更新t_receiver全表字段
    * @param record 要更新成为的TReceiver对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TReceiver record, @Param("example") Criteria criteria);

    /**
    * @Title TReceiverMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_receiver部分字段
    * @param record 要更新成为的TReceiver对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TReceiver record);

    /**
    * @Title TReceiverMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_receiver全部字段
    * @param record 要更新成为的TReceiver对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TReceiver record);
}