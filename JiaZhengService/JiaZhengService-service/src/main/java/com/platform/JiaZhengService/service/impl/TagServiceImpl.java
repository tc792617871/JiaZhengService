package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.platform.JiaZhengService.common.pojo.Filter;
import com.platform.JiaZhengService.common.pojo.JiaZhengServiceConstants;
import com.platform.JiaZhengService.common.pojo.Order;
import com.platform.JiaZhengService.common.pojo.TableAliasConstants;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.Criteria.Condition;
import com.platform.JiaZhengService.dao.Page;
import com.platform.JiaZhengService.dao.constants.TTProduct;
import com.platform.JiaZhengService.dao.constants.TTProductTag;
import com.platform.JiaZhengService.dao.constants.TTTag;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TTag;
import com.platform.JiaZhengService.dao.entity.TTag.Type;
import com.platform.JiaZhengService.dao.mapper.TProductMapper;
import com.platform.JiaZhengService.dao.mapper.TProductTagMapper;
import com.platform.JiaZhengService.dao.mapper.TTagMapper;
import com.platform.JiaZhengService.service.api.TagService;

@Service("tagServiceImpl")
public class TagServiceImpl extends BaseServiceImpl implements TagService {

	@Resource
	private TTagMapper tagMapper;

	@Resource
	private TProductTagMapper productTagMapper;

	@Resource
	private TProductMapper productMapper;

	@Transactional(readOnly = true)
	public List<TTag> findList(Type type) {
		if (type != null) {
			Criteria c = new Criteria();
			c.createConditon().andEqualTo(TTTag.TYPE, type.getCode());
			return tagMapper.selectByExample(c);
		}
		return null;
	}

	@Transactional(readOnly = true)
	@Cacheable("tag")
	public List<TTag> findList(Integer count, List<Filter> filters, List<Order> orders, String cacheRegion) {
		return null;
	}

	@Transactional(readOnly = true)
	public Long getCurrentTagId() {
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		if (requestAttributes != null) {
			HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
			Long tagId = (Long) request.getSession().getAttribute(TTag.TAGID_ATTRIBUTE_NAME);
			if (tagId != null) {
				return tagId;
			}
		}
		return null;

	}

	@Override
	public List<TTag> queryTagList(Criteria c) {
		return tagMapper.selectByExample(c);
	}

	@Override
	public TTag find(Long id) {
		if (id != null) {
			return tagMapper.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public void save(TTag tag) {
		tag.setCreateDate(new Date());
		tag.setModifyDate(new Date());
		tagMapper.insertSelective(tag);
	}

	@Override
	public void update(TTag tag) {
		tag.setModifyDate(new Date());
		tagMapper.updateByPrimaryKeySelective(tag);
	}

	@Override
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				tagMapper.deleteByPrimaryKey(id);
			}
		}
	}

	@Override
	public List<TProduct> findProductsByTagID(Long id, Boolean isMarketable, Boolean isArchive, Integer count) {
		if (id != null) {
			Criteria c = new Criteria();
			if (count != null) {
				c = new Criteria(new Page(0, count));
			}
			Condition con = c.createConditon();
			con.andEqualTo(TableAliasConstants.ALIAS_T_PRODUCT_TAG + TTProductTag.TAGS, id);
			if (isMarketable != null) {
				con.andEqualTo(TableAliasConstants.ALIAS_T_PRODUCT + TTProduct.IS_MARKETABLE, isMarketable);
			}
			if (isArchive != null) {
				con.andEqualTo(TableAliasConstants.ALIAS_T_PRODUCT + TTProduct.ARCHIVED, isArchive);
			}
			c.setOrderByClause(
					TableAliasConstants.ALIAS_T_PRODUCT + TTProduct.CREATE_DATE + JiaZhengServiceConstants.SORT_DESC);
			List<TProduct> products = productMapper.selectMutilTableByExample(c);
			return products;
		}
		return null;
	}

}