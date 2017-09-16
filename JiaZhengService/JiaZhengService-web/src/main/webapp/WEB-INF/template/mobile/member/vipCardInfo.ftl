<!DOCTYPE html> 
<html>
<head>
<title>贵宾卡</title>
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
	m$.header.titleContent.setTitle("贵宾卡");
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->		
			<div class="moMobileContent">
			    <ul class="vipCardInfo">
			        <li>
			            <lable>
			                等级：
			            </lable>
			            <span>
			                ${member.getMemberRank().getName()}
			            </span>
			        </li>
			         <li>
			            <lable>
			                贵宾卡号码：
			            </lable>
			            <span>
			                ${(member.getVipNumber())!"暂未绑定"}
			                <a id='bindVipCardBtn' href='viewBindVipCard.jhtml' class='bindVipCard'>绑定VIP卡号?</a>
			            </span>
			        </li>
			        <li>
			            <lable>
			                购物积分记录：
			            </lable>
			            <span>
			               ${member.getPoint()}
			            </span>
			        </li>
			        <li>
			            <lable>
			                享受折扣：
			            </lable>
			            <span>
			               [#if member.getMemberRank().getScale() == 1]
							    无折扣
						   [#else]
								${(member.getMemberRank().getScale())*10 }${message("Order.scale")}
						   [/#if]
			            </span>
			        </li>
			    </ul>
			</div>	
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
       <!-- /footer -->
	</div>
</body>
</html>