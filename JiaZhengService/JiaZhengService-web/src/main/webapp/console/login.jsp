<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.UUID"%>
<%@page import="java.security.interfaces.RSAPublicKey"%>
<%@page import="org.apache.commons.lang3.ArrayUtils"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.platform.JiaZhengService.common.pojo.Setting"%>
<%@page import="com.platform.JiaZhengService.common.util.SettingUtils"%>
<%@page import="com.platform.JiaZhengService.common.util.SpringUtils"%>
<%@page
	import="com.platform.JiaZhengService.common.pojo.Setting.CaptchaType"%>
<%@page
	import="com.platform.JiaZhengService.common.pojo.Setting.AccountLockType"%>
<%@page import="com.platform.JiaZhengService.service.api.RSAService"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String base = request.getContextPath();
	String captchaId = UUID.randomUUID().toString();
	ApplicationContext applicationContext = SpringUtils.getApplicationContext();
	Setting setting = SettingUtils.get();
	if (applicationContext != null) {
%>
<shiro:authenticated>
	<%
		response.sendRedirect(base + "/console/common/main.ct");
	%>
</shiro:authenticated>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%
	if (applicationContext != null) {
		RSAService rsaService = SpringUtils.getBean("rsaServiceImpl", RSAService.class);
		RSAPublicKey publicKey = rsaService.generateKey(request);
		String modulus = Base64.encodeBase64String(publicKey.getModulus().toByteArray());
		String exponent = Base64.encodeBase64String(publicKey.getPublicExponent().toByteArray());

		String message = null;
		String loginFailure = (String) request
				.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		if (loginFailure != null) {
			if (loginFailure.equals("org.apache.shiro.authc.pam.UnsupportedTokenException")) {
				message = "console.captcha.invalid";
			} else if (loginFailure.equals("org.apache.shiro.authc.UnknownAccountException")) {
				message = "console.login.unknownAccount";
			} else if (loginFailure.equals("org.apache.shiro.authc.DisabledAccountException")) {
				message = "console.login.disabledAccount";
			} else if (loginFailure.equals("org.apache.shiro.authc.LockedAccountException")) {
				message = "console.login.lockedAccount";
			} else if (loginFailure.equals("org.apache.shiro.authc.IncorrectCredentialsException")) {
				if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.admin)) {
					message = "console.login.accountLockCount";
				} else {
					message = "console.login.incorrectCredentials";
				}
			} else if (loginFailure.equals("org.apache.shiro.authc.AuthenticationException")) {
				message = "console.login.authentication";
			}
		}
%>
<title>家政服务管理平台</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="author" content="Sencloud Team" />
<meta name="copyright" content="Sencloud" />
<link href="<%=base%>/resources/console/css/common.css" rel="stylesheet"
	type="text/css" />
<link href="<%=base%>/resources/console/css/login.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=base%>/resources/console/js/jquery.1.8.3.js"></script>
<script type="text/javascript"
	src="<%=base%>/resources/console/js/jsbn.js"></script>
<script type="text/javascript"
	src="<%=base%>/resources/console/js/prng4.js"></script>
<script type="text/javascript"
	src="<%=base%>/resources/console/js/rng.js"></script>
<script type="text/javascript"
	src="<%=base%>/resources/console/js/rsa.js"></script>
<script type="text/javascript"
	src="<%=base%>/resources/console/js/base64.js"></script>
<script type="text/javascript"
	src="<%=base%>/resources/console/js/common.js"></script>

<script>
	
	
</script>
<script type="text/javascript">
	$().ready( function() {
		var $loginForm = $("#loginForm");
		var $enPassword = $("#enPassword");
		var $username = $("#username");
		var $password = $("#password");
		var $captcha = $("#captcha");
		var $captchaImage = $("#captchaImage");
		var $isRememberUsername = $("#isRememberUsername");
		// 记住用户名
		if(getCookie("adminUsername") != null) {
			$isRememberUsername.prop("checked", true);
			$username.val(getCookie("adminUsername"));
			$password.focus();
		} else {
			$isRememberUsername.prop("checked", false);
			$username.focus();
		}
		// 更换验证码
		$captchaImage.click( function() {
			$captchaImage.attr("src", "<%=base%>/console/common/captcha.ct?captchaId=<%=captchaId%>&timestamp=" + (new Date()).valueOf());
		});
		// 表单验证、记住用户名
		$loginForm.submit( function() {
			if ($username.val() == "") {
				$.message("warn", "<%=SpringUtils.getMessage("console.login.usernameRequired")%>");
				return false;
			}
			if ($password.val() == "") {
				$.message("warn", "<%=SpringUtils.getMessage("console.login.passwordRequired")%>");
				return false;
			}
			if ($captcha.val() == "") {
				$.message("warn", "<%=SpringUtils.getMessage("console.login.captchaRequired")%>");
				return false;
			}
			
			if ($isRememberUsername.prop("checked")) {
				addCookie("adminUsername", $username.val(), {expires: 7 * 24 * 60 * 60});
			} else {
				removeCookie("adminUsername");
			}
			
			var rsaKey = new RSAKey();
			rsaKey.setPublic(b64tohex("<%=modulus%>"), b64tohex("<%=exponent%>"));
			var enPassword = hex2b64(rsaKey.encrypt($password.val()));
			$enPassword.val(enPassword);
		});
				<%if (message != null) {%>
				$.message("error", "<%=SpringUtils.getMessage(message, setting.getAccountLockCount())%>");
				<%}%>
	});
</script>
<script>
	$(function() {
		if (navigator.userAgent.indexOf("MSIE 6") > -1) {
			//document.location.href = "/file/ie6/ie.html";
			document.end();
		}
		$(".img3").fadeIn(2000);

		setTimeout(function() {
			$(".img3").fadeOut(2000);
			$(".img4").fadeIn(2000);
			$(".loginForm").addClass("wellAppend1");
			$(".loginForm").removeClass("well");
		}, 6000);

		setTimeout(function() {
			$(".img4").fadeOut(2000);
			$(".img5").fadeIn(2000);
			$(".loginForm").addClass("wellAppend2");
			$(".loginForm").removeClass("wellAppend1");
		}, 12000);
		setTimeout(function() {
			$(".img5").fadeOut(2000);
			$(".img6").fadeIn(2000);
			$(".loginForm").addClass("wellAppend3");
			$(".loginForm").removeClass("wellAppend2");
		}, 18000);
		setTimeout(function() {
			$(".img6").fadeOut(2000);
			$(".img3").fadeIn(2000);
			$(".loginForm").addClass("well");
			$(".loginForm").removeClass("wellAppend3");
		}, 24000);//第一次执行一遍
		setInterval(function() {
			var testInt = setInterval(function() {
				$(".img3").fadeIn(2000);
				setTimeout(function() {
					$(".img3").fadeOut(2000);
					$(".img4").fadeIn(2000);
					$(".loginForm").addClass("wellAppend1");
					$(".loginForm").removeClass("well");
				}, 6000);
				setTimeout(function() {
					$(".img4").fadeOut(2000);
					$(".img5").fadeIn(2000);
					$(".loginForm").addClass("wellAppend2");
					$(".loginForm").removeClass("wellAppend1");
				}, 12000);
				setTimeout(function() {
					$(".img5").fadeOut(2000);
					$(".img6").fadeIn(2000);
					$(".loginForm").addClass("wellAppend3");
					$(".loginForm").removeClass("wellAppend2");
				}, 18000);
				setTimeout(function() {
					$(".img6").fadeOut(2000);
					$(".img3").fadeIn(2000);
					$(".loginForm").addClass("well");
					$(".loginForm").removeClass("wellAppend3");
				}, 24000);
				clearInterval(testInt);
				//$(".img6").fadeIn(8000);
			}, 2000);
		}, 24000);//自动切换执行
	});
</script>
<script type="text/javascript">
	//登录页面切换
	function choise() {
		document.getElementById("div_1").style.display = "none";
		document.getElementById("div_3").style.display = "none";
		document.getElementById("section_1").style.display = "none";
		$(".wechatdiv").css("display", "none");
		$(".wechatdivs").css("display", "none");
		document.getElementById("div_2").style.display = "block";
	}
	function help() {
		document.getElementById("div_1").style.display = "none";
		document.getElementById("div_2").style.display = "none";
		document.getElementById("div_3").style.display = "none";
		$(".wechatdiv").css("display", "none");
		$(".wechatdivs").css("display", "none");
		document.getElementById("section_1").style.display = "block";
	}
	function agreement() {
		document.getElementById("div_1").style.display = "none";
		document.getElementById("div_2").style.display = "none";
		document.getElementById("section_1").style.display = "none";
		$(".wechatdiv").css("display", "none");
		$(".wechatdivs").css("display", "none");
		document.getElementById("div_3").style.display = "block";
	}
</script>
<%
	} else {
%>
<title>提示信息 - 家政服务管理平台</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="author" content="Sencloud Team" />
<meta name="copyright" content="Sencloud" />
<link href="<%=base%>/resources/console/css/common.css" rel="stylesheet"
	type="text/css" />
<link href="<%=base%>/resources/console/css/login.css" rel="stylesheet"
	type="text/css" />
<%
	}
%>
</head>
<body>
	<%
		if (applicationContext != null) {
	%>
	<div class="header">
		<div class="wrap">
			<div class="logo">
				<img src="<%=base%>/resources/console/images/login_logo2.png"
					alt="家政服务管理平台" style="height: 80px; width: 300px;" />
			</div>
			<div class="menu">
				<ul>
<%-- 					<li><a href="<%=base%>/console/">首页</a></li> --%>
				</ul>
			</div>
		</div>
	</div>
	<div class="main" id="div_1" style="display: block;">
		<!-- <div class="img1" style="display: block;"></div>
        <div class="img2" style="display: none;"></div> 
        -->
		<div class="img3" style="display: block;"></div>
		<div class="img4" style="display: none;"></div>
		<div class="img5" style="display: none;"></div>
		<div class="img6" style="display: none;"></div>
		<div class="login">
			<div class="row">
				<div class="rowLeft">
					<h1 class="login-header-big"></h1>
				</div>
				<div class="rowRight loginstyle">
					<div class="loginForm well">
						<form id="loginForm" action="login.jsp" method="post"
							class="loginForm">
							<input type="hidden" id="enPassword" name="enPassword" />
							<%
								if (ArrayUtils.contains(setting.getCaptchaTypes(), CaptchaType.consoleLogin)) {
							%>
							<input type="hidden" name="captchaId" value="<%=captchaId%>" />
							<%
								}
							%>
							<div class="login-header">
								家政服务管理平台
							</div>
							<fieldset>
								<section> <label class="input"> <input
									type="text" id="username" name="username" class="user_input"
									maxlength="20"
									placeholder="<%=SpringUtils.getMessage("console.login.username")%>" />
								</label> </section>
								<section> <label class="input"> <input
									type="password" id="password" class="user_input" maxlength="20"
									autocomplete="off"
									placeholder="<%=SpringUtils.getMessage("console.login.password")%>" />
								</label> </section>
								<%
									if (ArrayUtils.contains(setting.getCaptchaTypes(), CaptchaType.consoleLogin)) {
								%>
								<section> <label class="input"> <input
									type="text" id="captcha" name="captcha"
									class="captchaText captcha" maxlength="4" autocomplete="off"
									placeholder="<%=SpringUtils.getMessage("console.captcha.name")%>" />
									<img id="captchaImage" class="captchaImage"
									src="<%=base%>/console/common/captcha.ct?captchaId=<%=captchaId%>"
									title="<%=SpringUtils.getMessage("console.captcha.imageTitle")%>" />
								</label> </section>
								<%
									}
								%>
							</fieldset>
							<footer> <label> <input type="checkbox"
								id="isRememberUsername" value="true" /> <%=SpringUtils.getMessage("console.login.rememberUsername")%>
							</label> <input type="submit" class="loginButton"
								value="<%=SpringUtils.getMessage("console.login.login")%>" />
							<div class="link">
								强烈建议使用 <a target="_blank"
									href="http://rj.baidu.com/soft/detail/14744.html?ald"> <img
									width="18px" height="18px"
									src="<%=base%>/resources/console/images/Google.png" alt="">谷歌浏览器
								</a> <a target="_blank" href="http://www.firefox.com.cn/download/">
									<img width="18px" height="18px"
									src="<%=base%>/resources/console/images/firefox.png" alt="">火狐浏览器
								</a>
							</div>
							</footer>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- IE版本过低 start -->
	<div id="bodyMask" style="display: none;"></div>
	<div id="bodyMask2" style="display: none;"></div>
	<div id="browser" class="layerDiv" jQuery19103044797775550879="18">
		<h2>噢，您是否知道您正在使用浏览器无法支持我们的页面？</h2>
		<h3>很抱歉，由于采用了HTML5，当前浏览器无法完美的呈现该页面。</h3>
		<div>
			<span>如果你还不知道什么是HTML5标准，请看<a
				href="http://zh.wikipedia.org/wiki/HTML5" target="_blank">维基百科</a></span>
			建议您使用以下浏览器最新版本
		</div>
		<ul>
			<li><a target="_blank"
				href="http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html"
				class="icoChrom" title="谷歌Chrome浏览器"></a></li>
			<li><a target="_blank" href="http://www.opera.com/zh-cn"
				class="icoOpera" title="Opera浏览器"></a></li>
			<li><a target="_blank" href="http://www.firefox.com.cn/"
				class="icoFirefox" title="火狐浏览器"></a></li>
			<li><a target="_blank" href="http://www.apple.com/cn/safari/"
				class="icosafari" title="safari浏览器"></a></li>
		</ul>
		<p>
			<a class="ico icoGt" onclick="knowStillOpen()">知道了但是还是请打开页面</a>
		</p>
	</div>
	<!-- IE版本过低 end-->

	<!-- 使用协议end -->
	<div class="footer">
		<div class="wrap">
<%-- 			<a href="<%=base%>/front/link/useAgreement.ct">使用协议</a>  --%>
			<span>
				XXX电子科技有限公司版权所有 © 2017-2018&nbsp;&nbsp;XXX备15011832号</span>
		</div>
	</div>
	<%
		} else {
	%>
	<fieldset>
		<legend>系统出现异常</legend>
	</fieldset>
	<%
		}
	%>
</body>
</html>