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
<link href="${base}/resources/mobile/css/personalInfo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("我的账户");
	$(".header_2 .cart_area").remove();
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
		<div class="moMobileContent">
			<div class="chief_info_area">
				<div class="chief_info">
					<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487560983465/钟点保洁.jpg#钟点保洁.jpg">
					<span class="title">xxxxx</span>
					<span class="description">把时间留给自己，把打扫交给我们</span>
				</div>
			</div>
			<ul class="personalInfo">
			    <li onclick="window.location='${base}/mobile/member/myOrder.jhtml'">
			        <table>
			            <tr>
			            	<td>
			                    <img src="${base}/resources/mobile/icons/document.png" class="personal-icon"/>
			                    <span class="tableSpan">我的订单</span>
			                </td>
			                 <td>
			                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="personal-right-arrow"/>
			                </td>
			            </tr>
			        </table>
			    </li>
			    <li onclick="window.location='${base}/mobile/member/myOrder.jhtml'">
			        <table>
			            <tr>
			            	<td>
			                    <img src="${base}/resources/mobile/icons/money.png" class="personal-icon"/>
			                    <span class="tableSpan">优惠券</span>
			                </td>
			                 <td>
			                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="personal-right-arrow"/>
			                </td>
			            </tr>
			        </table>
			    </li>
			    <li onclick="window.location='${base}/mobile/member/myOrder.jhtml'">
			        <table>
			            <tr>
			            	<td>
			                    <img src="${base}/resources/mobile/icons/money.png" class="personal-icon"/>
			                    <span class="tableSpan">领券中心</span>
			                </td>
			                 <td>
			                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="personal-right-arrow"/>
			                </td>
			            </tr>
			        </table>
			    </li>
		    </ul>
		    <ul class="personalInfo">
			    <li onclick="window.location='${base}/mobile/member/sendAddress.jhtml'">
			        <table>
			            <tr>
			            	<td>
			                    <img src="${base}/resources/mobile/icons/location_icon_mobile.png" class="personal-icon"/>
			                	<span class="tableSpan">寄送地址</span>
			                </td>
			                 <td>
			                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="personal-right-arrow"/>
			                </td>
			            </tr>
			        </table>
			    </li>
			    <li onclick="window.location='${base}/mobile/member/personalInfo.jhtml'">
			        <table>
			            <tr>
			            	<td>
			                    <img src="${base}/resources/mobile/icons/man.png" class="personal-icon"/>
			                    <span class="tableSpan">个人资料</span>
			                </td>
			                 <td>
			                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="personal-right-arrow"/>
			                </td>
			            </tr>
			        </table>
			    </li>
			    <li onclick="window.location='${base}/mobile/member/loginInfo.jhtml'">
			        <table>
			            <tr>
			            	<td>
			                    <img src="${base}/resources/mobile/icons/man.png" class="personal-icon"/>
			                    <span class="tableSpan">登录资料</span>
			                </td>
			                 <td>
			                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="personal-right-arrow"/>
			                </td>
			            </tr>
			        </table>
			    </li>
			    <li onclick="window.location='${base}/mobile/member/changePassword.jhtml'">
			        <table>
			            <tr>
			            	<td>
			                    <img src="${base}/resources/mobile/icons/key.png" class="personal-icon"/>
			                    <span class="tableSpan">更改密码</span>
			                </td>
			                 <td>
			                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="personal-right-arrow"/>
			                </td>
			            </tr>
			        </table>
			    </li>
		    </ul>
		    <ul class="personalInfo">
		    	<li onclick="window.location='${base}/mobile/member/contactUs.jhtml'">
			        <table>
			            <tr>
			            	<td>
			                    <img src="${base}/resources/mobile/icons/news.png" class="personal-icon"/>
			                    <span class="tableSpan">使用帮助</span>
			                </td>
			                 <td>
			                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="personal-right-arrow"/>
			                </td>
			            </tr>
			        </table>
			    </li>
			    <li onclick="window.location='${base}/mobile/member/contactUs.jhtml'">
			        <table>
			            <tr>
			            	<td>
			                    <img src="${base}/resources/mobile/icons/news.png" class="personal-icon"/>
			                    <span class="tableSpan">联系我们</span>
			                </td>
			                 <td>
			                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="personal-right-arrow"/>
			                </td>
			            </tr>
			        </table>
			    </li>
			</ul>						
			<div class="quit-btn">
				<button onClick="window.location='${base}/mobile/login/logout.jhtml';">退出</button>
			</div>
		</div>
	</div>
</body>
</html>