package com.platform.JiaZhengService.Controller.admin;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.platform.JiaZhengService.common.pojo.DateEditor;
import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.common.util.SpringUtils;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.Page;
import com.platform.JiaZhengService.dao.Pageable;
import com.platform.JiaZhengService.template.directive.FlashMessageDirective;

/**
 * 控制器抽象类
 * 
 * @author toncho
 *
 */
public class AbstractController {

	protected final Logger logger = LoggerFactory.getLogger(getClass().getName());

	private static final String PARA_NAME = "name";
	private static final String PARA_VALUE = "value";
	private static final String PARA_START = "iDisplayStart";
	private static final String PARA_LENGTH = "iDisplayLength";
	private static final String PARA_TOTAL = "iTotalRecords";
	private static final String PARA_DISPLAY_TOTAL = "iTotalDisplayRecords";
	private static final String PARA_AODATA = "aaData";

	/** 错误视图 */
	protected static final String ERROR_VIEW = "/admin/common/error";

	/** 错误消息 */
	protected static final Message ERROR_MESSAGE = Message.error("admin.message.error");

	/** 成功消息 */
	protected static final Message SUCCESS_MESSAGE = Message.success("admin.message.success");

	/** "验证结果"参数名称 */
	private static final String CONSTRAINT_VIOLATIONS_ATTRIBUTE_NAME = "constraintViolations";

	@Resource(name = "validator")
	private Validator validator;

	protected Criteria createPaginationCriteria(String aoData) {
		Integer begin = getIntQueryParam(aoData, PARA_START);
		Integer length = getIntQueryParam(aoData, PARA_LENGTH);
		if (begin == null) {
			begin = 0;
		}
		if (length == null) {
			length = 10;
		}
		return new Criteria(new Page(begin, length));
	}

	protected Criteria createPaginationCriteria(Pageable pageable) {
		Integer begin = (pageable.getPageNumber() - 1) * pageable.getPageSize();
		Integer length = pageable.getPageSize();
		Criteria c = new Criteria(new Page(begin, length));
		return c;
	}

	protected JSONArray initialValue(String aoData) {
		JSONArray json = null;
		if (!StringUtils.isEmpty(aoData)) {
			json = JSONObject.parseArray(aoData);
		}
		if (logger.isDebugEnabled()) {
			if (json != null) {
				logger.debug("aoData : " + json.toJSONString());
			}
		}
		return json;
	}

	protected String getQueryParam(String aoData, String key) {
		if (StringUtils.isEmpty(key)) {
			return null;
		}
		JSONArray params = initialValue(aoData);
		if (params != null) {
			for (int i = 0, len = params.size(); i < len; i++) {
				JSONObject json = params.getJSONObject(i);
				if (key.equals(json.getString(PARA_NAME))) {
					return json.getString(PARA_VALUE);
				}
			}
		}
		return null;
	}

	protected Integer getIntQueryParam(String aoData, String key) {
		if (StringUtils.isEmpty(key)) {
			return null;
		}
		JSONArray params = initialValue(aoData);
		if (params != null) {
			for (int i = 0, len = params.size(); i < len; i++) {
				JSONObject json = params.getJSONObject(i);
				if (key.equals(json.getString(PARA_NAME))) {
					return json.getInteger(PARA_VALUE);
				}
			}
		}
		return null;
	}

	protected JSONObject writeJson(long total, List<?> resultList) {
		JSONObject json = new JSONObject();
		JSONObject inner = new JSONObject();
		inner.put(PARA_TOTAL, total);
		inner.put(PARA_DISPLAY_TOTAL, total);
		inner.put(PARA_AODATA, resultList);
		json.put("data", inner);
		json.put("result", true);
		if (logger.isDebugEnabled()) {
			logger.debug("json result -> " + json.toJSONString());
		}
		return json;
	}

	/**
	 * 数据绑定
	 * 
	 * @param binder
	 *            WebDataBinder
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
		binder.registerCustomEditor(Date.class, new DateEditor(true));
	}

	/**
	 * 数据验证
	 * 
	 * @param target
	 *            验证对象
	 * @param groups
	 *            验证组
	 * @return 验证结果
	 */
	protected boolean isValid(Object target, Class<?>... groups) {
		Set<ConstraintViolation<Object>> constraintViolations = validator.validate(target, groups);
		if (constraintViolations.isEmpty()) {
			return true;
		} else {
			RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
			requestAttributes.setAttribute(CONSTRAINT_VIOLATIONS_ATTRIBUTE_NAME, constraintViolations,
					RequestAttributes.SCOPE_REQUEST);
			return false;
		}
	}

	/**
	 * 数据验证
	 * 
	 * @param type
	 *            类型
	 * @param property
	 *            属性
	 * @param value
	 *            值
	 * @param groups
	 *            验证组
	 * @return 验证结果
	 */
	protected boolean isValid(Class<?> type, String property, Object value, Class<?>... groups) {
		Set<?> constraintViolations = validator.validateValue(type, property, value, groups);
		if (constraintViolations.isEmpty()) {
			return true;
		} else {
			RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
			requestAttributes.setAttribute(CONSTRAINT_VIOLATIONS_ATTRIBUTE_NAME, constraintViolations,
					RequestAttributes.SCOPE_REQUEST);
			return false;
		}
	}

	/**
	 * 货币格式化
	 * 
	 * @param amount
	 *            金额
	 * @param showSign
	 *            显示标志
	 * @param showUnit
	 *            显示单位
	 * @return 货币格式化
	 */
	protected String currency(BigDecimal amount, boolean showSign, boolean showUnit) {
		Setting setting = SettingUtils.get();
		String price = setting.setScale(amount).toString();
		if (showSign) {
			price = setting.getCurrencySign() + price;
		}
		if (showUnit) {
			price += setting.getCurrencyUnit();
		}
		return price;
	}

	/**
	 * 获取国际化消息
	 * 
	 * @param code
	 *            代码
	 * @param args
	 *            参数
	 * @return 国际化消息
	 */
	protected String message(String code, Object... args) {
		return SpringUtils.getMessage(code, args);
	}

	/**
	 * 添加瞬时消息
	 * 
	 * @param redirectAttributes
	 *            RedirectAttributes
	 * @param message
	 *            消息
	 */
	protected void addFlashMessage(RedirectAttributes redirectAttributes, Message message) {
		if (redirectAttributes != null && message != null) {
			redirectAttributes.addFlashAttribute(FlashMessageDirective.FLASH_MESSAGE_ATTRIBUTE_NAME, message);
		}
	}

}
