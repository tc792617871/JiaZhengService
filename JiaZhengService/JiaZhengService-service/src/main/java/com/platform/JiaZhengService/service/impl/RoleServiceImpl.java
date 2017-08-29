package com.platform.JiaZhengService.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TRole;
import com.platform.JiaZhengService.dao.mapper.TRoleMapper;
import com.platform.JiaZhengService.service.api.RoleService;

/**
 * Service - 角色
 */
@Service("roleServiceImpl")
public class RoleServiceImpl extends BaseServiceImpl implements RoleService {

	@Resource
	private TRoleMapper roleMapper;

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public void save(TRole role) {
		roleMapper.insertSelective(role);
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public TRole update(TRole role) {
		roleMapper.updateByPrimaryKeySelective(role);
		return role;
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public void delete(Long id) {
		roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public TRole find(Long id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				roleMapper.deleteByPrimaryKey(id);
			}
		}
	}

	@Override
	public List<TRole> findAll() {
		Criteria c = new Criteria();
		return roleMapper.selectByExample(c);
	}

	@Override
	public List<TRole> findList(Long[] roleIds) {
		List<TRole> roles = new ArrayList<>();
		if (roleIds != null && roleIds.length > 0) {
			for (Long roleId : roleIds) {
				TRole role = roleMapper.selectByPrimaryKey(roleId);
				roles.add(role);
			}
		}
		return roles;
	}

	@Override
	public List<TRole> queryRoleList(Criteria c) {
		return roleMapper.selectByExample(c);
	}

}