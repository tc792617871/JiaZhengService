package com.platform.JiaZhengService.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TUser;
import com.platform.JiaZhengService.dao.mapper.TUserMapper;
import com.platform.JiaZhengService.service.api.TestService;

@Service("testServiceImpl")
public class TestServiceImpl extends BaseServiceImpl implements TestService {

	@Resource
	private TUserMapper userMapper;

	@Resource(name = "transactionManager")
	private DataSourceTransactionManager transactionManager;

	@Override
	public List<TUser> getUsers(Criteria c) {
		return userMapper.selectByExample(c);
	}

	@Override
	public void insertUser() {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW); // 事物隔离级别，开启新事务，这样会比较安全些。
		TransactionStatus status = transactionManager.getTransaction(def); // 获得事务状态
		try {
			TUser user = new TUser();
			user.setUserid(1000L);
			user.setAge(1);
			user.setPassword("111");
			user.setUsername("111");
			userMapper.insert(user);
			System.out.println(1 / 0);
			transactionManager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
			transactionManager.rollback(status);
		}

	}

}
