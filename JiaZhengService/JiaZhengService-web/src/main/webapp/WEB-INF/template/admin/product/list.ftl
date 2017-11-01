[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.product.list")} - 家政服务管理平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<style type="text/css">
.moreTable th {
	width: 80px;
	line-height: 25px;
	padding: 5px 10px 5px 0px;
	text-align: right;
	font-weight: normal;
	color: #333333;
	background-color: #f8fbff;
}

.moreTable td {
	line-height: 25px;
	padding: 5px;
	color: #666666;
}

.promotion {
	color: #cccccc;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $listForm = $("#listForm");
	var $moreButton = $("#moreButton");
	var $filterSelect = $("#filterSelect");
	var $dataSelect = $("#dataSelect");
	var $filterOption = $("#filterOption a");
	var $isMarketableButton = $("#isMarketableButton");
	var $isMarketlessButton = $("#isMarketlessButton");
	var $ids = $("#listTable input[name='ids']");
	var $selectAll = $("#selectAll");
	var $loading = $("#loading");
	[@flash_message /]
	
	tableRowSpan("#listTable",2);
	
	// 全选
	$selectAll.click(function() {
		var $this = $(this);
		var $enabledIds = $("#listTable input[name='ids']:enabled");
		if ($this.prop("checked")) {
			$enabledIds.prop("checked", true);
			if ($enabledIds.filter(":checked").size() > 0) {
				$isMarketableButton.removeClass("disabled");
				$isMarketlessButton.removeClass("disabled");
			} else {
				$isMarketableButton.addClass("disabled");
				$isMarketlessButton.addClass("disabled");
			}
		} else {
			$enabledIds.prop("checked", false);
			$isMarketableButton.addClass("disabled");
			$isMarketlessButton.addClass("disabled");
		}
	});
	
	// 选择
	$ids.click( function() {
		var $this = $(this);
		if ($this.prop("checked")) {
			$this.closest("tr").addClass("selected");
			$isMarketableButton.removeClass("disabled");
			$isMarketlessButton.removeClass("disabled");
		} else {
			$this.closest("tr").removeClass("selected");
			if ($("#listTable input[name='ids']:enabled:checked").size() > 0) {
				$isMarketableButton.removeClass("disabled");
				$isMarketlessButton.removeClass("disabled");
			} else {
				$isMarketableButton.addClass("disabled");
				$isMarketlessButton.addClass("disabled");
			}
		}
	});
	
	// 同意上架
	$isMarketableButton.click(function() {
	    var $this = $(this);
		if ($this.hasClass("disabled")) {
			return false;
		}
		var $checkedIds = $("#listTable input[name='ids']:enabled:checked");
		$.dialog({
			type: "warn",
			content: "${message("admin.product.isMarketable")}",
			ok: "${message("admin.dialog.ok")}",
			cancel: "${message("admin.dialog.cancel")}",
			onOk: function() {
				var data = $checkedIds.serialize();
				    data  +=  "&flag=1";
				$.ajax({
					url: "agreeIsMarketable.jhtml",
					type: "POST",
					data:data,
					dataType: "json",
					cache: false,
					beforeSend: function() {
						$loading.show();
					},
					success: function(message) {
						$.message(message);
						if (message.type == "success") {
							location.reload(true);
						}
						$isMarketableButton.addClass("disabled");
						$isMarketlessButton.addClass("disabled");
						$selectAll.prop("checked", false);
						$checkedIds.prop("checked", false);
					},
					complete: function() {
						$loading.hide();
					}
				});
			}
		});
	});
	
	 // 同意下架
	$isMarketlessButton.click(function() {
	    var $this = $(this);
		if ($this.hasClass("disabled")) {
			return false;
		}
		var $checkedIds = $("#listTable input[name='ids']:enabled:checked");
		$.dialog({
			type: "warn",
			content: "${message("admin.product.isMarketless")}",
			ok: "${message("admin.dialog.ok")}",
			cancel: "${message("admin.dialog.cancel")}",
			onOk: function() {
				var data = $checkedIds.serialize();
				data  +=  "&flag=0";
				$.ajax({
					url: "agreeIsMarketable.jhtml",
					type: "POST",
					data:data,
					dataType: "json",
					cache: false,
					beforeSend: function() {
						$loading.show();
					},
					success: function(message) {
						$.message(message);
						if (message.type == "success") {
							location.reload(true);
						}
						$isMarketableButton.addClass("disabled");
						$isMarketlessButton.addClass("disabled");
						$selectAll.prop("checked", false);
						$checkedIds.prop("checked", false);
					},
					complete: function() {
						$loading.hide();
					}
				});
			}
		});
	});
	
	// 更多选项
	$moreButton.click(function() {
		$.dialog({
			title: "${message("admin.product.moreOption")}",
			[@compress single_line = true]
				content: '
				<table id="moreTable" class="moreTable">
					<tr>
						<th>
							${message("Product.productCategory")}:
						<\/th>
						<td>
							<select name="productCategoryId">
								<option value="">${message("admin.common.choose")}<\/option>
								[#list productCategoryTree as productCategory]
									<option value="${productCategory.id}"[#if productCategory.id == productCategoryId] selected="selected"[/#if]>
										[#if productCategory.grade != 0]
											[#list 1..productCategory.grade as i]
												&nbsp;&nbsp;
											[/#list]
										[/#if]
										${productCategory.nameZh}
									<\/option>
								[/#list]
							<\/select>
						<\/td>
					<\/tr>
					<tr>
						<th>
							${message("Product.tags")}:
						<\/th>
						<td>
							<select name="tagId">
								<option value="">${message("admin.common.choose")}<\/option>
								[#list tags as tag]
									<option value="${tag.id}"[#if tag.id == tagId] selected="selected"[/#if]>
										${tag.name}
									<\/option>
								[/#list]
							<\/select>
						<\/td>
					<\/tr>
				<\/table>',
			[/@compress]
			width: 470,
			modal: true,
			ok: "${message("admin.dialog.ok")}",
			cancel: "${message("admin.dialog.cancel")}",
			onOk: function() {
				$("#moreTable :input").each(function() {
					var $this = $(this);
					$("#" + $this.attr("name")).val($this.val());
				});
				$listForm.submit();
			}
		});
	});
	
	// 商品筛选
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
	
	//商品操作
	$dataSelect.mouseover(function() {
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.product.list")} <span>(${message("admin.page.total", page.count)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="productCategoryId" name="productCategoryId" value="${productCategoryId}" />
		<input type="hidden" id="tagId" name="tagId" value="${tagId}" />
		<input type="hidden" id="isMarketable" name="isMarketable" value="[#if isMarketable??]${isMarketable?string("true", "false")}[/#if]" />
		<input type="hidden" id="isSquare" name="isSquare" value="[#if isSquare??]${isSquare?string("true", "false")}[/#if]" />
		<div class="bar">
			[@shiro.hasPermission name = "admin:product_icon_addIcon"]
				<a href="add.jhtml" class="iconButton">
					<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
				</a>
			[/@shiro.hasPermission]
			<div class="buttonWrap">
			[@shiro.hasPermission name = "admin:product_a_conllocation"]
			<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
			</a>
			[/@shiro.hasPermission]
			<div class="menuWrap">
				<a href="javascript:;" id="dataSelect" class="button">
					${message("商品操作")}<span class="arrow">&nbsp;</span>
				</a>
				<div class="popupMenu">
					<ul class="check">
						[@shiro.hasPermission name = "admin:product_button_isMarketableButton"]
						<li>
							<a href="javascript:;" id="isMarketableButton" class="btton disabled">
								${message("Product.isMarketableAgreed")}
							</a>
						</li>
						[/@shiro.hasPermission]
						[@shiro.hasPermission name = "admin:product_button_isMarketlessButton"]
						<li>
							<a href="javascript:;" id="isMarketlessButton" class="btton disabled">
								${message("Product.isMarketlessAgreed")}
							</a>
						</li>
						[/@shiro.hasPermission]
					</ul>
				</div>
			</div>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						${message("admin.product.filter")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							<li>
								<a href="javascript:;" name="isMarketable" val="true"[#if isMarketable?? && isMarketable] class="checked"[/#if]>${message("admin.product.marketable")}</a>
							</li>
							<li>
								<a href="javascript:;" name="isMarketable" val="false"[#if isMarketable?? && !isMarketable] class="checked"[/#if]>${message("admin.product.notMarketable")}</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="isSquare" val="true"[#if isSquare?? && isSquare] class="checked"[/#if]>${message("admin.product.isSquare")}</a>
							</li>
							<li>
								<a href="javascript:;" name="isSquare" val="false"[#if isSquare?? && !isSquare] class="checked"[/#if]>${message("admin.product.notSquare")}</a>
							</li>
						</ul>
					</div>
				</div>
				<a href="javascript:;" id="moreButton" class="button">${message("admin.product.moreOption")}</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
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
			<div id="loading" style="display:none;height: 3px;">
			    数据处理中... <img src="${base}/resources/admin/images/loading_icon.gif"/>
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
							<a href="javascript:;"[#if pageable.searchProperty == "name"] class="current"[/#if] val="name">${message("Product.name")}</a>
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
					<a href="javascript:;" class="sort" name="name">${message("Product.name")}</a>
				</th>
				<th>
					<span>${message("Product.productCategory")}</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="is_marketable">${message("Product.isMarketable")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="is_square">${message("Product.isSquare")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="create_date">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list content as product]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${product.id}" />
					</td>
					<td>
						<span title="${product.name}">
							${abbreviate(product.name, 50, "...")}
						</span>
						[#if product.tags]
							<span class="promotion">[
								[#list product.tags as tag]
									[#if !tag_has_next]
									${tag.name}
									[#else]
									${tag.name},
									[/#if]
								[/#list]
							]</span>
						[/#if]
						
					</td>
					<td>
						${product.category.nameZh}
					</td>
					<td>
						<span class="${product.isMarketable?string("true", "false")}Icon">&nbsp;</span>
					</td>
					<td>
						<span class="${product.isSquare?string("true", "false")}Icon">&nbsp;</span>
					</td>
					<td>
						<span title="${product.createDate?string("yyyy-MM-dd HH:mm:ss")}">${product.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
					</td>
					<td>
						[@shiro.hasPermission name = "admin:product_a_edit"]
							<a href="edit.jhtml?id=${product.id}">[${message("admin.common.edit")}]</a>
						[/@shiro.hasPermission]
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