<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.role.add")} - 家政服务平台</title>
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.role.add")}
	</div>
	<!-- start 中间内容部分 -->
	<div class="wrapper wrapper-content animated fadeIn">
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Role.name")}:
				</th>
				<td colspan="2">
					<input type="text" name="name"  class="text" value="" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Role.description")}:
				</th>
				<td colspan="2">
					<input type="text" name="description"  class="text" value="" maxlength="200" />
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
				<th rowspan="3">
					<input type="button" class="btn btn-primary btn-xs" id="productGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleProduct" name="authorities" value="admin:product" />
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
							<input type="checkbox" name="authorities" id="productAdd"  value="admin:product_icon_addIcon"/>
							<label for="productAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productArchivedButton" value="admin:product_button_archivedButton" />
							<label for="productArchivedButton">
								${message("admin.common.archived")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productIsMarketableButton"  value="admin:product_button_isMarketableButton"/>
							<label for="productIsMarketableButton">
								${message("admin.product.marketableAgreed")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productIsMarketlessButton" value="admin:product_button_isMarketlessButton"/>
							<label for="productIsMarketlessButton">
								${message("admin.product.marketlessAgreed")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productExportButton" value="admin:product_button_exportButton"/>
							<label for="productExportButton">
								${message("admin.common.export")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productEdit" value="admin:product_a_edit"/>
							<label for="productEdit">
								${message("admin.common.edit")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productConllocation" value="admin:product_a_conllocation"/>
							<label for="productConllocation">
								${message("admin.common.conllocation")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productExportStackOutButton" value="admin:product_button_exportStackOutButton"/>
							<label for="productExportStackOutButton">
								${message("admin.order.productOutOfStock")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productAdd_OnSale" value="admin:product_icon_add_OnSale"/>
							<label for="productAdd_OnSale">
								${message("+ On sale")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productDelete_OnSale" value="admin:product_icon_delete_OnSale"/>
							<label for="productDelete_OnSale">
								${message("- On sale")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productRefresh_NewArrival" value="admin:product_icon_refresh_NewArrival"/>
							<label for="productRefresh_NewArrival">
								${message("New Arrival")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productRefresh_BestSeller" value="admin:product_icon_refresh_BestSeller"/>
							<label for="productRefresh_BestSeller">
								${message("Best Seller")}
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
							<input type="checkbox" id="consoleProductCategory" name="authorities" value="admin:productCategory" />
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
							<input type="checkbox" name="authorities" id="productCategoryAdd"  value="admin:productCategory_icon_addIcon"/>
							<label for="productCategoryAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productCategoryDelete" value="admin:productCategory_a_delete" />
							<label for="productCategoryDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="productCategoryEdit"  value="admin:productCategory_a_edit"/>
							<label for="productCategoryEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 商品管理 -> 商品分类管理 -->
			
			<!-- start 商品管理 -> 规格管理 -->
			<tr class="productGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleSpecification" name="authorities" value="admin:specification" />
							<label for="consoleSpecification">
								${message("admin.role.specification")}
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
							<input type="checkbox" name="authorities" id="specificationAdd"  value="admin:specification_icon_addIcon"/>
							<label for="specificationAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="specificationDelete" value="admin:specification_button_deleteButton" />
							<label for="specificationDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="specificationEdit"  value="admin:specification_a_edit"/>
							<label for="specificationEdit">
								${message("admin.common.edit")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="specificationSyncSize" value="admin:specification_button_syncSizeButton"/>
							<label for="specificationSyncSize">
								${message("admin.specification.syncSize")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="specificationSyncColor" value="admin:specification_button_syncColorButton"/>
							<label for="specificationSyncColor">
								${message("admin.specification.syncColor")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 商品管理 -> 规格管理 -->
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
				<th rowspan="3">
					<input type="button" class="btn btn-primary btn-xs" id="orderGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleOrder" name="authorities" value="admin:order" />
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
						<li>
							<input type="checkbox" name="authorities" id="orderExport"  value="admin:order_button_exportButton"/>
							<label for="orderExport">
								${message("admin.common.export")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderEdit" value="admin:order_a_edit" />
							<label for="orderEdit">
								${message("admin.common.edit")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderMark"  value="admin:order_a_mark"/>
							<label for="orderMark">
								${message("admin.common.mark")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderConfirm" value="admin:order_button_confirmButton"/>
							<label for="orderConfirm">
								${message("admin.order.confirm")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderPayment" value="admin:order_button_paymentButton"/>
							<label for="orderPayment">
								${message("admin.order.payment")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderShipping" value="admin:order_button_shippingButton"/>
							<label for="orderShipping">
								${message("admin.order.shipping")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderComplete" value="admin:order_button_completeButton"/>
							<label for="orderComplete">
								${message("admin.order.complete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderRefunds" value="admin:order_button_refundsButton"/>
							<label for="orderRefunds">
								${message("admin.order.refunds")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderReturns" value="admin:order_button_returnsButton"/>
							<label for="orderReturns">
								${message("admin.order.returns")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderCancel" value="admin:order_button_cancelButton"/>
							<label for="orderCancel">
								${message("admin.order.cancel")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderReturns_a" value="admin:order_returns_a_edit"/>
							<label for="orderReturns_a">
								${message("admin.order.returns.edit")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderAgree" value="admin:order_returns_button_agreeButton"/>
							<label for="orderAgree">
								${message("admin.common.agree")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderReject" value="admin:order_returns_button_rejectButton"/>
							<label for="orderReject">
								${message("admin.common.reject")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderAgreeRefund" value="admin:order_returns_button_agreeRefundButton"/>
							<label for="orderAgreeRefund">
								${message("admin.returns.agreedRefund")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderExportProductSale" value="admin:order_button_exportProductSaleButton"/>
							<label for="orderExportProductSale">
								${message("admin.order.productSale")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="orderEditorder" value="admin:order_button_editorderButton"/>
							<label for="orderEditorder">
								${message("admin.order.editorder")}
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
							<input type="checkbox" id="consolePayment" name="authorities" value="admin:payment" />
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
							<input type="checkbox" name="authorities" id="paymentDelete" value="admin:payment_button_deleteButton" />
							<label for="paymentDelete">
								${message("admin.common.delete")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 订单管理 -> 收款管理 -->
			
			<!-- start 订单管理 -> 店铺数据字典管理 -->
			<tr class="orderGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleBrand" name="authorities" value="admin:shopStore" />
							<label for="consoleBrand">
								${message("admin.role.shopStore")}
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
							<input type="checkbox" name="authorities" id="shopStoreAdd"  value="admin:shopStore_icon_addIcon"/>
							<label for="shopStoreAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="shopStoreListCompany" value="admin:shopStore_button_listCompanyButton" />
							<label for="shopStoreListCompany">
								${message("admin.shopCompany.list")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="shopStoreSyncStoreInfo"  value="admin:shopStore_button_syncStoreInfoButton"/>
							<label for="shopStoreSyncStoreInfo">
								${message("admin.shopStore.syncStoreInfo")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="shopStoreDelete" value="admin:shopStore_button_deleteButton" />
							<label for="shopStoreDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="shopStoreEdit"  value="admin:shopStore_a_edit"/>
							<label for="shopStoreEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 订单管理 -> 店铺数据字典管理 -->
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
				<th rowspan="1">
					<input type="button" class="btn btn-primary btn-xs" id="memberGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleMember" name="authorities" value="admin:member" />
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
							<input type="checkbox" name="authorities" id="memberAdd"  value="admin:member_icon_addIcon"/>
							<label for="memberAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="memberDelete" value="admin:member_button_deleteButton" />
							<label for="memberDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="memberExport"  value="admin:member_button_exportButton"/>
							<label for="memberExport">
								${message("admin.common.export")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="memberEdit" value="admin:member_a_edit"/>
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
			
			<!-- start 内容管理 -> 模板管理 -->
			<tr class="contentGroup">
				<th rowspan="4">
					<input type="button" class="btn btn-primary btn-xs" id="contentGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleTemplate" name="authorities" value="admin:template" />
							<label for="consoleTemplate">
								${message("admin.role.template")}
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
							<input type="checkbox" name="authorities" id="templateEdit"  value="admin:template_a_edit"/>
							<label for="templateEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 内容管理 -> 模板管理 -->
			
			<!-- start 内容管理 -> 缓存管理 -->
			<tr class="contentGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleCache" name="authorities" value="admin:cache" />
							<label for="consoleCache">
								${message("admin.role.cache")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					
				</td>
			</tr>
			<!-- end 内容管理 -> 缓存管理 -->
			
			<!-- start 内容管理 -> 静态化管理 -->
			<tr class="contentGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleStatic" name="authorities" value="admin:static" />
							<label for="consoleStatic">
								${message("admin.role.static")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					
				</td>
			</tr>
			<!-- end 内容管理 -> 静态化管理 -->
			
			<!-- start 内容管理 -> 索引管理 -->
			<tr class="contentGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleIndex" name="authorities" value="admin:index" />
							<label for="consoleIndex">
								${message("admin.role.index")}
							</label>
						</li>
					</ul>
				</td>
				<td>
					
				</td>
			</tr>
			<!-- end 内容管理 -> 索引管理 -->
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
				<th rowspan="1">
					<input type="button" class="btn btn-primary btn-xs" id="promotionGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleCoupon" name="authorities" value="admin:coupon" />
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
							<input type="checkbox" name="authorities" id="couponAdd"  value="admin:coupon_icon_addIcon"/>
							<label for="couponAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="couponDelete" value="admin:coupon_button_deleteButton" />
							<label for="couponDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="couponEdit"  value="admin:coupon_a_edit"/>
							<label for="couponEdit">
								${message("admin.common.edit")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="couponBuild"  value="admin:coupon_a_build"/>
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
				<th  rowspan="10">
					<input type="button" class="btn btn-primary btn-xs" id="systemGroupSelectAll" value="${message("admin.common.selectAllOrNot")}">
				</th>
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleOrder" name="authorities" value="admin:setting" />
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
							<input type="checkbox" id="consoleArea" name="authorities" value="admin:area" />
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
							<input type="checkbox" id="consolePaymentMethod" name="authorities" value="admin:paymentMethod" />
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
							<input type="checkbox" name="authorities" id="paymentMethodAdd"  value="admin:paymentMethod_icon_addIcon"/>
							<label for="paymentMethodAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentMethodDelete" value="admin:paymentMethod_button_deleteButton" />
							<label for="paymentMethodDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentMethodEdit"  value="admin:paymentMethod_a_edit"/>
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
							<input type="checkbox" id="consolePaymentPlugin" name="authorities" value="admin:paymentPlugin" />
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
							<input type="checkbox" name="authorities" id="paymentPluginInstall"  value="admin:paymentPlugin_a_install"/>
							<label for="paymentPluginInstall">
								${message("admin.common.install")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentPluginSetting" value="admin:paymentPlugin_a_setting" />
							<label for="paymentPluginSetting">
								${message("admin.common.setting")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="paymentPluginUninstall"  value="admin:paymentPlugin_a_uninstall"/>
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
							<input type="checkbox" id="consoleStoragePlugin" name="authorities" value="admin:storagePlugin" />
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
							<input type="checkbox" name="authorities" id="storagePluginInstall"  value="admin:storagePlugin_a_install"/>
							<label for="storagePluginInstall">
								${message("admin.common.install")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="storagePluginSetting" value="admin:storagePlugin_a_setting" />
							<label for="storagePluginSetting">
								${message("admin.common.setting")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="storagePluginUninstall"  value="admin:storagePlugin_a_uninstall"/>
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
							<input type="checkbox" id="consoleAdmin" name="authorities" value="admin:admin" />
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
							<input type="checkbox" name="authorities" id="adminAdminAdd"  value="admin:admin_icon_addIcon"/>
							<label for="adminAdminAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="adminAdminDelte" value="admin:admin_button_delteButton" />
							<label for="adminAdminDelte">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="adminAdminEdit" value="admin:admin_a_edit" />
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
							<input type="checkbox" id="consoleRole" name="authorities" value="admin:role" />
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
							<input type="checkbox" name="authorities" id="adminRoleAdd"  value="admin:role_icon_addIcon"/>
							<label for="adminRoleAdd">
								${message("admin.common.add")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="adminRoleDelete" value="admin:role_button_deleteButton" />
							<label for="adminRoleDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="adminRoleEdit"  value="admin:role_a_edit"/>
							<label for="adminRoleEdit">
								${message("admin.common.edit")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 系统设置 -> 角色管理 -->
			
			<!-- start 系统设置 -> 消息管理 -->
			<tr class="systemGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleMessage" name="authorities" value="admin:message" />
							<label for="consoleMessage">
								${message("admin.role.message")}
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
							<input type="checkbox" name="authorities" id="messageDelete"  value="admin:message_button_deleteButton"/>
							<label for="messageDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="messageSend" value="admin:message_button_sendButton" />
							<label for="messageSend">
								${message("admin.message.send")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 系统设置 -> 消息管理 -->
			
			<!-- start 系统设置 -> 邮件消息管理 -->
			<tr class="systemGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleMailMessage" name="authorities" value="admin:mailMessage" />
							<label for="consoleMailMessage">
								${message("admin.role.mailMessage")}
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
							<input type="checkbox" name="authorities" id="mailMessageDelete"  value="admin:mailMessage_button_deleteButton"/>
							<label for="mailMessageDelete">
								${message("admin.common.delete")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="mailMessageSend" value="admin:mailMessage_button_sendButton" />
							<label for="mailMessageSend">
								${message("admin.message.mailSend")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 系统设置 -> 邮件消息管理 -->
			
			<!-- start 系统设置 -> 日志管理 -->
			<tr class="systemGroup">
				<td>
					<ul>
						<li>
							<input type="checkbox" id="consoleLog" name="authorities" value="admin:log" />
							<label for="consoleLog">
								${message("admin.role.log")}
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
							<input type="checkbox" name="authorities" id="logClear"  value="admin:log_button_clearButton"/>
							<label for="logClear">
								${message("admin.common.clear")}
							</label>
						</li>
						<li>
							<input type="checkbox" name="authorities" id="logDelete" value="admin:log_button_deleteButton" />
							<label for="logDelete">
								${message("admin.common.delete")}
							</label>
						</li>
					</ul>
				</td>
			</tr>
			<!-- end 系统设置 -> 日志管理 -->
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
	</div>
	<!-- end 中间内容部分-->
</body>
</html>