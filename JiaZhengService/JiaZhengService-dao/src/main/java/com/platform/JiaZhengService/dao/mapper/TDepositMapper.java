package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TDeposit;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TDepositMapper
* @Description: t_deposit表对应的dao操作Mapper映射类
* @author: peiyu
 */
public interface TDepositMapper {
    /**
    * @Title TDepositMapper.countByExample
    * @Description: 根据查询条件，计算t_deposit个数
    * @param example 通用查询条件类
    * @return int 结果个数
     */
    int countByExample(Criteria example);

    /**
    * @Title TDepositMapper.deleteByExample
    * @Description: 根据查询条件，删除t_deposit
    * @param example 通用查询条件类
    * @return int  删除个数
     */
    int deleteByExample(Criteria example);

    /**
    * @Title TDepositMapper.deleteByPrimaryKey
    * @Description: 根据属性名称，删除t_deposit
    * @param id id
    * @return int  删除个数
     */
    int deleteByPrimaryKey(Long id);

    /**
    * @Title TDepositMapper.insert
    * @Description: 插入一个t_deposit
    * @param record t_deposit的bean对象
    * @return int  插入个数
     */
    int insert(TDeposit record);

    /**
    * @Title TDepositMapper.insertSelective
    * @Description: 插入一个只有部分字段的t_deposit
    * @param record 只含部分字段的t_deposit的bean对象
    * @return int  插入个数
     */
    int insertSelective(TDeposit record);

    /**
    * @Title TDepositMapper.selectByExample
    * @Description: 根据查询条件类，返回t_deposit结果集
    * @param example 通用查询条件类
    * @return List<TDeposit>t_deposit结果集
     */
    List<TDeposit> selectByExample(Criteria example);

    /**
    * @Title TDepositMapper.selectByPrimaryKey
    * @Description: 根据主键类，返回t_deposit
    * @param id id
    * @return TDeposit bean对象
     */
    TDeposit selectByPrimaryKey(Long id);

    /**
    * @Title TDepositMapper.updateByExampleSelective
    * @Description: 根据查询条件更新t_deposit部分字段
    * @param record 要更新成为的TDeposit对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExampleSelective(@Param("record") TDeposit record, @Param("example") Criteria criteria);

    /**
    * @Title TDepositMapper.updateByExample
    * @Description: 根据查询条件更新t_deposit全表字段
    * @param record 要更新成为的TDeposit对象
    * @param criteria 更新记录的查询条件
    * @return int 更新记录数
     */
    int updateByExample(@Param("record") TDeposit record, @Param("example") Criteria criteria);

    /**
    * @Title TDepositMapper.updateByPrimaryKeySelective
    * @Description: 根据主键更新t_deposit部分字段
    * @param record 要更新成为的TDeposit对象
    * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(TDeposit record);

    /**
    * @Title TDepositMapper.updateByPrimaryKey
    * @Description: 根据主键更新t_deposit全部字段
    * @param record 要更新成为的TDeposit对象
    * @return int 更新记录数
     */
    int updateByPrimaryKey(TDeposit record);
}