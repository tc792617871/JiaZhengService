<!DOCTYPE html> 
<html>
<head>
<title>登陆资料</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("登陆资料");
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->
		<div class="moMobileContent">
			<button  style="margin-top: 10px;" onClick="window.location='${base}/mobile/member/changeEmail.jhtml'">更改电子邮箱</button>
			
			<button  style="margin-top: 10px;" onClick="window.location='${base}/mobile/member/changePhoneNum.jhtml'">更改手机号码</button>
		</div>
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->	
	</div><!-- /page -->
</body>
</html>