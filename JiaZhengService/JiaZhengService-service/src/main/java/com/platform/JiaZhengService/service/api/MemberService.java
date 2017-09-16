package com.platform.JiaZhengService.service.api;

import com.platform.JiaZhengService.dao.entity.TMember;

/**
 * 会员-memberService
 *
 */
public interface MemberService extends BaseService {

	/**
	 * 获取当前登录会员
	 * 
	 * @return 当前登录会员，若不存在则返回null
	 */
	TMember getCurrent();

}
