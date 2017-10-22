[#if notifyMessage??]
${notifyMessage}
[#else]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("shop.payment.notify")}[#if systemShowPowered] - 家政服务平台[/#if]</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		<div class="span24" style="text-align: center;margin-top: 50%;">
			<div class="title">
				[#if payment.status == "1"]
					${message("shop.payment.waitTitle")}
				[#elseif payment.status == "2"]
					[#if payment.type == "1"]
						${message("shop.payment.orderTitle")}
					[/#if]
				[#elseif payment.status == "3"]
					${message("shop.payment.failureTitle")}
				[/#if]
			</div>
			<div class="bottom">
				[#if payment.type == "1"]
					<a href="${base}/mobile/member/index.jhtml">${message("shop.payment.viewOrder")}</a>
				[/#if]
				| <a href="${base}/mobile/mobileIndex.jhtml">${message("shop.payment.index")}</a>
			</div>
		</div>
  	[#include "/mobile/include/footer_2.ftl" /]
	</div>
  
</body>
</html>
[/#if]