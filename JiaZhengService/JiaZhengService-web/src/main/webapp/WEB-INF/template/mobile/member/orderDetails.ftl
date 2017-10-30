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
	m$.header.titleContent.setTitle("订单详情");
	$(".header_2 .cart_area").remove();
	$(".header_2 .home_area").remove();
});
</script>
</head>
<body class="body_margin">
	<div id="container">
		[#include "/mobile/include/header_2.ftl" /]
		<div class="orderInfoContent">
			<div class="pgdarea">
				<span class="orderName">
					${order.sn}(${message("Order.OrderStatus." + order.orderStatus)},${message("Order.PaymentStatus." + order.paymentStatus)},${message("Order.ShippingStatus." + order.shippingStatus)})
				</span>
				<hr/>
				<span>
					<label style="font-weight:bold;">服务地址</label>
					<label>${order.areaName}&nbsp;${order.address}</label>
				</span>
				<hr/>
				<span>
					<label style="font-weight:bold;">开始时间</label>
					<label>${order.createDate?string("yyyy-MM-dd HH:mm:ss")}</label>
				</span>
				<hr/>
				<span>
					<label style="font-weight:bold;">结束时间</label>
					<label>
					</label>
				</span>
				<!--<span>
					<label style="font-weight:bold;">服务人员</label>
					<label >待定</label>
				</span>-->
			</div>
			<div class="parts">
				<span class="service-content">
					服务内容
				</span>
				<table cellpadding="2" cellspacing="0" style="width:100%;background:#ffffff;">
					[#list order.orderItems as orderItem]
					<tr>
						<td>${abbreviate(orderItem.name, 50, "...")}</td>
						<td>${currency(orderItem.price, true)}</td>
						<td>${orderItem.quantity}</td>
						<td>${currency(orderItem.subtotal, true)}</td>
					</tr>
					[/#list]
				</table>
			</div>
			<div class="pgdarea">
				<span style="position:relative;">
					<label style="font-weight:bold;">费用合计</label>
					<label style="color:red;position:absolute;right:30px;">
						${currency(order.amount, true)}
					</label>
				</span>
			</div>
        </div>
	   [#include "/mobile/include/footer_2.ftl" /]
	</div>
</body>
</html>