[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.log.list")} - 家政服务管理平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	var $clearButton = $("#clearButton");
	var $resultRow = $("#listTable tr:gt(0)");
	
	[@flash_message /]
	
	$clearButton.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("admin.dialog.clearConfirm")}",
			onOk: function() {
				$.ajax({
					url: "clear.jhtml",
					type: "POST",
					dataType: "json",
					cache: false,
					success: function(message) {
						if (message.type == "success") {
							$resultRow.remove();
						}
						$.message(message);
					}
				});
			}
		});
		return false;
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.log.list")} <span>(${message("admin.page.total", page.count)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
			<div class="buttonWrap">
			[@shiro.hasPermission name = "admin:log_button_deleteButton"]
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
			[/@shiro.hasPermission]
			[@shiro.hasPermission name = "admin:log_button_clearButton"]
				<a href="javascript:;" id="clearButton" class="iconButton">
					<span class="clearIcon">&nbsp;</span>${message("admin.common.clear")}
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
							<a href="javascript:;"[#if pageable.searchProperty == "operation"] class="current"[/#if] val="operation">${message("Log.operation")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "operator"] class="current"[/#if] val="operator">${message("Log.operator")}</a>
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
					<a href="javascript:;" class="sort" name="operation">${message("Log.operation")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="operator">${message("Log.operator")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="ip">${message("Log.ip")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="content">${message("Log.content")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="create_date">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list content as log]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${log.id}" />
					</td>
					<td>
						${log.operation}
					</td>
					<td>
						${log.operator}
					</td>
					<td>
						${log.ip}
					</td>
					<td>
						[#if log.content??]
							<span title="${log.content}">${abbreviate(log.content, 50, "...")}</span>
						[/#if]
					</td>
					<td>
						<span title="${log.createDate?string("yyyy-MM-dd HH:mm:ss")}">${log.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
					</td>
					<td>
						<a href="view.jhtml?id=${log.id}">[${message("admin.common.view")}]</a>
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