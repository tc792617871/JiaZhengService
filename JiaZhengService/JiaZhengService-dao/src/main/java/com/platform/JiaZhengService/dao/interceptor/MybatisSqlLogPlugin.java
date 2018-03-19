package com.platform.JiaZhengService.dao.interceptor;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.type.TypeHandlerRegistry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @ClassName: MybatisSqlLogPlugin
 * @Description: mybatis执行语句打印插件
 */
@Intercepts({
		@Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class,
				RowBounds.class, ResultHandler.class }),
		@Signature(type = Executor.class, method = "update", args = { MappedStatement.class, Object.class }) })
public class MybatisSqlLogPlugin implements Interceptor {

	/**
	 * @Fields LOGGER : 日志操作类
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(MybatisSqlLogPlugin.class);

	private static final DateFormat FORMAT = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
		Object parameter = null;
		if (invocation.getArgs().length > 1) {
			parameter = invocation.getArgs()[1];
		}
		String sqlId = mappedStatement.getId();
		BoundSql boundSql = mappedStatement.getBoundSql(parameter);
		Configuration configuration = mappedStatement.getConfiguration();
		Object returnValue = null;
		long start = System.currentTimeMillis();
		try {
			returnValue = invocation.proceed();
		} catch (Exception e) {
			LOGGER.error("异常", e);
			String sql = getSql(configuration, boundSql, sqlId, 0);
			LOGGER.error("执行异常SQL: " + sql);
			throw e;
		}
		long end = System.currentTimeMillis();
		long time = (end - start);
		String sql = getSql(configuration, boundSql, sqlId, time);
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("执行SQL：" + sql);
		}
		return returnValue;
	}

	public static String getSql(Configuration configuration, BoundSql boundSql, String sqlId, long time) {
		String sql = showSql(configuration, boundSql);
		StringBuilder str = new StringBuilder(100);
		str.append(sqlId);
		str.append(":");
		str.append(sql);
		if (time > 0) {
			str.append(":");
			str.append(time);
			str.append("ms");
		}
		return str.toString();
	}

	private static String getParameterValue(Object obj) {
		String value = null;
		if (obj instanceof String) {
			value = "'" + obj.toString().replaceAll("'", "''") + "'";
		} else if (obj instanceof Date) {
			// DateFormat formatter =
			// DateFormat.getDateTimeInstance(DateFormat.DEFAULT,
			// DateFormat.DEFAULT, Locale.CHINA);
			value = "str_to_date('" + FORMAT.format((Date) obj) + "','%Y-%m-%d %H:%i:%s')";
		} else {
			if (null != obj) {
				value = obj.toString();
			} else {
				value = "null";
			}
		}
		return value;
	}

	public static String showSql(Configuration configuration, BoundSql boundSql) {
		Object parameterObject = boundSql.getParameterObject();
		List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
		String sql = boundSql.getSql().replaceAll("[\\s]+", " ");
		if (null != parameterMappings && !parameterMappings.isEmpty()) {
			TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
			if (typeHandlerRegistry.hasTypeHandler(parameterObject.getClass())) {
				sql = sql.replaceFirst("\\?", getParameterValue(parameterObject));
			} else {
				MetaObject metaObject = configuration.newMetaObject(parameterObject);

				for (ParameterMapping parameterMapping : parameterMappings) {
					String propertyName = parameterMapping.getProperty();
					if (metaObject.hasGetter(propertyName)) {
						Object obj = metaObject.getValue(propertyName);
						sql = sql.replaceFirst("\\?", getParameterValue(obj));
					} else if (boundSql.hasAdditionalParameter(propertyName)) {
						Object obj = boundSql.getAdditionalParameter(propertyName);
						sql = sql.replaceFirst("\\?", getParameterValue(obj));
					}
				}
			}
		}
		return sql;

	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);

	}

	@Override
	public void setProperties(Properties properties) {

	}

}
