<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.role.edit")} - 家政服务管理平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<style type="text/css">
.authorities label { cursor: pointer;}
table.input1 td {line-height: 26px;}
.authorities li {float:left;  margin-left: 20px;}
li{list-style-type:none;}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $selectAll = $("#inputForm .selectAll");
	var $selectAllTable = $("#inputForm .selectAllTable");
	/**商品管理*/
	var $productGroupSelectAll = $("#productGroupSelectAll");
	/**订单管理*/
	var $orderGroupSelectAll = $("#orderGroupSelectAll");
	/**会员管理*/
	var $memberGroupSelectAll = $("#memberGroupSelectAll");
	/**内容管理*/
	var $contentGroupSelectAll = $("#contentGroupSelectAll");
	/**营销管理*/
	var $promotionGroupSelectAll = $("#promotionGroupSelectAll");
	/**系统设置*/
	var $systemGroupSelectAll = $("#systemGroupSelectAll");
	
	[@flash_message /]
	
	
	$selectAll.click(function() {
		var $this = $(this);
		var $thisCheckbox = $this.closest("ul").find(":checkbox");
		if ($thisCheckbox.filter(":checked").size() > 0) {
			$thisCheckbox.prop("checked", false);
		} else {
			$thisCheckbox.prop("checked", true);
		}
		return false;
	});
	
	/**商品管理*/
	$productGroupSelectAll.click(function(){
		var $thisCheckbox =  $(".productGroup").find(":checkbox");
			if ($thisCheckbox.filter(":checked").size() > 0) {
				$thisCheckbox.prop("checked", false);
			} else {
				$thisCheckbox.prop("checked", true);
			}
		return false;
	});
	
	/**订单管理*/
	$orderGroupSelectAll.click(function(){
		var $thisCheckbox =  $(".orderGroup").find(":checkbox");
			if ($thisCheckbox.filter(":checked").size() > 0) {
				$thisCheckbox.prop("checked", false);
			} else {
				$thisCheckbox.prop("checked", true);
			}
		return false;
	});
	
	/**会员管理*/
	$memberGroupSelectAll.click(function(){
		var $thisCheckbox =  $(".memberGroup").find(":checkbox");
			if ($thisCheckbox.filter(":checked").size() > 0) {
				$thisCheckbox.prop("checked", false);
			} else {
				$thisCheckbox.prop("checked", true);
			}
		return false;
	});
	
	/**内容管理*/
	$contentGroupSelectAll.click(function(){
		var $thisCheckbox =  $(".contentGroup").find(":checkbox");
			if ($thisCheckbox.filter(":checked").size() > 0) {
				$thisCheckbox.prop("checked", false);
			} else {
				$thisCheckbox.prop("checked", true);
			}
		return false;
	});
	
	/**营销管理*/
	$promotionGroupSelectAll.click(function(){
		var $thisCheckbox =  $(".promotionGroup").find(":checkbox");
			if ($thisCheckbox.filter(":checked").size() > 0) {
				$thisCheckbox.prop("checked", false);
			} else {
				$thisCheckbox.prop("checked", true);
			}
		return false;
	});
	
	/**系统设置*/
	$systemGroupSelectAll.click(function(){
		var $thisCheckbox =  $(".systemGroup").find(":checkbox");
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
					<input type="text" name="name"  class="text" value="${role.name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Role.description")}:
				</th>
				<td colspan="2">
					<input type="text" name="description"  class="text" value="${role.description}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<td colspan="3">
					&nbsp;
				</td>
			</tr>
			
			<!-- start 商品管理 -->
			<tr class="authorities">
				<th>
					${message("admin.role.productGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td style="padding-left: 20px;">
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			
			<!-- start 商品管理 -> 商品管理 -->
			<tr class="productGroup">
				<th  rowspan="2">
					<input type="button" class="btn btn-primary btn-xs" id="productGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleProduct" name="authorities" value="admin:product" [#if role.authorities?seq_contains("admin:product")] checked="checked"[/#if] />
							<label for="consoleProduct">
								${message("admin.role.productGroup")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll"  value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productAdd"  value="admin:product_icon_addIcon" [#if role.authorities?seq_contains("admin:product_icon_addIcon")] checked="checked"[/#if] />
							<label for="productAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productArchivedButton" value="admin:product_button_archivedButton" [#if role.authorities?seq_contains("admin:product_button_archivedButton")] checked="checked"[/#if]  />
							<label for="productArchivedButton">
								${message("admin.common.archived")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productIsMarketableButton"  value="admin:product_button_isMarketableButton" [#if role.authorities?seq_contains("admin:product_button_isMarketableButton")] checked="checked"[/#if] />
							<label for="productIsMarketableButton">
								${message("admin.product.marketableAgreed")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productIsMarketlessButton" value="admin:product_button_isMarketlessButton" [#if role.authorities?seq_contains("admin:product_button_isMarketlessButton")] checked="checked"[/#if] />
							<label for="productIsMarketlessButton">
								${message("admin.product.marketlessAgreed")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productEdit" value="admin:product_a_edit" [#if role.authorities?seq_contains("admin:product_a_edit")] checked="checked"[/#if] />
							<label for="productEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 商品管理 -> 商品管理 -->
			
			<!-- start 商品管理 -> 商品分类管理 -->
			<tr class="productGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleProductCategory" name="authorities" value="admin:productCategory" [#if role.authorities?seq_contains("admin:productCategory")] checked="checked"[/#if]  />
							<label for="consoleProductCategory">
								${message("admin.role.productCategory")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll"  value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productCategoryAdd"  value="admin:productCategory_icon_addIcon" [#if role.authorities?seq_contains("admin:productCategory_icon_addIcon")] checked="checked"[/#if] />
							<label for="productCategoryAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productCategoryDelete" value="admin:productCategory_a_delete" [#if role.authorities?seq_contains("admin:productCategory_a_delete")] checked="checked"[/#if]  />
							<label for="productCategoryDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productCategoryEdit"  value="admin:productCategory_a_edit" [#if role.authorities?seq_contains("admin:productCategory_a_edit")] checked="checked"[/#if] />
							<label for="productCategoryEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 商品管理 -> 商品分类管理 -->
			<!-- end 商品管理 -->
			
			<!-- start 订单管理 -->
			<tr class="authorities">
				<th>
					${message("admin.role.orderGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td style="padding-left: 20px;">
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			
			<!-- start 订单管理 -> 订单管理 -->
			<tr class="orderGroup">
				<th  rowspan="2">
					<input type="button" class="btn btn-primary btn-xs" id="orderGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleOrder" name="authorities" value="admin:order" [#if role.authorities?seq_contains("admin:order")] checked="checked"[/#if]  />
							<label for="consoleOrder">
								${message("admin.role.order")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
						</li>
						<!--<li>
							<input type="checkbox" name="authorities" id="orderEdit" value="admin:order_a_edit" [#if role.authorities?seq_contains("admin:order_a_edit")] checked="checked"[/#if]  />
							<label for="orderEdit">
								${message("admin.common.edit")}
							</label>
						</li>-->
						<li>
							<input type="checkbox" name="authorities" id="orderConfirm" value="admin:order_button_confirmButton" [#if role.authorities?seq_contains("admin:order_button_confirmButton")] checked="checked"[/#if] />
							<label for="orderConfirm">
								${message("admin.order.confirm")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderPayment" value="admin:order_button_paymentButton" [#if role.authorities?seq_contains("admin:order_button_paymentButton")] checked="checked"[/#if] />
							<label for="orderPayment">
								${message("admin.order.payment")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderShipping" value="admin:order_button_shippingButton" [#if role.authorities?seq_contains("admin:order_button_shippingButton")] checked="checked"[/#if] />
							<label for="orderShipping">
								${message("admin.order.shipping")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderComplete" value="admin:order_button_completeButton" [#if role.authorities?seq_contains("admin:order_button_completeButton")] checked="checked"[/#if] />
							<label for="orderComplete">
								${message("admin.order.complete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderCancel" value="admin:order_button_cancelButton" [#if role.authorities?seq_contains("admin:order_button_cancelButton")] checked="checked"[/#if] />
							<label for="orderCancel">
								${message("admin.order.cancel")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 订单管理 -> 订单管理 -->
			
			<!-- start 订单管理 -> 收款管理 -->
			<tr class="orderGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consolePayment" name="authorities" value="admin:payment"  [#if role.authorities?seq_contains("admin:payment")] checked="checked"[/#if] />
							<label for="consolePayment">
								${message("admin.role.payment")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentDelete" value="admin:payment_button_deleteButton"  [#if role.authorities?seq_contains("admin:payment_button_deleteButton")] checked="checked"[/#if] />
							<label for="paymentDelete">
								${message("admin.common.delete")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 订单管理 -> 收款管理 -->
			<!-- end 订单管理 -->
			
			<!-- start 会员管理 -->
			<tr class="authorities">
				<th>
					${message("admin.role.memberGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td style="padding-left: 20px;">
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			
			<!-- start 会员管理 -> 会员管理 -->
			<tr class="memberGroup">
				<th  rowspan="1">
					<input type="button" class="btn btn-primary btn-xs" id="memberGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleMember" name="authorities" value="admin:member"  [#if role.authorities?seq_contains("admin:member")] checked="checked"[/#if] />
							<label for="consoleMember">
								${message("admin.role.member")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="memberAdd"  value="admin:member_icon_addIcon" [#if role.authorities?seq_contains("admin:member_icon_addIcon")] checked="checked"[/#if] />
							<label for="memberAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="memberDelete" value="admin:member_button_deleteButton"  [#if role.authorities?seq_contains("admin:member_button_deleteButton")] checked="checked"[/#if] />
							<label for="memberDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="memberEdit" value="admin:member_a_edit" [#if role.authorities?seq_contains("admin:member_a_edit")] checked="checked"[/#if] />
							<label for="memberEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 会员管理 -> 会员管理 -->
			<!-- end 会员管理 -->
			
			<!-- start 内容管理 -->
			<tr class="authorities">
				<th>
					${message("admin.role.contentGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td style="padding-left: 20px;">
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			
			<!-- start 内容管理 -> 标签管理 -->
			<tr class="contentGroup">
				<th rowspan="1">
					<input type="button" class="btn btn-primary btn-xs" id="memberGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleTag" name="authorities" value="admin:tag"  [#if role.authorities?seq_contains("admin:tag")] checked="checked"[/#if] />
							<label for="consoleTag">
								${message("admin.role.tag")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="tagAdd"  value="admin:tag_icon_addIcon" [#if role.authorities?seq_contains("admin:tag_icon_addIcon")] checked="checked"[/#if] />
							<label for="tagAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="tagEdit" value="admin:tag_a_edit"  [#if role.authorities?seq_contains("admin:tag_a_edit")] checked="checked"[/#if] />
							<label for="tagEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 内容管理 -> 标签管理 -->
			<!-- end 内容管理 -->
			
			<!-- start 营销管理 -->
			<tr class="authorities">
				<th>
					${message("admin.role.marketingGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td style="padding-left: 20px;">
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>

			<!-- start 营销管理 -> 优惠券管理 -->
			<tr class="promotionGroup">
				<th  rowspan="1">
					<input type="button" class="btn btn-primary btn-xs" id="promotionGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleCoupon" name="authorities" value="admin:coupon"  [#if role.authorities?seq_contains("admin:coupon")] checked="checked"[/#if] />
							<label for="consoleCoupon">
								${message("admin.role.coupon")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="couponAdd"  value="admin:coupon_icon_addIcon" [#if role.authorities?seq_contains("admin:coupon_icon_addIcon")] checked="checked"[/#if] />
							<label for="couponAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="couponDelete" value="admin:coupon_button_deleteButton"  [#if role.authorities?seq_contains("admin:coupon_button_deleteButton")] checked="checked"[/#if] />
							<label for="couponDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="couponEdit"  value="admin:coupon_a_edit" [#if role.authorities?seq_contains("admin:coupon_a_edit")] checked="checked"[/#if] />
							<label for="couponEdit">
								${message("admin.common.edit")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="couponBuild"  value="admin:coupon_a_build" [#if role.authorities?seq_contains("admin:coupon_a_build")] checked="checked"[/#if] />
							<label for="couponBuild">
								${message("admin.common.build")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 营销管理 -> 优惠券管理 -->
			<!-- end 营销管理 -->
			
			<!-- start 系统设置 -->
			<tr class="authorities">
				<th>
					${message("admin.role.systemGroup")}
				</th>
				<td>
					${message("admin.common.menuRole")}
				</td>
				<td style="padding-left: 20px;">
					${message("admin.common.buttonAttribute")}
				</td>
			</tr>
			
			<!-- start 系统设置 -> 系统设置 -->
			<tr class="systemGroup">
				<th rowspan="7">
					<input type="button" class="btn btn-primary btn-xs" id="systemGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleOrder" name="authorities" value="admin:setting"  [#if role.authorities?seq_contains("admin:setting")] checked="checked"[/#if] />
							<label for="consoleOrder">
								${message("admin.role.setting")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					
				</td>
			</tr>
			<!-- end 系统设置 -> 系统设置 -->
			
			<!-- start 系统设置 -> 地区管理 -->
			<tr class="systemGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleArea" name="authorities" value="admin:area"  [#if role.authorities?seq_contains("admin:area")] checked="checked"[/#if] />
							<label for="consoleArea">
								${message("admin.role.area")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					
				</td>
			</tr>
			<!-- end 系统设置 -> 地区管理 -->
			
			<!-- start 系统设置 -> 支付方式管理 -->
			<tr class="systemGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consolePaymentMethod" name="authorities" value="admin:paymentMethod" [#if role.authorities?seq_contains("admin:paymentMethod")] checked="checked"[/#if]  />
							<label for="consolePaymentMethod">
								${message("admin.role.paymentMethod")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentMethodAdd"  value="admin:paymentMethod_icon_addIcon" [#if role.authorities?seq_contains("admin:paymentMethod_icon_addIcon")] checked="checked"[/#if] />
							<label for="paymentMethodAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentMethodDelete" value="admin:paymentMethod_button_deleteButton"  [#if role.authorities?seq_contains("admin:paymentMethod_button_deleteButton")] checked="checked"[/#if] />
							<label for="paymentMethodDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentMethodEdit"  value="admin:paymentMethod_a_edit" [#if role.authorities?seq_contains("admin:paymentMethod_a_edit")] checked="checked"[/#if] />
							<label for="paymentMethodEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 系统设置 -> 支付方式管理 -->
			
			<!-- start 系统设置 -> 支付插件 -->
			<tr class="systemGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consolePaymentPlugin" name="authorities" value="admin:paymentPlugin"  [#if role.authorities?seq_contains("admin:paymentPlugin")] checked="checked"[/#if] />
							<label for="consolePaymentPlugin">
								${message("admin.role.paymentPlugin")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentPluginInstall"  value="admin:paymentPlugin_a_install" [#if role.authorities?seq_contains("admin:paymentPlugin_a_install")] checked="checked"[/#if] />
							<label for="paymentPluginInstall">
								${message("admin.common.install")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentPluginSetting" value="admin:paymentPlugin_a_setting"  [#if role.authorities?seq_contains("admin:paymentPlugin_a_setting")] checked="checked"[/#if] />
							<label for="paymentPluginSetting">
								${message("admin.common.setting")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentPluginUninstall"  value="admin:paymentPlugin_a_uninstall" [#if role.authorities?seq_contains("admin:paymentPlugin_a_uninstall")] checked="checked"[/#if] />
							<label for="paymentPluginUninstall">
								${message("admin.common.uninstall")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 系统设置 -> 支付插件 -->
			
			<!-- start 系统设置 -> 存储插件 -->
			<tr class="systemGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleStoragePlugin" name="authorities" value="admin:storagePlugin"  [#if role.authorities?seq_contains("admin:storagePlugin")] checked="checked"[/#if] />
							<label for="consoleStoragePlugin">
								${message("admin.role.storagePlugin")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="storagePluginInstall"  value="admin:storagePlugin_a_install" [#if role.authorities?seq_contains("admin:storagePlugin_a_install")] checked="checked"[/#if] />
							<label for="storagePluginInstall">
								${message("admin.common.install")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="storagePluginSetting" value="admin:storagePlugin_a_setting"  [#if role.authorities?seq_contains("admin:storagePlugin_a_setting")] checked="checked"[/#if] />
							<label for="storagePluginSetting">
								${message("admin.common.setting")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="storagePluginUninstall"  value="admin:storagePlugin_a_uninstall" [#if role.authorities?seq_contains("admin:storagePlugin_a_uninstall")] checked="checked"[/#if] />
							<label for="storagePluginUninstall">
								${message("admin.common.uninstall")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 系统设置 -> 存储插件 -->
			
			<!-- start 系统设置 -> 管理员管理 -->
			<tr class="systemGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleAdmin" name="authorities" value="admin:admin" [#if role.authorities?seq_contains("admin:admin")] checked="checked"[/#if]  />
							<label for="consoleAdmin">
								${message("admin.role.admin")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="adminAdminAdd"  value="admin:admin_icon_addIcon" [#if role.authorities?seq_contains("admin:admin_icon_addIcon")] checked="checked"[/#if] />
							<label for="adminAdminAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="adminAdminDelte" value="admin:admin_button_delteButton"  [#if role.authorities?seq_contains("admin:admin_button_delteButton")] checked="checked"[/#if] />
							<label for="adminAdminDelte">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="adminAdminEdit" value="admin:admin_a_edit"  [#if role.authorities?seq_contains("admin:admin_a_edit")] checked="checked"[/#if] />
							<label for="adminAdminEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 系统设置 -> 管理员管理 -->
			
			<!-- start 系统设置 -> 角色管理 -->
			<tr class="systemGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleRole" name="authorities" value="admin:role"  [#if role.authorities?seq_contains("admin:role")] checked="checked"[/#if] />
							<label for="">
								${message("admin.role.role")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					<ul class="authorities">
						<li>
							<input type="button" class="btn btn-primary btn-xs selectAll" class="selectAll" value="${message("admin.common.selectAllOrNot")}">
						</li>
						<li>
							<input type="checkbox" name="authorities" id="adminRoleAdd"  value="admin:role_icon_addIcon" [#if role.authorities?seq_contains("admin:role_icon_addIcon")] checked="checked"[/#if] />
							<label for="adminRoleAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="adminRoleDelete" value="admin:role_button_deleteButton"  [#if role.authorities?seq_contains("admin:role_button_deleteButton")] checked="checked"[/#if] />
							<label for="adminRoleDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="adminRoleEdit"  value="admin:role_a_edit" [#if role.authorities?seq_contains("admin:role_a_edit")] checked="checked"[/#if] />
							<label for="adminRoleEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 系统设置 -> 角色管理 -->
			<!-- end 系统设置 -->
		</table>
		<table class="input">
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