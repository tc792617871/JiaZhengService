package com.platform.JiaZhengService.interceptor;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.platform.JiaZhengService.common.pojo.LogConfig;
import com.platform.JiaZhengService.common.util.JiaZhengServiceUtil;
import com.platform.JiaZhengService.dao.entity.TLog;
import com.platform.JiaZhengService.dao.entity.TLogWithBLOBs;
import com.platform.JiaZhengService.service.api.AdminService;
import com.platform.JiaZhengService.service.api.LogConfigService;
import com.platform.JiaZhengService.service.api.LogService;

/**
 * Interceptor - 日志记录
 */
public class LogInterceptor extends HandlerInterceptorAdapter {

	/** 默认忽略参数 */
	private static final String[] DEFAULT_IGNORE_PARAMETERS = new String[] { "password", "rePassword",
			"currentPassword" };

	/** antPathMatcher */
	private static AntPathMatcher antPathMatcher = new AntPathMatcher();

	/** 忽略参数 */
	private String[] ignoreParameters = DEFAULT_IGNORE_PARAMETERS;

	@Resource(name = "logConfigServiceImpl")
	private LogConfigService logConfigService;
	@Resource(name = "logServiceImpl")
	private LogService logService;
	@Resource(name = "adminServiceImpl")
	private AdminService adminService;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		List<LogConfig> logConfigs = logConfigService.getAll();
		if (logConfigs != null) {
			String path = request.getServletPath();
			for (LogConfig logConfig : logConfigs) {
				if (antPathMatcher.match(logConfig.getUrlPattern(), path)) {
					String username = adminService.getCurrentUsername();
					String operation = logConfig.getOperation();
					String operator = username;
					String content = (String) request.getAttribute(TLog.LOG_CONTENT_ATTRIBUTE_NAME);
					String ip = JiaZhengServiceUtil.getAddr(request);
					request.removeAttribute(TLog.LOG_CONTENT_ATTRIBUTE_NAME);
					StringBuffer parameter = new StringBuffer();
					Map<String, String[]> parameterMap = request.getParameterMap();
					if (parameterMap != null) {
						for (Entry<String, String[]> entry : parameterMap.entrySet()) {
							String parameterName = entry.getKey();
							if (!ArrayUtils.contains(ignoreParameters, parameterName)) {
								String[] parameterValues = entry.getValue();
								if (parameterValues != null) {
									for (String parameterValue : parameterValues) {
										parameter.append(parameterName + " = " + parameterValue + "\n");
									}
								}
							}
						}
					}
					TLogWithBLOBs log = new TLogWithBLOBs();
					log.setOperation(operation);
					log.setOperator(operator);
					log.setContent(content);
					log.setParameter(parameter.toString());
					log.setIp(ip);
					logService.saveLog(log);
					break;
				}
			}
		}
	}

	/**
	 * 设置忽略参数
	 * 
	 * @return 忽略参数
	 */
	public String[] getIgnoreParameters() {
		return ignoreParameters;
	}

	/**
	 * 设置忽略参数
	 * 
	 * @param ignoreParameters
	 *            忽略参数
	 */
	public void setIgnoreParameters(String[] ignoreParameters) {
		this.ignoreParameters = ignoreParameters;
	}

}