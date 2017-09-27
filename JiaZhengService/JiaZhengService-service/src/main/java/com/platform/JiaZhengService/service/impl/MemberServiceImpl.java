package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.platform.JiaZhengService.common.pojo.Principal;
import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTMember;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.mapper.TMemberMapper;
import com.platform.JiaZhengService.service.api.MemberService;

@Service("memberServiceImpl")
public class MemberServiceImpl extends BaseServiceImpl implements MemberService {

	@Resource
	private TMemberMapper memberMapper;

	@Override
	@Transactional(readOnly = true)
	public TMember getCurrent() {
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		if (requestAttributes != null) {
			HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
			Principal principal = (Principal) request.getSession().getAttribute(TMember.PRINCIPAL_ATTRIBUTE_NAME);
			if (principal != null) {
				return memberMapper.selectByPrimaryKey(principal.getId());
			}
		}
		return null;
	}

	@Override
	public boolean mobileUnique(String mobile) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTMember.MOBILE, mobile);
		List<TMember> members = memberMapper.selectByExample(c);
		if (members != null && members.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean usernameDisabled(String username) {
		Setting setting = SettingUtils.get();
		if (setting.getDisabledUsernames() != null) {
			for (String disabledUsername : setting.getDisabledUsernames()) {
				if (StringUtils.containsIgnoreCase(username, disabledUsername)) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public boolean usernameExists(String username) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTMember.USERNAME, username);
		List<TMember> members = memberMapper.selectByExample(c);
		if (members != null && members.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean addMember(TMember member) {
		Date dt = new Date();
		member.setCreateDate(dt);
		member.setModifyDate(dt);
		return memberMapper.insertSelective(member) > 0 ? true : false;
	}

}
