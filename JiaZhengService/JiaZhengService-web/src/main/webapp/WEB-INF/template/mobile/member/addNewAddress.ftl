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
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function(){ 
   $("#modify_orderAreaId").lSelect({
	    url: "${base}/mobile/common/area.jhtml"
	});
	m$.header.titleContent.setTitle("新增寄送地址");
	$(".header_2 .cart_area").remove();
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
		[#include "/mobile/include/header_2.ftl" /]
		<div class="moMobileContent">
		    <form id="receiverFormModify" method="post">
		    	<div class="box">
					<span class="fieldSet" id="receiverModifyAreaSpan">
						<input type="hidden" id="modify_orderAreaId" name="modify_orderAreaId" treePath="${receiver.area.treePath}"/>
					</span>
				</div>
				<div class="box">
					<input type="text" name="address" id="address" class="box_input" placeholder="寄送地址"/>
				</div>
				<div class="box">
					<input type="text" name="consignee"  id="consignee"  class="box_input" placeholder="收货人"/>
				</div>
				<div class="box">
					<input type="text" name="phone" id="phone"   class="box_input" placeholder="手机号码"/>
				</div>
				<div class="box">
					<input type="text" name="zipCode"  id="zipCode"  class="box_input" placeholder="邮编"/>
				</div>
				<div class="box" style="float: right; margin-right: 10px;">
					<input type="checkbox" name="isDefault" value="true" id="isDefault"/>是否默认
					<input type="hidden" name="_isDefault" value="false" />
				</div>
				<div class="address-btn">
					<!--<input type="button" name="btn-confirm" value="确认" class="box-button" onClick="addNewAddress()"/>-->
					<button type="button" onClick="addNewAddress();">确认</button>
				</div>
		    </form>	
		</div>
	   [#include "/mobile/include/footer_2.ftl" /]
	</div>
</body>
</html>