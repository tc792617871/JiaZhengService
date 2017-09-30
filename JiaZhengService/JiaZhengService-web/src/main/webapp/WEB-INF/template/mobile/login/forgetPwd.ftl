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
<link href="${base}/resources/mobile/css/login.css" rel="stylesheet" type="text/css" />
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
	m$.header.titleContent.setTitle('找回密码');
	$(".header_2 .cart_area").remove();
	$(".header_2 .home_area").remove();
});
</script>

</head>
<body class="body_margin" id='bdmg'>
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
			<div class="moMobileContent">
            	<div class="box" style="margin-top:10px;">
            		<input type="text" id="phoneNumber" name="phoneNumber" placeholder="手机号码" class="box_input" style="width:100%;"/>
        		</div>
            	<div class="box">
            		<div style="width:58%;float:left;">
            			<input type="text" id="validateCode" name="validateCode" placeholder="验证码" class="box_input" style="width:100%;"/>
            		</div>
            		<div style="width:42%;float:left;">
            			<button type="button" onclick="m$.register.registerUser.getValidateCode(60)" id="getValidateCode">获取验证码</button>
        			</div>
				</div>
				<div class="box">
					<button  type="button" onclick="m$.register.registerUser.forgetPwdNext()" id="forgetPwdNext">下一步</button>
				</div>
			</div>
	    [#include "/mobile/include/footer_2.ftl" /]
	</div>
</body>
</html>