<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.role.edit")} - MO&Co.</title>
<meta name="author" content="广州爱帛服饰有限公司 Team" />
<meta name="copyright" content="广州爱帛服饰有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<style type="text/css">
.authorities label {
	min-width: 120px;
	_width: 120px;
	display: block;
	float: left;
	padding-right: 4px;
	_white-space: nowrap;
}

table.input1 td {
	line-height: 26px;
}

</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $selectAll = $("#inputForm .selectAll");
	var $selectAllTable = $("#inputForm .selectAllTable");
	
	[@flash_message /]
	
	
	$selectAllTable.click(function(){
		var $this = $(this);
		var $thisCheckbox = $this.closest("table").find(":checkbox");
		if ($thisCheckbox.filter(":checked").size() > 0) {
			$thisCheckbox.prop("checked", false);
		} else {
			$thisCheckbox.prop("checked", true);
		}
		return false;
	});
	
	$selectAll.click(function() {
		var $this = $(this);
		var $thisCheckbox = $this.closest("tr").find(":checkbox");
		if ($thisCheckbox.filter(":checked").size() > 0) {
			$thisCheckbox.prop("checked", false);
		} else {
			$thisCheckbox.prop("checked", true);
		}
		return false;
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			authorities: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.role.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${role.id}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Role.name")}:
				</th>
				<td colspan="2">
					<input type="text" name="name" class="text" value="${role.name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Role.description")}:
				</th>
				<td colspan="2">
					<input type="text" name="description" class="text" value="${role.description}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<td colspan="3">
					&nbsp;
				</td>
			</tr>
			<tr class="authorities">
				<th>
					${message("admin.role.productGroup")}
				</th>
				<td width="138px">
					${message("admin.common.menuRole")}
				</td>
				<td>
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			<tr class="authorities">
				<th>
					&nbsp;
				</th>
				<td>
					<table class="input1" style="width: 100%;">
						<tr>
							<td>
								<label style="height: 26px;">
									<input type="button" class="selectAllTable" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
						</tr>
						<tr rowspan="2">
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:product"[#if role.authorities?seq_contains("admin:product")] checked="checked"[/#if] />${message("admin.role.product")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:productCategory"[#if role.authorities?seq_contains("admin:productCategory")] checked="checked"[/#if] />${message("admin.role.productCategory")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:productColumn"[#if role.authorities?seq_contains("admin:productColumn")] checked="checked"[/#if] />${message("admin.role.productColumn")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:parameterGroup"[#if role.authorities?seq_contains("admin:parameterGroup")] checked="checked"[/#if] />${message("admin.role.parameterGroup")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:attribute"[#if role.authorities?seq_contains("admin:attribute")] checked="checked"[/#if] />${message("admin.role.attribute")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:specification"[#if role.authorities?seq_contains("admin:specification")] checked="checked"[/#if] />${message("admin.role.specification")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:brand"[#if role.authorities?seq_contains("admin:brand")] checked="checked"[/#if] />${message("admin.role.brand")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:productNotify"[#if role.authorities?seq_contains("admin:productNotify")] checked="checked"[/#if] />${message("admin.role.productNotify")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:productTransmit"[#if role.authorities?seq_contains("admin:productTransmit")] checked="checked"[/#if] />${message("admin.role.productTransmit")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:washingInstructions"[#if role.authorities?seq_contains("admin:washingInstructions")] checked="checked"[/#if] />${message("admin.washingInstructions")}
									</label>
								</span>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="input1" style="width: 100%;">
					<tr>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr rowspan="2">
						<td width="124px">
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
						<span class="fieldSet">
							<label>
								<input type="checkbox" name="authorities" value="admin:product_icon_addIcon"[#if role.authorities?seq_contains("admin:product_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_button_archivedButton"[#if role.authorities?seq_contains("admin:product_button_archivedButton")] checked="checked"[/#if] />${message("admin.common.archived")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_button_isMarketableButton"[#if role.authorities?seq_contains("admin:product_button_isMarketableButton")] checked="checked"[/#if] />${message("admin.product.marketableAgreed")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_button_isMarketlessButton"[#if role.authorities?seq_contains("admin:product_button_isMarketlessButton")] checked="checked"[/#if] />${message("admin.product.marketlessAgreed")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_button_exportButton"[#if role.authorities?seq_contains("admin:product_button_exportButton")] checked="checked"[/#if] />${message("admin.common.export")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_a_edit"[#if role.authorities?seq_contains("admin:product_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_a_conllocation"[#if role.authorities?seq_contains("admin:product_a_conllocation")] checked="checked"[/#if] />${message("admin.common.conllocation")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_exportProductSaleButton"[#if role.authorities?seq_contains("admin:product_button_exportStackOutButton")] checked="checked"[/#if] />${message("admin.order.productOutOfStock")}
							</label>
						</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:productCategory_icon_addIcon"[#if role.authorities?seq_contains("admin:productCategory_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productCategory_a_delete"[#if role.authorities?seq_contains("admin:productCategory_a_delete")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productCategory_a_edit"[#if role.authorities?seq_contains("admin:productCategory_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:productColumn_icon_addIcon"[#if role.authorities?seq_contains("admin:productColumn_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productColumn_button_deleteButton"[#if role.authorities?seq_contains("admin:productColumn_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productColumn_a_edit"[#if role.authorities?seq_contains("admin:productColumn_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:parameterGroup_icon_addIcon"[#if role.authorities?seq_contains("admin:parameterGroup_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:parameterGroup_button_deleteButton"[#if role.authorities?seq_contains("admin:parameterGroup_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:parameterGroup_a_edit"[#if role.authorities?seq_contains("admin:parameterGroup_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:attribute_icon_addIcon"[#if role.authorities?seq_contains("admin:attribute_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:attribute_button_deleteButton"[#if role.authorities?seq_contains("admin:attribute_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:attribute_a_edit"[#if role.authorities?seq_contains("admin:attribute_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:specification_icon_addIcon"[#if role.authorities?seq_contains("admin:specification_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:specification_button_deleteButton"[#if role.authorities?seq_contains("admin:specification_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:specification_a_edit"[#if role.authorities?seq_contains("admin:specification_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:specification_button_syncSizeButton"[#if role.authorities?seq_contains("admin:specification_button_syncSizeButton")] checked="checked"[/#if] />${message("admin.specification.syncSize")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:specification_button_syncColorButton"[#if role.authorities?seq_contains("admin:specification_button_syncColorButton")] checked="checked"[/#if] />${message("admin.specification.syncColor")}
								</label>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:brand_icon_addIcon"[#if role.authorities?seq_contains("admin:brand_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:brand_button_deleteButton"[#if role.authorities?seq_contains("admin:brand_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:brand_a_edit"[#if role.authorities?seq_contains("admin:brand_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:productNotify_button_sendButton"[#if role.authorities?seq_contains("admin:productNotify_button_sendButton")] checked="checked"[/#if] />${message("admin.productNotify.send")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productNotify_button_deleteButton"[#if role.authorities?seq_contains("admin:productNotify_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:productTransmit_icon_addIcon"[#if role.authorities?seq_contains("admin:productTransmit_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productTransmit_button_deleteButton"[#if role.authorities?seq_contains("admin:productTransmit_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productTransmit_a_edit"[#if role.authorities?seq_contains("admin:productTransmit_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:washingInstructions_icon_addIcon"[#if role.authorities?seq_contains("admin:washingInstructions_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:washingInstructions_button_deleteButton"[#if role.authorities?seq_contains("admin:washingInstructions_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:washingInstructions_a_edit"[#if role.authorities?seq_contains("admin:washingInstructions_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
						</td>
					</tr>
					</table>
				</td>
			</tr>
			
			
			
			<tr class="authorities">
				<th>
					${message("admin.role.orderGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td>
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			<tr class="authorities">
				<th>
					&nbsp;
				</th>
				<td>
					<table class="input1" style="width: 100%;">
						<tr>
							<td>
								<label style="height: 26px;">
									<input type="button" class="selectAllTable" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
						</tr>
						<tr rowspan="3">
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:order"[#if role.authorities?seq_contains("admin:order")] checked="checked"[/#if] />${message("admin.role.order")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:payment"[#if role.authorities?seq_contains("admin:payment")] checked="checked"[/#if] />${message("admin.role.payment")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:refunds"[#if role.authorities?seq_contains("admin:refunds")] checked="checked"[/#if] />${message("admin.role.refunds")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:shipping"[#if role.authorities?seq_contains("admin:shipping")] checked="checked"[/#if] />${message("admin.role.shipping")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:returns"[#if role.authorities?seq_contains("admin:returns")] checked="checked"[/#if] />${message("admin.role.returns")}
									</label>
								</span>
							</td>
						</tr>
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:deliveryTemplate"[#if role.authorities?seq_contains("admin:deliveryTemplate")] checked="checked"[/#if] />${message("admin.role.deliveryTemplate")}
									</label>
								</span>
							</td>
						</tr>-->
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:deliveryCenter"[#if role.authorities?seq_contains("admin:deliveryCenter")] checked="checked"[/#if] />${message("admin.role.deliveryCenter")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:shopStore"[#if role.authorities?seq_contains("admin:shopStore")] checked="checked"[/#if] />${message("admin.role.shopStore")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:invoiceType"[#if role.authorities?seq_contains("admin:invoiceType")] checked="checked"[/#if] />${message("admin.role.invoiceType")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:refuseReason"[#if role.authorities?seq_contains("admin:refuseReason")] checked="checked"[/#if] />${message("admin.role.refuseReason")}
									</label>
								</span>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="input1" style="width: 100%;">
					<tr>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr rowspan="3">
						<td width="124px">
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_exportButton"[#if role.authorities?seq_contains("admin:order_button_exportButton")] checked="checked"[/#if] />${message("admin.common.export")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_a_edit"[#if role.authorities?seq_contains("admin:order_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_a_mark"[#if role.authorities?seq_contains("admin:order_a_mark")] checked="checked"[/#if] />${message("admin.common.mark")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_confirmButton"[#if role.authorities?seq_contains("admin:order_button_confirmButton")] checked="checked"[/#if] />${message("admin.order.confirm")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_paymentButton"[#if role.authorities?seq_contains("admin:order_button_paymentButton")] checked="checked"[/#if] />${message("admin.order.payment")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_shippingButton"[#if role.authorities?seq_contains("admin:order_button_shippingButton")] checked="checked"[/#if] />${message("admin.order.shipping")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_completeButton"[#if role.authorities?seq_contains("admin:order_button_completeButton")] checked="checked"[/#if] />${message("admin.order.complete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_refundsButton"[#if role.authorities?seq_contains("admin:order_button_refundsButton")] checked="checked"[/#if] />${message("admin.order.refunds")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_returnsButton"[#if role.authorities?seq_contains("admin:order_button_returnsButton")] checked="checked"[/#if] />${message("admin.order.returns")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_cancelButton"[#if role.authorities?seq_contains("admin:order_button_cancelButton")] checked="checked"[/#if] />${message("admin.order.cancel")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_returns_a_edit"[#if role.authorities?seq_contains("admin:order_returns_a_edit")] checked="checked"[/#if] />${message("admin.order.returns.edit")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_returns_button_agreeButton"[#if role.authorities?seq_contains("admin:order_returns_button_agreeButton")] checked="checked"[/#if] />${message("admin.common.agree")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_returns_button_rejectButton"[#if role.authorities?seq_contains("admin:order_returns_button_rejectButton")] checked="checked"[/#if] />${message("admin.common.reject")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_returns_button_agreeRefundButton"[#if role.authorities?seq_contains("admin:order_returns_button_agreeRefundButton")] checked="checked"[/#if] />${message("admin.returns.agreedRefund")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_button_exportStackOutButton"[#if role.authorities?seq_contains("admin:order_button_exportProductSaleButton")] checked="checked"[/#if] />${message("admin.order.productSale")}
							</label>
						</td>	
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<label>
								<input type="checkbox" name="authorities" value="admin:payment_button_deleteButton"[#if role.authorities?seq_contains("admin:payment_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
						</td>	
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<label>
								<input type="checkbox" name="authorities" value="admin:refunds_button_deleteButton"[#if role.authorities?seq_contains("admin:refunds_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:refunds_button_exportButton"[#if role.authorities?seq_contains("admin:refunds_button_exportButton")] checked="checked"[/#if] />${message("admin.common.export")}
							</label>
						</td>	
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<label>
								<input type="checkbox" name="authorities" value="admin:shipping_button_deleteButton"[#if role.authorities?seq_contains("admin:shipping_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
						</td>	
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_button_deleteButton"[#if role.authorities?seq_contains("admin:returns_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_button_exportButton"[#if role.authorities?seq_contains("admin:returns_button_exportButton")] checked="checked"[/#if] />${message("admin.common.export")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_a_edit"[#if role.authorities?seq_contains("admin:returns_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_button_agreeButton"[#if role.authorities?seq_contains("admin:returns_button_agreeButton")] checked="checked"[/#if] />${message("admin.common.agree")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_button_agreeRefundButton"[#if role.authorities?seq_contains("admin:returns_button_agreeRefundButton")] checked="checked"[/#if] />${message("admin.returns.agreedRefund")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_button_rejectButton"[#if role.authorities?seq_contains("admin:returns_button_rejectButton")] checked="checked"[/#if] />${message("admin.common.reject")}
							</label>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<label>
								<input type="checkbox" name="authorities" value="admin:deliveryCenter_icon_addIcon"[#if role.authorities?seq_contains("admin:deliveryCenter_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:deliveryCenter_button_deleteButton"[#if role.authorities?seq_contains("admin:deliveryCenter_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:deliveryCenter_a_edit"[#if role.authorities?seq_contains("admin:deliveryCenter_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<label>
								<input type="checkbox" name="authorities" value="admin:shopStore_icon_addIcon"[#if role.authorities?seq_contains("admin:shopStore_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:shopStore_button_listCompanyButton"[#if role.authorities?seq_contains("admin:shopStore_button_listCompanyButton")] checked="checked"[/#if] />${message("admin.shopCompany.list")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:shopStore_button_syncStoreInfoButton"[#if role.authorities?seq_contains("admin:shopStore_button_syncStoreInfoButton")] checked="checked"[/#if] />${message("admin.shopStore.syncStoreInfo")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:shopStore_button_deleteButton"[#if role.authorities?seq_contains("admin:shopStore_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:shopStore_a_edit"[#if role.authorities?seq_contains("admin:shopStore_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<label>
								<input type="checkbox" name="authorities" value="admin:invoiceType_icon_addIcon"[#if role.authorities?seq_contains("admin:invoiceType_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:invoiceType_button_deleteButton"[#if role.authorities?seq_contains("admin:invoiceType_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:invoiceType_a_edit"[#if role.authorities?seq_contains("admin:invoiceType_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
							<label>
								<input type="checkbox" name="authorities" value="admin:refuseReason_icon_addIcon"[#if role.authorities?seq_contains("admin:refuseReason_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:refuseReason_button_deleteButton"[#if role.authorities?seq_contains("admin:refuseReason_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:refuseReason_a_edit"[#if role.authorities?seq_contains("admin:refuseReason_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
						</td>
					</tr>
					</table>
				</td>
			</tr>
			
			<tr class="authorities">
				<th>
					${message("admin.role.memberGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td>
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			<tr class="authorities">
				<th>
					&nbsp;
				</th>
				<td>
					<table class="input1" style="width:100%">
						<tr>
							<td>
								<label style="height:26px">
									<input type="button" class="selectAllTable" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:member"[#if role.authorities?seq_contains("admin:member")] checked="checked"[/#if] />${message("admin.role.member")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:memberRank"[#if role.authorities?seq_contains("admin:memberRank")] checked="checked"[/#if] />${message("admin.role.memberRank")}
									</label>
								</span>
							</td>
						</tr>
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:memberAttribute"[#if role.authorities?seq_contains("admin:memberAttribute")] checked="checked"[/#if] />${message("admin.role.memberAttribute")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:review"[#if role.authorities?seq_contains("admin:review")] checked="checked"[/#if] />${message("admin.role.review")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:consultation"[#if role.authorities?seq_contains("admin:consultation")] checked="checked"[/#if] />${message("admin.role.consultation")}
									</label>
								</span>
							</td>
						</tr>-->
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:memberLanguage"[#if role.authorities?seq_contains("admin:memberLanguage")] checked="checked"[/#if] />${message("admin.role.memberLanguage")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:occupation"[#if role.authorities?seq_contains("admin:occupation")] checked="checked"[/#if] />${message("admin.role.occupation")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:memberLabel"[#if role.authorities?seq_contains("admin:memberLabel")] checked="checked"[/#if] />${message("admin.role.memberLabel")}
									</label>
								</span>
							</td>
						</tr>
				</table>
			</td>
			<td>
				<table class="input1" style="width: 100%;">
					<tr>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td width="124px">
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
						<span class="fieldSet">
							<label>
								<input type="checkbox" name="authorities" value="admin:member_icon_addIcon"[#if role.authorities?seq_contains("admin:member_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:member_button_deleteButton"[#if role.authorities?seq_contains("admin:member_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:member_button_exportButton"[#if role.authorities?seq_contains("admin:member_button_exportButton")] checked="checked"[/#if] />${message("admin.common.export")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:member_a_edit"[#if role.authorities?seq_contains("admin:member_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
						</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
						<span class="fieldSet">
							<label>
								<input type="checkbox" name="authorities" value="admin:memberRank_icon_addIcon"[#if role.authorities?seq_contains("admin:memberRank_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberRank_button_deleteButton"[#if role.authorities?seq_contains("admin:memberRank_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberRank_button_syncVipGradeInfoButton"[#if role.authorities?seq_contains("admin:memberRank_button_syncVipGradeInfoButton")] checked="checked"[/#if] />${message("admin.member.sysnMemberRankInfo")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberRank_a_edit"[#if role.authorities?seq_contains("admin:memberRank_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
						</span>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
						<span class="fieldSet">
							<label>
								<input type="checkbox" name="authorities" value="admin:memberLanguage_icon_addIcon"[#if role.authorities?seq_contains("admin:memberLanguage_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberLanguage_button_deleteButton"[#if role.authorities?seq_contains("admin:memberLanguage_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberLanguage_a_edit"[#if role.authorities?seq_contains("admin:memberLanguage_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
						</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
							</label>
						</td>
						<td>
						<span class="fieldSet">
							<label>
								<input type="checkbox" name="authorities" value="admin:memberLabel_icon_addIcon"[#if role.authorities?seq_contains("admin:memberLabel_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberLabel_button_deleteButton"[#if role.authorities?seq_contains("admin:memberLabel_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberLabel_a_edit"[#if role.authorities?seq_contains("admin:memberLabel_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
							</label>
						</span>
						</td>
					</tr>
				</table>
			</td>
			
			<tr class="authorities">
				<th>
					${message("admin.role.contentGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td>
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			<tr class="authorities">
				<th>
					&nbsp;
				</th>
				<td>
					<table class="input1" style="width:100%">
						<tr>
							<td>
								<label style="height:26px">
									<input type="button" class="selectAllTable" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
						</tr>
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:navigation"[#if role.authorities?seq_contains("admin:navigation")] checked="checked"[/#if] />${message("admin.role.navigation")}
									</label>
								</span>
							</td>
						</tr>-->
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:article"[#if role.authorities?seq_contains("admin:article")] checked="checked"[/#if] />${message("admin.role.article")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:articleCategory"[#if role.authorities?seq_contains("admin:articleCategory")] checked="checked"[/#if] />${message("admin.role.articleCategory")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:shopInfo"[#if role.authorities?seq_contains("admin:shopInfo")] checked="checked"[/#if] />${message("admin.role.shopInfo")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:tag"[#if role.authorities?seq_contains("admin:tag")] checked="checked"[/#if] />${message("admin.role.tag")}
									</label>
								</span>
							</td>
						</tr>
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:friendLink"[#if role.authorities?seq_contains("admin:friendLink")] checked="checked"[/#if] />${message("admin.role.friendLink")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:adPosition"[#if role.authorities?seq_contains("admin:adPosition")] checked="checked"[/#if] />${message("admin.role.adPosition")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:ad"[#if role.authorities?seq_contains("admin:ad")] checked="checked"[/#if] />${message("admin.role.ad")}
									</label>
								</span>
							</td>
						</tr>-->
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:template"[#if role.authorities?seq_contains("admin:template")] checked="checked"[/#if] />${message("admin.role.template")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:cache"[#if role.authorities?seq_contains("admin:cache")] checked="checked"[/#if] />${message("admin.role.cache")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:static"[#if role.authorities?seq_contains("admin:static")] checked="checked"[/#if] />${message("admin.role.static")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:index"[#if role.authorities?seq_contains("admin:index")] checked="checked"[/#if] />${message("admin.role.index")}
									</label>
								</span>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="input1" style="width: 100%;">
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td width="124px">
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:article_icon_addIcon"[#if role.authorities?seq_contains("admin:article_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:article_button_deleteButton"[#if role.authorities?seq_contains("admin:article_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:article_a_edit"[#if role.authorities?seq_contains("admin:article_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:articleCategory_icon_addIcon"[#if role.authorities?seq_contains("admin:articleCategory_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:articleCategory_button_articleModelButton"[#if role.authorities?seq_contains("admin:articleCategory_button_articleModelButton")] checked="checked"[/#if] />${message("admin.articleModel.manager")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:articleCategory_a_delete"[#if role.authorities?seq_contains("admin:articleCategory_a_delete")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:articleCategory_a_edit"[#if role.authorities?seq_contains("admin:articleCategory_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:shopInfo_icon_addIcon"[#if role.authorities?seq_contains("admin:shopInfo_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:shopInfo_button_listShopArea"[#if role.authorities?seq_contains("admin:shopInfo_button_listShopArea")] checked="checked"[/#if] />${message("admin.shopArea.list")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:shopInfo_button_deleteButton"[#if role.authorities?seq_contains("admin:shopInfo_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:shopInfo_a_edit"[#if role.authorities?seq_contains("admin:shopInfo_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:tag_icon_addIcon"[#if role.authorities?seq_contains("admin:tag_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:tag_a_edit"[#if role.authorities?seq_contains("admin:tag_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:template_a_edit"[#if role.authorities?seq_contains("admin:template_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr class="authorities">
				<th>
					${message("admin.role.marketingGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td>
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			<tr class="authorities">
				<th>
					&nbsp;
				</th>
				<td>
					<table class="input1" style="width:100%">
						<tr>
							<td>
								<label style="height:26px">
									<input type="button" class="selectAllTable" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:promotion"[#if role.authorities?seq_contains("admin:promotion")] checked="checked"[/#if] />${message("admin.role.promotion")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:coupon"[#if role.authorities?seq_contains("admin:coupon")] checked="checked"[/#if] />${message("admin.role.coupon")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:seo"[#if role.authorities?seq_contains("admin:seo")] checked="checked"[/#if] />${message("admin.role.seo")}
									</label>
								</span>
							</td>
						</tr>
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:sitemap"[#if role.authorities?seq_contains("admin:sitemap")] checked="checked"[/#if] />${message("admin.role.sitemap")}
									</label>
								</span>
							</td>
						</tr>-->
					</table>
			 	</td>
			 	<td>
					<table class="input1" style="width: 100%;">
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td width="124px">
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:promotion_icon_addIcon"[#if role.authorities?seq_contains("admin:promotion_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:promotion_button_deleteButton"[#if role.authorities?seq_contains("admin:promotion_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:promotion_a_edit"[#if role.authorities?seq_contains("admin:promotion_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:promotion_caring_sms_pushButton" [#if role.authorities?seq_contains("admin:promotion_caring_sms_pushButton")] checked="checked"[/#if]  />${message("促销关怀短信推送")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:coupon_icon_addIcon"[#if role.authorities?seq_contains("admin:coupon_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:coupon_button_deleteButton"[#if role.authorities?seq_contains("admin:coupon_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:coupon_a_edit"[#if role.authorities?seq_contains("admin:coupon_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:coupon_a_build"[#if role.authorities?seq_contains("admin:coupon_a_build")] checked="checked"[/#if] />${message("admin.common.build")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:seo_a_edit"[#if role.authorities?seq_contains("admin:seo_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr class="authorities">
				<th>
					${message("admin.role.statisticsGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td>
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			<tr class="authorities">
				<th>
					&nbsp;
				</th>
				<td>
					<table class="input1" style="width:100%">
						<tr>
							<td>
								<label style="height:26px">
									<input type="button" class="selectAllTable" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:statistics"[#if role.authorities?seq_contains("admin:statistics")] checked="checked"[/#if] />${message("admin.role.statistics")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:salesAmount" [#if role.authorities?seq_contains("admin:salesAmount")] checked="checked"[/#if]/>${message("admin.main.salesAmount")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:buyDetails" [#if role.authorities?seq_contains("admin:buyDetails")] checked="checked"[/#if]/>${message("admin.main.buyDetails")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:goodsSalesRanking" [#if role.authorities?seq_contains("admin:goodsSalesRanking")] checked="checked"[/#if]/>${message("admin.main.goodsSalesRanking")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:flowOverview" [#if role.authorities?seq_contains("admin:flowOverview")] checked="checked"[/#if]/>${message("admin.main.flowOverview")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:promotionAnalysis" [#if role.authorities?seq_contains("admin:promotionAnalysis")] checked="checked"[/#if]/>${message("admin.main.promotionAnalysis")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:searchKeywordRanking" [#if role.authorities?seq_contains("admin:searchKeywordRanking")] checked="checked"[/#if]/>${message("admin.main.searchKeywordRanking")}
									</label>
								</span>
							</td>
						</tr>
						<!--
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:sales"[#if role.authorities?seq_contains("admin:sales")] checked="checked"[/#if] />${message("admin.role.sales")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:salesRanking"[#if role.authorities?seq_contains("admin:salesRanking")] checked="checked"[/#if] />${message("admin.role.salesRanking")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:purchaseRanking"[#if role.authorities?seq_contains("admin:purchaseRanking")] checked="checked"[/#if] />${message("admin.role.purchaseRanking")}
									</label>
								</span>
							</td>
						</tr>-->
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:deposit"[#if role.authorities?seq_contains("admin:deposit")] checked="checked"[/#if] />${message("admin.role.deposit")}
									</label>
								</span>
							</td>
						</tr>-->
					</table>
			 	</td>
			 	<td>
					<table class="input1" style="width: 100%;">
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr class="authorities">
				<th>
					${message("admin.role.systemGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td>
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			<tr class="authorities">
				<th>
					&nbsp;
				</th>
				<td>
					<table class="input1" style="width:100%">
						<tr>
							<td>
								<label style="height:26px">
									<input type="button" class="selectAllTable" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:setting"[#if role.authorities?seq_contains("admin:setting")] checked="checked"[/#if] />${message("admin.role.setting")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:area"[#if role.authorities?seq_contains("admin:area")] checked="checked"[/#if] />${message("admin.role.area")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:paymentMethod"[#if role.authorities?seq_contains("admin:paymentMethod")] checked="checked"[/#if] />${message("admin.role.paymentMethod")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:shippingMethod"[#if role.authorities?seq_contains("admin:shippingMethod")] checked="checked"[/#if] />${message("admin.role.shippingMethod")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:deliveryCorp"[#if role.authorities?seq_contains("admin:deliveryCorp")] checked="checked"[/#if] />${message("admin.role.deliveryCorp")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:paymentPlugin"[#if role.authorities?seq_contains("admin:paymentPlugin")] checked="checked"[/#if] />${message("admin.role.paymentPlugin")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:storagePlugin"[#if role.authorities?seq_contains("admin:storagePlugin")] checked="checked"[/#if] />${message("admin.role.storagePlugin")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:admin"[#if role.authorities?seq_contains("admin:admin")] checked="checked"[/#if] />${message("admin.role.admin")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:role"[#if role.authorities?seq_contains("admin:role")] checked="checked"[/#if] />${message("admin.role.role")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:message"[#if role.authorities?seq_contains("admin:message")] checked="checked"[/#if] />${message("admin.role.message")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:mailMessage"[#if role.authorities?seq_contains("admin:mailMessage")] checked="checked"[/#if] />${message("admin.role.mailMessage")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:log"[#if role.authorities?seq_contains("admin:log")] checked="checked"[/#if] />${message("admin.role.log")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:customerService"[#if role.authorities?seq_contains("admin:customerService")] checked="checked"[/#if] />${message("admin.role.customerService")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:alipayService"[#if role.authorities?seq_contains("admin:alipayService")] checked="checked"[/#if] />${message("admin.role.alipayService")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:mailSendService"[#if role.authorities?seq_contains("admin:mailSendService")] checked="checked"[/#if] />${message("admin.role.mailSendService")}
									</label>
								</span>
							</td>
						</tr>
					</table>
			 	</td>
			 	<td>
					<table class="input1" style="width: 100%;">
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td width="124px">
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:paymentMethod_icon_addIcon"[#if role.authorities?seq_contains("admin:paymentMethod_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:paymentMethod_button_deleteButton"[#if role.authorities?seq_contains("admin:paymentMethod_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:paymentMethod_a_edit"[#if role.authorities?seq_contains("admin:paymentMethod_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:shippingMethod_icon_addIcon"[#if role.authorities?seq_contains("admin:shippingMethod_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:shippingMethod_button_deleteButton"[#if role.authorities?seq_contains("admin:shippingMethod_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:shippingMethod_a_edit"[#if role.authorities?seq_contains("admin:shippingMethod_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:deliveryCorp_icon_addIcon"[#if role.authorities?seq_contains("admin:deliveryCorp_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:deliveryCorp_button_deleteButton"[#if role.authorities?seq_contains("admin:deliveryCorp_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:deliveryCorp_a_edit"[#if role.authorities?seq_contains("admin:deliveryCorp_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:paymentPlugin_a_install"[#if role.authorities?seq_contains("admin:paymentPlugin_a_install")] checked="checked"[/#if] />${message("admin.common.install")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:paymentPlugin_a_setting"[#if role.authorities?seq_contains("admin:paymentPlugin_a_setting")] checked="checked"[/#if] />${message("admin.common.setting")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:paymentPlugin_a_uninstall"[#if role.authorities?seq_contains("admin:paymentPlugin_a_uninstall")] checked="checked"[/#if] />${message("admin.common.uninstall")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:storagePlugin_a_install"[#if role.authorities?seq_contains("admin:storagePlugin_a_install")] checked="checked"[/#if] />${message("admin.common.install")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:storagePlugin_a_setting"[#if role.authorities?seq_contains("admin:storagePlugin_a_setting")] checked="checked"[/#if] />${message("admin.common.setting")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:storagePlugin_a_uninstall"[#if role.authorities?seq_contains("admin:storagePlugin_a_uninstall")] checked="checked"[/#if] />${message("admin.common.uninstall")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:admin_icon_addIcon"[#if role.authorities?seq_contains("admin:admin_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:admin_button_delteButton"[#if role.authorities?seq_contains("admin:admin_button_delteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:admin_a_edit"[#if role.authorities?seq_contains("admin:admin_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:role_icon_addIcon"[#if role.authorities?seq_contains("admin:role_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:role_button_deleteButton"[#if role.authorities?seq_contains("admin:role_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:role_a_edit"[#if role.authorities?seq_contains("admin:role_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:message_button_deleteButton"[#if role.authorities?seq_contains("admin:message_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:message_button_sendButton"[#if role.authorities?seq_contains("admin:message_button_sendButton")] checked="checked"[/#if] />${message("admin.message.send")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:mailMessage_button_deleteButton"[#if role.authorities?seq_contains("admin:mailMessage_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:mailMessage_button_sendButton"[#if role.authorities?seq_contains("admin:mailMessage_button_sendButton")] checked="checked"[/#if] />${message("admin.message.mailSend")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:log_button_clearButton"[#if role.authorities?seq_contains("admin:log_button_clearButton")] checked="checked"[/#if] />${message("admin.common.clear")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:log_button_deleteButton"[#if role.authorities?seq_contains("admin:log_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr class="authorities">
				<th>
					${message("admin.role.mobile")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td>
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			<tr class="authorities">
				<th>
					&nbsp;
				</th>
				<td>
					<table class="input1" style="width:100%">
						<tr>
							<td>
								<label style="height:26px">
									<input type="button" class="selectAllTable" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_resolution"[#if role.authorities?seq_contains("admin:mobile_device_resolution")] checked="checked"[/#if] />${message("admin.role.mobileDeviceManage")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_startup_cover"[#if role.authorities?seq_contains("admin:mobile_device_startup_cover")] checked="checked"[/#if] />${message("admin.role.mobileHomeScreenImage")}
									</label>
								</span>
							</td>
						</tr>
					</table>
			 	</td>
			 	<td>
					<table class="input1" style="width: 100%;">
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td width="124px">
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_resolution_icon_addIcon"[#if role.authorities?seq_contains("admin:mobile_device_resolution_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
									</label>
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_resolution_button_deleteButton"[#if role.authorities?seq_contains("admin:mobile_device_resolution_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
									</label>
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_resolution_a_edit"[#if role.authorities?seq_contains("admin:mobile_device_resolution_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="button" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_startup_cover_icon_addIcon"[#if role.authorities?seq_contains("admin:mobile_device_startup_cover_icon_addIcon")] checked="checked"[/#if] />${message("admin.common.add")}
									</label>
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_startup_cover_button_deleteButton"[#if role.authorities?seq_contains("admin:mobile_device_startup_cover_button_deleteButton")] checked="checked"[/#if] />${message("admin.common.delete")}
									</label>
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_startup_cover_a_edit"[#if role.authorities?seq_contains("admin:mobile_device_startup_cover_a_edit")] checked="checked"[/#if] />${message("admin.common.edit")}
									</label>
								</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			[#if role.isSystem]
				<tr>
					<th>
						&nbsp;
					</th>
					<td colspan="2">
						<span class="tips">${message("admin.role.editSystemNotAllowed")}</span>
					</td>
				</tr>
			[/#if]
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="2">
					<input type="submit" class="button" value="${message("admin.common.submit")}"[#if role.isSystem] disabled="disabled"[/#if] />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>