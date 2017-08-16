package com.platform.JiaZhengService.common.pojo;

import java.io.Serializable;

import com.platform.JiaZhengService.common.util.JSONUtil;

public interface Pojo extends Serializable {
	/**
	 * 将Pojo转换成json字符串
	 * 
	 * @return json字符串
	 */
	default String toJsonString() {
		return JSONUtil.toJson(this);
	}
}
