package com.platform.JiaZhengService.Controller.console;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.Page;

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

}
