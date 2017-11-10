[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.coupon.list")} - 家政服务平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.coupon.list")} <span>(${message("admin.page.total", page.count)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
		[@shiro.hasPermission name = "admin:coupon_icon_addIcon"]
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>
		[/@shiro.hasPermission]
			<div class="buttonWrap">
			[@shiro.hasPermission name = "admin:coupon_button_deleteButton"]
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
			[/@shiro.hasPermission]
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
							<a href="javascript:;"[#if pageable.searchProperty == "name"] class="current"[/#if] val="name">${message("Coupon.name")}</a>
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
					<a href="javascript:;" class="sort" name="name">${message("Coupon.name")}</a>
				</th>
				<!--
				<th>
					<a href="javascript:;" class="sort" name="prefix">${message("Coupon.prefix")}</a>
				</th>
				-->
				<th>
					<a href="javascript:;" class="sort" name="beginDate">${message("Coupon.beginDate")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="endDate">${message("Coupon.endDate")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="isEnabled">${message("Coupon.isEnabled")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="circulation">${message("发行量")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="limited">${message("每人限领")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list content as coupon]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${coupon.id}" />
					</td>
					<td>
						${coupon.name}
					</td>
					<!--
					<td>
						${coupon.prefix}
					</td>
					-->
					<td>
						[#if coupon.beginDate??]
							<span title="${coupon.beginDate?string("yyyy-MM-dd HH:mm:ss")}">${coupon.beginDate?string("yyyy-MM-dd HH:mm:ss")}</span>
						[#else]
							-
						[/#if]
					</td>
					<td>
						[#if coupon.endDate??]
							<span title="${coupon.endDate?string("yyyy-MM-dd HH:mm:ss")}">${coupon.endDate?string("yyyy-MM-dd HH:mm:ss")}</span>
						[#else]
							-
						[/#if]
					</td>
					<td>
						<span class="${coupon.isEnabled?string("true", "false")}Icon">&nbsp;</span>
					</td>
					<td>
					   ${coupon.circulation}
					</td>
					<td>
					   ${coupon.limited}
					</td>
					<td>
					[@shiro.hasPermission name = "admin:coupon_a_build"]
						<a href="build.jhtml?id=${coupon.id}">[${message("admin.coupon.build")}]</a>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name = "admin:coupon_a_edit"]
						<a href="edit.jhtml?id=${coupon.id}">[${message("admin.common.edit")}]</a>
					[/@shiro.hasPermission]
					
					[#if !coupon.expired]
					    <a href="provideCoupon.jhtml?couponId=${coupon.id}">[${message("站内发送优惠券")}]</a>
					[/#if]
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