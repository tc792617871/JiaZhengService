<!DOCTYPE html> 
<html>
<head>
<title>更改电子邮箱</title>
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
	m$.header.titleContent.setTitle("更改电子邮箱");
	setInterval(function () {
	   m$.ui.fixed.fixedBody($('#bdmg'));
	}, 500);
	
	setInterval(function () {
	   m$.ui.fixed.fixedTop($('#header'));
	}, 500);
	
	setInterval(function () {
	   m$.ui.fixed.fixedWatch($('#footer'));
	}, 500);
	
	$inputs = $("input");
	$inputs.each(function(){
		$(this).keydown(function(event){
			if(event.keyCode == 13){ 
		   		btnClick();
    		}
		});
	});
});

function btnClick(){
    var password = $("#password").val();
    var newEmail = $("#newEmail").val();
    var confirmEmail = $("#confirmEmail").val();
    m$.myAccount.changeEmail.submit(password,newEmail,confirmEmail);
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
				<input type="password" id="password" value="" class="box_input" placeholder="&nbsp;&nbsp;密码"/>
			</div>
			<div class="box">
				<input type="text" id="newEmail" value="" class="box_input" placeholder="&nbsp;&nbsp;新电子邮件"/>
			</div>
			<div class="box">
				<input type="text" id="confirmEmail" value="" class="box_input" placeholder="&nbsp;&nbsp;新电子邮件确认"/>
			</div>
			<div class="box" style="margin-top: 60px;">
				<button onClick="btnClick()">保存</button>
			</div>
		</div>
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->
	</div>
</body>
</html>