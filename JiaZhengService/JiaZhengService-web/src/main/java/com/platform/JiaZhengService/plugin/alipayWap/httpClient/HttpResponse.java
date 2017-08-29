package com.platform.JiaZhengService.plugin.alipayWap.httpClient;

import java.io.UnsupportedEncodingException;

import org.apache.commons.httpclient.Header;

import com.platform.JiaZhengService.dao.entity.TPluginConfig;

/**
 * 
 * 类名：HttpResponse 功能：Http返回对象的封装
 * 
 * @author xutianlong
 * @version [版本号, Oct 19, 2014]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
public class HttpResponse {

	/**
	 * 返回中的Header信息
	 */
	private Header[] responseHeaders;

	/**
	 * String类型的result
	 */
	private String stringResult;

	/**
	 * btye类型的result
	 */
	private byte[] byteResult;

	public Header[] getResponseHeaders() {
		return responseHeaders;
	}

	public void setResponseHeaders(Header[] responseHeaders) {
		this.responseHeaders = responseHeaders;
	}

	public byte[] getByteResult() {
		if (byteResult != null) {
			return byteResult;
		}
		if (stringResult != null) {
			return stringResult.getBytes();
		}
		return null;
	}

	public void setByteResult(byte[] byteResult) {
		this.byteResult = byteResult;
	}

	public String getStringResult() throws UnsupportedEncodingException {
		if (stringResult != null) {
			return stringResult;
		}
		if (byteResult != null) {
			return new String(byteResult, TPluginConfig.INPUT_CHARSET);
		}
		return null;
	}

	public void setStringResult(String stringResult) {
		this.stringResult = stringResult;
	}

}
