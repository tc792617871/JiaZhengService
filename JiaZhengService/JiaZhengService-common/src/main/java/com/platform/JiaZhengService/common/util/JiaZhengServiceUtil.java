package com.platform.JiaZhengService.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.platform.JiaZhengService.common.meta.Dto;
import com.platform.JiaZhengService.common.pojo.JiaZhengServiceConstants;

/**
 * Util-工具类
 * 
 */
public class JiaZhengServiceUtil {
	/** logger */
	private static final Logger logger = LoggerFactory.getLogger(JiaZhengServiceUtil.class);

	/**
	 * 判断对象是否Empty(null或元素为0)<br>
	 * 实用于对如下对象做判断:String Collection及其子类 Map及其子类
	 * 
	 * @param pObj
	 *            待检查对象
	 * @return boolean 返回的布尔值
	 */
	public static boolean isEmpty(Object pObj) {
		if (pObj == null)
			return true;
		if ("".equals(pObj))
			return true;
		if (pObj instanceof String) {
			if (((String) pObj).length() == 0) {
				return true;
			}
		} else if (pObj instanceof Collection) {
			if (((Collection) pObj).size() == 0) {
				return true;
			}
		} else if (pObj instanceof Map) {
			if (((Map) pObj).size() == 0) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 判断对象是否为NotEmpty(!null或元素>0)<br>
	 * 实用于对如下对象做判断:String Collection及其子类 Map及其子类
	 * 
	 * @param pObj
	 *            待检查对象
	 * @return boolean 返回的布尔值
	 */
	public static boolean isNotEmpty(Object pObj) {
		if (pObj == null)
			return false;
		if ("".equals(pObj))
			return false;
		if (pObj instanceof String) {
			if (((String) pObj).length() == 0) {
				return false;
			}
		} else if (pObj instanceof Collection) {
			if (((Collection) pObj).size() == 0) {
				return false;
			}
		} else if (pObj instanceof Map) {
			if (((Map) pObj).size() == 0) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 判断一个字符串是否由数字、字母、数字字母组成
	 * 
	 * @param pStr
	 *            需要判断的字符串
	 * @param pStyle
	 *            判断规则
	 * @return boolean 返回的布尔值
	 */
	public static boolean isTheStyle(String pStr, String pStyle) {
		for (int i = 0; i < pStr.length(); i++) {
			char c = pStr.charAt(i);
			if (pStyle.equals(JiaZhengServiceConstants.S_STYLE_N)) {
				if (!Character.isDigit(c))
					return false;
			} else if (pStyle.equals(JiaZhengServiceConstants.S_STYLE_L)) {
				if (!Character.isLetter(c))
					return false;
			} else if (pStyle.equals(JiaZhengServiceConstants.S_STYLE_NL)) {
				if (Character.isLetterOrDigit(c))
					return false;
			}
		}
		return true;
	}

	/**
	 * JavaBean之间对象属性值拷贝
	 * 
	 * @param pFromObj
	 *            Bean源对象
	 * @param pToObj
	 *            Bean目标对象
	 */
	public static void copyPropBetweenBeans(Object pFromObj, Object pToObj) {
		if (pToObj != null) {
			try {
				BeanUtils.copyProperties(pToObj, pFromObj);
			} catch (Exception e) {
				logger.error("==开发人员请注意:==\n JavaBean之间的属性值拷贝发生错误啦!" + "\n详细错误信息如下:");
				e.printStackTrace();
			}
		}
	}

	/**
	 * 将JavaBean对象中的属性值拷贝到Dto对象
	 * 
	 * @param pFromObj
	 *            JavaBean对象源
	 * @param pToDto
	 *            Dto目标对象
	 */
	public static void copyPropFromBean2Dto(Object pFromObj, Dto pToDto) {
		if (pToDto != null) {
			try {
				pToDto.putAll(BeanUtils.describe(pFromObj));
				// BeanUtils自动加入了一个Key为class的键值,故将其移除
				pToDto.remove("class");
			} catch (Exception e) {
				logger.error("==开发人员请注意:==\n 将JavaBean属性值拷贝到Dto对象发生错误啦!" + "\n详细错误信息如下:");
				e.printStackTrace();
			}
		}
	}

	/**
	 * 实现字符串首字母大写
	 * 
	 * @param str
	 *            字符串(任意字符串)
	 * @return String 首字母大写
	 */
	public static String upperCaseFirstChar(String str) {
		str = str.toLowerCase();// 先转换成小写
		str = str.substring(0, 1).toUpperCase() + str.substring(1);
		return str;
	}

	/**
	 * 获取ip地址,防止集群、代理
	 * 
	 * @param request
	 * @return ip
	 */
	public static String getAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		// 解决出现多层代理，返回第一个作为实际IP地址
		if (JiaZhengServiceUtil.isNotEmpty(ip)) {
			String[] ips = ip.split(",");
			if (ips.length > 0) {
				return ips[0].trim();
			}
		}
		return ip;
	}

	/**
	 * String 转成Long数组<一句话功能简述> <功能详细描述>
	 * 
	 * @param str
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static Long[] string2Long(String str) {
		if ("".equals(str) || null == str) {
			return null;
		}
		String[] strArray = str.split(",");
		Long[] longArray = new Long[strArray.length];
		for (int i = 0; i < strArray.length; i++) {
			longArray[i] = Long.valueOf(strArray[i]);
		}
		return longArray;
	}

	/**
	 * String 转成BigDeciaml集合<一句话功能简述> <功能详细描述>
	 * 
	 * @param str
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static List<BigDecimal> string2BigDecimal(String str) {
		if ("".equals(str) || null == str) {
			return null;
		}
		String[] strArray = str.split(",");
		List<BigDecimal> bigDecimalList = new ArrayList<BigDecimal>();
		for (int i = 0; i < strArray.length; i++) {
			BigDecimal bigDecimal = new BigDecimal(strArray[i]);
			bigDecimalList.add(bigDecimal);
		}
		return bigDecimalList;
	}

	/**
	 * 验证电话号码是否正确
	 * 
	 * @param mobiles
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static boolean isMobileNO(String mobiles) {
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,2-9]))\\d{8}$");
		Matcher m = p.matcher(mobiles);
		return m.matches();
	}

	/**
	 * 验证是否是邮件格式<一句话功能简述> <功能详细描述>
	 * 
	 * @param email
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static boolean isEmail(String email) {
		String str = "^([a-zA-Z0-9]*([-_]|[-.])?[a-zA-Z0-9]+)*@([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2})?$";
		Pattern p = Pattern.compile(str);
		Matcher m = p.matcher(email);
		return m.matches();
	}

	/**
	 * 计算Map合
	 * 
	 * @param totalMap
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static BigDecimal totalMap(Map<Long, BigDecimal> totalMap) {
		BigDecimal bd = new BigDecimal(0);
		for (Long key : totalMap.keySet()) {
			bd = bd.add(totalMap.get(key));
		}
		return bd;
	}

	/**
	 * 获取随机字符串
	 * 
	 * @return
	 */
	public static String getNonceStr() {
		// 随机数
		String currTime = DateUtil.generateTime();
		// 8位日期
		String strTime = currTime.substring(8, currTime.length());
		// 四位随机数
		String strRandom = JiaZhengServiceUtil.buildRandom(4) + "";
		// 10位序列号,可以自行调整。
		return strTime + strRandom;
	}

	/**
	 * 取出一个指定长度大小的随机正整数.
	 * 
	 * @param length
	 *            int 设定所取出随机数的长度。length小于11
	 * @return int 返回生成的随机数。
	 */
	public static int buildRandom(int length) {
		int num = 1;
		double random = Math.random();
		if (random < 0.1) {
			random = random + 0.1;
		}
		for (int i = 0; i < length; i++) {
			num = num * 10;
		}
		return (int) ((random * num));
	}

	/**
	 * 时间邮票
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getTimeStamp() {
		return String.valueOf(System.currentTimeMillis() / 1000);
	}

	/**
	 * 是否是微信浏览器
	 * 
	 * @param request
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static Boolean getIsWeChatBrowser(HttpServletRequest request) {
		String ua = request.getHeader("user-agent").toLowerCase();
		if (ua.indexOf("micromessenger") > 0) {
			return true;
		} else {
			return false;
		}

	}

	/**
	 * 保留两位小数四舍五入
	 * 
	 * @param preValue
	 * @return
	 */
	public static double decimalFormat(Double preValue) {
		BigDecimal bg = new BigDecimal(preValue);
		double resultValue = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		return resultValue;
	}

	/**
	 * 根据经纬度反向解析地址
	 * 
	 * @param latitude
	 *            纬度
	 * @param longitude
	 *            经度
	 * @return
	 */
	public static String geocodeAddr(String latitude, String longitude) {
		String city = "";

		// 也可以是http://maps.google.cn/maps/geo?output=csv&key=abcdef&q=%s,%s，不过解析出来的是英文地址
		// 密钥可以随便写一个key=abc
		// output=csv,也可以是xml或json，不过使用csv返回的数据最简洁方便解析

		String url = String.format(
				"http://api.map.baidu.com/geocoder/v2/?ak=9NRLHTxsqi5LDPpmLxwoTcCy&callback=renderReverse&location=%s,%s",
				latitude, longitude);
		url = url + "&output=json";
		URL myURL = null;
		URLConnection httpsConn = null;
		try {
			myURL = new URL(url);
		} catch (MalformedURLException e) {
			e.printStackTrace();
			return null;
		}
		try {
			httpsConn = (URLConnection) myURL.openConnection();
			if (httpsConn != null) {
				InputStreamReader insr = new InputStreamReader(httpsConn.getInputStream(), "UTF-8");
				BufferedReader br = new BufferedReader(insr);
				String data = null;
				if ((data = br.readLine()) != null) {
					data = data.replace("renderReverse&&renderReverse(", "").replace(")", "");
					Dto dto = JsonUtils.toDto(data);
					LinkedHashMap result = (LinkedHashMap) dto.get("result");
					LinkedHashMap addressComponent = (LinkedHashMap) result.get("addressComponent");
					city = String.valueOf(addressComponent.get("city"));
					return city;
				}
				insr.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return city;
	}

	public static void main(String[] args) {
		// 32.00918148060945,118.76591942529285
		System.out.println(JiaZhengServiceUtil.geocodeAddr("32.00918148060945", "118.76591942529285"));
	}

}
