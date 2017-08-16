package com.platform.JiaZhengService.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TUser;
import com.platform.JiaZhengService.dao.mapper.TUserMapper;
import com.platform.JiaZhengService.service.api.ITestService;

@Service("testServiceImpl")
public class TestServiceImpl extends BaseServiceImpl implements ITestService {

	@Autowired
	private TUserMapper userMapper;

	@Override
	public List<TUser> getUsers(Criteria c) {
		return userMapper.selectByExample(c);
	}

}
