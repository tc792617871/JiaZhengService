package com.platform.JiaZhengService.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTProductTag;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TProductSpecificationKey;
import com.platform.JiaZhengService.dao.entity.TProductTagKey;
import com.platform.JiaZhengService.dao.entity.TProductWithBLOBs;
import com.platform.JiaZhengService.dao.entity.TSpecification;
import com.platform.JiaZhengService.dao.entity.TTag;
import com.platform.JiaZhengService.dao.mapper.TProductCategoryMapper;
import com.platform.JiaZhengService.dao.mapper.TProductMapper;
import com.platform.JiaZhengService.dao.mapper.TProductSpecificationMapper;
import com.platform.JiaZhengService.dao.mapper.TProductTagMapper;
import com.platform.JiaZhengService.dao.mapper.TSpecificationMapper;
import com.platform.JiaZhengService.service.api.ProductService;

@Service("productServiceImpl")
public class ProductServiceImpl extends BaseServiceImpl implements ProductService {

	@Resource
	TProductMapper productMapper;

	@Resource
	TSpecificationMapper specificationMapper;

	@Resource
	TProductSpecificationMapper productSpecificationMapper;

	@Resource
	TProductTagMapper productTagMapper;

	@Resource
	TProductCategoryMapper productCategoryMapper;

	@Override
	public List<TProduct> queryProductList(Criteria c) {
		List<TProduct> products = productMapper.selectMutilTableByExample(c);
		if (products != null && products.size() > 0) {
			for (TProduct product : products) {
				product.setCategory(productCategoryMapper.selectByPrimaryKey(product.getProductCategory()));
				product.setTags(productTagMapper.selectByProductID(product.getId()));
			}
		}
		return products;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void save(TProductWithBLOBs product) {
		product.setCreateDate(new Date());
		product.setModifyDate(new Date());
		productMapper.insertSelective(product);
		List<TSpecification> specifications = product.getSpecifications();
		if (specifications != null && specifications.size() > 0) {
			for (Iterator<TSpecification> iterator = product.getSpecifications().iterator(); iterator.hasNext();) {
				TSpecification specification = iterator.next();
				if (specification == null || specification.isEmpty()) {
					iterator.remove();
					continue;
				}
				Date dt = new Date();
				specification.setCreateDate(dt);
				specification.setModifyDate(dt);
				specificationMapper.insertSelective(specification);
				TProductSpecificationKey productSpecification = new TProductSpecificationKey();
				productSpecification.setProducts(product.getId());
				productSpecification.setSpecifications(specification.getId());
				productSpecificationMapper.insertSelective(productSpecification);
			}
		}
		Long[] tagIds = product.getTagIds();
		if (tagIds != null && tagIds.length > 0) {
			for (Long id : tagIds) {
				TProductTagKey ptk = new TProductTagKey();
				ptk.setProducts(product.getId());
				ptk.setTags(id);
				productTagMapper.insertSelective(ptk);
			}
		}
	}

	@Override
	@Transactional
	public void update(TProductWithBLOBs product) {
		product.setModifyDate(new Date());
		productMapper.updateByPrimaryKeySelective(product);
		List<TSpecification> specifications = product.getSpecifications();
		if (specifications != null && specifications.size() > 0) {
			for (Iterator<TSpecification> iterator = product.getSpecifications().iterator(); iterator.hasNext();) {
				TSpecification specification = iterator.next();
				if (specification == null || specification.isEmpty()) {
					iterator.remove();
					continue;
				}
				Long id = specification.getId();
				if (id != null) {
					specificationMapper.updateByPrimaryKeySelective(specification);
				} else {
					Date dt = new Date();
					specification.setCreateDate(dt);
					specification.setModifyDate(dt);
					specificationMapper.insertSelective(specification);
					TProductSpecificationKey productSpecification = new TProductSpecificationKey();
					productSpecification.setProducts(product.getId());
					productSpecification.setSpecifications(specification.getId());
					productSpecificationMapper.insertSelective(productSpecification);
				}
			}
		}
		Long[] tagIds = product.getTagIds();
		if (tagIds != null && tagIds.length > 0) {
			Criteria ptc = new Criteria();
			ptc.createConditon().andEqualTo(TTProductTag.PRODUCTS, product.getId());
			productTagMapper.deleteByExample(ptc);
			for (Long id : tagIds) {
				TProductTagKey ptk = new TProductTagKey();
				ptk.setProducts(product.getId());
				ptk.setTags(id);
				productTagMapper.insertSelective(ptk);
			}
		}
	}

	@Override
	public TProductWithBLOBs find(Long id) {
		if (id != null) {
			TProductWithBLOBs product = productMapper.selectByPrimaryKey(id);
			List<TTag> tags = productTagMapper.selectByProductID(product.getId());
			if (tags != null && tags.size() > 0) {
				Long[] tagIds = new Long[tags.size()];
				int index = 0;
				for (TTag tag : tags) {
					tagIds[index] = tag.getId();
					index++;
				}
				product.setTagIds(tagIds);
			}
			product.setTags(tags);
			product.setSpecifications(productSpecificationMapper.selectByProductID(product.getId()));
			return product;
		}
		return null;
	}

	@Override
	public List<TProduct> findList(Long[] ids) {
		if (ids != null && ids.length > 0) {
			List<TProduct> products = new ArrayList<>();
			for (Long id : ids) {
				TProductWithBLOBs product = productMapper.selectByPrimaryKey(id);
				products.add(product);
			}
			return products;
		}
		return null;
	}

	@Override
	public boolean updateByProductSelective(TProductWithBLOBs p) {
		return productMapper.updateByPrimaryKeySelective(p) > 0 ? true : false;
	}

	@Override
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				productMapper.deleteByPrimaryKey(id);
			}
		}
	}

}
