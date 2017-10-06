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
	m$.header.titleContent.setTitle("寄送地址");
	$(".header_2 .cart_area").remove();
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
		<div class="moMobileContent">
			[#if member??]
			<ul class="sendAddressList">
			  [#list receivers as receiver]
				  <li>
						<table>
						    <tr>
						        <td>
						            ${receiver.consignee}
						        </td>
						         <td>
						            [#if receiver.isDefault ]  
						               <span>默认</span>
						            [/#if]
									 <a href="javascript:void(0);" onclick="m$.myAccount.modifyAddress.deleteConfirm(${(receiver.id)!})">
										<img src="${base}/resources/mobile/images/icon_delete.png" class="basket-icon-delete"/>
									</a>
						        </td>
						    </tr>
						     <tr>
						        <td>
						            ${receiver.address}
						        </td>
						         <td rowspan="3" class="editAddress">
								     <img src="${base}/resources/mobile/images/edit.png" width="20px" height="20px" onClick="window.location='${base}/mobile/member/editAddress.jhtml?id=${receiver.id}';"/>
						        </td>
						    </tr>
						     <tr>
						        <td>
						           <span>${receiver.zipCode},</span><span>${receiver.areaName}</span>
						        </td>
						    </tr>
						     <tr>
						        <td>
						            <span>手机号码:</span><span>${receiver.phone}</span>
						        </td>
						    </tr>
						     <tr>
						        <td>
						            <intput type="hidden" value ="${receiver.id}">
						        </td>
						    </tr>
						</table>	
				  </li>
			  [/#list]
			  </ul>
			 [/#if]
			<div style="margin-top: 60px;">
				<button onClick="window.location='${base}/mobile/member/addNewAddress.jhtml';">
					新增地址
				</button>
			</div>
		</div>
    	[#include "/mobile/include/footer_2.ftl" /]
	</div>
</body>
</html>