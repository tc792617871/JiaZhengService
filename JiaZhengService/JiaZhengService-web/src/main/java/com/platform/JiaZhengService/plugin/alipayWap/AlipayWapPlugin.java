package com.platform.JiaZhengService.plugin.alipayWap;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.lang3.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.platform.JiaZhengService.common.util.DateUtil;
import com.platform.JiaZhengService.common.util.MD5;
import com.platform.JiaZhengService.common.util.RSAUtils;
import com.platform.JiaZhengService.dao.entity.TPluginConfig;
import com.platform.JiaZhengService.plugin.alipayWap.httpClient.HttpProtocolHandler;
import com.platform.JiaZhengService.plugin.alipayWap.httpClient.HttpRequest;
import com.platform.JiaZhengService.plugin.alipayWap.httpClient.HttpResponse;
import com.platform.JiaZhengService.plugin.alipayWap.httpClient.HttpResultType;
import com.platform.JiaZhengService.pluginService.PaymentPlugin;

/**
 * Plugin - 支付宝(手机网站支付)
 * 
 */
@Component("alipayWapPlugin")
public class AlipayWapPlugin extends PaymentPlugin {

	/** logger */
	private static final Logger logger = LoggerFactory.getLogger(AlipayWapPlugin.class);

	@Override
	public String getName() {
		return "支付宝(手机网站支付)";
	}

	@Override
	public String getVersion() {
		return "1.0";
	}

	@Override
	public String getAuthor() {
		return "xxx";
	}

	@Override
	public String getSiteUrl() {
		return "http://www.xxx.com.cn";
	}

	@Override
	public String getInstallUrl() {
		return "alipay_wap/install.jhtml";
	}

	@Override
	public String getUninstallUrl() {
		return "alipay_wap/uninstall.jhtml";
	}

	@Override
	public String getSettingUrl() {
		return "alipay_wap/setting.jhtml";
	}

	@Override
	public String getRequestUrl() {
		return "http://wappaygw.alipay.com/service/rest.htm?";
	}

	@Override
	public RequestMethod getRequestMethod() {
		return RequestMethod.get;
	}

	@Override
	public String getRequestCharset() {
		return "UTF-8";
	}

	@Override
	public Map<String, Object> getParameterMap(String sn, String description, HttpServletRequest request) {
		TPluginConfig pluginConfig = getPluginConfig();
		// Payment payment = getPayment(sn);

		String sellerAccountName = pluginConfig.getAttribute("partner");
		String subject = StringUtils.abbreviate(description.replaceAll("[^0-9a-zA-Z\\u4e00-\\u9fa5 ]", ""), 60);
		String totalFee = "0";
		String merchantUrl = getMobileNotifyUrl(sn, NotifyMethod.sync);
		// 返回格式
		String format = "xml";
		// 必填，不需要修改
		// 返回格式
		String v = "2.0";

		// 请求业务参数详细
		String reqDataToken = "<direct_trade_create_req><notify_url>" + getMobileNotifyUrl(sn, NotifyMethod.async)
				+ "</notify_url><call_back_url>" + getMobileNotifyUrl(sn, NotifyMethod.sync)
				+ "</call_back_url><seller_account_name>" + "moco.tmall@moco-paris.com"
				+ "</seller_account_name><out_trade_no>" + sn + "</out_trade_no><subject>" + subject
				+ "</subject><total_fee>" + totalFee + "</total_fee><merchant_url>" + merchantUrl
				+ "</merchant_url></direct_trade_create_req>";

		Map<String, Object> parameterMapToken = new HashMap<String, Object>();
		parameterMapToken.put("service", "alipay.wap.trade.create.direct");
		parameterMapToken.put("partner", pluginConfig.getAttribute("partner"));
		parameterMapToken.put("_input_charset", "utf-8");
		// 签名方式，选择项：0001(RSA)、MD5
		// 无线的产品中，签名方式为rsa时，sign_type需赋值为0001而不是RSA
		parameterMapToken.put("sec_id", TPluginConfig.SIGN_TYPE);
		parameterMapToken.put("format", format);
		parameterMapToken.put("v", v);
		parameterMapToken.put("req_id", DateUtil.getOrderNum());
		parameterMapToken.put("req_data", reqDataToken);

		String requestToken = "";
		// URLDECODE返回的信息
		try {
			// 建立请求
			String sHtmlTextToken = buildRequest(getRequestUrl(), parameterMapToken);
			// sHtmlTextToken =
			// sHtmlTextToken.replaceAll("%(?![0-9a-fA-F]{2})",
			// "%25");
			// sHtmlTextToken = sHtmlTextToken.replaceAll("\\+", "%2B");
			sHtmlTextToken = URLDecoder.decode(sHtmlTextToken, "utf-8");
			requestToken = super.getRequestToken(sHtmlTextToken);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}

		// 业务详细
		String reqData = "<auth_and_execute_req><request_token>" + requestToken
				+ "</request_token></auth_and_execute_req>";
		// 必填
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("service", "alipay.wap.auth.authAndExecute");
		parameterMap.put("partner", sellerAccountName);
		parameterMap.put("_input_charset", "utf-8");
		parameterMap.put("sec_id", TPluginConfig.SIGN_TYPE);
		parameterMap.put("format", format);
		parameterMap.put("v", v);
		parameterMap.put("req_data", reqData);
		return buildRequestPara(parameterMap);
	}

	@Override
	public boolean verifyNotify(String sn, NotifyMethod notifyMethod, HttpServletRequest request) {
		TPluginConfig pluginConfig = getPluginConfig();
		// Payment payment = getPayment(sn);
		if (generateSign(request.getParameterMap()).equals(request.getParameter("sign"))
				&& pluginConfig.getAttribute("partner").equals(request.getParameter("seller_id"))
				&& sn.equals(request.getParameter("out_trade_no"))
				&& ("TRADE_SUCCESS".equals(request.getParameter("trade_status"))
						|| "TRADE_FINISHED".equals(request.getParameter("trade_status")))
				&& new BigDecimal("0").compareTo(new BigDecimal(request.getParameter("total_fee"))) == 0) {
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("service", "notify_verify");
			parameterMap.put("partner", pluginConfig.getAttribute("partner"));
			parameterMap.put("notify_id", request.getParameter("notify_id"));
			if ("true".equals(post("https://mapi.alipay.com/gateway.do", parameterMap))) {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean verifyMobileNotify(String sn, NotifyMethod notifyMethod, HttpServletRequest request) {
		Map<String, Object> params = generateMobileSign(request);
		// 获取待签名字符串
		if (NotifyMethod.sync.equals(notifyMethod)) {
			if (null != params && params.size() > 0) {
				// 获取支付宝的通知返回参数，
				// 商户订单号
				String outTradeNo = params.get("out_trade_no").toString();
				// 交易状态
				String result = params.get("result").toString();
				if (verifyReturn(params) && sn.equals(outTradeNo) && ("success".equals(result))) {
					return true;
				}
			} else {
				return false;
			}
		} else {
			// RSA签名解密
			if (TPluginConfig.SIGN_TYPE.equals("0001")) {
				params = decrypt(params);
			}
			// XML解析notify_data数据
			Document doc_notify_data = null;
			try {
				doc_notify_data = DocumentHelper.parseText(params.get("notify_data").toString());
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (doc_notify_data != null) {
				// 商户订单号
				String outTradeNo = doc_notify_data.selectSingleNode("//notify/out_trade_no").getText();
				// 交易状态
				String tradeStatus = doc_notify_data.selectSingleNode("//notify/trade_status").getText();
				if (verifyNotify(params) && sn.equals(outTradeNo)
						&& ("TRADE_FINISHED".equals(tradeStatus) || "TRADE_SUCCESS".equals(tradeStatus))) {
					return true;
				}
			}
		}

		return false;
	}

	/**
	 * RSA签名解密
	 * 
	 * @return 签名
	 * @throws Exception
	 */
	private Map<String, Object> generateMobileSign(HttpServletRequest request) {
		// 获取支付宝POST过来反馈信息
		Map<String, Object> params = new HashMap<String, Object>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			params.put(name, valueStr);
		}
		return params;
	}

	/**
	 * 解密
	 * 
	 * @param inputPara
	 *            要解密数据
	 * @return 解密后结果
	 */
	public Map<String, Object> decrypt(Map<String, Object> inputPara) {
		try {
			inputPara.put("notify_data", RSAUtils.decrypt(inputPara.get("notify_data").toString(),
					TPluginConfig.ALI_PRIVATE_KEY, TPluginConfig.INPUT_CHARSET));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return inputPara;
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
	private String generateSign(Map<String, ?> parameterMap) {
		TPluginConfig pluginConfig = getPluginConfig();
		return DigestUtils.md5Hex(joinKeyValue(new TreeMap<String, Object>(parameterMap), null,
				pluginConfig.getAttribute("key"), "&", true, "sign_type", "sign"));
	}

	/**
	 * 生成要请求给支付宝的参数数组
	 * 
	 * @param sParaTemp
	 *            请求前的参数数组
	 * @return 要请求的参数数组
	 */
	private Map<String, Object> buildRequestPara(Map<String, Object> sParaTemp) {
		// 除去数组中的空值和签名参数
		Map<String, Object> sPara = paraFilter(sParaTemp);
		// 生成签名结果
		String mysign = buildRequestMysign(sPara);
		// 签名结果与签名方式加入请求提交参数组中
		sPara.put("sign", mysign);
		if (!sPara.get("service").equals("alipay.wap.trade.create.direct")
				&& !sPara.get("service").equals("alipay.wap.auth.authAndExecute")) {
			sPara.put("sign_type", TPluginConfig.SIGN_TYPE);
		}
		return sPara;
	}

	/**
	 * 生成签名结果
	 * 
	 * @param sPara
	 *            要签名的数组
	 * @return 签名结果字符串
	 */
	public String buildRequestMysign(Map<String, Object> sPara) {
		String prestr = createLinkString(sPara); // 把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串
		String mysign = "";
		TPluginConfig pluginConfig = getPluginConfig();

		String key = pluginConfig.getAttribute("key");
		if (TPluginConfig.SIGN_TYPE.equals("MD5")) {
			mysign = MD5.sign(prestr, key, TPluginConfig.INPUT_CHARSET);
		}
		if (TPluginConfig.SIGN_TYPE.equals("0001")) {
			mysign = RSAUtils.sign(prestr, TPluginConfig.ALI_PRIVATE_KEY, TPluginConfig.INPUT_CHARSET);
		}
		return mysign;
	}

	/**
	 * 建立请求，以模拟远程HTTP的POST请求方式构造并获取支付宝的处理结果
	 * 如果接口中没有上传文件参数，那么strParaFileName与strFilePath设置为空值 如：buildRequest("",
	 * "",sParaTemp)
	 * 
	 * @paramALIPAY_GATEWAY_NEW 支付宝网关地址
	 * @param strParaFileName
	 *            文件类型的参数名
	 * @param strFilePath
	 *            文件路径
	 * @param sParaTemp
	 *            请求参数数组
	 * @return 支付宝处理结果
	 * @throws Exception
	 */
	public String buildRequest(String url, Map<String, Object> sParaTemp) throws Exception {
		// 待请求参数数组
		Map<String, Object> sPara = buildRequestPara(sParaTemp);
		HttpProtocolHandler httpProtocolHandler = HttpProtocolHandler.getInstance();
		HttpRequest request = new HttpRequest(HttpResultType.BYTES);
		// 设置编码集
		request.setCharset(TPluginConfig.INPUT_CHARSET);
		request.setParameters(generatNameValuePair(sPara));
		request.setUrl(url + "_input_charset=" + TPluginConfig.INPUT_CHARSET);
		HttpResponse response = httpProtocolHandler.execute(request, "", "");
		if (response == null) {
			return null;
		}
		String strResult = response.getStringResult();
		return strResult;
	}

	/**
	 * MAP类型数组转换成NameValuePair类型
	 * 
	 * @param properties
	 *            MAP类型数组
	 * @return NameValuePair类型数组
	 */
	private static NameValuePair[] generatNameValuePair(Map<String, Object> properties) {
		NameValuePair[] nameValuePair = new NameValuePair[properties.size()];
		int i = 0;
		for (Map.Entry<String, Object> entry : properties.entrySet()) {
			nameValuePair[i++] = new NameValuePair(entry.getKey(), entry.getValue().toString());
		}
		return nameValuePair;
	}

	/**
	 * 验证消息是否是支付宝发出的合法消息，验证callback
	 * 
	 * @param params
	 *            通知返回来的参数数组
	 * @return 验证结果
	 */
	public boolean verifyReturn(Map<String, Object> params) {
		String sign = "";
		// 获取返回时的签名验证结果
		if (params.get("sign") != null) {
			sign = params.get("sign").toString();
		}
		// 验证签名
		boolean isSign = getSignVeryfy(params, sign, true);

		// 写日志记录（若要调试，请取消下面两行注释）
		String sWord = "isSign=" + isSign + "\n 返回回来的参数：" + createLinkString(params);
		// System.out.println(sWord);
		// 判断isSign是否为true
		// isSign不是true，与安全校验码、请求时的参数格式（如：带自定义参数等）、编码格式有关
		if (isSign) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 验证消息是否是支付宝发出的合法消息，验证服务器异步通知
	 * 
	 * @param params
	 *            通知返回来的参数数组
	 * @return 验证结果
	 */
	public boolean verifyNotify(Map<String, Object> params) {
		// 获取是否是支付宝服务器发来的请求的验证结果
		String responseTxt = "true";
		try {
			// XML解析notify_data数据，获取notify_id
			Document document = DocumentHelper.parseText(params.get("notify_data").toString());
			String notify_id = document.selectSingleNode("//notify/notify_id").getText();
			responseTxt = verifyResponse(notify_id);
		} catch (Exception e) {
			responseTxt = e.toString();
		}
		// 获取返回时的签名验证结果
		String sign = "";
		if (params.get("sign") != null) {
			sign = params.get("sign").toString();
		}
		boolean isSign = getSignVeryfy(params, sign, false);
		// 判断responsetTxt是否为true，isSign是否为true
		// responsetTxt的结果不是true，与服务器设置问题、合作身份者ID、notify_id一分钟失效有关
		// isSign不是true，与安全校验码、请求时的参数格式（如：带自定义参数等）、编码格式有关
		if (isSign && responseTxt.equals("true")) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 根据反馈回来的信息，生成签名结果
	 * 
	 * @param Params
	 *            通知返回来的参数数组
	 * @param sign
	 *            比对的签名结果
	 * @param isSort
	 *            是否排序
	 * @return 生成的签名结果
	 */
	private boolean getSignVeryfy(Map<String, Object> params, String sign, boolean isSort) {
		TPluginConfig pluginConfig = getPluginConfig();

		String key = pluginConfig.getAttribute("key");
		// 过滤空值、sign与sign_type参数
		Map<String, Object> sParaNew = paraFilter(params);
		// 获取待签名字符串
		String preSignStr = "";
		if (isSort) {
			preSignStr = createLinkString(sParaNew);
		} else {
			preSignStr = createLinkStringNoSort(sParaNew);
		}
		// 获得签名验证结果
		boolean isSign = false;
		if (TPluginConfig.SIGN_TYPE.equals("MD5")) {
			isSign = MD5.verify(preSignStr, sign, key, TPluginConfig.INPUT_CHARSET);
		}
		if (TPluginConfig.SIGN_TYPE.equals("0001")) {
			isSign = RSAUtils.verify(preSignStr, sign, TPluginConfig.ALI_PUBLIC_KEY, TPluginConfig.INPUT_CHARSET);
		}
		return isSign;
	}

	/**
	 * 获取远程服务器ATN结果,验证返回URL
	 * 
	 * @param notify_id
	 *            通知校验ID
	 * @return 服务器ATN结果 验证结果集： invalid命令参数不对 出现这个错误，请检测返回处理中partner和key是否为空 true
	 *         返回正确信息 false 请检查防火墙或者是服务器阻止端口问题以及验证时间是否超过一分钟
	 */
	private String verifyResponse(String notify_id) {
		// 获取远程服务器ATN结果，验证是否是支付宝服务器发来的请求
		TPluginConfig pluginConfig = getPluginConfig();
		String partner = pluginConfig.getAttribute("partner");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("service", "notify_verify");
		parameterMap.put("partner", partner);
		parameterMap.put("notify_id", notify_id);
		return post("https://mapi.alipay.com/gateway.do", parameterMap);
	}
}
