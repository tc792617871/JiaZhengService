package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.platform.JiaZhengService.common.pojo.Principal;
import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.pojo.Setting.AccountLockType;
import com.platform.JiaZhengService.common.util.JiaZhengServiceUtil;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTMember;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.mapper.TMemberMapper;
import com.platform.JiaZhengService.dao.mapper.TOrderMapper;
import com.platform.JiaZhengService.service.api.MemberService;

@Service("memberServiceImpl")
public class MemberServiceImpl extends BaseServiceImpl implements MemberService {

	@Resource
	private TMemberMapper memberMapper;

	@Resource
	private TOrderMapper orderMapper;

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
	@Transactional
	public boolean addMember(TMember member) {
		Date dt = new Date();
		member.setCreateDate(dt);
		member.setModifyDate(dt);
		return memberMapper.insertSelective(member) > 0 ? true : false;
	}

	@Override
	public TMember findByUsername(String username) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTMember.USERNAME, username);
		List<TMember> members = memberMapper.selectByExample(c);
		if (members != null && members.size() > 0) {
			return members.get(0);
		}
		return null;
	}

	@Override
	@Transactional
	public boolean checkLockedStatus(TMember member, Setting setting) {
		if (!member.getIsLocked()) {
			return false;
		}
		boolean needUpdate = false;
		if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.member)) {
			int loginFailureLockTime = setting.getAccountLockTime();
			if (loginFailureLockTime == 0) {
				return false;
			}
			Date lockedDate = member.getLockedDate();
			Date unlockDate = DateUtils.addMinutes(lockedDate, loginFailureLockTime);
			if (new Date().after(unlockDate)) {
				needUpdate = true;
			}
		} else {
			needUpdate = true;
		}
		if (needUpdate) {
			member.setLoginFailureCount(0);
			member.setIsLocked(false);
			member.setLockedDate(null);
			member.setModifyDate(new Date());
			memberMapper.updateByPrimaryKeySelective(member);
			return false;
		}
		return true;
	}

	@Override
	@Transactional
	public boolean updateMember(TMember member) {
		member.setModifyDate(new Date());
		return memberMapper.updateByPrimaryKeySelective(member) > 0 ? true : false;
	}

	@Override
	@Transactional
	public void updateLoginStatus(HttpServletRequest request, TMember member) {
		member.setLoginIp(JiaZhengServiceUtil.getAddr(request));
		member.setLoginDate(new Date());
		member.setModifyDate(new Date());
		member.setLoginFailureCount(0);
		memberMapper.updateByPrimaryKeySelective(member);
	}

	@Override
	public TMember find(Long uid) {
		return memberMapper.selectByPrimaryKey(uid);
	}

	/**
	 * 判断mobile是否唯一
	 * 
	 * @param previousMobile
	 *            修改前mobile(忽略大小写)
	 * @param mobile
	 *            当前mobile(忽略大小写)
	 * @return mobile是否唯一
	 */
	@Override
	public boolean mobileUnique(String previousMobile, String mobile) {
		if (StringUtils.equalsIgnoreCase(previousMobile, mobile)) {
			return true;
		} else {
			Criteria c = new Criteria();
			c.createConditon().andEqualTo(TTMember.MOBILE, mobile);
			List<TMember> members = memberMapper.selectByExample(c);
			if (members != null && members.size() > 0) {
				return true;
			} else {
				return false;
			}
		}
	}

	@Override
	@Transactional
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				memberMapper.deleteByPrimaryKey(id);
			}
		}
	}

	@Override
	public List<TMember> findMemberList(Criteria c) {
		return memberMapper.selectByExample(c);
	}

	@Override
	@Transactional
	public void saveMember(TMember member) {
		member.setCreateDate(new Date());
		member.setModifyDate(new Date());
		memberMapper.insertSelective(member);
	}

	@Override
	public Boolean isAuthenticated() {
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		if (requestAttributes != null) {
			HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
			Principal principal = (Principal) request.getSession().getAttribute(TMember.PRINCIPAL_ATTRIBUTE_NAME);
			if (principal != null) {
				return true;
			}
		}
		return false;
	}

	@Override
	public List<TOrder> findOrdersByCriteria(Criteria c) {
		return orderMapper.selectByExample(c);
	}

	@Override
	public Long count() {
		Integer count = memberMapper.countByExample(new Criteria());
		return Long.valueOf(count);
	}

}
