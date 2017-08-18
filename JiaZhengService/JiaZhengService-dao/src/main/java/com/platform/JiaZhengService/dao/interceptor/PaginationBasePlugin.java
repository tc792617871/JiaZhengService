package com.platform.JiaZhengService.dao.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.MappedStatement.Builder;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.ParameterMode;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.property.PropertyTokenizer;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.type.TypeHandler;
import org.apache.ibatis.type.TypeHandlerRegistry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.platform.JiaZhengService.dao.Page;
import com.platform.JiaZhengService.dao.PageCondition;
import com.platform.JiaZhengService.dao.PageHolder;

/**
 * @ClassName: PaginationBasePlugin
 * @Description: 分页排序插件
 *
 */
@Intercepts({ @Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class,
		RowBounds.class, ResultHandler.class }) })
public abstract class PaginationBasePlugin implements Interceptor {

	private static final Logger log = LoggerFactory.getLogger(PaginationBasePlugin.class);
	/**
	 * @Fields INDEX_MAPPED_STATEMENT : mappStatement参数位置
	 */
	static int INDEX_MAPPED_STATEMENT = 0;
	/**
	 * @Fields INDEX_PARAMETER : 入参对象参数位置
	 */
	static int INDEX_PARAMETER = 1;
	/**
	 * @Fields INDEX_ROW_BOUNDS : 记录获取数参数位置
	 */
	static int INDEX_ROW_BOUNDS = 2;
	/**
	 * @Fields INDEX_RESULT_HANDLER : 结果集处理参数位置
	 */
	static int INDEX_RESULT_HANDLER = 3;

	@SuppressWarnings("unchecked")
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		log.info("进入sql分页拦截器.....");
		final MappedStatement mappedStatement = this.getMappedStatement(invocation);
		final Object parameter = this.getParameter(invocation);
		final RowBounds rowBounds = getRowBounds(invocation);
		BoundSql boundSql = mappedStatement.getBoundSql(parameter);
		// Object[] queryArgs = invocation.getArgs();
		// MappedStatement ms = (MappedStatement) queryArgs[0];
		// BoundSql boundSql = ms.getBoundSql(queryArgs[1]);
		String sql = boundSql.getSql().trim();
		// Object args = queryArgs[1];

		// 分析是否含有分页参数，如果没有则不是分页查询
		// 注意：在多参数的情况下，只处理第一个分页参数
		PageCondition condition = null;
		if (parameter instanceof PageCondition) { // 只有一个参数的情况
			condition = (PageCondition) parameter;
		} else if (parameter instanceof Map) { // 多参数的情况，找到第一个Criteria的参数
			for (Map.Entry<Object, Object> e : ((Map<Object, Object>) parameter).entrySet()) {
				if (e.getValue() instanceof PageCondition) {
					condition = (PageCondition) e.getValue();
					break;
				}
			}
		}
		Page page = null;
		if (rowBounds.getLimit() == RowBounds.NO_ROW_LIMIT) {
			// 如果基本查询条件为null，则略过继续执行
			if (condition == null) {
				return invocation.proceed();
			} else {
				page = condition.getPage();

				// 如果order by参数不为空，则需要排序后，再分页
				sql = orderbySql(sql, condition.getOrderByClause());
			}
		} else {// 如果传入了RowBounds对象，设置RowBounds信息到Page对象中
			page = new Page(rowBounds.getOffset(), rowBounds.getLimit());
		}

		// 如果分页参数不为空，则需要计算记录总数
		if (page != null && page.isNeedCount()) {
			Connection connection = mappedStatement.getConfiguration().getEnvironment().getDataSource().getConnection();
			int totalCount = getTotalCount(sql, connection, mappedStatement, parameter, boundSql);
			page.setCount(totalCount);
			PageHolder.setPage(page);
		}

		// 如果page不为空，则生成分页sql
		if (page != null) {
			sql = paginationSql(sql, page); // 通过子类实现
		}
		this.setMappedStatement(invocation, this.buildMappedStatement(mappedStatement, boundSql, sql));
		this.setRowBounds(invocation, RowBounds.DEFAULT);
		return invocation.proceed();
	}

	/**
	 * get all count peple search
	 * 
	 * @param sql
	 * @param connection
	 * @param statement
	 * @param parameterObj
	 * @param boundSql
	 * @return
	 * @throws SQLException
	 */
	public int getTotalCount(final String sql, final Connection connection, final MappedStatement statement,
			final Object parameterObj, final BoundSql boundSql) throws SQLException {

		// final String totalCountSql = totalCountSql(sql);

		PreparedStatement pStatement = null;
		ResultSet rs = null;

		try {
			// pStatement = connection.prepareStatement(totalCountSql);

			pStatement = connection.prepareStatement(sql);

			// setParameters(pStatement, this.buildMappedStatement(statement,
			// boundSql, totalCountSql), boundSql, parameterObj);
			setParameters(pStatement, this.buildMappedStatement(statement, boundSql, sql), boundSql, parameterObj);
			long start = System.currentTimeMillis();
			rs = pStatement.executeQuery();
			long time = System.currentTimeMillis() - start;
			log.info("分页语句执行耗时(ms): " + time);
			// if (rs.next()) {
			// return rs.getInt(1);
			// }
			if (rs.last()) {
				return rs.getRow();
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			freeResource(rs, pStatement);
			if (connection != null) {
				connection.close();
			}
		}

		return 0;
	}

	/**
	 * 对SQL参数(?)设值,参考org.apache.ibatis.executor.parameter.
	 * DefaultParameterHandler
	 * 
	 * @param ps
	 * @param mappedStatement
	 * @param boundSql
	 * @param parameterObject
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	private void setParameters(PreparedStatement ps, MappedStatement mappedStatement, BoundSql boundSql,
			Object parameterObject) throws SQLException {
		ErrorContext.instance().activity("setting parameters").object(mappedStatement.getParameterMap().getId());
		List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
		if (parameterMappings != null) {
			Configuration configuration = mappedStatement.getConfiguration();
			TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
			MetaObject metaObject = parameterObject == null ? null : configuration.newMetaObject(parameterObject);
			for (int i = 0; i < parameterMappings.size(); i++) {
				ParameterMapping parameterMapping = parameterMappings.get(i);
				if (parameterMapping.getMode() != ParameterMode.OUT) {
					Object value;
					String propertyName = parameterMapping.getProperty();
					PropertyTokenizer prop = new PropertyTokenizer(propertyName);
					if (parameterObject == null) {
						value = null;
					} else if (typeHandlerRegistry.hasTypeHandler(parameterObject.getClass())) {
						value = parameterObject;
					} else if (boundSql.hasAdditionalParameter(propertyName)) {
						value = boundSql.getAdditionalParameter(propertyName);
					} else if (propertyName.startsWith(ForEachSqlNode.ITEM_PREFIX)
							&& boundSql.hasAdditionalParameter(prop.getName())) {
						value = boundSql.getAdditionalParameter(prop.getName());
						if (value != null) {
							value = configuration.newMetaObject(value)
									.getValue(propertyName.substring(prop.getName().length()));
						}
					} else {
						value = metaObject == null ? null : metaObject.getValue(propertyName);
					}
					@SuppressWarnings("rawtypes")
					TypeHandler typeHandler = parameterMapping.getTypeHandler();
					if (typeHandler == null) {
						throw new ExecutorException("There was no TypeHandler found for parameter " + propertyName
								+ " of statement " + mappedStatement.getId());
					}
					typeHandler.setParameter(ps, i + 1, value, parameterMapping.getJdbcType());
				}
			}
		}
	}

	/**
	 * @Title: paginationSql
	 * @Description: 子类实现分页sql处理
	 * @param sql
	 *            原始sql
	 * @param page
	 *            分页参数
	 * @return 分页处理后的sql
	 */
	protected abstract String paginationSql(String sql, Page page); // 子类实现

	/**
	 * @Title: orderbySql
	 * @Description: 子类实现排序sql处理
	 * @param sql
	 *            原始sql
	 * @param orderByClause
	 *            排序参数
	 * @return 排序处理后的sql
	 */
	protected abstract String orderbySql(String sql, String orderByClause); // 子类实现

	/**
	 * @Title: totalCountSql
	 * @Description: 子类实现总数统计sql处理
	 * @param sql
	 *            原始sql
	 * @return 分页处理后的sql
	 */
	protected abstract String totalCountSql(String sql); // 子类实现

	/**
	 * @Title: buildMappedStatement
	 * @Description: 生成新的mappedStatement
	 * @param ms
	 *            原始ms
	 * @param boundSql
	 *            原始boundsql
	 * @param sql
	 *            分页最终sql
	 * @return 新的mappedStatement
	 */
	private MappedStatement buildMappedStatement(MappedStatement ms, BoundSql boundSql, String sql) {
		Builder builder = new Builder(ms.getConfiguration(), ms.getId(), new BoundSqlSqlSource(ms, boundSql, sql),
				ms.getSqlCommandType());

		builder.resource(ms.getResource());
		builder.parameterMap(ms.getParameterMap());
		builder.resultMaps(ms.getResultMaps());
		builder.fetchSize(ms.getFetchSize());
		builder.timeout(ms.getTimeout());
		builder.statementType(ms.getStatementType());
		builder.resultSetType(ms.getResultSetType());
		builder.cache(ms.getCache());
		builder.flushCacheRequired(ms.isFlushCacheRequired());
		builder.useCache(ms.isUseCache());
		builder.keyGenerator(ms.getKeyGenerator());
		builder.keyProperty(delimitedArraytoString(ms.getKeyProperties()));
		builder.keyColumn(delimitedArraytoString(ms.getKeyColumns()));
		builder.databaseId(ms.getDatabaseId());

		return builder.build();
	}

	/**
	 * @Title: getMappedStatement
	 * @Description: 获取 MappedStatement
	 * @param invocation
	 *            调用
	 * @return MappedStatement
	 */
	private MappedStatement getMappedStatement(Invocation invocation) {
		return (MappedStatement) invocation.getArgs()[INDEX_MAPPED_STATEMENT];
	}

	/**
	 * @Title: setMappedStatement
	 * @Description: 设置MappedStatement
	 * @param invocation
	 *            调用
	 * @param mappedStatement
	 *            新的MappedStatement
	 */
	private void setMappedStatement(Invocation invocation, MappedStatement mappedStatement) {
		invocation.getArgs()[INDEX_MAPPED_STATEMENT] = mappedStatement;
	}

	/**
	 * @Title: getParameter
	 * @Description: 获取sql入参
	 * @param invocation
	 *            调用
	 * @return sql入参
	 */
	private Object getParameter(Invocation invocation) {
		return invocation.getArgs()[INDEX_PARAMETER];
	}

	/**
	 * @Title: getRowBounds
	 * @Description: 获取行数
	 * @param invocation
	 *            调用
	 * @return 行数范围
	 */
	private RowBounds getRowBounds(Invocation invocation) {
		return (RowBounds) invocation.getArgs()[INDEX_ROW_BOUNDS];
	}

	/**
	 * @Title: setRowBounds
	 * @Description: 设置行数范围
	 * @param invocation
	 *            调用
	 * @param rowBounds
	 *            行数范围
	 */
	private void setRowBounds(Invocation invocation, RowBounds rowBounds) {
		invocation.getArgs()[INDEX_ROW_BOUNDS] = rowBounds;
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	/**
	 * @Title: delimitedArraytoString
	 * @Description: 将参数转string
	 * @param in
	 *            properties
	 * @return keyProperty
	 */
	private static String delimitedArraytoString(String[] in) {
		if (in == null || in.length == 0) {
			return null;
		} else {
			StringBuffer answer = new StringBuffer();
			for (String str : in) {
				answer.append(str).append(",");
			}
			return answer.toString();
		}
	}

	/**
	 * @ClassName: BoundSqlSqlSource
	 * @Description: boundsql处理类
	 */
	public static class BoundSqlSqlSource implements SqlSource {

		/**
		 * @Fields boundSql : 新boundsql
		 */
		private final BoundSql boundSql;

		/**
		 * Title: 构造函数 Description:根据新的ms和boundsql生成sqlsource
		 * 
		 * @param ms
		 *            新的ms
		 * @param boundSql
		 *            新的boundsql
		 * @param sql
		 *            执行sql
		 */
		public BoundSqlSqlSource(MappedStatement ms, BoundSql boundSql, String sql) {
			this.boundSql = buildBoundSql(ms, boundSql, sql);
		}

		@Override
		public BoundSql getBoundSql(Object parameterObject) {
			return boundSql;
		}

		/**
		 * @Title: buildBoundSql
		 * @Description: 入参处理
		 * @param ms
		 *            新的ms
		 * @param boundSql
		 *            新的boundsql
		 * @param sql
		 *            执行sql
		 * @return 最终boundsql
		 */
		private BoundSql buildBoundSql(MappedStatement ms, BoundSql boundSql, String sql) {
			BoundSql newBoundSql = new BoundSql(ms.getConfiguration(), sql, boundSql.getParameterMappings(),
					boundSql.getParameterObject());
			for (ParameterMapping mapping : boundSql.getParameterMappings()) {
				String prop = mapping.getProperty();
				if (boundSql.hasAdditionalParameter(prop)) {
					newBoundSql.setAdditionalParameter(prop, boundSql.getAdditionalParameter(prop));
				}
			}
			return newBoundSql;
		}
	}

	@Override
	public void setProperties(Properties properties) {
		// String dialectClass = properties.getProperty("dialect");
		// try {
		// dialect = (Dialect) Class.forName(dialectClass).newInstance();
		// } catch (Exception e) {
		// throw new MyBatisShardsException("Can not create dialect instance by
		// dialect:"
		// + dialectClass, e);
		// }
	}

	/**
	 * free the database resource
	 * 
	 * @param rs
	 * @param ps
	 */
	public static void freeResource(ResultSet rs, PreparedStatement ps) {

		try {
			if (null != rs) {
				rs.close();
				rs = null;
			}
			if (null != ps) {
				ps.close();
				ps = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
