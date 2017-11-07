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
<link href="${base}/resources/mobile/css/coupon.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	m$.header.titleContent.setTitle("我的账户");
	$(".header_2 .cart_area").remove();
	$(".header_2 .home_area").remove();
	
	[@flash_message /]

});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
		<div class="moMobileContent">
			<ul class="couponsEntry">
				[#if couponCodes ?? && (couponCodes?size>0)]
					[#list couponCodes as couponCode]
					<li dataid="${couponCode.code}" dataval="${couponCode.couponName}">
					    <a href="javascript:;">
					        <img src="${base}/resources/mobile/images/coupon.png" />
					        <p>${couponCode.couponName}</p>
					        <p>${couponCode.couponBeginDate?string("yyyy-MM-dd HH:mm:ss")}</p>
					        <p>${couponCode.couponEndDate?string("yyyy-MM-dd HH:mm:ss")}</p>
					    </a>
					    <i></i>
					</li>
					[/#list]
				[#else]
					<p style="text-align: center;font-size: 16px;">暂无优惠券</p>
				[/#if]
			</ul>
		</div>
		[#include "/mobile/include/footer_2.ftl" /]
	</div>
</body>
</html>