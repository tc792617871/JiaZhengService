<!DOCTYPE html> 
<html>
<head>
<title>更改密码</title>
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
	m$.header.titleContent.setTitle("更改密码");
	setInterval(function () {
	   m$.ui.fixed.fixedBody($('#bdmg'));
	}, 500);
	
	setInterval(function () {
	   m$.ui.fixed.fixedTop($('#header'));
	}, 500);
	
	setInterval(function () {
	   m$.ui.fixed.fixedWatch($('#footer'));
	}, 500);
});

function btnClick(){
    var oldPassword = $("#oldPassword").val();
    var newPassword = $("#newPassword").val();
    var confirmPassword = $("#confirmPassword").val();
    m$.myAccount.changePasssword.show(oldPassword,newPassword,confirmPassword);
}

</script>
</head>
<body class="body_margin" id='bdmg'>
	<div class="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->		
		<div class="moMobileContent">
			<div class="box">
				<input type="password" id="oldPassword" value="" class="box_input" placeholder="&nbsp;&nbsp;输入原始密码"/>
			</div>
			<div class="box">
				<input type="password" id="newPassword" value="" class="box_input" placeholder="&nbsp;&nbsp;输入新密码"/>
			</div>
			<div class="box">
				<input type="password" id="confirmPassword" value="" class="box_input" placeholder="&nbsp;&nbsp;再次输入新密码"/>
			</div>
			<div class="box" style="margin-top: 60px;">
				<button onClick="btnClick()">确认</button>
			</div>
		</div>
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->
	</div>
</body>
</html>