[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.order.view")} - 家政服务管理平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $confirmForm = $("#confirmForm");
	var $completeForm = $("#completeForm");
	var $cancelForm = $("#cancelForm");
	var $confirmButton = $("#confirmButton");
	var $paymentButton = $("#paymentButton");
	var $shippingButton = $("#shippingButton");
	var $completeButton = $("#completeButton");
	var $refundsButton = $("#refundsButton");
	var $returnsButton = $("#returnsButton");
	var $cancelButton = $("#cancelButton");
	var isLocked = false;
	
	[@flash_message /]
	
	// 检查锁定
	function checkLock() {
		if (!isLocked) {
			$.ajax({
				url: "check_lock.jhtml",
				type: "POST",
				data: {id: ${order.id}},
				dataType: "json",
				cache: false,
				success: function(message) {
					if (message.type != "success") {
						$.message(message);
						$confirmButton.prop("disabled", true);
						$paymentButton.prop("disabled", true);
						$shippingButton.prop("disabled", true);
						$completeButton.prop("disabled", true);
						$refundsButton.prop("disabled", true);
						$returnsButton.prop("disabled", true);
						$cancelButton.prop("disabled", true);
						isLocked = true;
					}
				}
			});
		}
	}
	
	// 检查锁定
	checkLock();
	setInterval(function() {
		checkLock();
	}, 10000);
	
	// 确认
	$confirmButton.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("admin.order.confirmDialog")}",
			onOk: function() {
				$confirmForm.submit();
			}
		});
	});
	
	// 完成
	$completeButton.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("admin.order.completeDialog")}",
			onOk: function() {
				$completeForm.submit();
			}
		});
	});
	
	// 取消
	$cancelButton.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("admin.order.cancelDialog")}",
			onOk: function() {
				$cancelForm.submit();
			}
		});
	});

	[#if !order.expired && order.orderStatus == "confirmed" && (order.paymentStatus == "unpaid" || order.paymentStatus == "partialPayment")]
		// 支付
		$paymentButton.click(function() {
			$.dialog({
				title: "${message("admin.order.payment")}",
				[@compress single_line = true]
					content: '
					<form id="paymentForm" action="payment.jhtml" method="post">
						<input type="hidden" name="token" value="${token}" \/>
						<input type="hidden" name="orderId" value="${order.id}" \/>
						<table class="input">
							<tr>
								<th>
									${message("Order.sn")}:
								<\/th>
								<td width="300">
									${order.sn}
								<\/td>
								<th>
									${message("admin.common.createDate")}:
								<\/th>
								<td>
									${order.createDate?string("yyyy-MM-dd HH:mm:ss")}
								<\/td>
							<\/tr>
							<tr>
								<th>
									${message("Order.amount")}:
								<\/th>
								<td>
									${currency(order.amount, true)}
								<\/td>
								<th>
									${message("Order.amountPaid")}:
								<\/th>
								<td>
									${currency(order.amountPaid, true)}
								<\/td>
							<\/tr>
							[#if order.isInvoice]
								<tr>
									<th>
										${message("Order.invoiceTitle")}:
									<\/th>
									<td>
										${order.invoiceTitle}
									<\/td>
									<th>
										${message("Order.tax")}:
									<\/th>
									<td>
										${currency(order.tax, true)}
									<\/td>
								<\/tr>
							[/#if]
							<tr>
								<th>
									${message("Payment.bank")}:
								<\/th>
								<td>
									<input type="text" name="bank" class="text" maxlength="200" \/>
								<\/td>
								<th>
									${message("Payment.account")}:
								<\/th>
								<td>
									<input type="text" name="account" class="text" maxlength="200" \/>
								<\/td>
							<\/tr>
							<tr>
								<th>
									${message("Payment.amount")}:
								<\/th>
								<td>
									<input type="text" name="amount" class="text" value="${order.amountPayable}" maxlength="16" \/>
								<\/td>
								<th>
									${message("Payment.payer")}:
								<\/th>
								<td>
									<input type="text" name="payer" class="text" maxlength="200" \/>
								<\/td>
							<\/tr>
							<tr>
								<th>
									${message("Payment.method")}:
								<\/th>
								<td>
									<select id="method" name="method">
										[#list methods as method]
											<option value="${method}">${message("Payment.Method." + method)}<\/option>
										[/#list]
									<\/select>
								<\/td>
								<th>
									${message("Payment.paymentMethod")}:
								<\/th>
								<td>
									<select name="paymentMethodId">
										<option value="">${message("admin.common.choose")}<\/option>
										[#list paymentMethods as paymentMethod]
											<option value="${paymentMethod.id}">${paymentMethod.name}<\/option>
										[/#list]
									<\/select>
								<\/td>
							<\/tr>
							<tr>
								<th>
									${message("Payment.memo")}:
								<\/th>
								<td colspan="3">
									<input type="text" name="memo" class="text" maxlength="200" \/>
								<\/td>
							<\/tr>
							<tr>
								<td colspan="4" style="border-bottom: none;">
									&nbsp;
								<\/td>
							<\/tr>
						<\/table>
					<\/form>',
				[/@compress]
				width: 900,
				modal: true,
				ok: "${message("admin.dialog.ok")}",
				cancel: "${message("admin.dialog.cancel")}",
				onShow: function() {
					var $method = $("#method");
					$.validator.addMethod("balance", 
						function(value, element, param) {
							return this.optional(element) || $method.val() != "deposit" || parseFloat(value) <= parseFloat(param);
						},
						"${message("admin.order.insufficientBalance")}"
					);
					$("#paymentForm").validate({
						rules: {
							amount: {
								required: true,
								positive: true,
								max: ${order.amountPayable},
								decimal: {
									integer: 12,
									fraction: ${setting.priceScale}
								},
								balance: ${order.member.balance}
							}
						}
					});
				},
				onOk: function() {
					$("#paymentForm").submit();
					return false;
				}
			});
		});
	[/#if]
	
	[#if !order.expired  && (order.paymentStatus == "paid" || order.paymentStatus == "partialPayment" || order.paymentStatus == "partialRefunds")]
		// 退款
		$refundsButton.click(function() {
			$.dialog({
				title: "${message("admin.order.refunds")}",
				[@compress single_line = true]
					content: '
					<form id="refundsForm" action="refunds.jhtml" method="post">
						<input type="hidden" name="token" value="${token}" \/>
						<input type="hidden" name="orderId" value="${order.id}" \/>
						<table class="input">
							<tr>
								<th>
									${message("Order.sn")}:
								<\/th>
								<td width="300">
									${order.sn}
								<\/td>
								<th>
									${message("admin.common.createDate")}:
								<\/th>
								<td>
									${order.createDate?string("yyyy-MM-dd HH:mm:ss")}
								<\/td>
							<\/tr>
							<tr>
								<th>
									${message("Order.amount")}:
								<\/th>
								<td>
									${currency(order.amount, true)}
								<\/td>
								<th>
									${message("Order.amountPaid")}:
								<\/th>
								<td>
									${currency(order.amountPaid, true)}
								<\/td>
							<\/tr>
							[#if order.isInvoice]
								<tr>
									<th>
										${message("Order.invoiceTitle")}:
									<\/th>
									<td>
										${order.invoiceTitle}
									<\/td>
									<th>
										${message("Order.tax")}:
									<\/th>
									<td>
										${currency(order.tax, true)}
									<\/td>
								<\/tr>
							[/#if]
							<tr>
								<th>
									${message("Refunds.bank")}:
								<\/th>
								<td>
									<input type="text" name="bank" class="text" maxlength="200" \/>
								<\/td>
								<th>
									${message("Refunds.account")}:
								<\/th>
								<td>
									<input type="text" name="account" class="text" maxlength="200" \/>
								<\/td>
							<\/tr>
							<tr>
								<th>
									${message("Refunds.amount")}:
								<\/th>
								<td>
									<input type="text" name="amount" class="text" value="${order.amountPaid}" maxlength="16" \/>
								<\/td>
								<th>
									${message("Refunds.payee")}:
								<\/th>
								<td>
									<input type="text" name="payee" class="text" maxlength="200" \/>
								<\/td>
							<\/tr>
							<tr>
								<th>
									${message("Refunds.method")}:
								<\/th>
								<td>
									<select name="method">
										[#list refundsMethods as refundsMethod]
											<option value="${refundsMethod}">${message("Refunds.Method." + refundsMethod)}<\/option>
										[/#list]
									<\/select>
								<\/td>
								<th>
									${message("Refunds.paymentMethod")}:
								<\/th>
								<td>
									<select name="paymentMethodId">
										<option value="">${message("admin.common.choose")}<\/option>
										[#list paymentMethods as paymentMethod]
											<option value="${paymentMethod.id}">${paymentMethod.name}<\/option>
										[/#list]
									<\/select>
								<\/td>
							<\/tr>
							<tr>
								<th>
									${message("Refunds.memo")}:
								<\/th>
								<td colspan="3">
									<input type="text" name="memo" class="text" maxlength="200" \/>
								<\/td>
							<\/tr>
							<tr>
								<td colspan="4" style="border-bottom: none;">
									&nbsp;
								<\/td>
							<\/tr>
						<\/table>
					<\/form>',
				[/@compress]
				width: 900,
				modal: true,
				ok: "${message("admin.dialog.ok")}",
				cancel: "${message("admin.dialog.cancel")}",
				onShow: function() {
					$("#refundsForm").validate({
						rules: {
							amount: {
								required: true,
								positive: true,
								max: ${order.amountPaid},
								decimal: {
									integer: 12,
									fraction: ${setting.priceScale}
								}
							}
						}
					});
				},
				onOk: function() {
					$("#refundsForm").submit();
					return false;
				}
			});
		});
	[/#if]
	
	[#if !order.expired && order.orderStatus == "confirmed" && (order.shippingStatus == "unshipped" || order.shippingStatus == "partialShipment")]
		// 发货
		$shippingButton.click(function() {
			$.dialog({
				title: "${message("admin.order.shipping")}",
				[@compress single_line = true]
					content: '
					<form id="shippingForm" action="shipping.jhtml" method="post">
						<input type="hidden" name="token" value="${token}" \/>
						<input type="hidden" name="orderId" value="${order.id}" \/>
						<div style="height: 380px; overflow-x: hidden; overflow-y: auto;">
							<table class="input" style="margin-bottom: 30px;">
								<tr>
									<th>
										${message("Order.sn")}:
									<\/th>
									<td width="300">
										${order.sn}
									<\/td>
									<th>
										${message("admin.common.createDate")}:
									<\/th>
									<td>
										${order.createDate?string("yyyy-MM-dd HH:mm:ss")}
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.shippingMethod")}:
									<\/th>
									<td>
										<select name="shippingMethodId">
											<option value="">${message("admin.common.choose")}<\/option>
											[#list shippingMethods as shippingMethod]
												<option value="${shippingMethod.id}"[#if shippingMethod == order.shippingMethod] selected="selected"[/#if]>${shippingMethod.name}<\/option>
											[/#list]
										<\/select>
									<\/td>
									<th>
										${message("Shipping.deliveryCorp")}:
									<\/th>
									<td>
										<select name="deliveryCorpId">
											[#list deliveryCorps as deliveryCorp]
												<option value="${deliveryCorp.id}"[#if order.shippingMethod?? && deliveryCorp == order.shippingMethod.defaultDeliveryCorp] selected="selected"[/#if]>${deliveryCorp.name}<\/option>
											[/#list]
										<\/select>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.trackingNo")}:
									<\/th>
									<td>
										<input type="text" name="trackingNo" class="text" maxlength="200" \/>
									<\/td>
									<th>
										${message("Shipping.freight")}:
									<\/th>
									<td>
										<input type="text" name="freight" class="text" maxlength="16" \/>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.consignee")}:
									<\/th>
									<td>
										<input type="text" name="consignee" class="text" value="${order.consignee}" maxlength="200" \/>
									<\/td>
									<th>
										${message("Shipping.zipCode")}:
									<\/th>
									<td>
										<input type="text" name="zipCode" class="text" value="${order.zipCode}" maxlength="200" \/>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.area")}:
									<\/th>
									<td>
										<span class="fieldSet">
											<input type="hidden" id="areaId" name="areaId" value="${(order.area.id)!}" treePath="${(order.area.treePath)!}" \/>
										<\/span>
									<\/td>
									<th>
										${message("Shipping.address")}:
									<\/th>
									<td>
										<input type="text" name="address" class="text" value="${order.address}" maxlength="200" \/>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.phone")}:
									<\/th>
									<td>
										<input type="text" name="phone" class="text" value="${order.phone}" maxlength="200" \/>
									<\/td>
									<th>
										${message("Shipping.memo")}:
									<\/th>
									<td>
										<input type="text" name="memo" class="text" maxlength="200" \/>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Shipping.store")}:
									<\/th>
									<td>
										<select name="shopStoreId">
											<option value="">${message("admin.common.choose")}<\/option>
											[#list shopStoreList as shopStore]
												<option value="${shopStore.id}">${shopStore.storeName}<\/option>
											[/#list]
										<\/select>
									<\/td>
								<\/tr>
							<\/table>
							<table class="input">
								<tr class="title">
									<th>
										${message("ShippingItem.sn")}
									<\/th>
									<th>
										${message("ShippingItem.name")}
									<\/th>
									<th>
										${message("admin.order.productStock")}
									<\/th>
									<th>
										${message("admin.order.productQuantity")}
									<\/th>
									<th>
										${message("OrderItem.shippedQuantity")}
									<\/th>
									<th>
										${message("admin.order.shippingQuantity")}
									<\/th>
								<\/tr>
								[#list order.orderItems as orderItem]
									<tr>
										<td>
											<input type="hidden" name="shippingItems[${orderItem_index}].sn" value="${orderItem.sn}" \/>
											${orderItem.sn}
										<\/td>
										<td width="300">
											<span title="${orderItem.fullName}">${abbreviate(orderItem.fullName, 50, "...")}<\/span>
											[#if orderItem.isGift]
												<span class="red">[${message("admin.order.gift")}]<\/span>
											[/#if]
										<\/td>
										<td>
											${(orderItem.product.stock)!"-"}
										<\/td>
										<td>
											${orderItem.quantity}
										<\/td>
										<td>
											${orderItem.shippedQuantity}
										<\/td>
										<td>
											[#if orderItem.product?? && orderItem.product.stock??]
												[#if orderItem.product.stock <= 0 || orderItem.quantity - orderItem.shippedQuantity <= 0]
													<input type="text" name="shippingItems[${orderItem_index}].quantity" class="text" value="0" style="width: 30px;" disabled="disabled" \/>
												[#elseif orderItem.product.stock < orderItem.quantity - orderItem.shippedQuantity]
													<input type="text" name="shippingItems[${orderItem_index}].quantity" class="text shippingItemsQuantity" value="${orderItem.product.stock}" maxlength="9" style="width: 30px;" max="${orderItem.product.stock}" \/>
												[#else]
													<input type="text" name="shippingItems[${orderItem_index}].quantity" class="text shippingItemsQuantity" value="${orderItem.quantity - orderItem.shippedQuantity}" maxlength="9" style="width: 30px;" max="${orderItem.quantity - orderItem.shippedQuantity}" \/>
												[/#if]
											[#else]
												<input type="text" name="shippingItems[${orderItem_index}].quantity" class="text shippingItemsQuantity" value="${orderItem.quantity - orderItem.shippedQuantity}" maxlength="9" style="width: 30px;" max="${orderItem.quantity - orderItem.shippedQuantity}" \/>
											[/#if]
										<\/td>
									<\/tr>
								[/#list]
								<tr>
									<td colspan="6" style="border-bottom: none;">
										&nbsp;
									<\/td>
								<\/tr>
							<\/table>
						<\/div>
					<\/form>',
				[/@compress]
				width: 900,
				modal: true,
				ok: "${message("admin.dialog.ok")}",
				cancel: "${message("admin.dialog.cancel")}",
				onShow: function() {
					$("#areaId").lSelect({
						url: "${base}/common/area.jhtml"
					});
					$.validator.addClassRules({
						shippingItemsQuantity: {
							required: true,
							digits: true
						}
					});
					$("#shippingForm").validate({
						rules: {
							shippingMethodId: "required",
							deliveryCorpId: "required",
							freight: {
								min: 0,
								decimal: {
									integer: 12,
									fraction: ${setting.priceScale}
								}
							},
							consignee: "required",
							zipCode: "required",
							areaId: "required",
							address: "required",
							phone: "required"
						}
					});
				},
				onOk: function() {
					var total = 0;
					$("#shippingForm input.shippingItemsQuantity").each(function() {
						var quantity = $(this).val();
						if ($.isNumeric(quantity)) {
							total += parseInt(quantity);
						}
					});
					if (total <= 0) {
						$.message("warn", "${message("admin.order.shippingQuantityPositive")}");
					} else {
						$("#shippingForm").submit();
					}
					return false;
				}
			});
		});
	[/#if]
	
	[#if !order.expired && (order.shippingStatus == "shipped" || order.shippingStatus == "partialReturns" )]
		[#if order.orderStatus == "confirmed" || order.orderStatus == "receipt" ]  
		// 退货
		$returnsButton.click(function() {
			$.dialog({
				title: "${message("admin.order.returns")}",
				[@compress single_line = true]
					content: '
					<form id="returnsForm" action="returns.jhtml" method="post">
						<input type="hidden" name="token" value="${token}" \/>
						<input type="hidden" name="orderId" value="${order.id}" \/>
						<div style="height: 380px; overflow-x: hidden; overflow-y: auto;">
							<table class="input" style="margin-bottom: 30px;">
								<tr>
									<th>
										${message("Order.sn")}:
									<\/th>
									<td width="300">
										${order.sn}
									<\/td>
									<th>
										${message("admin.common.createDate")}:
									<\/th>
									<td>
										${order.createDate?string("yyyy-MM-dd HH:mm:ss")}
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Returns.shippingMethod")}:
									<\/th>
									<td>
										<select name="shippingMethodId">
											<option value="">${message("admin.common.choose")}<\/option>
											[#list shippingMethods as shippingMethod]
												<option value="${shippingMethod.id}">${shippingMethod.name}<\/option>
											[/#list]
										<\/select>
									<\/td>
									<th>
										${message("Returns.deliveryCorp")}:
									<\/th>
									<td>
										<select name="deliveryCorpId">
											<option value="">${message("admin.common.choose")}<\/option>
											[#list deliveryCorps as deliveryCorp]
												<option value="${deliveryCorp.id}">${deliveryCorp.name}<\/option>
											[/#list]
										<\/select>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Returns.trackingNo")}:
									<\/th>
									<td>
										<input type="text" name="trackingNo" class="text" maxlength="200" \/>
									<\/td>
									<th>
										${message("Returns.freight")}:
									<\/th>
									<td>
										<input type="text" name="freight" class="text" maxlength="16" \/>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Returns.shipper")}:
									<\/th>
									<td>
										<input type="text" name="shipper" class="text" value="${order.consignee}" maxlength="200" \/>
									<\/td>
									<th>
										${message("Returns.zipCode")}:
									<\/th>
									<td>
										<input type="text" name="zipCode" class="text" value="${order.zipCode}" maxlength="200" \/>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Returns.area")}:
									<\/th>
									<td>
										<span class="fieldSet">
											<input type="hidden" id="areaId" name="areaId" value="${(order.area.id)!}" treePath="${(order.area.treePath)!}" \/>
										<\/span>
									<\/td>
									<th>
										${message("Returns.address")}:
									<\/th>
									<td>
										<input type="text" name="address" class="text" value="${order.address}" maxlength="200" \/>
									<\/td>
								<\/tr>
								<tr>
									<th>
										${message("Returns.phone")}:
									<\/th>
									<td>
										<input type="text" name="phone" class="text" value="${order.phone}" maxlength="200" \/>
									<\/td>
									<th>
										${message("Returns.memo")}:
									<\/th>
									<td>
										<input type="text" name="memo" class="text" maxlength="200" \/>
									<\/td>
								<\/tr>
							<\/table>
							<table class="input">
								<tr class="title">
									<th>
										${message("ReturnsItem.sn")}
									<\/th>
									<th>
										${message("ReturnsItem.name")}
									<\/th>
									<th>
										${message("admin.order.productStock")}
									<\/th>
									<th>
										${message("OrderItem.shippedQuantity")}
									<\/th>
									<th>
										${message("OrderItem.returnQuantity")}
									<\/th>
									<th>
										${message("admin.order.returnsQuantity")}
									<\/th>
								<\/tr>
								[#list order.orderItems as orderItem]
									<tr>
										<td>
											<input type="hidden" name="returnsItems[${orderItem_index}].sn" value="${orderItem.sn}" \/>
											${orderItem.sn}
										<\/td>
										<td width="300">
											<span title="${orderItem.fullName}">${abbreviate(orderItem.fullName, 50, "...")}<\/span>
											[#if orderItem.isGift]
												<span class="red">[${message("admin.order.gift")}]<\/span>
											[/#if]
										<\/td>
										<td>
											${(orderItem.product.stock)!"-"}
										<\/td>
										<td>
											${orderItem.shippedQuantity}
										<\/td>
										<td>
											${orderItem.returnQuantity}
										<\/td>
										<td>
											<input type="text" name="returnsItems[${orderItem_index}].quantity" class="text returnsItemsQuantity" value="${orderItem.shippedQuantity - orderItem.returnQuantity}" maxlength="9" style="width: 30px;"[#if orderItem.shippedQuantity - orderItem.returnQuantity <= 0] disabled="disabled"[#else] max="${orderItem.shippedQuantity - orderItem.returnQuantity}"[/#if] \/>
										<\/td>
									<\/tr>
								[/#list]
								<tr>
									<td colspan="6" style="border-bottom: none;">
										&nbsp;
									<\/td>
								<\/tr>
							<\/table>
						<\/div>
					<\/form>',
				[/@compress]
				width: 900,
				modal: true,
				ok: "${message("admin.dialog.ok")}",
				cancel: "${message("admin.dialog.cancel")}",
				onShow: function() {
					$("#areaId").lSelect({
						url: "${base}/common/area.jhtml"
					});
					$.validator.addClassRules({
						returnsItemsQuantity: {
							required: true,
							digits: true
						}
					});
					$("#returnsForm").validate({
						rules: {
							freight: {
								min: 0,
								decimal: {
									integer: 12,
									fraction: ${setting.priceScale}
								}
							},
							shipper: "required",
							zipCode: "required",
							areaId: "required",
							address: "required",
							phone: "required"
						}
					});
				},
				onOk: function() {
					var total = 0;
					$("#returnsForm input.returnsItemsQuantity").each(function() {
						var quantity = $(this).val();
						if ($.isNumeric(quantity)) {
							total += parseInt(quantity);
						}
					});
					if (total <= 0) {
						$.message("warn", "${message("admin.order.returnsQuantityPositive")}");
					} else {
						$("#returnsForm").submit();
					}
					return false;
				}
			});
		});
		[/#if]
	[/#if]

});
</script>
</head>
<body>
	<form id="confirmForm" action="confirm.jhtml" method="post">
		<input type="hidden" name="id" value="${order.id}" />
	</form>
	<form id="completeForm" action="complete.jhtml" method="post">
		<input type="hidden" name="id" value="${order.id}" />
	</form>
	<form id="cancelForm" action="cancel.jhtml" method="post">
		<input type="hidden" name="id" value="${order.id}" />
	</form>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.order.view")}
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="${message("admin.order.orderInfo")}" />
		</li>
		<li>
			<input type="button" value="${message("admin.order.productInfo")}" />
		</li>
		<li>
			<input type="button" value="${message("admin.order.memberInfo")}" />
		</li>
		<li>
			<input type="button" value="${message("admin.order.paymentInfo")}" />
		</li>
		<li>
			<input type="button" value="${message("admin.order.shippingInfo")}" />
		</li>
		[#if order.refunds]
		<li>
			<input type="button" value="${message("admin.order.refundsInfo")}" />
		</li>
		[/#if]
		[#if order.returns]
		<li>
			<input type="button" value="${message("admin.order.returnsInfo")}" />
		</li>
		[/#if]
		<li>
			<input type="button" value="${message("admin.order.orderLog")}" />
		</li>
	</ul>
	<table class="input tabContent">
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				[@shiro.hasPermission name = "admin:order_button_confirmButton"]
				<input type="button" id="confirmButton" class="button" value="${message("admin.order.confirm")}"[#if order.expired || order.orderStatus != "unconfirmed"] disabled="disabled"[/#if] />
				[/@shiro.hasPermission]
				[@shiro.hasPermission name = "admin:order_button_paymentButton"]
				<input type="button" id="paymentButton" class="button" value="${message("admin.order.payment")}"[#if order.expired || order.orderStatus != "confirmed" || (order.paymentStatus != "unpaid" && order.paymentStatus != "partialPayment")] disabled="disabled"[/#if] />
				[/@shiro.hasPermission]
				[@shiro.hasPermission name = "admin:order_button_shippingButton"]
				<input type="button" id="shippingButton" class="button" value="${message("admin.order.shipping")}"[#if order.expired || order.orderStatus != "confirmed" || (order.shippingStatus != "unshipped" && order.shippingStatus != "partialShipment")] disabled="disabled"[/#if] />
				[/@shiro.hasPermission]
				[@shiro.hasPermission name = "admin:order_button_completeButton"]
				<input type="button" id="completeButton" class="button" value="${message("admin.order.complete")}"[#if order.expired || (order.orderStatus != "confirmed" && order.orderStatus != "receipt")] disabled="disabled"[/#if] />
				[/@shiro.hasPermission]
			</td>
			<td>
				&nbsp;
			</td>
			<td>
				[@shiro.hasPermission name = "admin:order_button_refundsButton"]
				<input type="button" id="refundsButton" class="button" value="${message("admin.order.refunds")}"[#if order.expired || (order.paymentStatus != "paid" && order.paymentStatus != "partialPayment" && order.paymentStatus != "partialRefunds" )] disabled="disabled"  [/#if] />
				[/@shiro.hasPermission]
				[@shiro.hasPermission name = "admin:order_button_returnsButton"]
				<input type="button" id="returnsButton" class="button" value="${message("admin.order.returns")}"[#if order.expired  || (order.shippingStatus != "shipped" && order.shippingStatus != "partialReturns")]disabled="disabled" [/#if] />
				[/@shiro.hasPermission]
				[@shiro.hasPermission name = "admin:order_button_cancelButton"]
				<input type="button" id="cancelButton" class="button" value="${message("admin.order.cancel")}"[#if order.expired || order.orderStatus != "unconfirmed"] disabled="disabled"[/#if] />
				[/@shiro.hasPermission]
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.sn")}:
			</th>
			<td width="360">
				${order.sn}
			</td>
			<th>
				${message("admin.common.createDate")}:
			</th>
			<td>
				${order.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.orderStatus")}:
			</th>
			<td>
				${message("Order.OrderStatus." + order.orderStatus)}
				[#if order.expired]
					<span title="${message("Order.expire")}: ${order.expire?string("yyyy-MM-dd HH:mm:ss")}">(${message("admin.order.hasExpired")})</span>
				[#elseif order.expire??]
					<span title="${message("Order.expire")}: ${order.expire?string("yyyy-MM-dd HH:mm:ss")}">(${message("Order.expire")}: ${order.expire})</span>
				[/#if]
			</td>
			<th>
				${message("Order.paymentStatus")}:
			</th>
			<td>
				${message("Order.PaymentStatus." + order.paymentStatus)}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.shippingStatus")}:
			</th>
			<td>
				${message("Order.ShippingStatus." + order.shippingStatus)}
			</td>
			<th>
				${message("Member.username")}:
			</th>
			<td>
				${order.member.username}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.amount")}:
			</th>
			<td>
				${currency(order.amount, true)}
			</td>
			<th>
				${message("Order.amountPaid")}:
			</th>
			<td>
				${currency(order.amountPaid, true)}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.weight")}:
			</th>
			<td>
				${order.weight}
			</td>
			<th>
				${message("Order.quantity")}:
			</th>
			<td>
				${order.quantity}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.promotion")}:
			</th>
			<td>
				${(order.promotion)!"-"}
			</td>
			<th>
				${message("admin.order.coupon")}:
			</th>
			<td>
				${(order.couponCode.coupon.name)!"-"}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.promotionDiscount")}:
			</th>
			<td>
				${currency(order.promotionDiscount, true)}
			</td>
			<th>
				${message("Order.couponDiscount")}:
			</th>
			<td>
				${currency(order.couponDiscount, true)}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.offsetAmount")}:
			</th>
			<td>
				${currency(order.offsetAmount, true)}
			</td>
			<th>
				${message("Order.point")}:
			</th>
			<td>
				${order.point}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.freight")}:
			</th>
			<td>
				${currency(order.freight, true)}
			</td>
			<th>
				${message("Order.fee")}:
			</th>
			<td>
				${currency(order.fee, true)}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.paymentMethod")}:
			</th>
			<td>
				${order.paymentMethodName} [${paymentPluginAttribute}]
				[#if order.bankCode]
				    [${order.bankName}]
				[/#if]
			</td>
			<th>
				${message("Order.shippingMethod")}:
			</th>
			<td>
				${order.shippingMethodName}
			</td>
		</tr>
		[#if order.isInvoice]
			<tr>
				<th>
					${message("Order.invoiceTitle")}/${message("Order.invoiceType.invoiceTypeName")}:
				</th>
				<td>
					${order.invoiceTitle}/${order.invoiceType.invoiceTypeName}
				</td>
				<th>
					${message("Order.tax")}:
				</th>
				<td>
					${currency(order.tax, true)}
				</td>
			</tr>
		[/#if]
		<tr>
			<th>
				${message("Order.consignee")}:
			</th>
			<td>
				${order.consignee}
			</td>
			<th>
				${message("Order.area")}:
			</th>
			<td>
				${order.areaName}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.address")}:
			</th>
			<td>
				${order.address}
			</td>
			<th>
				${message("Order.zipCode")}:
			</th>
			<td>
				${order.zipCode}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.phone")}:
			</th>
			<td>
				${order.phone}
			</td>
			<th>
				${message("Order.memo")}:
			</th>
			<td>
				${order.memo}
			</td>
		</tr>
		<tr>
			<th>
				${message("Order.markStatus")}:
			</th>
			<td>
				[#if order.memoFlag]
							<img src="${base}/resources/admin/images/op_memo_${order.memoFlag}.png">
				[#else]
						-
				[/#if]
			</td>
			<th>
				${message("Order.sellerMemo")}:
			</th>
			<td>
				${order.sellerMemo}
			</td>
		</tr>
		<tr>
			<th>
				${message("Payment.businessSn")}:
			</th>
			<td colspan="3">
				[#list order.payments as payment]
				    [#if payment.status == 'success']
				        [${payment.sn}]
				    [/#if]
				[/#list]
			</td>
		</tr>
	<table class="input tabContent">
		<tr class="title">
			<th>
				${message("OrderItem.sn")}
			</th>
			<th>
				${message("OrderItem.name")}
			</th>
			<th>
				${message("OrderItem.price")}
			</th>
			<th>
				${message("OrderItem.product.price")}
			</th>
			<th>
				${message("Order.member.memberRank.scale")}
			</th>
			<th>
				${message("OrderItem.quantity")}
			</th>
			<th>
				${message("OrderItem.shippedQuantity")}
			</th>
			<th>
				${message("OrderItem.returnQuantity")}
			</th>
			<th>
				${message("OrderItem.subtotal")}
			</th>
		</tr>
		[#list order.orderItems as orderItem]
			<tr>
				<td>
					<a href="${base}${orderItem.product.path}?brandId=${orderItem.product.brand.id}&productCategoryId=${orderItem.product.productCategory.id}&productId=${orderItem.product.id}"  target="_blank">${orderItem.sn}</a>
				</td>
				<td>
					<span title="${orderItem.fullName}">${abbreviate(orderItem.fullName, 50, "...")}</span>
					[#if orderItem.isGift]
						<span class="red">[${message("admin.order.gift")}]</span>
					[/#if]
				</td>
				<td>
					[#if !orderItem.isGift]
						${currency(orderItem.price, true)}
					[#else]
						-
					[/#if]
				</td>
				<td>
					${currency(orderItem.product.marketPrice, true)}
				</td>
				<td>
				[#if orderItem.discount == 1]
					${message("Order.member.memberRank.noScale")}
				[#else]
					${(orderItem.discount)*10 }${message("Order.scale")}
				[/#if]
				</td>
				<td>
					${orderItem.quantity}
				</td>
				<td>
					${orderItem.shippedQuantity}
				</td>
				<td>
					${orderItem.returnQuantity}
				</td>
				<td>
					[#if !orderItem.isGift]
						${currency(orderItem.subtotal, true)}
					[#else]
						-
					[/#if]
				</td>
			</tr>
		[/#list]
	</table>
		</table>
	<table class="input tabContent">
		<tr>
			<th>
				${message("Member.username")}
			</th>
			<td>
				${order.member.username}
			</td>
			<th>
				${message("Member.email")}
			</th>
			<td>
				${order.member.email}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.memberRank")}
			</th>
			<td>
				${order.member.memberRank.name}
			</td>
			<th>
				${message("Member.scale")}
			</th>
			<td>
				${order.member.memberRank.scale}
			</td>
		</tr>
		[#if order.promotion.name]
		<tr>
			<th>
				${message("Order.promotion.name")}
			</th>
			<td>
				${order.promotion.name}
			</td>
			<th>
				${message("Order.promotionDiscount")}
			</th>
			<td>
				${order.promotionDiscount}
			</td>
		</tr>
		[/#if]
	</table>
	<table class="input tabContent">
		<tr class="title">
			<th>
				${message("Payment.businessSn")}
			</th>
			<th>
				${message("Payment.method")}
			</th>
			<th>
				${message("Payment.paymentMethod")}
			</th>
			<th>
				${message("Payment.amount")}
			</th>
			<th>
				${message("Payment.status")}
			</th>
			<th>
				${message("Payment.paymentDate")}
			</th>
		</tr>
		[#list order.payments as payment]
			<tr>
				<td>
					${payment.sn}
				</td>
				<td>
					${message("Payment.Method." + payment.method)}
				</td>
				<td>
					${(payment.paymentMethod)!"-"}
				</td>
				<td>
					${currency(payment.amount, true)}
				</td>
				<td>
					${message("Payment.Status." + payment.status)}
				</td>
				<td>
					[#if payment.paymentDate??]
						<span title="${payment.paymentDate?string("yyyy-MM-dd HH:mm:ss")}">${payment.paymentDate}</span>
					[#else]
						-
					[/#if]
				</td>
			</tr>
		[/#list]
	</table>
	<table class="input tabContent">
	[#list order.shippings as shipping]
		<tr class="title">
			<th style="background-color: darkseagreen;">
				${message("Shipping.sn")}
			</th>
			<th>
				${message("Shipping.shippingMethod")}
			</th>
			<th>
				${message("Shipping.deliveryCorp")}
			</th>
			<th>
				${message("Shipping.trackingNo")}
			</th>
			<th>
				${message("Shipping.consignee")}
			</th>
			<th>
				${message("admin.common.createDate")}
			</th>
			<th>
				${message("Shipping.order.sn")}
			</th>
			
			<th>
				${message("Shipping.operator")}
			</th>
			<th colspan="2">
				${message("Shipping.memo")}
			</th>
		</tr>
		<tr>
			<td>
				${shipping.sn}
			</td>
			<td>
				${shipping.shippingMethod}
			</td>
			<td>
				${shipping.deliveryCorp}
			</td>
			<td>
				<a href="http://www.kuaidi100.com/chaxun?com=${shipping.deliveryCorpCode}&nu=${shipping.trackingNo}" target="_blank">${(shipping.trackingNo)!"-"}</a>
			</td>
			<td>
				<div>${shipping.address}</div>
				<div>${shipping.consignee}</div>
				<div>${shipping.phone}</div>
			</td>
			<td>
				${shipping.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
			<td>
				${shipping.order.sn}
			</td>
			<td>
				${shipping.operator}
			</td>
			<td colspan="2">
				${(shipping.memo)!"-"}
			</td>
		</tr>
		<tr class="title">
			<th>
				${message("Shipping.shippingItems")}
			</th>
			<th colspan="3">
				${message("ShippingItem.sn")}
			</th>
			<th colspan="3">
				${message("ShippingItem.name")}
			</th>
			<th colspan="3">
				${message("ShippingItem.quantity")}
			</th>
		</tr>
		[#list shipping.shippingItems as shippingItem]
			<tr>
				<td style="background-color: #ffffff;">
					&nbsp
				</td>
				<td colspan="3">
					${shippingItem.sn}
				</td>
				<td colspan="3">
					<span title="${shippingItem.name}">${abbreviate(shippingItem.name, 50, "...")}</span>
				</td>
				<td colspan="3">
					${shippingItem.quantity}
				</td>
			</tr>
		[/#list]
		<tr class="title">
			<th>
				${message("Shipping.shopStore.storeRowId")}
			</th>
			<th>
				${message("Shipping.shopStore.storeCode")}
			</th>
			<th>
				${message("Shipping.shopStore.storeName")}
			</th>
			<th>
				${message("Shipping.shopStore.storeType")}
			</th>
			<th>
				${message("Shipping.shopStore.storeAlipayNo")}
			</th>
			<th>
				${message("Shipping.shopStore.position")}
			</th>
			<th>
				${message("Shipping.shopStore.address")}
			</th>
			<th>
				${message("Shipping.shopStore.zipcode")}
			</th>
			<th>
				${message("Shipping.shopStore.consignorInfo")}
			</th>
			<th>
				${message("Shipping.shopStore.shopCompany")}
			</th>
		</tr>
		<tr>
			<td>
				${shipping.shopStore.storeRowId}
			</td>
			<td>
				${shipping.shopStore.storeCode}
			</td>
			<td>
				${shipping.shopStore.storeName}
			</td>
			<td>
				[#if shipping.shopStore.storeType == 1]
					${Shipping.ShopStore.storeType.warehouse}
				[#else]
					${Shipping.ShopStore.storeType.store}
				[/#if]
				
			</td>
			<td>
				${shipping.shopStore.storeAlipayNo}
			</td>
			<td>
				<div>${shipping.shopStore.province}</div>
				<div>${shipping.shopStore.city}</div>
				<div>${shipping.shopStore.district}</div>
			</td>
			<td>
				${shipping.shopStore.address}
			</td>
			<td>
				${shipping.shopStore.zipcode}
			</td>
			<td>
				<div>${shipping.shopStore.consignor}</div>
				<div>${shipping.shopStore.telephone}</div>
			</td>
			<td>
				${shipping.shopStore.shopCompany.companyName}
			</td>
		</tr>
		<tr>
			<td colspan="10">
				&nbsp
			</td>
		</tr>
	[/#list]
	</table>
	[#if order.refunds]
	<table class="input tabContent">
		<tr class="title">
			<th>
				${message("Refunds.sn")}
			</th>
			<th>
				${message("Refunds.method")}
			</th>
			<th>
				${message("Refunds.paymentMethod")}
			</th>
			<th>
				${message("Refunds.amount")}
			</th>
			<th>
				${message("admin.common.createDate")}
			</th>
		</tr>
		[#list order.refunds as refunds]
			<tr>
				<td>
					${refunds.sn}
				</td>
				<td>
					${message("Refunds.Method." + refunds.method)}
				</td>
				<td>
					${refunds.paymentMethod!"-"}
				</td>
				<td>
					${currency(refunds.amount, true)}
				</td>
				<td>
					${refunds.createDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr>
		[/#list]
	</table>
	[/#if]
	[#if order.returns]
	<table class="input tabContent">
	[#list order.returns as returns]
		<tr class="title">
			<th style="background-color: darkseagreen;">
				${message("admin.returns.base")}
			</th>
			<th>
				${message("Returns.sn")}
			</th>
			<th>
				${message("Returns.shippingMethod")}
			</th>
			<th>
				${message("Returns.deliveryCorp")}
			</th>
			<th>
				${message("Returns.trackingNo")}
			</th>
			<th>
				${message("Returns.shipper")}
			</th>
			<th>
				${message("admin.common.createDate")}
			</th>
			<th>
				${message("Returns.memo")}:
			</th>
			<th colspan="2">
				${message("Returns.customerMemo")}:
			</th>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				${returns.sn}
			</td>
			<td>
				${(returns.shippingMethod)!"-"}
			</td>
			<td>
				${(returns.deliveryCorp)!"-"}
			</td>
			<td>
				${(returns.trackingNo)!"-"}
			</td>
			<td>
				${returns.shipper}
			</td>
			<td>
				${returns.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
			<td>
				${(returns.memo)!"-"}
			</td>
			<td colspan="2">
				${(returns.customerMemo)!"-"}
			</td>
		</tr>
		<tr class="title">
			<th>
				${message("Returns.returnsItems")}
			</th>
			<th colspan="2">
				${message("ReturnsItem.sn")}
			</th>
			<th colspan="2">
				${message("ReturnsItem.name")}
			</th>
			<th colspan="2">
				${message("ReturnsItem.quantity")}
			</th>
			<th>
				${message("ReturnsItem.actualReceiptQty")}
			</th>
			<th>
				${message("Returns.returnsSingleAppliedAmount")}
			</th>
			<th>
				${message("Returns.returnsSingleAmount")}
			</th>
		</tr>
		[#list returns.returnsItems as returnsItem]
		<tr>
			<td>
				&nbsp;
			</td>
			<td colspan="2">
				${returnsItem.sn}
			</td>
			<td colspan="2">
				<span title="${returnsItem.name}">${abbreviate(returnsItem.name, 50, "...")}</span>
			</td>
			<td colspan="2">
				${returnsItem.quantity}
			</td>
			<td>
				${(returnsItem.actualReceiptQty)!"-"}
			</td>
			<td>
			    ${currency(returnsItem.returnsAppliedAmount, true)!"-"}
			</td>
			<td>
			    ${currency(returnsItem.returnsAmount, true)!"-"}
		    </td>
		</tr>
		[/#list]
		<tr class="title">
			<th>
				${message("Returns.shopStore.storeRowId")}
			</th>
			<th>
				${message("Returns.shopStore.storeCode")}
			</th>
			<th>
				${message("Returns.shopStore.storeName")}
			</th>
			<th>
				${message("Returns.shopStore.storeType")}
			</th>
			<th>
				${message("Returns.shopStore.storeAlipayNo")}
			</th>
			<th>
				${message("Returns.shopStore.position")}
			</th>
			<th>
				${message("Returns.shopStore.address")}
			</th>
			<th>
				${message("Returns.shopStore.zipcode")}
			</th>
			<th>
				${message("Returns.shopStore.consignorInfo")}
			</th>
			<th>
				${message("Returns.shopStore.shopCompany")}
			</th>
		</tr>
		<tr>
			<td>
				${returns.shopStore.storeRowId}
			</td>
			<td>
				${returns.shopStore.storeCode}
			</td>
			<td>
				${returns.shopStore.storeName}
			</td>
			<td>
				[#if returns.shopStore.storeType == 1]
					${returns.ShopStore.storeType.warehouse}
				[#else]
					${returns.ShopStore.storeType.store}
				[/#if]
				
			</td>
			<td>
				${returns.shopStore.storeAlipayNo}
			</td>
			<td>
				<div>${returns.shopStore.province}</div>
				<div>${returns.shopStore.city}</div>
				<div>${returns.shopStore.district}</div>
			</td>
			<td>
				${returns.shopStore.address}
			</td>
			<td>
				${returns.shopStore.zipcode}
			</td>
			<td>
				<div>${returns.shopStore.consignor}</div>
				<div>${returns.shopStore.telephone}</div>
			</td>
			<td>
				${returns.shopStore.shopCompany.companyName}
			</td>
		</tr>
		<tr>
			<td colspan="10">
				&nbsp
			</td>
		</tr>
	[/#list]
	</table>
	</table>
	[/#if]
	<table class="input tabContent">
		<tr class="title">
			<th>
				${message("OrderLog.type")}
			</th>
			<th>
				${message("OrderLog.operator")}
			</th>
			<th>
				${message("OrderLog.content")}
			</th>
			<th>
				${message("admin.common.createDate")}
			</th>
		</tr>
		[#list order.orderLogs as orderLog]
			<tr>
				<td>
					${message("OrderLog.Type." + orderLog.type)}
				</td>
				<td>
					[#if orderLog.operator??]
						${orderLog.operator}
					[#else]
						<span class="green">${message("admin.order.member")}</span>
					[/#if]
				</td>
				<td>
					[#if orderLog.content??]
						<span title="${orderLog.content}">${abbreviate(orderLog.content, 50, "...")}</span>
					[/#if]
				</td>
				<td>
					<span title="${orderLog.createDate?string("yyyy-MM-dd HH:mm:ss")}">${orderLog.createDate}</span>
				</td>
			</tr>
		[/#list]
	</table>
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
			</td>
		</tr>
	</table>
</body>
</html>