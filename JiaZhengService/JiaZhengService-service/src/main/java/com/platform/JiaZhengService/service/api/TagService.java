package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.common.pojo.Filter;
import com.platform.JiaZhengService.common.pojo.Order;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TTag;
import com.platform.JiaZhengService.dao.entity.TTag.Type;

/**
 * Service - 标签
 */
public interface TagService extends BaseService {

	/**
	 * 查找标签
	 * 
	 * @param type
	 *            类型
	 * @return 标签
	 */
	List<TTag> findList(Type type);

	/**
	 * 查找标签(缓存)
	 * 
	 * @param count
	 *            数量
	 * @param filters
	 *            筛选
	 * @param orders
	 *            排序
	 * @param cacheRegion
	 *            缓存区域
	 * @return 标签(缓存)
	 */
	List<TTag> findList(Integer count, List<Filter> filters, List<Order> orders, String cacheRegion);

	/**
	 * 获取当前的Tags<一句话功能简述> <功能详细描述>
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	Long getCurrentTagId();

	List<TTag> queryTagList(Criteria c);

	TTag find(Long id);

	void save(TTag tag);

	void update(TTag tag);

	void delete(Long[] ids);

	List<TProduct> findProductsByTagID(Long id);

}