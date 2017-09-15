package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TProductWithBLOBs;

/**
 * Service - 商品
 */
public interface ProductService extends BaseService {

	List<TProduct> queryProductList(Criteria c);

	void save(TProductWithBLOBs product);

	void update(TProductWithBLOBs product);

	TProductWithBLOBs find(Long id);

	List<TProduct> findList(Long[] ids);

	boolean updateByProductSelective(TProductWithBLOBs p);

}