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
	m$.header.titleContent.setTitle('找回密码');
});
</script>

</head>
<body class="body_margin" id='bdmg'>
	<div class="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->	
			<div class="moMobileContent">
				<ul style="line-height: 50px;">
				    <li>
				        <table style="width: 100%;">
				            <tr>
				                <td colspan="2">
				                     <input type="text" id="phoneNumber" name="phoneNumber" placeholder="手机号码" class="box_input"/>
				                </td>
				            </tr>
				            <tr>
				                <td>
				                    <input type="text" id="validateCode" name="validateCode" placeholder="验证码" class="box_input"/>
				                </td>
				                <td>
				                    <button type="button" onclick="m$.register.registerUser.getValidateCode(60)" style="width: 95%;" id="getValidateCode">获取验证码</button>
				                </td>
				            </tr>
				        </table>
				    </li>
				     <li>
				        <button  type="button" onclick="m$.register.registerUser.forgetPwdNext()" id="forgetPwdNext">下一步</button>
				    </li>
				</ul>
			</div>
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->
	</div>
</body>
</html>