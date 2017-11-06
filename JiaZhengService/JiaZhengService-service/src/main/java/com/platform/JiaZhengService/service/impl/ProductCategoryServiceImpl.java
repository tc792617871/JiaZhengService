package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.common.pojo.JiaZhengServiceConstants;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTProduct;
import com.platform.JiaZhengService.dao.constants.TTProductCategory;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TProductCategory;
import com.platform.JiaZhengService.dao.mapper.TProductCategoryMapper;
import com.platform.JiaZhengService.dao.mapper.TProductMapper;
import com.platform.JiaZhengService.service.api.ProductCategoryService;

/**
 * Service - 商品分类
 */
@Service("productCategoryServiceImpl")
public class ProductCategoryServiceImpl extends BaseServiceImpl implements ProductCategoryService {

	@Resource
	private TProductCategoryMapper productCategoryMapper;

	@Resource
	private TProductMapper productMapper;

	@Transactional(readOnly = true)
	public List<TProductCategory> findRoots(Long parentId, Integer count) {
		Criteria c = new Criteria();
		if (parentId == null) {
			c.createConditon().andIsNull(TTProductCategory.PARENT);
		} else {
			c.createConditon().andEqualTo(TTProductCategory.PARENT, parentId);
		}
		c.setOrderByClause(TTProductCategory.ORDERS + JiaZhengServiceConstants.SORT_ASC);
		List<TProductCategory> productCategories = productCategoryMapper.selectByExample(c);
		if (count != null && count > 0) {
			if (productCategories != null && productCategories.size() > 0) {
				if (productCategories.size() > count) {
					return productCategories.subList(0, count);
				} else {
					return productCategories;
				}
			}
		}
		return productCategories;
	}

	@Override
	public List<TProductCategory> findList(Criteria c) {
		List<TProductCategory> productCategories = productCategoryMapper.selectByExample(c);
		return productCategories;
	}

	@Override
	@Transactional
	public TProductCategory update(TProductCategory productCategory) {
		productCategory.setModifyDate(new Date());
		productCategoryMapper.updateByPrimaryKeySelective(productCategory);
		return productCategory;
	}

	@Override
	@Transactional
	public void delete(Long id) {
		productCategoryMapper.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional
	public void delete(Long... ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				productCategoryMapper.deleteByPrimaryKey(id);
			}
		}
	}

	@Override
	@Transactional
	public void save(TProductCategory productCategory) {
		productCategory.setCreateDate(new Date());
		productCategory.setModifyDate(new Date());
		productCategoryMapper.insertSelective(productCategory);
	}

	@Override
	public TProductCategory find(Long id) {
		if (id != null) {
			return productCategoryMapper.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public List<TProduct> findProducts(Long id) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTProduct.PRODUCT_CATEGORY, id);
		List<TProduct> products = productMapper.selectByExample(c);
		return products;
	}
}