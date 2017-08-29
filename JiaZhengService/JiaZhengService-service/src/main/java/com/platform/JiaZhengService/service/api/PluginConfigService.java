package com.platform.JiaZhengService.service.api;

import com.platform.JiaZhengService.dao.entity.TPluginConfig;

/**
 * Service - 插件配置
 * 
 */
public interface PluginConfigService extends BaseService {

	/**
	 * 判断插件ID是否存在
	 * 
	 * @param pluginId
	 *            插件ID
	 * @return 插件ID是否存在
	 */
	boolean pluginIdExists(String pluginId);

	/**
	 * 根据插件ID查找插件配置
	 * 
	 * @param pluginId
	 *            插件ID
	 * @return 插件配置，若不存在则返回null
	 */
	TPluginConfig findByPluginId(String pluginId);

	boolean save(TPluginConfig pluginConfig);

	boolean update(TPluginConfig pluginConfig);

	boolean delete(TPluginConfig pluginConfig);

}