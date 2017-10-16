package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TSmsMqList;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TSmsMqListMapper
* @Description: t_sms_mq_list表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TSmsMqListMapper {
    /**
    * @Title TSmsMqListMapper.countByExample
    * @Description: 根据查询条件，计算t_sms_mq_list个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TSmsMqListMapper.deleteByExample
    * @Description: 根据查询条件，删除t_sms_mq_list
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TSmsMqListMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_sms_mq_list
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TSmsMqListMapper.insert
    * @Description: 插入一个t_sms_mq_list
    * @param record t_sms_mq_list的bean对象
    * @return int  插入个数
     */
    int insert(TSmsMqList record);

    /**
    * @Title TSmsMqListMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_sms_mq_list
    * @param record 只含部分字段的t_sms_mq_list的bean对象
    * @return int  插入个数
     */
    int insertSelective(TSmsMqList record);

    /**
    * @Title TSmsMqListMapper.selectByExample
    * @Description: 根据查询条件类，返回t_sms_mq_list结果集
    * @param example 通用查询条件类
    * @return List<TSmsMqList>t_sms_mq_list结果集
     */
    List<TSmsMqList> selectByExample(Criteria example);

    /**
    * @Title TSmsMqListMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_sms_mq_list
    * @param id id
    * @return TSmsMqList bean对象
     */
    TSmsMqList selectByPrimaryKey(Long id);

    /**
    * @Title TSmsMqListMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_sms_mq_list部分字段
    * @param record 要更新成为的TSmsMqList对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TSmsMqList record, @Param("example") Criteria criteria);

    /**
    * @Title TSmsMqListMapper.updateByExample
    * @Description: 根据查询条件更新t_sms_mq_list全表字段
    * @param record 要更新成为的TSmsMqList对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TSmsMqList record, @Param("example") Criteria criteria);

    /**
    * @Title TSmsMqListMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_sms_mq_list部分字段
    * @param record 要更新成为的TSmsMqList对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TSmsMqList record);

    /**
    * @Title TSmsMqListMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_sms_mq_list全部字段
    * @param record 要更新成为的TSmsMqList对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TSmsMqList record);

	void batchUpdate(List<TSmsMqList> resultSmsMqLists);
}