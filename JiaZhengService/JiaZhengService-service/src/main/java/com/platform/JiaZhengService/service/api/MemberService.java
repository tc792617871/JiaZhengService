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

	/**
	 * 判断mobile是否唯一
	 * 
	 * @param mobile
	 * @return
	 */
	boolean mobileUnique(String mobile);

	/**
	 * 判断用户名是否禁用
	 * 
	 * @param username
	 *            用户名(忽略大小写)
	 * @return 用户名是否禁用
	 */
	boolean usernameDisabled(String username);

	/**
	 * 判断用户名是否存在
	 * 
	 * @param username
	 *            用户名(忽略大小写)
	 * @return 用户名是否存在
	 */
	boolean usernameExists(String username);

	/**
	 * 新增会员
	 * 
	 * @param member
	 * @return
	 */
	boolean addMember(TMember member);

}
