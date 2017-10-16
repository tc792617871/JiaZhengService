package com.platform.JiaZhengService.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.platform.JiaZhengService.common.pojo.JiaZhengServiceConstants;
import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.util.DateUtil;
import com.platform.JiaZhengService.common.util.JiaZhengServiceUtil;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.common.util.SmsCellUtil;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTSmsMqList;
import com.platform.JiaZhengService.dao.entity.TSmsMqList;
import com.platform.JiaZhengService.dao.mapper.TSmsMqListMapper;
import com.platform.JiaZhengService.service.api.SmsMqListService;

/**
 * Service - 短信清单
 * 
 */
@Service("smsMqListServiceImpl")
public class SmsMqListServiceImpl extends BaseServiceImpl implements SmsMqListService {

	/** logger */
	private static final Logger logger = LoggerFactory.getLogger(SmsMqListServiceImpl.class);

	@Resource
	private TSmsMqListMapper smsMqListMapper;

	/**
	 * 发送短信
	 * 
	 * @param receiveNum
	 *            目标号码
	 * @param content
	 *            内容 需要发送的短信内容。 采用UTF-8编码。
	 * @see [类、类#方法、类#成员]
	 */
	@Override
	public void sendSms(String receiveNum, String content) {
		Setting setting = SettingUtils.get();
		if (setting.getIsMsgNotified()) {
			TSmsMqList smsMqList = new TSmsMqList();
			smsMqList.setReceiveNum(receiveNum);
			smsMqList.setContent(content);
			smsMqList.setRstatus(false);
			smsMqList.setRsubmitTime(DateUtil.getDate());
			smsMqList.setChannel(0);
			smsMqListMapper.insertSelective(smsMqList);
		}
	}

	/**
	 * 刷新短信到平台给用户
	 * 
	 * @see [类、类#方法、类#成员]
	 */
	@Override
	public void refurbishSms() {
		List<TSmsMqList> smsMqLists = findByReady();
		List<TSmsMqList> resultSmsMqLists = new ArrayList<TSmsMqList>();
		for (TSmsMqList smsMqList : smsMqLists) {
			String receiveNum = smsMqList.getReceiveNum();
			String content = smsMqList.getContent();
			String sendDateTime = DateUtil.getCurrentDate();
			try {
				Map<String, String> returnData = SmsCellUtil.getInstance().sendDone(receiveNum, content, sendDateTime);
				if (JiaZhengServiceUtil.isNotEmpty(returnData)) {
					String response = returnData.get("info");
					String statusCode = returnData.get("return");
					String msgId = returnData.get("msgid");
					smsMqList.setAstatus(statusCode);
					smsMqList.setRerrStatus(msgId);
					smsMqList.setRsendTime(DateUtil.getDate());
					smsMqList.setRerrStatusContent(response.toString());
					if (statusCode != null && "0".equals(statusCode)) {
						smsMqList.setRstatus(true);
					} else {
						smsMqList.setRstatus(false);
					}
					resultSmsMqLists.add(smsMqList);
				}

			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e.getMessage(), e);
			} catch (InterruptedException e) {
				e.printStackTrace();
				logger.error(e.getMessage(), e);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e.getMessage(), e);
			}
		}
		if (resultSmsMqLists != null && resultSmsMqLists.size() > 0) {
			for (TSmsMqList smsMq : resultSmsMqLists) {
				smsMqListMapper.updateByPrimaryKeySelective(smsMq);
			}
		}
	}

	/**
	 * 查询待发送的短信
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public List<TSmsMqList> findByReady() {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTSmsMqList.RSTATUS, false);
		c.setOrderByClause(TTSmsMqList.RSUBMIT_TIME + JiaZhengServiceConstants.SORT_ASC);
		return smsMqListMapper.selectByExample(c);
	}

}
