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
<link href="${base}/resources/mobile/css/article.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function(){ 
    m$.header.titleContent.setTitle("联系我们");
    $(".header_2 .cart_area").remove();
 });
 
 </script>
</head>
<body class="body_margin">
		
<div id="bigview" style="overflow:hidden;" class="fullview">
	[#include "/mobile/include/header_2.ftl" /]
	<div class="content">
		<div id="article_area">
			<p>感谢您的使用，有任何问题可联系客服，我们将竭诚为您服务。</p>
			<p align=center>客服电话：
				<a href="tel:400-9981-000">
					<font color=#0066cc>400-9981-555</font>
				</a>
			</p>
		</div>	
	</div>
</div>
</body>
</html>