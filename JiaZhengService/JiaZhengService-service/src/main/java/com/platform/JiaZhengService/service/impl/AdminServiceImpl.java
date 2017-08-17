package com.platform.JiaZhengService.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.common.pojo.Principal;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTAdmin;
import com.platform.JiaZhengService.dao.constants.TTAdminRole;
import com.platform.JiaZhengService.dao.constants.TTRoleAuthority;
import com.platform.JiaZhengService.dao.entity.TAdmin;
import com.platform.JiaZhengService.dao.entity.TAdminRoleKey;
import com.platform.JiaZhengService.dao.entity.TRoleAuthority;
import com.platform.JiaZhengService.dao.mapper.TAdminMapper;
import com.platform.JiaZhengService.dao.mapper.TAdminRoleMapper;
import com.platform.JiaZhengService.dao.mapper.TRoleAuthorityMapper;
import com.platform.JiaZhengService.service.api.AdminService;

@Service("adminServiceImpl")
public class AdminServiceImpl extends BaseServiceImpl implements AdminService {

	@Autowired
	private TAdminMapper adminMapper;

	@Autowired
	private TAdminRoleMapper adminRoleMapper;

	@Autowired
	private TRoleAuthorityMapper roleAuthorityMapper;

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
	@Transactional(readOnly = true)
	public boolean update(TAdmin admin) {
		return adminMapper.updateByPrimaryKeySelective(admin) > 0 ? true : false;
	}
}