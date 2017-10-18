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
<link rel="${base}/resources/mobile/css/swipe-left-right.css"rel="stylesheet" type="text/css" />
<link href="${base}/resources/mobile/css/register.css" rel="stylesheet" type="text/css" />
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
	m$.header.titleContent.setTitle("注册");
	$(".header_2 .cart_area").remove();
	$(".header_2 .home_area").remove();
	
	var $registerSubmit = $("#registerSubmit");
	$registerSubmit.click(function(){
		m$.register.registerUser.submit();
	});
});
</script>
</head>
<body class="body_margin" id='bdmg'>
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
		<form id="registerForm" action="${base}/mobile/register/registSubmit.jhtml" method="get" >
			<div class="moMobileContent">
				<div class="box" style="margin-top: 10px;">
					<input type="number" id="mobile" name="mobile" placeholder="手机号码" class="box_input" style="width:100%;"/>
				</div>
				<div class="box">
            		<div style="width:58%;float:left;">
            			<input type="text" id="validateCode" name="validateCode" placeholder="验证码" class="box_input" style="width:100%;"/>
            		</div>
            		<div style="width:42%;float:left;">
            			<button type="button" onclick="m$.register.registerUser.getRegisterValidateCode(60)" id="getValidateCode">获取验证码</button>
        			</div>
				</div>
				<div class="box">
					<input type="password" id="password" name="password" placeholder="密码" class="box_input" style="width:100%;"/>
				</div>
				<div class="box">
					<input type="password" name="confirmPsd" id="confirmPsd" placeholder="确认密码" class="box_input" style="width:100%;"/>
				</div>
				<div class="box">
					<input type="text" id="name" name="name" placeholder="姓名" class="box_input" style="width:100%;"/>
				</div>
				<div class="box">
					<button type="button" id="registerSubmit">存储</button>
				</div>
			</div>		
		</form>
    </div>
</body>
</html>