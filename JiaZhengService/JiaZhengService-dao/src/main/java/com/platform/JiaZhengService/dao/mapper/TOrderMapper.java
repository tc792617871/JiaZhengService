package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TOrder;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TOrderMapper
* @Description: t_order表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TOrderMapper {
    /**
    * @Title TOrderMapper.countByExample
    * @Description: 根据查询条件，计算t_order个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TOrderMapper.deleteByExample
    * @Description: 根据查询条件，删除t_order
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TOrderMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_order
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TOrderMapper.insert
    * @Description: 插入一个t_order
    * @param record t_order的bean对象
    * @return int  插入个数
     */
    int insert(TOrder record);

    /**
    * @Title TOrderMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_order
    * @param record 只含部分字段的t_order的bean对象
    * @return int  插入个数
     */
    int insertSelective(TOrder record);

    /**
    * @Title TOrderMapper.selectByExample
    * @Description: 根据查询条件类，返回t_order结果集
    * @param example 通用查询条件类
    * @return List<TOrder>t_order结果集
     */
    List<TOrder> selectByExample(Criteria example);

    /**
    * @Title TOrderMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_order
    * @param id id
    * @return TOrder bean对象
     */
    TOrder selectByPrimaryKey(Long id);

    /**
    * @Title TOrderMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_order部分字段
    * @param record 要更新成为的TOrder对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TOrder record, @Param("example") Criteria criteria);

    /**
    * @Title TOrderMapper.updateByExample
    * @Description: 根据查询条件更新t_order全表字段
    * @param record 要更新成为的TOrder对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TOrder record, @Param("example") Criteria criteria);

    /**
    * @Title TOrderMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_order部分字段
    * @param record 要更新成为的TOrder对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TOrder record);

    /**
    * @Title TOrderMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_order全部字段
    * @param record 要更新成为的TOrder对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TOrder record);
}