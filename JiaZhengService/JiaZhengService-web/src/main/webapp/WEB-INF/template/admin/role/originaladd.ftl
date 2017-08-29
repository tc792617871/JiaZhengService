<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.role.add")} - MO&Co.</title>
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.role.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Role.name")}:
				</th>
				<td colspan="2">
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Role.description")}:
				</th>
				<td colspan="2">
					<input type="text" name="description" class="text" maxlength="200" />
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
					<span class="fieldSet">
						<label>
							${message("admin.common.menuRole")}
						</label>
					</span>
				</td>
				<td>
					<span class="fieldSet">
						<label>
							${message("admin.common.buttonAttribute")}
						</label>
					</span>
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
										<input type="checkbox" name="authorities" value="admin:product" />${message("admin.role.product")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:productCategory" />${message("admin.role.productCategory")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:productColumn" />${message("admin.role.productColumn")}
								</label>
							</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:parameterGroup" />${message("admin.role.parameterGroup")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:attribute" />${message("admin.role.attribute")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:specification" />${message("admin.role.specification")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:brand" />${message("admin.role.brand")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:productNotify" />${message("admin.role.productNotify")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:productTransmit" />${message("admin.role.productTransmit")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:washingInstructions" />${message("admin.washingInstructions")}
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
								<input type="checkbox" name="authorities" value="admin:product_icon_addIcon" />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_button_archivedButton" />${message("admin.common.archived")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_button_isMarketableButton" />${message("admin.product.marketableAgreed")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_button_isMarketlessButton" />${message("admin.product.marketlessAgreed")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_button_exportButton" />${message("admin.common.export")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_a_edit" />${message("admin.common.edit")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_a_conllocation" />${message("admin.common.conllocation")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:product_button_exportStackOutButton" />${message("admin.order.productOutOfStock")}
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
									<input type="checkbox" name="authorities" value="admin:productCategory_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productCategory_a_delete" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productCategory_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:productColumn_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productColumn_button_deleteButton"/>${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productColumn_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:parameterGroup_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:parameterGroup_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:parameterGroup_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:attribute_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:attribute_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:attribute_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:specification_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:specification_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:specification_a_edit" />${message("admin.common.edit")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:specification_button_syncSizeButton" />${message("admin.specification.syncSize")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:specification_button_syncColorButton" />${message("admin.specification.syncColor")}
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
									<input type="checkbox" name="authorities" value="admin:brand_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:brand_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:brand_a_edit"/>${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:productNotify_button_sendButton"/>${message("admin.productNotify.send")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productNotify_button_deleteButton" />${message("admin.common.delete")}
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
									<input type="checkbox" name="authorities" value="admin:productTransmit_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productTransmit_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:productTransmit_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:washingInstructions_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:washingInstructions_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:washingInstructions_a_edit" />${message("admin.common.edit")}
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
					<span class="fieldSet">
						<label>
							${message("admin.common.menuRole")}
						</label>
					</span>
				</td>
				<td>
					<span class="fieldSet">
						<label>	
							${message("admin.common.buttonAttribute")}
						</label>
					</span>
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
								<label style="height:26px">
									<input type="button" class="selectAllTable" value="${message("admin.common.selectAllOrNot")}">
								</label>
							</td>
						</tr>
						<tr rowspan="3">
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:order" />${message("admin.role.order")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:payment" />${message("admin.role.payment")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:refunds" />${message("admin.role.refunds")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:shipping" />${message("admin.role.shipping")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:returns" />${message("admin.role.returns")}
									</label>
								</span>
							</td>
						</tr>
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:deliveryTemplate" />${message("admin.role.deliveryTemplate")}
									</label>
								</span>
							</td>
						</tr>-->
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:deliveryCenter" />${message("admin.role.deliveryCenter")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:shopStore" />${message("admin.role.shopStore")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:invoiceType"/>${message("admin.role.invoiceType")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:refuseReason" />${message("admin.role.refuseReason")}
									</label>
								</span>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="input1" style="width:100%">
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
								<input type="checkbox" name="authorities" value="admin:order_button_exportButton" />${message("admin.common.export")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_a_edit" />${message("admin.common.edit")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_a_mark"/>${message("admin.common.mark")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_confirmButton" />${message("admin.order.confirm")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_paymentButton" />${message("admin.order.payment")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_shippingButton" />${message("admin.order.shipping")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_completeButton" />${message("admin.order.complete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_refundsButton" />${message("admin.order.refunds")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_returnsButton" />${message("admin.order.returns")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_cancelButton" />${message("admin.order.cancel")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_returns_a_edit" />${message("admin.order.returns.edit")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_returns_button_agreeButton" />${message("admin.common.agree")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_returns_button_rejectButton" />${message("admin.common.reject")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_returns_button_agreeRefundButton" />${message("admin.returns.agreedRefund")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:order_button_exportProductSaleButton" />${message("admin.order.productSale")}
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
								<input type="checkbox" name="authorities" value="admin:payment_button_deleteButton"/>${message("admin.common.delete")}
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
								<input type="checkbox" name="authorities" value="admin:refunds_button_deleteButton"/>${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:refunds_button_exportButton"/>${message("admin.common.export")}
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
								<input type="checkbox" name="authorities" value="admin:shipping_button_deleteButton" />${message("admin.common.delete")}
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
								<input type="checkbox" name="authorities" value="admin:returns_button_deleteButton" />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_button_exportButton" />${message("admin.common.export")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_a_edit" />${message("admin.common.edit")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_button_agreeButton" />${message("admin.common.agree")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_button_agreeRefundButton" />${message("admin.returns.agreedRefund")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:returns_button_rejectButton" />${message("admin.common.reject")}
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
								<input type="checkbox" name="authorities" value="admin:deliveryCenter_icon_addIcon" />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:deliveryCenter_button_deleteButton" />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:deliveryCenter_a_edit" />${message("admin.common.edit")}
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
								<input type="checkbox" name="authorities" value="admin:shopStore_icon_addIcon" />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:shopStore_button_listCompanyButton" />${message("admin.shopCompany.list")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:shopStore_button_syncStoreInfoButton" />${message("admin.shopStore.syncStoreInfo")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:shopStore_button_deleteButton" />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:shopStore_a_edit" />${message("admin.common.edit")}
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
								<input type="checkbox" name="authorities" value="admin:invoiceType_icon_addIcon" />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:invoiceType_button_deleteButton" />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:invoiceType_a_edit" />${message("admin.common.edit")}
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
								<input type="checkbox" name="authorities" value="admin:refuseReason_icon_addIcon" />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:refuseReason_button_deleteButton" />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:refuseReason_a_edit" />${message("admin.common.edit")}
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
					<span class="fieldSet">
						<label>
							${message("admin.common.menuRole")}
						</label>
					</span>
				</td>
				<td>
					<span class="fieldSet">
						<label>	
							${message("admin.common.buttonAttribute")}
						</label>
					</span>
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
										<input type="checkbox" name="authorities" value="admin:member" />${message("admin.role.member")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:memberRank" />${message("admin.role.memberRank")}
									</label>
								</span>
							</td>
						</tr>
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:memberAttribute" />${message("admin.role.memberAttribute")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:review" />${message("admin.role.review")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:consultation" />${message("admin.role.consultation")}
									</label>
								</span>
							</td>
						</tr>-->
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:memberLanguage"/>${message("admin.role.memberLanguage")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:occupation" />${message("admin.role.occupation")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:occupation" />${message("admin.role.memberLabel")}
									</label>
								</span>
							</td>
						</tr>
				</table>
			</td>
			<td>
				<table class="input1" style="width:100%">
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
								<input type="checkbox" name="authorities" value="admin:member_icon_addIcon" />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:member_button_deleteButton" />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:member_button_exportButton" />${message("admin.common.export")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:member_a_edit"/>${message("admin.common.edit")}
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
								<input type="checkbox" name="authorities" value="admin:memberRank_icon_addIcon" />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberRank_button_deleteButton" />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberRank_button_syncVipGradeInfoButton" />${message("admin.member.sysnMemberRankInfo")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberRank_a_edit"/>${message("admin.common.edit")}
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
								<input type="checkbox" name="authorities" value="admin:memberLanguage_icon_addIcon" />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberLanguage_button_deleteButton" />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberLanguage_a_edit" />${message("admin.common.edit")}
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
								<input type="checkbox" name="authorities" value="admin:memberLabel_icon_addIcon" />${message("admin.common.add")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberLabel_button_deleteButton" />${message("admin.common.delete")}
							</label>
							<label>
								<input type="checkbox" name="authorities" value="admin:memberLabel_a_edit" />${message("admin.common.edit")}
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
					<span class="fieldSet">
						<label>
							${message("admin.common.menuRole")}
						</label>
					</span>
				</td>
				<td>
					<span class="fieldSet">
						<label>	
							${message("admin.common.buttonAttribute")}
						</label>
					</span>
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
										<input type="checkbox" name="authorities" value="admin:navigation" />${message("admin.role.navigation")}
									</label>
								</span>
							</td>
						</tr>-->
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:article" />${message("admin.role.article")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:articleCategory" />${message("admin.role.articleCategory")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:shopInfo" />${message("admin.role.shopInfo")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:tag" />${message("admin.role.tag")}
									</label>
								</span>
							</td>
						</tr>
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:friendLink" />${message("admin.role.friendLink")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:adPosition" />${message("admin.role.adPosition")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:ad"/>${message("admin.role.ad")}
									</label>
								</span>
							</td>
						</tr>-->
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:template" />${message("admin.role.template")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:cache" />${message("admin.role.cache")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:static" />${message("admin.role.static")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:index" />${message("admin.role.index")}
									</label>
								</span>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="input1" style="width:100%">
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
									<input type="checkbox" name="authorities" value="admin:article_icon_addIcon"/>${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:article_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:article_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:articleCategory_icon_addIcon"/>${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:articleCategory_button_articleModelButton" />${message("admin.articleModel.manager")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:articleCategory_a_delete"/>${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:articleCategory_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:shopInfo_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:shopInfo_button_listShopArea" />${message("admin.shopArea.list")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:shopInfo_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:shopInfo_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:tag_icon_addIcon"/>${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:tag_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:template_a_edit" />${message("admin.common.edit")}
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
					<span class="fieldSet">
						<label>
							${message("admin.common.menuRole")}
						</label>
					</span>
				</td>
				<td>
					<span class="fieldSet">
						<label>	
							${message("admin.common.buttonAttribute")}
						</label>
					</span>
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
										<input type="checkbox" name="authorities" value="admin:promotion" />${message("admin.role.promotion")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:coupon" />${message("admin.role.coupon")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:seo" />${message("admin.role.seo")}
									</label>
								</span>
							</td>
						</tr>
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:sitemap"/>${message("admin.role.sitemap")}
									</label>
								</span>
							</td>
						</tr>-->
					</table>
			 	</td>
			 	<td>
					<table class="input1" style="width:100%">
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
									<input type="checkbox" name="authorities" value="admin:promotion_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:promotion_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:promotion_a_edit" />${message("admin.common.edit")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:promotion_caring_sms_pushButton" />${message("促销关怀短信推送")}
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
									<input type="checkbox" name="authorities" value="admin:coupon_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:coupon_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:coupon_a_edit" />${message("admin.common.edit")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:coupon_a_build" />${message("admin.common.build")}
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
									<input type="checkbox" name="authorities" value="admin:seo_a_edit"/>${message("admin.common.edit")}
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
					<span class="fieldSet">
						<label>
							${message("admin.common.menuRole")}
						</label>
					</span>
				</td>
				<td>
					<span class="fieldSet">
						<label>	
							${message("admin.common.buttonAttribute")}
						</label>
					</span>
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
										<input type="checkbox" name="authorities" value="admin:statistics" />${message("admin.role.statistics")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:salesAmount" />${message("admin.main.salesAmount")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:buyDetails" />${message("admin.main.buyDetails")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:goodsSalesRanking" />${message("admin.main.goodsSalesRanking")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:flowOverview" />${message("admin.main.flowOverview")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:promotionAnalysis" />${message("admin.main.promotionAnalysis")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:searchKeywordRanking" />${message("admin.main.searchKeywordRanking")}
									</label>
								</span>
							</td>
						</tr>
						<!--
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:sales" />${message("admin.role.sales")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:salesRanking" />${message("admin.role.salesRanking")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:purchaseRanking"/>${message("admin.role.purchaseRanking")}
									</label>
								</span>
							</td>
						</tr>-->
						<!--<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:deposit" />${message("admin.role.deposit")}
									</label>
								</span>
							</td>
						</tr>-->
					</table>
			 	</td>
			 	<td>
					<table class="input1" style="width:100%">
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
					<span class="fieldSet">
						<label>
							${message("admin.common.menuRole")}
						</label>
					</span>
				</td>
				<td>
					<span class="fieldSet">
						<label>	
							${message("admin.common.buttonAttribute")}
						</label>
					</span>
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
										<input type="checkbox" name="authorities" value="admin:setting" />${message("admin.role.setting")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:area" />${message("admin.role.area")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:paymentMethod" />${message("admin.role.paymentMethod")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:shippingMethod" />${message("admin.role.shippingMethod")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:deliveryCorp" />${message("admin.role.deliveryCorp")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:paymentPlugin" />${message("admin.role.paymentPlugin")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:storagePlugin" />${message("admin.role.storagePlugin")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:admin" />${message("admin.role.admin")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:role"/>${message("admin.role.role")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:message" />${message("admin.role.message")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:mailMessage" />${message("admin.role.mailMessage")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:log"/>${message("admin.role.log")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:customerService" />${message("admin.role.customerService")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:alipayService" />${message("admin.role.alipayService")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:mailSendService" />${message("admin.role.mailSendService")}
									</label>
								</span>
							</td>
						</tr>
					</table>
			 	</td>
			 	<td>
					<table class="input1" style="width:100%">
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
									<input type="checkbox" name="authorities" value="admin:paymentMethod_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:paymentMethod_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:paymentMethod_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:shippingMethod_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:shippingMethod_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:shippingMethod_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:deliveryCorp_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:deliveryCorp_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:deliveryCorp_a_edit"/>${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:paymentPlugin_a_install" />${message("admin.common.install")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:paymentPlugin_a_setting" />${message("admin.common.setting")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:paymentPlugin_a_uninstall" />${message("admin.common.uninstall")}
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
									<input type="checkbox" name="authorities" value="admin:storagePlugin_a_install" />${message("admin.common.install")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:storagePlugin_a_setting" />${message("admin.common.setting")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:storagePlugin_a_uninstall" />${message("admin.common.uninstall")}
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
									<input type="checkbox" name="authorities" value="admin:admin_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:admin_button_delteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:admin_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:role_icon_addIcon" />${message("admin.common.add")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:role_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:role_a_edit" />${message("admin.common.edit")}
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
									<input type="checkbox" name="authorities" value="admin:message_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:message_button_sendButton" />${message("admin.message.send")}
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
									<input type="checkbox" name="authorities" value="admin:mailMessage_button_deleteButton" />${message("admin.common.delete")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:mailMessage_button_sendButton" />${message("admin.message.mailSend")}
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
									<input type="checkbox" name="authorities" value="admin:log_button_clearButton" />${message("admin.common.clear")}
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:log_button_deleteButton" />${message("admin.common.delete")}
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
					<span class="fieldSet">
						<label>
							${message("admin.common.menuRole")}
						</label>
					</span>
				</td>
				<td>
					<span class="fieldSet">
						<label>	
							${message("admin.common.buttonAttribute")}
						</label>
					</span>
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
										<input type="checkbox" name="authorities" value="admin:mobile_device_resolution" />${message("admin.role.mobileDeviceManage")}
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span class="fieldSet">
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_startup_cover"/>${message("admin.role.mobileHomeScreenImage")}
									</label>
								</span>
							</td>
						</tr>
					</table>
			 	</td>
			 	<td>
					<table class="input1" style="width:100%">
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
										<input type="checkbox" name="authorities" value="admin:mobile_device_resolution_icon_addIcon" />${message("admin.common.add")}
									</label>
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_resolution_button_deleteButton" />${message("admin.common.delete")}
									</label>
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_resolution_a_edit"/>${message("admin.common.edit")}
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
										<input type="checkbox" name="authorities" value="admin:mobile_device_startup_cover_icon_addIcon" />${message("admin.common.add")}
									</label>
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_startup_cover_button_deleteButton" />${message("admin.common.delete")}
									</label>
									<label>
										<input type="checkbox" name="authorities" value="admin:mobile_device_startup_cover_a_edit" />${message("admin.common.edit")}
									</label>
								</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="2">
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>