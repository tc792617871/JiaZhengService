<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>贵宾卡绑定</title>
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

	$bindVipCardBtn = $("#bindVipCardBtn");
	$userVipUserName = $("#userVipUserName");
	$userVipMobile = $("#userVipMobile");
	$userVipCardNumber = $("#userVipCardNumber");
	$bindVipCardBtn.click(function(){
        var vipCardNumber = $("#userVipCardNumber");
    	var vipUserName = $("#userVipUserName");
    	var vipMobile = $("#userVipMobile");
    	activationVipInfo(vipCardNumber.val(),vipUserName.val(),vipMobile.val());
	}); 
	m$.header.titleContent.setTitle("贵宾卡绑定");
}); 

	/**
	 * 绑定Vip卡
	 */
	function activationVipInfo(vipCardNumber,vipUserName,vipMobile){
		if(!vipUserName){
			 m$.ui.dialog.dialogShow({
	         'title': '提示',
	         'content': '姓名不能为空'
	        },
	        [{
	         'text': '确定'
	        }]);
		    return false;
		}
		if(!vipMobile){
			m$.ui.dialog.dialogShow({
	         'title': '提示',
	         'content': '手机号码不能为空'
	        },
	        [{
	         'text': '确定'
	        }]);
		    return false;
		}
		if(!vipCardNumber){
		    m$.ui.dialog.dialogShow({
	         'title': '提示',
	         'content': 'VIP卡号不能为空'
	       },
	       [{
	         'text': '确定'
	       }]);
		    return false;
		}
		var userName = getCookie("username");
		$.ajax({
			url: moshop.base+"/mobile/member/bindVipCard.jhtml",
			type: "POST",
			data: {
			    vipCardNumber:vipCardNumber,
		        vipUserName:vipUserName,
		        vipMobile:vipMobile,
		        userName:userName
			},
			dataType: "json",
			cache: false,
			success: function(message) {
		        if(message.type == "success"){
		            m$.ui.dialog.dialogShow({
			         'title': '提示',
			         'content': message.content
			        },
			        [{
			         'text': '确定',
			         'func': function(){
			              window.location.href = moshop.base + "/mobile/member/vipCardInfo.jhtml";
			          }
			        }]);
		        }
		        else{
			        m$.ui.dialog.dialogShow({
			         'title': '提示',
			         'content': message.content
			        },
			        [{
			         'text': '确定'
			        }]);
		        }
			}
		});
} 

</script>

<style type="text/css">

	.iconImg {
		display:inline;
		vertical-align : middle;
	}
	
	.bindVipCardInfo li{
		margin : 10px;
	}
	
	.fontClass {
		font-size : 12px;
	}
	
</style>
</head>
<body class="body_margin">
	<div class="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->		
			<div class="moMobileContent">
			    <img src="${base}/resources/mobile/images/vipcard.png" width="100%;">
			    <ul class="bindVipCardInfo">
			         <li>
			             <table cellpadding="0" cellspacing="0" border="0">
			                 <tr>
			                     <td style="width: 50px;">
			                         <img src="${base}/resources/mobile/images/nameIcon.png"/>
			                     </td>
			                      <td>
			                         <input type="text" id="userVipUserName" name="userVipUserName" placeholder="&nbsp;&nbsp;姓名" class="box_input" />
			                     </td>
			                 </tr>
			             </table>
			        </li>
			        <li>
			             <table cellpadding="0" cellspacing="0" border="0">
			                 <tr>
			                     <td style="width: 50px;">
			                        <img src="${base}/resources/mobile/images/phoneIcon.png"/>
			                     </td>
			                      <td>
			                        <input type="text" id="userVipMobile" name="userVipMobile" placeholder="&nbsp;&nbsp;手机号码" class="box_input"/>
			                     </td>
			                 </tr>
			             </table>
			        </li>
			         <li>
			            <table cellpadding="0" cellspacing="0" border="0">
			                 <tr>
			                     <td style="width: 50px;">
			                        <img src="${base}/resources/mobile/images/cardIcon.png" class="iconImg">
			                     </td>
			                      <td>
			                        <input type="text" id="userVipCardNumber" name="userVipCardNumber" placeholder="&nbsp;&nbsp;VIP卡号" class="box_input" />
			                     </td>
			                 </tr>
			             </table>
			        </li>
			        <li class="fontClass">
			            <lable>
			                * 请填写开卡时所登记的姓名/手机/VIP卡号
			            </lable>
			        </li>
			         <li class="fontClass">
			            <button  type="button" id="bindVipCardBtn">绑定</button>
			        </li>
			    </ul>
			</div>	
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
       <!-- /footer -->
	</div>
</body>
</html>