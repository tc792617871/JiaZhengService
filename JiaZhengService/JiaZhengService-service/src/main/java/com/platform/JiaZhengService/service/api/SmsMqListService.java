package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.entity.TSmsMqList;

public interface SmsMqListService extends BaseService {
	/**
	 * 发送短信
	 * 
	 * @param destmobile
	 *            目标号码
	 * @param msgText
	 *            内容 需要发送的短信内容。 采用UTF-8编码。
	 * @see [类、类#方法、类#成员]
	 */
	public void sendSms(String receiveNum, String content);

	/**
	 * 刷新短信到平台给用户
	 * 
	 * @see [类、类#方法、类#成员]
	 */
	public void refurbishSms();

	/**
	 * 查询待发送的短信
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public List<TSmsMqList> findByReady();
}
