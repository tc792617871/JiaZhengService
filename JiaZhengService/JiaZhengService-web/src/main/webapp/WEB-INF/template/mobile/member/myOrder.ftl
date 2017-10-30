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
<link href="${base}/resources/mobile/css/myOrder.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("我的订单");
	$(".header_2 .cart_area").remove();
	$(".header_2 .home_area").remove();
	
	setCheckCate(document.getElementById('noend'),'noend');
});
</script>
</head>
<body class="body_margin">
	<div id="container">
		[#include "/mobile/include/header_2.ftl" /]
		<div id="bigcates">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td class="nocheckCate checkCate" id="noend" onClick="setCheckCate(this,'noend')">未完成订单</td>
					<td class="nocheckCate" id="end" onClick="setCheckCate(this,'end')">已完成订单</td>
				</tr>
			</table>
		</div>
		<div class="order-list">
			<div id="smallcates">
			</div>
		</div>
		<script type="text/javascript">
			function setCheckCate(obj,bigcate){
				var container_clientwidth = $('#bigcates').innerWidth();
				var width = $(obj).outerWidth(false);//返回元素的宽度（包括元素宽度、内边距和边框，不包括外边距）参数为true，包括外边距
				var dis = (container_clientwidth-width)/2;//滚动后元素距左侧距离
				var offleft = obj.offsetLeft ;//$(obj).position().left;//相对于容器左边距离
				$('#bigcates').animate({ scrollLeft: offleft-dis }, 300);
		
				if($('#bigcates .checkCate').length>0){
					$('#bigcates .checkCate').removeClass('checkCate');
				}
				$(obj).addClass('checkCate');
				$('#currid').val(bigcate);
				getsmallcates(bigcate);
			}
			function getsmallcates(bigcate){
				$.ajax({  
					type:'post',   
					async:true,
					dataType: "json",
					url:'${base}/mobile/member/myOrderList.jhtml?orderStatus='+bigcate,
					success:function(data){
						var orders = data.orders; 
						var html = "";
						var length = orders.length;
						if(length > 0){
							for(var index = 0;  index < length; index ++){
								var orderItem = orders[index];
								var orderId = orderItem.id;
								var order_status = orderItem.orderStatus;
								var payment_status = orderItem.paymentStatus;
								var shipping_status = orderItem.shippingStatus;
								var status = message(("Order.OrderStatus."+order_status))+","+message(("Order.PaymentStatus."+payment_status))+","+message(("Order.ShippingStatus."+shipping_status));
								var sn = orderItem.sn;
								var orderName = orderItem.name;
								var areaName = orderItem.areaName;
								var address = orderItem.address;
								var createTime = timeStamp2String(orderItem.createDate);
								html += '<div class="pgdarea" onclick="window.location=\'${base}/mobile/member/orderDetails.jhtml?id='+orderId+'\'">'
									  + '<table width="100%" border="0" cellspacing="0" cellpadding="0">'
									  + '<tr>'
										+ '<td align="center" class="pgdnum">'+sn+'</td>'
										+ '<td align="right" class="pgdstatus"><span style="color:#FF4000" >'+status+'</span></td>'
									  + '</tr>'
									  + '</table>'
									  + '<table width="100%" border="0" cellspacing="0" cellpadding="0" >'
									  + '<tr><td class="pgddetail">服务项目：'+orderName+'</td></tr>'	
									  +	'<tr><td class="pgddetail">服务地址：'+(areaName+address)+'</td><td align="right"><span class="rightArrow"></span></td></tr>'
									  +	'<tr><td class="pgddetail">开始时间：'+(createTime)+'</td></tr>'
									  + '</table></div>';
							}
						}
						else{
							html = '<p style="text-align: center;">暂无订单</p>';
						}
						$('#smallcates').html(html);
					}
				})
			}
		</script>
	   [#include "/mobile/include/footer_2.ftl" /]
	</div>
</body>
</html>