package com.platform.JiaZhengService.dao.mapper;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TPayment;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: TPaymentMapper
 * @Description: t_payment表对应的dao操作Mapper映射类
 * @author: peiyu
 */
public interface TPaymentMapper {
	/**
	 * @Title TPaymentMapper.countByExample
	 * @Description: 根据查询条件，计算t_payment个数
	 * @param example
	 *            通用查询条件类
	 * @return int 结果个数
	 */
	int countByExample(Criteria example);

	/**
	 * @Title TPaymentMapper.deleteByExample
	 * @Description: 根据查询条件，删除t_payment
	 * @param example
	 *            通用查询条件类
	 * @return int 删除个数
	 */
	int deleteByExample(Criteria example);

	/**
	 * @Title TPaymentMapper.deleteByPrimaryKey
	 * @Description: 根据属性名称，删除t_payment
	 * @param id
	 *            id
	 * @return int 删除个数
	 */
	int deleteByPrimaryKey(Long id);

	/**
	 * @Title TPaymentMapper.insert
	 * @Description: 插入一个t_payment
	 * @param record
	 *            t_payment的bean对象
	 * @return int 插入个数
	 */
	int insert(TPayment record);

	/**
	 * @Title TPaymentMapper.insertSelective
	 * @Description: 插入一个只有部分字段的t_payment
	 * @param record
	 *            只含部分字段的t_payment的bean对象
	 * @return int 插入个数
	 */
	int insertSelective(TPayment record);

	/**
	 * @Title TPaymentMapper.selectByExample
	 * @Description: 根据查询条件类，返回t_payment结果集
	 * @param example
	 *            通用查询条件类
	 * @return List<TPayment>t_payment结果集
	 */
	List<TPayment> selectByExample(Criteria example);

	/**
	 * @Title TPaymentMapper.selectByPrimaryKey
	 * @Description: 根据主键类，返回t_payment
	 * @param id
	 *            id
	 * @return TPayment bean对象
	 */
	TPayment selectByPrimaryKey(Long id);

	/**
	 * @Title TPaymentMapper.updateByExampleSelective
	 * @Description: 根据查询条件更新t_payment部分字段
	 * @param record
	 *            要更新成为的TPayment对象
	 * @param criteria
	 *            更新记录的查询条件
	 * @return int 更新记录数
	 */
	int updateByExampleSelective(@Param("record") TPayment record, @Param("example") Criteria criteria);

	/**
	 * @Title TPaymentMapper.updateByExample
	 * @Description: 根据查询条件更新t_payment全表字段
	 * @param record
	 *            要更新成为的TPayment对象
	 * @param criteria
	 *            更新记录的查询条件
	 * @return int 更新记录数
	 */
	int updateByExample(@Param("record") TPayment record, @Param("example") Criteria criteria);

	/**
	 * @Title TPaymentMapper.updateByPrimaryKeySelective
	 * @Description: 根据主键更新t_payment部分字段
	 * @param record
	 *            要更新成为的TPayment对象
	 * @return int 更新记录数
	 */
	int updateByPrimaryKeySelective(TPayment record);

	/**
	 * @Title TPaymentMapper.updateByPrimaryKey
	 * @Description: 根据主键更新t_payment全部字段
	 * @param record
	 *            要更新成为的TPayment对象
	 * @return int 更新记录数
	 */
	int updateByPrimaryKey(TPayment record);

	/**
	 * 多表关联查询
	 * 
	 * @param c
	 * @return
	 */
	List<TPayment> selectMulTablesByExample(Criteria c);
}