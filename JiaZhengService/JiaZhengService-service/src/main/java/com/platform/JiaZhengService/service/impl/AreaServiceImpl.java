package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.common.pojo.JiaZhengServiceConstants;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTArea;
import com.platform.JiaZhengService.dao.entity.TArea;
import com.platform.JiaZhengService.dao.mapper.TAreaMapper;
import com.platform.JiaZhengService.service.api.AreaService;

/**
 * Service - 地区
 * 
 */
@Service("areaServiceImpl")
public class AreaServiceImpl extends BaseServiceImpl implements AreaService {

	@Resource
	private TAreaMapper areaMapper;

	@Transactional(readOnly = true)
	public List<TArea> findRoots() {
		Criteria c = new Criteria();
		c.createConditon().andIsNull(TTArea.PARENT);
		List<TArea> areas = areaMapper.selectByExample(c);
		return areas;
	}

	@Transactional(readOnly = true)
	public List<TArea> findRoots(Integer count) {
		Criteria c = new Criteria();
		c.createConditon().andIsNull(TTArea.PARENT);
		c.setOrderByClause(TTArea.ORDERS + JiaZhengServiceConstants.SORT_ASC);
		List<TArea> areas = areaMapper.selectByExample(c);
		if (areas != null && areas.size() > 0) {
			if (areas.size() > count) {
				return areas.subList(0, count);
			} else {
				return areas;
			}
		}
		return null;
	}

	@Override
	@Transactional
	@CacheEvict(value = "area", allEntries = true)
	public void save(TArea area) {
		area.setCreateDate(new Date());
		area.setModifyDate(new Date());
		areaMapper.insertSelective(area);
	}

	@Override
	@Transactional
	@CacheEvict(value = "area", allEntries = true)
	public TArea update(TArea area) {
		area.setModifyDate(new Date());
		areaMapper.updateByPrimaryKeySelective(area);
		return area;
	}

	@Override
	@Transactional
	@CacheEvict(value = "area", allEntries = true)
	public void delete(Long id) {
		areaMapper.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional
	@CacheEvict(value = "area", allEntries = true)
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				areaMapper.deleteByPrimaryKey(id);
			}
		}
	}

	@Override
	public TArea find(Long parentId) {
		if (parentId != null) {
			return areaMapper.selectByPrimaryKey(parentId);
		}
		return null;
	}

	@Override
	public List<TArea> findChilds(Long parentId) {
		if (parentId != null) {
			Criteria c = new Criteria();
			c.createConditon().andEqualTo(TTArea.PARENT, parentId);
			return areaMapper.selectByExample(c);
		}
		return null;
	}

}