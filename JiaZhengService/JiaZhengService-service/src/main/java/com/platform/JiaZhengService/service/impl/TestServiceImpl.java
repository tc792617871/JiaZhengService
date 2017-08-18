package com.platform.JiaZhengService.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TUser;
import com.platform.JiaZhengService.dao.mapper.TUserMapper;
import com.platform.JiaZhengService.service.api.TestService;

@Service("testServiceImpl")
public class TestServiceImpl extends BaseServiceImpl implements TestService {

	@Resource
	private TUserMapper userMapper;

	@Override
	public List<TUser> getUsers(Criteria c) {
		return userMapper.selectByExample(c);
	}

}
