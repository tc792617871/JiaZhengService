<!DOCTYPE html> 
<html>
<head>
<title>${setting.siteName}</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/jsbn.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/prng4.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/rng.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/rsa.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/base64.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>

<script type="text/javascript">
$().ready(function() {
	var $loginSubmit = $("#loginSubmit");
	var $loginForm = $("#loginForm");
	m$.header.titleContent.setTitle('登录/注册');
	$(".header_2 .cart_area").remove();
	$(".header_2 .home_area").remove();
	
	$loginSubmit.click(function(){
	    var redirectUrl = "${redirectUrl}";
		m$.business.login.loginSubmit(redirectUrl);
	});
	
	$loginForm.keydown(function(event){
    	if(event.keyCode == 13){ 
		   var redirectUrl = "${redirectUrl}";
		   m$.business.login.loginSubmit(redirectUrl);
    	}
    });
});
</script>

</head>
<body class="body_margin" id='bdmg'>
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
		<div class="moMobileContent">
		    <form id="loginForm" action="${base}/mobile/login/loginSubmit.jhtml" method="post">
				<div class="already-registered">
					<span>我已注册</span>
				</div>
				<div class="box">
				    <input type="hidden" id="openId" name="openId" value="${openId}"/>
					<input type="text" id= "username" name="username" placeholder="手机号码" class="box_input"/>
				</div>
				<div class="box">
					<input type="password" id= "password" name="password" placeholder="密码" class="box_input"/>
				</div>
				<div class="box">
				    <button type="button" id="loginSubmit">登录</button>
				</div>
				<div class="box">
				    <a style="color: #BBB5B5; text-decoration: underline;font-size: 12px;" href="${base}/mobile/login/forgetPwd.jhtml">忘记密码？</a>
				</div>
			</form>
			<div style="margin-bottom:10px;margin-top: 50px;">
				<span class="box-span">我要注册</span>
			</div>
			<div class="box">
				<button onClick="location.href='${base}/mobile/register/index.jhtml'">创建用户名</button>
			</div>
		</div>
    	[#include "/mobile/include/footer_2.ftl" /]
	</div>
</body>
</html>