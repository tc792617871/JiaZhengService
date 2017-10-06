package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.entity.TArea;

/**
 * Service - 地区
 */
public interface AreaService extends BaseService {

	/**
	 * 查找顶级地区
	 * 
	 * @return 顶级地区
	 */
	List<TArea> findRoots();

	/**
	 * 查找顶级地区
	 * 
	 * @param count
	 *            数量
	 * @return 顶级地区
	 */
	List<TArea> findRoots(Integer count);

	void save(TArea area);

	TArea update(TArea area);

	void delete(Long id);

	void delete(Long[] ids);

	TArea find(Long id);

	List<TArea> findChilds(Long parentId);

}