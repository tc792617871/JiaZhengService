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
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("个人资料");
	$(".header_2 .cart_area").remove();
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
			<div class="moMobileContent">
			    <ul class="vipCardInfo">
			        <li>
			            <lable>
			                用户：
			            </lable>
			            <span>
			                ${member.name}
			            </span>
			        </li>
			        <li>
			            <lable>
			                电话：
			            </lable>
			            <span>
			               ${member.mobile}
			            </span>
			        </li>
			        <li>
			            <lable>
			                地址：
			            </lable>
			            <span>
			               ${receiver.areaName!'-'}${receiver.address!'-'}
			            </span>
			        </li>
			    </ul>
			    <!--<button  style="margin-top: 10px;" onClick="window.location='${base}/mobile/member/editPersonalInfo.jhtml?id=${member.id}'">修改</button>-->
			</div>	
					
	     [#include "/mobile/include/footer_2.ftl" /]
	</div>
</body>
</html>