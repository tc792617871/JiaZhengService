package com.platform.JiaZhengService.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.common.pojo.Principal;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTAdmin;
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
import com.platform.JiaZhengService.service.api.AdminService;

@Service("adminServiceImpl")
public class AdminServiceImpl extends BaseServiceImpl implements AdminService {

	@Resource
	private TAdminMapper adminMapper;

	@Resource
	private TAdminRoleMapper adminRoleMapper;

	@Resource
	private TRoleAuthorityMapper roleAuthorityMapper;

	@Resource
	private TRoleMapper roleMapper;

	@Override
	public boolean usernameExists(String username) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTAdmin.USERNAME, username);
		List<TAdmin> admins = adminMapper.selectByExample(c);
		if (admins != null && admins.size() > 0) {
			return true;
		}
		return false;
	}

	@Transactional(readOnly = true)
	public TAdmin findByUsername(String username) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTAdmin.USERNAME, username);
		List<TAdmin> admins = adminMapper.selectByExample(c);
		if (admins != null && admins.size() > 0) {
			return admins.get(0);
		}
		return null;
	}

	@Transactional(readOnly = true)
	public List<String> findAuthorities(Long id) {
		List<String> authorities = new ArrayList<String>();
		TAdmin admin = adminMapper.selectByPrimaryKey(id);
		if (admin != null) {
			Criteria c = new Criteria();
			c.createConditon().andEqualTo(TTAdminRole.ADMINS, admin.getId());
			List<TAdminRoleKey> roles = adminRoleMapper.selectByExample(c);
			for (TAdminRoleKey adminRole : roles) {
				Criteria criteria = new Criteria();
				criteria.createConditon().andEqualTo(TTRoleAuthority.ROLE, adminRole.getRoles());
				List<TRoleAuthority> ras = roleAuthorityMapper.selectByExample(criteria);
				if (ras != null && ras.size() > 0) {
					for (TRoleAuthority ra : ras) {
						authorities.add(ra.getAuthorities());
					}
				}
			}
		}
		return authorities;
	}

	@Transactional(readOnly = true)
	public boolean isAuthenticated() {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			return subject.isAuthenticated();
		}
		return false;
	}

	@Transactional(readOnly = true)
	public TAdmin getCurrent() {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null) {
				return adminMapper.selectByPrimaryKey(principal.getId());
			}
		}
		return null;
	}

	@Transactional(readOnly = true)
	public String getCurrentUsername() {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null) {
				return principal.getUsername();
			}
		}
		return null;
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public TAdmin update(TAdmin admin) {
		admin.setModifyDate(new Date());
		adminMapper.updateByPrimaryKeySelective(admin);

		Set<TRole> roles = admin.getRoles();
		if (roles != null && !roles.isEmpty()) {
			Criteria c = new Criteria();
			c.createConditon().andEqualTo(TTAdminRole.ADMINS, admin.getId());
			adminRoleMapper.deleteByExample(c);

			for (TRole role : roles) {
				TAdminRoleKey roleKey = new TAdminRoleKey();
				roleKey.setAdmins(admin.getId());
				roleKey.setRoles(role.getId());
				adminRoleMapper.insert(roleKey);
			}
		}

		return adminMapper.selectByPrimaryKey(admin.getId());
	}

	@Override
	@Transactional
	public void save(TAdmin admin) {
		admin.setCreateDate(new Date());
		admin.setModifyDate(new Date());
		adminMapper.insertSelective(admin);
		Set<TRole> roles = admin.getRoles();
		if (roles != null && !roles.isEmpty()) {
			for (TRole role : roles) {
				TAdminRoleKey roleKey = new TAdminRoleKey();
				roleKey.setAdmins(admin.getId());
				roleKey.setRoles(role.getId());
				adminRoleMapper.insert(roleKey);
			}
		}
	}

	@Override
	public TAdmin find(Long id) {
		return adminMapper.selectByPrimaryKey(id);
	}

	@Override
	public int count() {
		Criteria c = new Criteria();
		List<TAdmin> admins = adminMapper.selectByExample(c);
		return admins.size();
	}

	@Override
	@Transactional
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				Criteria c = new Criteria();
				c.createConditon().andEqualTo(TTAdminRole.ADMINS, id);
				adminRoleMapper.deleteByExample(c);
				adminMapper.deleteByPrimaryKey(id);
			}
		}
	}

	@Override
	public List<TAdmin> queryAdminList(Criteria c) {
		List<TAdmin> admins = adminMapper.selectByExample(c);
		return admins;
	}

	@Override
	public Set<TRole> findRolesByAdminID(Long id) {
		Set<TRole> roles = new HashSet<>();
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTAdminRole.ADMINS, id);
		List<TAdminRoleKey> keys = adminRoleMapper.selectByExample(c);
		if (keys != null && !keys.isEmpty()) {
			for (TAdminRoleKey key : keys) {
				TRole role = roleMapper.selectByPrimaryKey(key.getRoles());
				roles.add(role);
			}
		}
		return roles;
	}
}