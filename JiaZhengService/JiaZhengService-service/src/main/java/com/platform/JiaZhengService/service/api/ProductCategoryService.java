package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TProductCategory;

/**
 * Service - 商品分类
 */
public interface ProductCategoryService extends BaseService {

	/**
	 * 查找商品分类
	 * 
	 * @param parentId
	 *            父级分类
	 * @param count
	 *            数量
	 * @return 顶级商品分类
	 */
	List<TProductCategory> findRoots(Long parentId, Integer count);

	/**
	 * 查找所有商品分类
	 * 
	 * @param c
	 * @return
	 */
	List<TProductCategory> findList(Criteria c);

	TProductCategory update(TProductCategory productCategory);

	void delete(Long id);

	void delete(Long... ids);

	void save(TProductCategory productCategory);

	TProductCategory find(Long id);

	/**
	 * 查找商品分类下的商品
	 * 
	 * @param id
	 * @return
	 */
	List<TProduct> findProducts(Long id);
}