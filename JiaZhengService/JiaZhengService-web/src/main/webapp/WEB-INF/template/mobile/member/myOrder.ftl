<!DOCTYPE html> 
<html>
<head>
<title>我的订单</title>
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
	m$.header.titleContent.setTitle("我的订单");
});

var nextOrderPageHtml = '';
var listData = '';
var scrollbarLocation = 0;
var pageParams = {
	pageNumber : 1,
	pageCount : ${totalPage},
	pageSize : 6,
	total:0,
	totalPages:0
}
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->
		
		<div class="moMobileContent">
		   <ul class="myOrderList" id="myOrderList">
		        <button onClick="window.location='${base}/mobile/member/moreMyOrder.jhtml';">查看更多</button>
				[#if page.content?has_content]
					[#list page.content as order]
					    	<li onClick="window.location='${base}/mobile/member/orderDetails.jhtml?id=${order.id}';">
					    	    <table>
					    	        <tr>
					    	            <td rowspan="7">
					    	                <img src="${order.orderItems[0].product.listCoverImage}@100w_100Q_1x.jpg"  datasrc="${order.orderItems[0].product.listCoverImage}@100w_100Q_1x.jpg"  haslazy="true" />
					    	            </td>
					    	            <th>
					    	                <label for="orderSn">订单编号：</label>
					    	                <span id="orderSn">${order.sn}</span>
					    	            </th>
					    	             <td rowspan="7">
					    	                <img src="${base}/resources/mobile/images/icon_rightarrow.png" datasrc="${base}/resources/mobile/images/icon_rightarrow.png"  width="8px">
					    	            </td>
					    	        </tr>
					    	         <tr>
					    	            <td>
					    	                <label for="orderStatus">订单状态：</label>
					    	                <span id="orderStatus">
					    	                  ${message("Order.OrderStatus." + order.orderStatus)}
							                  [#if order.expired]<span class="gray">(${message("admin.order.hasExpired")})</span>[/#if]
					    	                </span>
					    	            </td>
					    	        </tr>
					    	         <tr>
					    	            <td>
					    	                <label for="paymentStatus">支付状态：</label>
					    	                <span id="paymentStatus">${message("Order.PaymentStatus." + order.paymentStatus)}</span>
					    	            </td>
					    	        </tr>
					    	         <tr>
					    	            <td>
					    	                <label for="shippingStatus">配送状态：</label>
					    	                <span id="shippingStatus">${message("Order.ShippingStatus." + order.shippingStatus)}</span>
					    	            </td>
					    	        </tr>
					    	         <tr>
					    	            <td>
					    	                <label for="orderCreateDate">成交日期：</label>
					    	                <span id="orderCreateDate">${order.createDate}</span>
					    	            </td>
					    	        </tr>
					    	         <tr>
					    	            <td>
					    	                <label for="orderQuantity">商品总数：</label>
					    	                <span id="orderQuantity">${order.quantity}</span>
					    	            </td>
					    	        </tr>
					    	         <tr>
					    	           <td>
					    	                <label for="orderAmount">实付金额：</label>
					    	                <span id="orderAmount">${currency(order.amount, true)}</span>
					    	            </td>
					    	        </tr>
					    	    </table>
					    	</li>
					[/#list]
					<li class="page_loading" id="pageLoading">
					    <div class="loading">
					        <div class="rotate"></div>
					    </div>
					</li>
				[#else]
				    <li style="text-align: center;padding-top: 50px;">
					     暂无订单	
					</li>
				[/#if]
			</ul>
		</div>
		<script type="text/javascript">
		<!--
			_listPop(window.location.href, 'get');
			var listUrl = "${base}/mobile/member/myOrderList.jhtml?";
			var listParam =  getListParam(pageParams);
			var nextPageIndex = pageParams.pageNumber + 1;
			if (nextPageIndex <= pageParams.pageCount){
				getOrderList(listUrl, listParam, false);
				if(pageParams.pageNumber == 1){
				    $('#pageLoading').before(nextOrderPageHtml);
	                nextOrderPageHtml = '';
				}
			}else{
			    $('#pageLoading .loading').css('display', 'none');
			}
			m$.myAccount.lazyLoadOrder.init('myOrderList');
			-->
		</script>
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->
	</div>
</body>
</html>