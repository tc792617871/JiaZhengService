<!DOCTYPE html> 
<html>
<head>
<title>收银台</title>
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
	m$.header.titleContent.setTitle("收银台");
	var $paymentPlugin = $(".paymentPlugin");
	var $paymentForm = $("#paymentForm");
	var $paymentPluginId = $("#paymentPluginId");
	[#if order.paymentMethod.method == "online" && (order.paymentStatus == "unpaid" || order.paymentStatus == "partialPayment")]
		// 订单锁定
		setInterval(function() {
			$.ajax({
				url: "lock.jhtml",
				type: "POST",
				data: {sn: "${order.sn}"},
				dataType: "json",
				cache: false,
				success: function(data) {
					if (!data) {
						window.location= moshop.base +  '/mobile/mobileIndex.jhtml';
					}
				}
			});
		}, 10000);

		// 检查支付
		setInterval(function() {
			$.ajax({
				url: "check_payment.jhtml",
				type: "POST",
				data: {sn: "${order.sn}"},
				dataType: "json",
				cache: false,
				success: function(data) {
					if (data) {
						window.location= moshop.base +  '/mobile/mobileIndex.jhtml';
					}
				}
			});
		}, 10000);
	[/#if]
	
	
	// 支付
	$paymentPlugin.click(function(){
	    $paymentPluginId.val($(this).attr("data-code"));
	    $paymentForm.attr('action','${base}/payment/submit.jhtml');
	    $paymentForm.submit();
	});

});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
	    <!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->
		<form id="paymentForm" method="post">
		<input type="hidden" name="type" value="payment" />
		<input type="hidden" name="sn" value="${order.sn}" />
		<input type="hidden" name="amount" value="${order.amountPayable}" />
		<input type="hidden" name="paymentPluginId" id="paymentPluginId" value="${order.paymentPluginId}"/>
		<input type="hidden" name="bank" id="bankCode"  value="${order.bankCode}"/>
		<input type="hidden" name="bankName" id="bankName"  value="${order.bankName}"/>
		<div class="moMobileContent">
		    <ul class="paymentContent">
		       <li>
		           <p class="success-p">
					 <span>
			          ${message("shop.orderDetail.orderCompleteTips",timeoutStr)}
			          </span>
					</p>
		       </li>
		       <li>
				   <ul class="payList">
				          [#if isWeChatBrowser] 
	                         <!--微信-->
	                         <li data-code="wxJsPlugin" class="paymentPlugin">
	                             <img src="http://images.mo-co.com/upload/image/201509/49027800-36d0-4997-9ebe-a899945dd86c.png" />微信支付
	                         </li>
                         [/#if]
                         <!--支付宝支付-->
                         <li data-code="alipayWapPlugin" style="border: none;"  class="paymentPlugin">
                             <img src="http://images.mo-co.com/upload/image/201509/64ff404e-47b4-4353-adac-f290d84fb2e5.png">支付宝支付
                         </li>
                    </ul>
			   </li>
		       <li>
		          <table>
		               <tr>
			               <th>
			                    订单编号：${order.sn}
			               </th>
		               </tr>
		               <tr>
			               <td>
			                    日期：${order.createDate}
			               </td>
		                </tr>
		                <tr>
			                <td>
			                    <label>${message("shop.orderDetail.doorshippingMethod")}</label> 
		                        <span>${message("shop.orderDetail.doorDelivery")}</span>
			                </td>
		               </tr>
		               <tr>
		                  <td>
		                      实付金额：${currency(order.amountPayable, true)}
		                  </td>
		               </tr>
		           </table>
		       </li>
               <li>
			        <table>
			            <tr>
			                <th>
			                   收货信息
			                </th>
			            </tr>
			            <tr>
			                <td>
			                    <label for="consignee">收件人:</label>
			                    <span id="consignee">${order.consignee}</span>
			                </td>
			            </tr>
			            <tr>
			                <td>
			                    <label for="phone">电话:</label>
			                    <span id="phone">${order.phone}</span>
			                </td>
			            </tr>
			            <tr>
			                <td>
			                    <label for="phone">地址:</label>
			                    <span id="phone">
			                        [#if order.address?length lt 5] 
									     ${order.areaName}${order.address}
									[#else]
									     ${order.areaName}${order.address}
									[/#if]
			                    </span>
			                </td>
			            </tr>
			            <tr>
			                <td>
			                    <label for="phone">邮编:</label>
			                    <span id="phone">${order.zipCode}</span>
			                </td>
			            </tr>
			         </table>
				 </li>
				
				 <!--
				 <li>
				 </li>-->
		    </ul>
		    <!--
			<div class="paymentBtnDiv">
			    <button type="button" id="paymentSubmit">支付</button>
			</div>
			-->
		</div>
		</form>	
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->
	</div><!-- /page -->
</body>
</html>