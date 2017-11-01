package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.common.pojo.LogConfig;

public interface LogConfigService extends BaseService {
	/**
	 * 获取所有日志配置
	 * 
	 * @return 所有日志配置
	 */
	List<LogConfig> getAll();
}
