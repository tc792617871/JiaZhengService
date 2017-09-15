package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TUser;

public interface TestService extends BaseService {

	List<TUser> getUsers(Criteria c);

	void insertUser();

}
