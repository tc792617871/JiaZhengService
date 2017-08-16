package com.platform.JiaZhengService.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

/**
 * @ClassName: Criteria
 * @Description: 通用dao条件类
 */
public class Criteria extends PageCondition {

	private static final long serialVersionUID = -1539561086698123519L;

	/**
	 * @Fields attrs : 额外的键值对参数，不建议使用，请注意mybatis的sql写法，将sql入参写成方法的入参，这样dao的api可查
	 */
	@Deprecated
	public Map<String, Object> attrs;

	/**
	 * getAttrs
	 * 
	 * @return
	 */
	public Map<String, Object> getAttrs() {
		return attrs;
	}

	/**
	 * setAttrs
	 * 
	 * @param attrs
	 */
	public void setAttrs(Map<String, Object> attrs) {
		this.attrs = attrs;
	}

	/**
	 * @Fields distinct : 是否要distinct
	 */
	protected boolean distinct;

	/**
	 * @Fields locale : 国际化标识 zh_CN,或en等
	 */
	protected String locale;

	/**
	 * @Fields oredCriteria : 查询条件对象的组合链
	 */
	protected List<Condition> oredCriteria;

	/**
	 * <p>
	 * Title: 构造类
	 * </p>
	 * <p>
	 * Description: 新建构造条件类
	 * </p>
	 */
	public Criteria() {
		super();
		oredCriteria = new ArrayList<>();
		attrs = new HashMap<>();
	}

	/**
	 * <p>
	 * Title: 构造函数
	 * </p>
	 * <p>
	 * Description: 带分页构造函数，tapetry分页grid用
	 * </p>
	 * 
	 * @param page
	 *            分页参选
	 */
	public Criteria(final Page page) {
		super(page);
		oredCriteria = new ArrayList<>();
		attrs = new HashMap<>();
	}

	/**
	 * @Title: getLocale
	 * @Description: 获取当前国际化语言类型
	 * @return 国际化语言
	 */
	public String getLocale() {
		return locale;
	}

	/**
	 * @Title: setLocale
	 * @Description: 设置国际化语言
	 * @param locale
	 *            zh_CN,en等国际化语言
	 */
	public void setLocale(final String locale) {
		this.locale = locale;
	}

	/**
	 * @Title: setDistinct
	 * @Description: 是否需要结果排重
	 * @param distinct
	 *            是否排重
	 */
	public void setDistinct(final boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * @Title: isDistinct
	 * @Description: 查询结果是否排重
	 * @return 是否排重
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * @Title: getOredCriteria
	 * @Description: 获取查询条件对象列表
	 * @return 查询条件列表
	 */
	public List<Condition> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * @Title: or
	 * @Description: or 并行下一个查询条件对象
	 * @param condition
	 *            查询条件组
	 */
	public void or(final Condition condition) {
		oredCriteria.add(condition);
	}

	/**
	 * @Title: or
	 * @Description: 返回一个新的or后面的查询条件对象
	 * @return 返回 or后的新查询条件对象
	 */
	public Condition or() {
		final Condition condition = createConditionInternal();
		oredCriteria.add(condition);
		return condition;
	}

	/**
	 * @Title: createConditon
	 * @Description: 创建查询条件对象
	 * @return 一个新的查询条件对象
	 */
	public Condition createConditon() {
		final Condition condition = createConditionInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(condition);
		}
		return condition;
	}

	/**
	 * @Title: createConditionInternal
	 * @Description: 创建一个查询条件对象
	 * @return 新建的查询条件对象
	 */
	protected Condition createConditionInternal() {
		final Condition condition = new Condition();
		return condition;
	}

	/**
	 * @Title: clear
	 * @Description: 重置查询条件类
	 */
	@Override
	public void clear() {
		super.clear();
		oredCriteria.clear();
		attrs.clear();
		distinct = false;
		locale = null;
	}

	/**
	 * @ClassName: Condition
	 * @Description: 查询条件对象类
	 * @author linyl linyuliang.85@gmail.com
	 */
	public static class Condition {
		/**
		 * @Fields LIKE : sql语句中的like
		 */
		private static final String LIKE = " like";
		/**
		 * @Fields " not like" : sql语句中的not like
		 */
		private static final String NOT_LIKE = " not like";

		/**
		 * @Fields ANY_MATCH : sql语句中的%号通配符
		 */
		private static final String ANY_MATCH = "%";

		/**
		 * @Fields UPPER_LEFT : sql语句中大写化方法左边
		 */
		private static final String UPPER_LEFT = "upper(";

		/**
		 * @Fields UPPER_RIGHT: sql语句中大写化方法右边
		 */
		private static final String UPPER_RIGHT = ") like";

		/**
		 * @Fields criterions : 原子查询条件
		 */
		protected List<Criterion> criterions = new ArrayList<Criterion>();

		/**
		 * @Title: isValid
		 * @Description: 查询条件对象是否有效，仅该查询条件对象包含原子查询条件时，有效
		 * @return 当前查询条件对象是否有效
		 */
		public boolean isValid() {
			return criterions.size() > 0;
		}

		/**
		 * @Title: getCriterions
		 * @Description: 返回原子查询条件列表
		 * @return 原子查询条件列表
		 */
		public List<Criterion> getCriterions() {
			return criterions;
		}

		/**
		 * @Title: addCriterion
		 * @Description: 增加一个原子查询条件
		 * @param condition
		 *            原子查询条件
		 */
		protected void addCriterion(final String condition) {
			if (condition == null) {
				// throw new
				// RuntimeException("Value for condition cannot be null");
				return;
			}
			criterions.add(new Criterion(condition));
		}

		/**
		 * @Title: addCriterion
		 * @Description: 包含一个值的原子查询条件
		 * @param condition
		 *            原子查询条件
		 * @param value
		 *            值
		 * @param property
		 *            字段名
		 */
		protected void addCriterion(final String condition, final Object value, final String property) {
			if (value == null) {
				// throw new RuntimeException("Value for " + property +
				// " cannot be null");
				return;
			}
			criterions.add(new Criterion(condition, value));
		}

		/**
		 * @Title: addCriterion
		 * @Description: 包含两个值的原子查询条件
		 * @param condition
		 *            原子查询条件
		 * @param value1
		 *            值1
		 * @param value2
		 *            值2
		 * @param property
		 *            字段名
		 */
		protected void addCriterion(final String condition, final Object value1, final Object value2,
				final String property) {
			if (value1 == null || value2 == null) {
				// throw new RuntimeException("Between values for " + property +
				// " cannot be null");
				return;
			}
			criterions.add(new Criterion(condition, value1, value2));
		}

		/**
		 * @Title: andIsNull
		 * @Description: and 某个字段名为null的条件
		 * @param columnName
		 *            字段名
		 * @return 增加条件后的条件类对象
		 */
		public Condition andIsNull(final String columnName) {
			addCriterion(columnName + " is null");
			return this;
		}

		/**
		 * @Title: andIsNotNull
		 * @Description: and 某个字段名不为null的条件
		 * @param columnName
		 *            字段名
		 * @return 增加条件后的条件类对象
		 */
		public Condition andIsNotNull(final String columnName) {
			addCriterion(columnName + " is not null");
			return this;
		}

		/**
		 * @Title: andEqualTo
		 * @Description: and某个字段指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andEqualTo(final String columnName, final Object value) {
			addCriterion(columnName + " =", value, columnName);
			return this;
		}

		/**
		 * @Title: andNotEqualTo
		 * @Description: and某个字段非指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andNotEqualTo(final String columnName, final Object value) {
			addCriterion(columnName + " <>", value, columnName);
			return this;
		}

		/**
		 * @Title: andGreaterThan
		 * @Description: and某个字段大于指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andGreaterThan(final String columnName, final Object value) {
			addCriterion(columnName + " >", value, columnName);
			return this;
		}

		/**
		 * @Title: andGreaterThanOrEqualTo
		 * @Description: and某个字段大于等于指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andGreaterThanOrEqualTo(final String columnName, final Object value) {
			addCriterion(columnName + " >=", value, columnName);
			return this;
		}

		/**
		 * @Title: andLessThan
		 * @Description: and某个字段小于指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andLessThan(final String columnName, final Object value) {
			addCriterion(columnName + " <", value, columnName);
			return this;
		}

		/**
		 * @Title: andLessThanOrEqualTo
		 * @Description: and某个字段小于等于指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andLessThanOrEqualTo(final String columnName, final Object value) {
			addCriterion(columnName + " <=", value, columnName);
			return this;
		}

		/**
		 * @Title: andBetween
		 * @Description: and 某个字段在v1和v2的范围内
		 * @param columnName
		 *            字段名
		 * @param value1
		 *            值1
		 * @param value2
		 *            值2
		 * @return 增加条件后的条件类对象
		 */
		public Condition andBetween(final String columnName, final Object value1, final Object value2) {
			addCriterion(columnName + " between", value1, value2, columnName);
			return this;
		}

		/**
		 * @Title: andNotBetween
		 * @Description: and 某个字段不在v1和v2的范围内
		 * @param columnName
		 *            字段名
		 * @param value1
		 *            值1
		 * @param value2
		 *            值2
		 * @return 增加条件后的条件类对象
		 */
		public Condition andNotBetween(final String columnName, final Object value1, final Object value2) {
			addCriterion(columnName + " not between", value1, value2, columnName);
			return this;
		}

		/**
		 * @Title: andIn
		 * @Description: and 某个字段在列表中
		 * @param columnName
		 *            字段名
		 * @param values
		 *            列表
		 * @return 增加条件后的条件类对象
		 */
		public Condition andIn(final String columnName, final List<Object> values) {
			if (values != null && values.size() > 0) {
				addCriterion(columnName + " in", values, columnName);
			} else {
				addCriterion("1 != 1");
			}
			return this;
		}

		/**
		 * @Title: andNotIn
		 * @Description: and 某个字段不在列表中
		 * @param columnName
		 *            字段名
		 * @param values
		 *            列表
		 * @return 增加条件后的条件类对象
		 */
		public Condition andNotIn(final String columnName, final List<Object> values) {
			if (values != null && values.size() > 0) {
				addCriterion(columnName + " not in", values, columnName);
			}
			return this;
		}

		/**
		 * @Title: andLeftLike
		 * @Description: and 某字段左边匹配
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andLeftLike(final String columnName, final String value) {
			if (StringUtils.isNotBlank(value)) {
				addCriterion(columnName + LIKE, value + ANY_MATCH, columnName);
			}
			return this;
		}

		/**
		 * @Title: andRightLike
		 * @Description: and 某字段右边匹配
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andRightLike(final String columnName, final String value) {
			if (StringUtils.isNotBlank(value)) {
				addCriterion(columnName + LIKE, ANY_MATCH + value, columnName);
			}
			return this;
		}

		/**
		 * @Title: andLike
		 * @Description: and 某字段任意包含指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andLike(final String columnName, final String value) {
			if (StringUtils.isNotBlank(value)) {
				addCriterion(columnName + LIKE, ANY_MATCH + value + ANY_MATCH, columnName);
			}
			return this;
		}

		/**
		 * @Title: andLeftNotLike
		 * @Description: and 某字段左边不以 指定值开始
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andLeftNotLike(final String columnName, final String value) {
			if (StringUtils.isNotBlank(value)) {
				addCriterion(columnName + NOT_LIKE, value + ANY_MATCH, columnName);
			}
			return this;
		}

		/**
		 * @Title: andLeftNotLike
		 * @Description: and 某字段右边不以 指定值结束
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andRightNotLike(final String columnName, final String value) {
			if (StringUtils.isNotBlank(value)) {
				addCriterion(columnName + NOT_LIKE, ANY_MATCH + value, columnName);
			}
			return this;
		}

		/**
		 * @Title: andNotLike
		 * @Description: and 某字段不包含指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andNotLike(final String columnName, final String value) {
			if (StringUtils.isNotBlank(value)) {
				addCriterion(columnName + NOT_LIKE, ANY_MATCH + value + ANY_MATCH, columnName);
			}
			return this;
		}

		/**
		 * @Title: andLikeInsensitive
		 * @Description: and 某字段不区分大小写包含指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andLikeInsensitive(final String columnName, final String value) {
			if (StringUtils.isNotBlank(value)) {
				addCriterion(UPPER_LEFT + columnName + UPPER_RIGHT,
						value == null ? null : ANY_MATCH + value.toUpperCase() + ANY_MATCH, columnName);
			}
			return this;
		}

		/**
		 * @Title: andLeftLikeInsensitive
		 * @Description: and 某字段左边不区分大小写匹配指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andLeftLikeInsensitive(final String columnName, final String value) {
			if (StringUtils.isNotBlank(value)) {
				addCriterion(UPPER_LEFT + columnName + UPPER_RIGHT,
						value == null ? null : value.toUpperCase() + ANY_MATCH, columnName);
			}
			return this;
		}

		/**
		 * @Title: andRightLikeInsensitive
		 * @Description: and 某字段右边不区分大小写匹配指定值
		 * @param columnName
		 *            字段名
		 * @param value
		 *            值
		 * @return 增加条件后的条件类对象
		 */
		public Condition andRightLikeInsensitive(final String columnName, final String value) {
			if (StringUtils.isNotBlank(value)) {
				addCriterion(UPPER_LEFT + columnName + UPPER_RIGHT,
						value == null ? null : ANY_MATCH + value.toUpperCase(), columnName);
			}
			return this;
		}
	}

	/**
	 * @ClassName: Criterion
	 * @Description: 原子条件类
	 * @author linyl linyuliang.85@gmail.com
	 */
	public static class Criterion {
		/**
		 * @Fields condition : 判断条件
		 */
		private final String condition;

		/**
		 * @Fields value :第一个参数值
		 */
		private Object value;

		/**
		 * @Fields secondValue : 第2个参数值
		 */
		private Object secondValue;

		/**
		 * @Fields noValue : 无需参数
		 */
		private boolean noValue;

		/**
		 * @Fields singleValue :只有一个参数
		 */
		private boolean singleValue;

		/**
		 * @Fields betweenValue : 是否是between两个参数
		 */
		private boolean betweenValue;

		/**
		 * @Fields listValue : 是否参数是列表值
		 */
		private boolean listValue;

		/**
		 * @Fields dateValue : 是否参数是日期类型
		 */
		private boolean dateValue;

		/**
		 * @Fields typeHandler : 类型转换处理
		 */
		private final String typeHandler;

		/**
		 * <p>
		 * Title: 没有参数的原子条件类构造
		 * </p>
		 * <p>
		 * Description: 只有一个条件
		 * </p>
		 * 
		 * @param condition
		 *            条件
		 */
		protected Criterion(final String condition) {
			super();
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		/**
		 * <p>
		 * Title: 有一个参数的原子条件类构造
		 * </p>
		 * <p>
		 * Description: 包含一个参数的条件
		 * </p>
		 * 
		 * @param condition
		 *            条件
		 * @param value
		 *            参数1
		 * @param typeHandler
		 *            类型转换处理
		 */
		protected Criterion(final String condition, final Object value, final String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List<?>) {
				this.listValue = true;
			} else if (value instanceof Date) {
				this.dateValue = true;
			} else {
				this.singleValue = true;
			}
		}

		/**
		 * <p>
		 * Title: 包含一个参数的条件
		 * </p>
		 * <p>
		 * Description: 构造一个不须类型转换的包含一个参数的条件
		 * </p>
		 * 
		 * @param condition
		 *            条件
		 * @param value
		 *            参数值
		 */
		protected Criterion(final String condition, final Object value) {
			this(condition, value, null);
		}

		/**
		 * <p>
		 * Title: 包含两个参数的原子条件类构造
		 * </p>
		 * <p>
		 * Description: 包含两个参数条件和制定类型转换
		 * </p>
		 * 
		 * @param condition
		 *            条件
		 * @param value
		 *            参数1
		 * @param secondValue
		 *            参数2
		 * @param typeHandler
		 *            类型转换
		 */
		protected Criterion(final String condition, final Object value, final Object secondValue,
				final String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		/**
		 * <p>
		 * Title: 包含两个参数的原子条件类构造
		 * </p>
		 * <p>
		 * Description: 包含两个参数条件
		 * </p>
		 * 
		 * @param condition
		 *            条件
		 * @param value
		 *            参数1
		 * @param secondValue
		 *            参数2
		 */
		protected Criterion(final String condition, final Object value, final Object secondValue) {
			this(condition, value, secondValue, null);
		}

		/**
		 * @Title: getCondition
		 * @Description: 获取判断条件
		 * @return 判断条件
		 */
		public String getCondition() {
			return condition;
		}

		/**
		 * @Title: getValue
		 * @Description: 获取第一个参数值
		 * @return 第一个参数值
		 */
		public Object getValue() {
			return value;
		}

		/**
		 * @Title: getSecondValue
		 * @Description: 获取第二个参数值
		 * @return 第二个参数值
		 */
		public Object getSecondValue() {
			return secondValue;
		}

		/**
		 * @Title: isNoValue
		 * @Description: 是否没有参数值
		 * @return 是否没有参数值
		 */
		public boolean isNoValue() {
			return noValue;
		}

		/**
		 * @Title: isSingleValue
		 * @Description: 是否只有一个参数
		 * @return 是否只有一个参数
		 */
		public boolean isSingleValue() {
			return singleValue;
		}

		/**
		 * @Title: isBetweenValue
		 * @Description: 是否between两个参数
		 * @return 是否between两个参数
		 */
		public boolean isBetweenValue() {
			return betweenValue;
		}

		/**
		 * @Title: isListValue
		 * @Description: 是否列表参数
		 * @return 是否列表参数
		 */
		public boolean isListValue() {
			return listValue;
		}

		/**
		 * @Title: isDateValue
		 * @Description: 参数是否日期类型
		 * @return 参数是否日期类型
		 */
		public boolean isDateValue() {
			return dateValue;
		}

		/**
		 * @Title: getTypeHandler
		 * @Description: 类型转换处理
		 * @return 类型转换处理
		 */
		public String getTypeHandler() {
			return typeHandler;
		}
	}
}
