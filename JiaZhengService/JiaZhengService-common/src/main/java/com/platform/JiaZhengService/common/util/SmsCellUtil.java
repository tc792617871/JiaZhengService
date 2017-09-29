package com.platform.JiaZhengService.common.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.platform.JiaZhengService.common.pojo.Setting;

/**
 * Util-短信平台工具类
 */
public class SmsCellUtil {
	protected static Logger logger = Logger.getLogger(SmsCellUtil.class.getName());

	private SmsCellUtil() {
	}

	private static String url;

	private static String userId;

	private static SmsCellUtil instance;

	private static String password;

	public static SmsCellUtil getInstance() throws IOException, InterruptedException {
		if (instance == null) {
			instance = new SmsCellUtil();
			initDone();
		}
		return instance;
	}

	// 初始化参数
	public static void initDone() {
		Setting setting = SettingUtils.get();
		url = setting.getSmsUrl();
		userId = setting.getSmsAccount();
		password = setting.getSmsPassword();
	}

	// 设置参数
	public void setParamDone(String urlV, String userIdV, String passwordV) {
		url = urlV;
		userId = userIdV;
		password = passwordV;
	}

	// 发送短信（外部接口）
	/*
	 * 参数 : userid:用户名 password:密码 destnumbers 发送号码 msg 发送内容 sendtime发送时间 返回值 :
	 * XML格式,UTF-8编码 说明: 1. destnumbers 发送号码最大一次提交200个,号码用任意分隔符分开. 2.
	 * 发送号码移动,联通,小灵通可以混和提交 3. 如当前账号不支持某网络发送在QueryUserInfo返回中 /root/ maxchars_xx
	 * 的值为0 4. 如当前账号不支持某网络的发送同时又提交了此网络的号码会报错5.号码错误 5. msg发送内容最大250个字符,不分区中英文. 6.
	 * 发送内容大于相应网络的最大字符数(/root/ maxchars_xx)时系统拆成多条发送 7. 每条短信后自动加上用户注册的签名:如 [满堂红]
	 * 8. 不加sendtime参数或值为“”时短信立即发送,如果要定制发送时间则加sendtime参数格式为 YYYY-MM-DD HH:MM:SS
	 * 如:2008-05-12 10:00:00 调用成功时: <root return="0" info="成功" msgid="{短信批号}"
	 * numbers="{ 总计号码个数}" messages="{ 总计短信条数}"> </root> 例如: 发一个移动号码,内容不分段的返回
	 * <root return="0" info="成功" msgid=“FI293EF2D002F01D” numbers="1"
	 * messages="1"> </root>
	 */
	public Map<String, String> sendDone(String destnumbers, String msg, String sendtime) throws Exception {
		if (StringUtils.isNotEmpty(url) && StringUtils.isNotEmpty(userId) && StringUtils.isNotEmpty(password)) {
			try {
				String qUrl = url + "?userid=" + userId + "&password=" + java.net.URLEncoder.encode(password, "UTF-8")
						+ "&destnumbers=" + destnumbers + "&msg=" + java.net.URLEncoder.encode(msg, "UTF-8");
				if (!StringUtils.isBlank(sendtime)) {
					qUrl += "&sendtime=" + sendtime;
				}

				// 这里用了 dom4j 来分析返回的XML
				org.dom4j.io.SAXReader reader = new org.dom4j.io.SAXReader();
				org.dom4j.Document doc = reader.read(new java.net.URL(qUrl));

				Map<String, String> map = new HashMap<String, String>();
				map.put("return", doc.valueOf("/root/@return"));
				map.put("info", doc.valueOf("/root/@info"));
				map.put("msgid", doc.valueOf("/root/@msgid"));
				return map;
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
				return new HashMap<>();
			}
		} else {
			return new HashMap<>();
		}
	}

	public Map<String, String> queryReportsDone(String date, String msgid) throws Exception {
		if (StringUtils.isNotEmpty(url) && StringUtils.isNotEmpty(userId) && StringUtils.isNotEmpty(password)) {
			try {
				String qUrl = url + "?userid=" + userId + "&password=" + java.net.URLEncoder.encode(password, "UTF-8");
				if (!StringUtils.isBlank(date)) {
					qUrl += "&date=" + date;
				}
				if (!StringUtils.isBlank(msgid)) {
					qUrl += "&mode=1&match=" + msgid;
				}
				// 这里用了 dom4j 来分析返回的XML
				org.dom4j.io.SAXReader reader = new org.dom4j.io.SAXReader();
				org.dom4j.Document doc = reader.read(new java.net.URL(qUrl));

				Map<String, String> map = new HashMap<String, String>();
				map.put("return", doc.valueOf("/root/@return"));
				map.put("info", doc.valueOf("/root/@info"));
				return map;
			} catch (Exception e) {
				logger.error(e.getMessage());
				return new HashMap<String, String>();
			}
		} else {
			return new HashMap<String, String>();
		}
	}

	public static String getUrl() {
		return url;
	}

	public static void setUrl(String url) {
		SmsCellUtil.url = url;
	}

	public static String getUserId() {
		return userId;
	}

	public static void setUserId(String userId) {
		SmsCellUtil.userId = userId;
	}

	public static void setInstance(SmsCellUtil instance) {
		SmsCellUtil.instance = instance;
	}

	public static String getPassword() {
		return password;
	}

	public static void setPassword(String password) {
		SmsCellUtil.password = password;
	}

}
