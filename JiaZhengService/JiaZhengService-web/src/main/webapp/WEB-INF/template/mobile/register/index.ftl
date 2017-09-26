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
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jsbn.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/prng4.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/rng.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/rsa.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/base64.js"></script>
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
				<div class="box">
					<input type="email" id="email" name="email" placeholder="&nbsp;&nbsp;电子邮箱" class="box_input"/>
				</div>
				<div class="box">
					<input type="number" id="mobile" name="mobile" placeholder="&nbsp;&nbsp;手机号码" class="box_input"/>
				</div>
				<div class="box">
					<input type="password" id="password" name="password" placeholder="&nbsp;&nbsp;密码" class="box_input"/>
				</div>
				<div class="box">
					<input type="password" name="confirmPsd" id="confirmPsd" placeholder="&nbsp;&nbsp;确认密码" class="box_input"/>
				</div>
				<div class="box">
					<input type="text" id="name" name="name" placeholder="&nbsp;&nbsp;姓名" class="box_input"/>
				</div>
				<div class="box">
					<input type="text" id="address" name="address" placeholder="&nbsp;&nbsp;地址" class="box_input"/>
				</div>
				<div class="box" style="margin-top: 20px;">
					<button type="button" id="registerSubmit">存储</button>
				</div>
			</div>		
		</form>
       [#include "/mobile/include/footer_2.ftl" /]
    </div>
</body>
</html>