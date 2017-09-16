<!DOCTYPE html> 
<html>
<head>
<title>新增地址</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function(){ 
   $("#modify_orderAreaId").lSelect({
	    url: "${base}/common/area.jhtml"
	});
	setInterval(function () {
	  m$.ui.fixed.fixedTop($('#header'));
	}, 500);
	setInterval(function () {
	  m$.ui.fixed.fixedBody($('#bdmg'));
	}, 500);
	setInterval(function () {
	  m$.ui.fixed.fixedWatch($('#footer'));
	}, 500);
	
	m$.header.titleContent.setTitle("新增寄送地址");
 });
 
function addNewAddress(){
   var $receiverModifyAreaSpan = $("#receiverModifyAreaSpan");
   var $areaSelects = $receiverModifyAreaSpan.find("select");
   m$.myAccount.modifyAddress.addAddress($receiverModifyAreaSpan,$areaSelects);
}
 
</script>
</head>
<body class="body_margin" id='bdmg'>
	<div class="fullscreen" id="fullscreen">
	    <!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->		
		<div style="margin: 40px 12px 20% 12px;">
		    <form id="receiverFormModify" action="${base}/mobile/member/submitNewAddress.jhtml" method="post" novalidate="novalidate">
		    	<div class="box">
					<span class="fieldSet" id="receiverModifyAreaSpan">
						<input type="hidden" id="modify_orderAreaId" name="modify_orderAreaId" treePath="${receiver.area.treePath}"/>
					</span>
				</div>
				<div class="box">
					<input type="text" name="address" id="address" class="box_input" placeholder="&nbsp;&nbsp;寄送地址"/>
				</div>
				<div class="box">
					<input type="text" name="consignee"  id="consignee"  class="box_input" placeholder="&nbsp;&nbsp;收货人"/>
				</div>
				<div class="box">
					<input type="text" name="phone" id="phone"   class="box_input" placeholder="&nbsp;&nbsp;手机号码"/>
				</div>
				<div class="box">
					<input type="text" name="zipCode"  id="zipCode"  class="box_input" placeholder="&nbsp;&nbsp;邮编"/>
				</div>
				<div class="address-btn">
					<input type="button" name="btn-confirm" value="确认" class="box-button" onClick="addNewAddress()"/>
				</div>
		    </form>	
		</div>
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->
	</div>
</body>
</html>