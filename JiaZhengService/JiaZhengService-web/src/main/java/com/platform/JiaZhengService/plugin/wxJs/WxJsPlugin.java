package com.platform.JiaZhengService.plugin.wxJs;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.ClientPNames;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.platform.JiaZhengService.common.util.AmountUtils;
import com.platform.JiaZhengService.common.util.Base64Util;
import com.platform.JiaZhengService.common.util.JiaZhengServiceUtil;
import com.platform.JiaZhengService.common.util.MD5;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TOrder;
import com.platform.JiaZhengService.dao.entity.TPayment;
import com.platform.JiaZhengService.dao.entity.TPluginConfig;
import com.platform.JiaZhengService.pluginService.PaymentPlugin;

/**
 * Plugin - 微信JSAPI支付
 */
@Component("wxJsPlugin")
public class WxJsPlugin extends PaymentPlugin {
	/** logger */
	private static final Logger logger = LoggerFactory.getLogger(WxJsPlugin.class);

	public static DefaultHttpClient httpclient;

	static {
		httpclient = new DefaultHttpClient();
		httpclient = (DefaultHttpClient) HttpClientConnectionManager.getSSLInstance(httpclient);
	}

	@Override
	public String getName() {
		return "微信JSAPI支付";
	}

	@Override
	public String getVersion() {
		return "1.0";
	}

	@Override
	public String getAuthor() {
		return "toncho";
	}

	@Override
	public String getSiteUrl() {
		return "http://www.xxx.com.cn";
	}

	@Override
	public String getInstallUrl() {
		return "wx_js/install.jhtml";
	}

	@Override
	public String getUninstallUrl() {
		return "wx_js/uninstall.jhtml";
	}

	@Override
	public String getSettingUrl() {
		return "wx_js/setting.jhtml";
	}

	@Override
	public String getRequestUrl() {
		return "wxJsApiPay.jhtml?showwxpaytitle=1";
	}

	public String getCreateOrderURL() {
		return "https://api.mch.weixin.qq.com/pay/unifiedorder";
	}

	public String getQueryOrder() {
		return "https://api.mch.weixin.qq.com/pay/orderquery";
	}

	@Override
	public RequestMethod getRequestMethod() {
		return RequestMethod.post;
	}

	@Override
	public String getRequestCharset() {
		return "UTF-8";
	}

	@Override
	public Map<String, Object> getParameterMap(String sn, String description, HttpServletRequest request) {
		TPluginConfig pluginConfig = getPluginConfig();
		TPayment payment = getPayment(sn);
		TOrder order = payment.getOrder();
		TMember member = payment.getTmember();
		String appId = pluginConfig.getAttribute("appId");
		String partnerId = pluginConfig.getAttribute("partnerId");
		String nonceStr = JiaZhengServiceUtil.getNonceStr();
		String body = StringUtils.abbreviate(description.replaceAll("[^0-9a-zA-Z\\u4e00-\\u9fa5 ]", ""), 20);
		String totalFee = AmountUtils.changeY2Cent(payment.getAmount().toString());
		String notifyUrl = getNotifyUrl(sn, NotifyMethod.async);
		String attach = "JSAPI";
		String spbillCreateIp = JiaZhengServiceUtil.getAddr(request);
		String tradeType = "JSAPI";
		String openId = member.getWeChatOpenId();
		Map<String, Object> parameterMap = new HashMap<String, Object>();

		// 设置package订单参数
		SortedMap<String, String> packageParams = new TreeMap<String, String>();
		packageParams.put("appid", appId);
		packageParams.put("mch_id", partnerId);
		packageParams.put("nonce_str", nonceStr);
		packageParams.put("body", body);
		packageParams.put("attach", attach);
		packageParams.put("out_trade_no", sn);
		// 支付金额，以分为单位
		packageParams.put("total_fee", totalFee);
		packageParams.put("spbill_create_ip", spbillCreateIp);
		packageParams.put("notify_url", notifyUrl);

		packageParams.put("trade_type", tradeType);
		if (!StringUtils.isEmpty(openId)) {
			packageParams.put("openid", new String(Base64Util.decode(openId)));
		} else {
			packageParams.put("openid", "");
		}

		String sign = "";
		try {
			sign = generateSign(packageParams);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		String xml = "<xml>" + "<appid><![CDATA[" + appId + "]]></appid>" + "<mch_id><![CDATA[" + partnerId
				+ "]]></mch_id>" + "<nonce_str><![CDATA[" + nonceStr + "]]></nonce_str>" + "<sign><![CDATA[" + sign
				+ "]]></sign>" + "<body><![CDATA[" + body + "]]></body>" + "<out_trade_no><![CDATA[" + sn
				+ "]]></out_trade_no>" + "<attach><![CDATA[" + attach + "]]></attach>" + "<total_fee><![CDATA["
				+ totalFee + "]]></total_fee>" + "<spbill_create_ip><![CDATA[" + spbillCreateIp
				+ "]]></spbill_create_ip>" + "<notify_url><![CDATA[" + notifyUrl + "]]></notify_url>"
				+ "<trade_type><![CDATA[" + tradeType + "]]></trade_type>" + "<openid><![CDATA["
				+ new String(Base64Util.decode(openId)) + "]]></openid>" + "</xml>";
		// logger.error(xml);
		String prepayId = "";
		prepayId = getPayNo(getCreateOrderURL(), xml);
		// logger.error(prepayId);
		String timestamp = JiaZhengServiceUtil.getTimeStamp();
		String packages = "prepay_id=" + prepayId;

		SortedMap<String, String> finalPackage = new TreeMap<String, String>();
		finalPackage.put("appId", appId);
		finalPackage.put("timeStamp", timestamp);
		finalPackage.put("nonceStr", nonceStr);
		finalPackage.put("package", packages);
		finalPackage.put("signType", "MD5");

		String paySign = "";
		try {
			// 要签名
			paySign = generateSign(finalPackage);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		// 增加非参与签名的额外参数
		parameterMap.put("appid", appId);
		parameterMap.put("timestamp", timestamp);
		parameterMap.put("nonceStr", nonceStr);
		parameterMap.put("packageValue", packages);
		parameterMap.put("signType", "MD5");
		parameterMap.put("paySign", paySign);
		parameterMap.put("orderSn", order.getSn());
		parameterMap.put("paymentSn", payment.getSn());
		return parameterMap;
	}

	/**
	 * 校验
	 * 
	 * @param sn
	 * @param notifyMethod
	 * @param request
	 * @return
	 */
	@Override
	public boolean verifyNotify(String sn, NotifyMethod notifyMethod, HttpServletRequest request) {
		String inputLine;
		String notityXml = "";
		try {
			while ((inputLine = request.getReader().readLine()) != null) {
				notityXml += inputLine;
			}
			request.getReader().close();
		} catch (Exception e) {
			logger.error(e.getMessage());
			return false;
		}
		if (notityXml != null && !"".equals(notityXml)) {
			Map resultMap = null;
			try {
				resultMap = doXMLParse(notityXml);
			} catch (Exception e) {
				logger.error(e.getMessage());
				return false;
			}
			if (null != resultMap) {
				if ("SUCCESS".equals(resultMap.get("result_code").toString())) {
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	/**
	 * 校验是否成功支付
	 * 
	 * @param sn
	 * @param notifyMethod
	 * @param request
	 * @return
	 */
	@Override
	public boolean verifyMobileNotify(String sn, NotifyMethod notifyMethod, HttpServletRequest request) {
		TPluginConfig pluginConfig = getPluginConfig();
		String appId = pluginConfig.getAttribute("appId");
		String partnerId = pluginConfig.getAttribute("partnerId");
		String nonceStr = JiaZhengServiceUtil.getNonceStr();
		String transactionId = "";

		SortedMap<String, String> packageParameters = new TreeMap<String, String>();
		// 微信支付 商户参数ID
		packageParameters.put("appid", appId);
		// 商户号
		packageParameters.put("mch_id", partnerId);
		packageParameters.put("nonce_str", nonceStr);
		packageParameters.put("out_trade_no", sn);
		String sign = "";
		try {
			sign = generateSign(packageParameters);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		String xml = "<xml>" + "<appid>" + appId + "</appid>" + "<mch_id>" + partnerId + "</mch_id>"
				+ "<transaction_id>" + transactionId + "</transaction_id>" + "<out_trade_no>" + sn + "</out_trade_no>"
				+ "<nonce_str>" + nonceStr + "</nonce_str>" + "<sign>" + sign + "</sign>" + "</xml>";

		Map resultMap = getReturnMap(getQueryOrder(), xml);
		/**
		 * SUCCESS—支付成功 REFUND—转入退款 NOTPAY—未支付 CLOSED—已关闭 REVOKED—已撤销
		 * USERPAYING--用户支付中 PAYERROR--支付失败(其他原因，如银行返回失败)
		 */
		if ("SUCCESS".equals(resultMap.get("result_code").toString())
				&& "SUCCESS".equals(resultMap.get("trade_state"))) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String getNotifyMessage(String sn, NotifyMethod notifyMethod, HttpServletRequest request) {
		if (notifyMethod == NotifyMethod.async) {
			return "success";
		}
		return null;
	}

	@Override
	public Integer getTimeout() {
		return 21600;
	}

	/**
	 * 生成签名
	 * 
	 * @param parameterMap
	 *            参数
	 * @return 签名
	 */
	/**
	 * 生成签名
	 * 
	 * @param parameterMap
	 *            参数
	 * @return 签名
	 * @throws NoSuchAlgorithmException
	 */
	private String generateSign(Map<String, String> parameterMap) throws NoSuchAlgorithmException {
		TPluginConfig pluginConfig = getPluginConfig();
		StringBuffer sb = new StringBuffer();
		Set es = parameterMap.entrySet();
		Iterator it = es.iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			String k = (String) entry.getKey();
			String v = (String) entry.getValue();
			if (null != v && !"".equals(v) && !"sign".equals(k) && !"key".equals(k)) {
				sb.append(k + "=" + v + "&");
			}
		}
		sb.append("key=" + pluginConfig.getAttribute("partnerKey"));
		String sign = MD5.MD5Encode(sb.toString(), getRequestCharset()).toUpperCase();
		return sign;
	}

	/**
	 * 创建支付
	 * 
	 * @param url
	 *            创建订单的URL
	 * @param xmlParam
	 *            报文数据
	 * @return
	 * @author Draco
	 * @see
	 */
	public static String getPayNo(String url, String xmlParam) {
		DefaultHttpClient client = new DefaultHttpClient();
		client.getParams().setParameter(ClientPNames.ALLOW_CIRCULAR_REDIRECTS, true);
		HttpPost httpost = HttpClientConnectionManager.getPostMethod(url);
		String prepayId = "";
		try {
			httpost.setEntity(new StringEntity(xmlParam, "UTF-8"));
			HttpResponse response = httpclient.execute(httpost);
			String jsonStr = EntityUtils.toString(response.getEntity(), "UTF-8");
			// System.out.println(jsonStr);
			// logger.error(jsonStr);
			if (jsonStr.indexOf("FAIL") != -1) {
				return prepayId;
			}
			Map map = doXMLParse(jsonStr);
			prepayId = (String) map.get("prepay_id");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return prepayId;
	}

	/**
	 * 查询订单是否支付成功
	 * 
	 * @param url
	 * @param xmlParam
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	private static Map getReturnMap(String url, String xmlParam) {
		Map map = null;
		DefaultHttpClient client = new DefaultHttpClient();
		client.getParams().setParameter(ClientPNames.ALLOW_CIRCULAR_REDIRECTS, true);
		HttpPost httpost = HttpClientConnectionManager.getPostMethod(url);
		String code_url = "";
		try {
			httpost.setEntity(new StringEntity(xmlParam, "UTF-8"));
			HttpResponse response = httpclient.execute(httpost);
			String jsonStr = EntityUtils.toString(response.getEntity(), "UTF-8");
			if (jsonStr.indexOf("FAIL") != -1) {
				return null;
			}
			map = doXMLParse(jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * XML解析
	 * 
	 * @param strxml
	 * @return
	 * @throws Exception
	 * @see [类、类#方法、类#成员]
	 */
	public static Map doXMLParse(String strxml) throws Exception {
		if (null == strxml || "".equals(strxml)) {
			return null;
		}
		Map m = new HashMap();
		InputStream in = string2Inputstream(strxml);
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(in);
		Element root = doc.getRootElement();
		List list = root.getChildren();
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Element e = (Element) it.next();
			String k = e.getName();
			String v = "";
			List children = e.getChildren();
			if (children.isEmpty()) {
				v = e.getTextNormalize();
			} else {
				v = getChildrenText(children);
			}
			m.put(k, v);
		}
		in.close();
		return m;
	}

	/**
	 * 获取子节点
	 * 
	 * @param children
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getChildrenText(List children) {
		StringBuffer sb = new StringBuffer();
		if (!children.isEmpty()) {
			Iterator it = children.iterator();
			while (it.hasNext()) {
				Element e = (Element) it.next();
				String name = e.getName();
				String value = e.getTextNormalize();
				List list = e.getChildren();
				sb.append("<" + name + ">");
				if (!list.isEmpty()) {
					sb.append(getChildrenText(list));
				}
				sb.append(value);
				sb.append("</" + name + ">");
			}
		}
		return sb.toString();
	}

	public static InputStream string2Inputstream(String str) {
		return new ByteArrayInputStream(str.getBytes());
	}

}
