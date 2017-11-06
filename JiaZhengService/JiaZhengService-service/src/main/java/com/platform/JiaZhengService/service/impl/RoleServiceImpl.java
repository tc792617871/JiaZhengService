package com.platform.JiaZhengService.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTAdminRole;
import com.platform.JiaZhengService.dao.constants.TTRoleAuthority;
import com.platform.JiaZhengService.dao.entity.TAdmin;
import com.platform.JiaZhengService.dao.entity.TAdminRoleKey;
import com.platform.JiaZhengService.dao.entity.TRole;
import com.platform.JiaZhengService.dao.entity.TRoleAuthority;
import com.platform.JiaZhengService.dao.mapper.TAdminMapper;
import com.platform.JiaZhengService.dao.mapper.TAdminRoleMapper;
import com.platform.JiaZhengService.dao.mapper.TRoleAuthorityMapper;
import com.platform.JiaZhengService.dao.mapper.TRoleMapper;
import com.platform.JiaZhengService.service.api.RoleService;

/**
 * Service - 角色
 */
@Service("roleServiceImpl")
public class RoleServiceImpl extends BaseServiceImpl implements RoleService {

	@Resource
	private TRoleMapper roleMapper;

	@Resource
	private TAdminRoleMapper adminRoleMapper;

	@Resource
	private TAdminMapper adminMapper;

	@Resource
	private TRoleAuthorityMapper roleAuthorityMapper;

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public void save(TRole role) {
		role.setCreateDate(new Date());
		role.setModifyDate(new Date());
		roleMapper.insertSelective(role);
		List<String> authorities = role.getAuthorities();
		if (authorities != null && !authorities.isEmpty()) {
			for (String auth : authorities) {
				TRoleAuthority roleAuth = new TRoleAuthority();
				roleAuth.setRole(role.getId());
				roleAuth.setAuthorities(auth);
				roleAuthorityMapper.insertSelective(roleAuth);
			}
		}
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public TRole update(TRole role) {
		role.setModifyDate(new Date());
		roleMapper.updateByPrimaryKeySelective(role);
		List<String> authorities = role.getAuthorities();
		if (authorities != null && !authorities.isEmpty()) {
			Criteria c = new Criteria();
			c.createConditon().andEqualTo(TTRoleAuthority.ROLE, role.getId());
			roleAuthorityMapper.deleteByExample(c);
			for (String auth : authorities) {
				TRoleAuthority roleAuth = new TRoleAuthority();
				roleAuth.setRole(role.getId());
				roleAuth.setAuthorities(auth);
				roleAuthorityMapper.insertSelective(roleAuth);
			}
		}
		return role;
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public void delete(Long id) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTRoleAuthority.ROLE, id);
		roleAuthorityMapper.deleteByExample(c);
		roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public TRole find(Long id) {
		TRole role = roleMapper.selectByPrimaryKey(id);
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTRoleAuthority.ROLE, id);
		List<TRoleAuthority> authorities = roleAuthorityMapper.selectByExample(c);
		if (authorities != null && !authorities.isEmpty()) {
			List<String> auths = new ArrayList<>();
			for (TRoleAuthority authority : authorities) {
				auths.add(authority.getAuthorities());
			}
			role.setAuthorities(auths);
		}
		return role;
	}

	@Override
	@Transactional
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

	@Override
	public Set<TAdmin> findAdminsByRoleID(Long roleID) {
		Set<TAdmin> admins = new HashSet<>();
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTAdminRole.ROLES, roleID);
		List<TAdminRoleKey> roleKeys = adminRoleMapper.selectByExample(c);
		if (roleKeys != null && roleKeys.size() > 0) {
			for (TAdminRoleKey key : roleKeys) {
				TAdmin admin = adminMapper.selectByPrimaryKey(key.getAdmins());
				admins.add(admin);
			}
		}
		return admins;
	}

}