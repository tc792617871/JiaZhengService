package com.platform.JiaZhengService.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TProductTagKey;
import com.platform.JiaZhengService.dao.entity.TTag;

/**
 * @ClassName: TProductTagMapper
 * @Description: t_product_tag表对应的dao操作Mapper映射类
 * @author: peiyu
 */
public interface TProductTagMapper {
	/**
	 * @Title TProductTagMapper.countByExample
	 * @Description: 根据查询条件，计算t_product_tag个数
	 * @param example
	 *            通用查询条件类
	 * @return int 结果个数
	 */
	int countByExample(Criteria example);

	/**
	 * @Title TProductTagMapper.deleteByExample
	 * @Description: 根据查询条件，删除t_product_tag
	 * @param example
	 *            通用查询条件类
	 * @return int 删除个数
	 */
	int deleteByExample(Criteria example);

	/**
	 * @Title TProductTagMapper.deleteByPrimaryKey
	 * @Description: 根据属性名称，删除t_product_tag
	 * @param key
	 *            key
	 * @return int 删除个数
	 */
	int deleteByPrimaryKey(TProductTagKey key);

	/**
	 * @Title TProductTagMapper.insert
	 * @Description: 插入一个t_product_tag
	 * @param record
	 *            t_product_tag的bean对象
	 * @return int 插入个数
	 */
	int insert(TProductTagKey record);

	/**
	 * @Title TProductTagMapper.insertSelective
	 * @Description: 插入一个只有部分字段的t_product_tag
	 * @param record
	 *            只含部分字段的t_product_tag的bean对象
	 * @return int 插入个数
	 */
	int insertSelective(TProductTagKey record);

	/**
	 * @Title TProductTagMapper.selectByExample
	 * @Description: 根据查询条件类，返回t_product_tag结果集
	 * @param example
	 *            通用查询条件类
	 * @return List<TProductTag>t_product_tag结果集
	 */
	List<TProductTagKey> selectByExample(Criteria example);

	/**
	 * @Title TProductTagMapper.updateByExampleSelective
	 * @Description: 根据查询条件更新t_product_tag部分字段
	 * @param record
	 *            要更新成为的TProductTag对象
	 * @param criteria
	 *            更新记录的查询条件
	 * @return int 更新记录数
	 */
	int updateByExampleSelective(@Param("record") TProductTagKey record, @Param("example") Criteria criteria);

	/**
	 * @Title TProductTagMapper.updateByExample
	 * @Description: 根据查询条件更新t_product_tag全表字段
	 * @param record
	 *            要更新成为的TProductTag对象
	 * @param criteria
	 *            更新记录的查询条件
	 * @return int 更新记录数
	 */
	int updateByExample(@Param("record") TProductTagKey record, @Param("example") Criteria criteria);

	List<TTag> selectByProductID(Long productId);
}