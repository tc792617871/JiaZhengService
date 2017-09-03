package com.platform.JiaZhengService.service.api;

import java.util.List;
import java.util.Set;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TAdmin;
import com.platform.JiaZhengService.dao.entity.TRole;

/**
 * Service - 管理员
 */
public interface AdminService extends BaseService {

	/**
	 * 判断用户名是否存在
	 * 
	 * @param username
	 *            用户名(忽略大小写)
	 * @return 用户名是否存在
	 */
	boolean usernameExists(String username);

	/**
	 * 根据用户名查找管理员
	 * 
	 * @param username
	 *            用户名(忽略大小写)
	 * @return 管理员，若不存在则返回null
	 */
	TAdmin findByUsername(String username);

	/**
	 * 根据ID查找权限
	 * 
	 * @param id
	 *            ID
	 * @return 权限,若不存在则返回null
	 */
	List<String> findAuthorities(Long id);

	/**
	 * 判断管理员是否登录
	 * 
	 * @return 管理员是否登录
	 */
	boolean isAuthenticated();

	/**
	 * 获取当前登录管理员
	 * 
	 * @return 当前登录管理员,若不存在则返回null
	 */
	TAdmin getCurrent();

	/**
	 * 获取当前登录用户名
	 * 
	 * @return 当前登录用户名,若不存在则返回null
	 */
	String getCurrentUsername();

	/**
	 * 更新管理员
	 * 
	 * @param admin
	 * @return
	 */
	TAdmin update(TAdmin admin);

	/**
	 * 保存管理员
	 * 
	 * @param admin
	 */
	void save(TAdmin admin);

	/**
	 * 根据ID获取管理员
	 * 
	 * @param id
	 * @return
	 */
	TAdmin find(Long id);

	/**
	 * 获取当前管理员数量
	 * 
	 * @return
	 */
	int count();

	/**
	 * 批量删除管理员
	 * 
	 * @param ids
	 */
	void delete(Long[] ids);

	/**
	 * 查询管理员列表
	 * 
	 * @param c
	 * @return
	 */
	List<TAdmin> queryAdminList(Criteria c);

	/**
	 * 查找管理角色列表
	 * 
	 * @param id
	 * @return
	 */
	Set<TRole> findRolesByAdminID(Long id);

}