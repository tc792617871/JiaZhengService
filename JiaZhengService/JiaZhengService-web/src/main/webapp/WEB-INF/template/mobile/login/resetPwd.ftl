<!DOCTYPE html> 
<html>
<head>
<title>重置密码</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/jsbn.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/prng4.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/rng.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/rsa.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/base64.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>

<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle('重置密码');
	$("#resetPasswordBtn").click(function(){
	        submitReset();
	 });
});
function submitReset() {
    $.ajax({
        url: moshop.base + "/common/public_key.jhtml",
        type: "GET",
        dataType: "json",
        cache: false,
        success: function (data) {
            var rsaKey = new RSAKey();
            rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
            var enNewPassword = hex2b64(rsaKey.encrypt($("#newPassword").val()));
            if ($("#newPassword").val().length < 1 || $("#newPassword").val().length > 117) {
                m$.ui.dialog.dialogShow({
                    'title': '提示',
                    'content': '${message("shop.common.invalid")}'
                }, [{
                    'text': '确定'
                }]);
                return false;
                $("#newPassword").focus();
                return;
            }
            if ($("#newPassword").val() != $("#agNewPassword").val()) {
                m$.ui.dialog.dialogShow({
                    'title': '提示',
                    'content': '密码不一致'
                }, [{
                    'text': '确定'
                }]);
                return false;
                $("#agNewPassword").focus();
            } else {
                $.ajax({
                    url: $("#resetPasswordForm").attr("action"),
                    type: "POST",
                    dataType: "json",
                    cache: false,
                    data: {
                        uid: $("#memeberId").val(),
                        newPassword: enNewPassword,
                        key: $("#key4user").val()
                    },
                    beforeSend: function () {
                        $("#resetPasswordBtn").prop("disabled", true);
                    },
                    success: function (message) {
                        if (message.type == "success") {
                            $("#resetPasswordBtn").prop("disabled", false);
                            cookie('validateCode', '');
                            cookie('phoneNumber', '');
                            m$.ui.dialog.dialogShow({
                                'title': '提示',
                                'content': '${message("shop.resetpassword.success")}'
                            }, [{
                                'text': '确定',
                                'func': function () {
                                    window.location.href = moshop.base + "/mobile/login/index.jhtml";
                                }
                            }]);
                        } else {
                            m$.ui.dialog.dialogShow({
                                'title': '提示',
                                'content': message.content
                            }, [{
                                'text': '确定'
                            }]);
                            return;
                        }
                    }
                });
            }
        }
    });
}
</script>

</head>
<body class="body_margin" id='bdmg'>
	<div class="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->	
			<div class="moMobileContent">
			   <form id="resetPasswordForm" action="${base}/login/resetPasswordSubmit.jhtml" method="post">
			         <input type="hidden" id="phoneNumber" name="phoneNumber" value="${phoneNumber}" />
			        <input type="hidden" id="validateCode" name="validateCode" value="${validateCode}"/>
			        <input type="hidden" id="memeberId" value="${member.id}">
			        <input type="hidden" id="key4user" name="key" value="${key}" />
					<ul style="line-height: 50px;">
					    <li>
					       <input type="password" id="newPassword" name="newPassword" placeholder="新密码" class="box_input"/>
					    </li>
					    <li>
					       <input type="password" id="agNewPassword" name="agNewPassword" placeholder="再次输入新密码" class="box_input"/>
					    </li>
					    <li>
					        <button type="button" id="resetPasswordBtn">提交</button>
					    </li>
					</ul>
				</form>
			</div>
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->
	</div>
</body>
</html>