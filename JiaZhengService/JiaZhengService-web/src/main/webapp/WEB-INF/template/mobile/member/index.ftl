<!DOCTYPE html> 
<html>
<head>
<title>我的账户</title>
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
	m$.header.titleContent.setTitle("我的账户");
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header.ftl" /]
		<div class="moMobileContent">
			<div  style="text-align:center;margin-bottom: 35px;">
				<span>${member.email}</span>
			</div>
			<ul class="personalInfo">
			    <li>
			    </li>
			</ul>						
			<div class="myaccount-btn">
				<button onClick="window.location='${base}/mobile/login/logout.jhtml';">退出</button>
			</div>
		</div>
	   [#include "/mobile/include/footer.ftl" /]
	</div>
</body>
</html>