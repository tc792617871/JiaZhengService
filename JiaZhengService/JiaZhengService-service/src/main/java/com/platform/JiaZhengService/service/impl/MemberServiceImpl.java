package com.platform.JiaZhengService.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.platform.JiaZhengService.common.pojo.Principal;
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

}
