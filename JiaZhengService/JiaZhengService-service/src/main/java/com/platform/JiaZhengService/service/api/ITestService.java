package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TUser;

public interface ITestService extends IBaseService {

	List<TUser> getUsers(Criteria c);

}
