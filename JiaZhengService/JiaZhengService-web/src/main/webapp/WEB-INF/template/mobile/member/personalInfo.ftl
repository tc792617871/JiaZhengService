<!DOCTYPE html> 
<html>
<head>
<title>个人资料</title>
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
			                用户：
			            </lable>
			            <span>
			                ${member.name}
			            </span>
			        </li>
			         <li>
			            <lable>
			                邮箱：
			            </lable>
			            <span>
			               ${member.email}
			            </span>
			        </li>
			        <li>
			            <lable>
			               性别：
			            </lable>
			            <span>
			              ${member.gender}
			            </span>
			        </li>
			        <li>
			            <lable>
			                生日：
			            </lable>
			            <span>
			               ${member.birth}
			            </span>
			        </li>
			        <li>
			            <lable>
			               身高：
			            </lable>
			            <span>
			               ${member.height}
			            </span>
			        </li>
			        <li>
			            <lable>
			               体重：
			            </lable>
			            <span>
			               ${member.weight}
			            </span>
			        </li>
			        <li>
			            <lable>
			                三围：
			            </lable>
			            <span>
			                [#if member.bust ] 
						        ${member.bust}
							[#else] 
							   00
							[/#if] 
						    /
						    [#if member.waist ] 
						       ${member.waist}
							[#else] 
							   00
							[/#if] 
						    /
						    [#if member.hip ] 
						       ${member.hip}
							[#else] 
							   00
							[/#if]
			            </span>
			        </li>
			        <li>
			            <lable>
			               年龄：
			            </lable>
			            <span>
			               ${member.age}
			            </span>
			        </li>
			        <li>
			            <lable>
			                职业：
			            </lable>
			            <span>
			               ${member.occupation.name}
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
			               ${member.address}
			            </span>
			        </li>
			        <li>
			            <lable>
			                居住国家：
			            </lable>
			            <span>
			               ${member.country}
			            </span>
			        </li>
			         <li>
			            <lable>
			                主要语言：
			            </lable>
			            <span>
			              ${member.languagePreference.languageName}
			            </span>
			        </li>
			    </ul>
			    <button  style="margin-top: 10px;" onClick="window.location='${base}/mobile/member/editPersonalInfo.jhtml?id=${member.id}'">修改</button>
			</div>	
					
		<!-- footer -->
	     [#include "/mobile/include/footer.ftl" /]
        <!-- /footer -->
	</div><!-- /page -->
</body>
</html>