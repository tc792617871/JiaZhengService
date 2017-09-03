package com.platform.JiaZhengService.service.api;

import java.util.List;
import java.util.Set;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TAdmin;
import com.platform.JiaZhengService.dao.entity.TRole;

/**
 * Service - 角色
 */
public interface RoleService extends BaseService {

	void save(TRole role);

	TRole update(TRole role);

	void delete(Long id);

	TRole find(Long id);

	Set<TAdmin> findAdminsByRoleID(Long roleID);

	void delete(Long[] ids);

	List<TRole> findAll();

	List<TRole> findList(Long[] roleIds);

	List<TRole> queryRoleList(Criteria c);

}