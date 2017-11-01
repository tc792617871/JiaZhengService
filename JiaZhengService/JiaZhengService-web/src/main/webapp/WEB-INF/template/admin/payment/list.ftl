[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.payment.list")} - 家政服务平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $listForm = $("#listForm");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");
	
	[@flash_message /]
	
	// 收款状态筛选
	$filterSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	// 筛选选项
	$filterOption.click(function() {
		var $this = $(this);
		var $dest = $("#" + $this.attr("name"));
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
		$listForm.submit();
		return false;
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.payment.list")} <span>(${message("admin.page.total", page.count)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="payStatus" name="payStatus" value="${payStatus}" />
		<div class="bar">
			<div class="buttonWrap">
			[@shiro.hasPermission name = "admin:payment_button_deleteButton"]
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
			[/@shiro.hasPermission]
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						${message("admin.payment.filter")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
						 	<li>
						 		<a href="javascript:;" name="payStatus" val="success"[#if payStatus == "success"] class="checked" [/#if]>${message("Payment.Status.success")}</a>	
						 	</li>
							<li>
								<a href="javascript:;" name="payStatus" val="failure"[#if payStatus == "failure"] class="checked"[/#if]>${message("Payment.Status.failure")}</a>
							</li>
							<li>
								<a href="javascript:;" name="payStatus" val="wait"[#if payStatus == "wait"] class="checked"[/#if]>${message("Payment.Status.wait")}</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if page.length == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.length == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.length == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.length == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelectValue" class="value">${message("Page.searchPropertyValue")}</span>
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${pageable.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "sn"] class="current"[/#if] val="sn">${message("Payment.businessSn")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "payer"] class="current"[/#if] val="payer">${message("Payment.payer")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "orderSn"] class="current"[/#if] val="orderSn">${message("Payment.order.sn")}</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="sn">${message("Payment.businessSn")}</a>
				</th>
				<th>
					<span>${message("Payment.type")}</span>
				</th>
				<th>
					<span>${message("Payment.method")}</span>
				</th>
				<th>
					<span>${message("Payment.paymentMethod")}</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="amount">${message("Payment.amount")}</a>
				</th>
				<th>
					<span>${message("Payment.member")}</span>
				</th>
				<th>
					<span>${message("Payment.order.sn")}</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="status">${message("Payment.status")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="payment_date">${message("Payment.paymentDate")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="create_date">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list content as payment]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${payment.id}" />
					</td>
					<td>
						${payment.sn}
					</td>
					<td>
						${message("Payment.Type." + payment.type)}
					</td>
					<td>
						${message("Payment.Method." + payment.method)}
					</td>
					<td>
						${payment.paymentMethod}
					</td>
					<td>
						${currency(payment.amount, true)}
					</td>
					<td>
						${(payment.tmember.username)!"-"}
					</td>
					<td>
						${(payment.order.sn)!"-"}
					</td>
					<td>
						${message("Payment.Status." + payment.status)}
					</td>
					<td>
						[#if payment.paymentDate??]
							<span title="${payment.paymentDate?string("yyyy-MM-dd HH:mm:ss")}">${payment.paymentDate?string("yyyy-MM-dd HH:mm:ss")}</span>
						[#else]
							-
						[/#if]
					</td>
					<td>
						<span title="${payment.createDate?string("yyyy-MM-dd HH:mm:ss")}">${payment.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
					</td>
					<td>
						<a href="view.jhtml?id=${payment.id}">[${message("admin.common.view")}]</a>
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.current totalPages = page.total]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>