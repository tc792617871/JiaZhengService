<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>testListUsers</title>
<meta name="author" content="广州爱帛服饰有限公司 Team" />
<meta name="copyright" content="广州爱帛服饰有限公司" />
[#include "/admin/common/commonCss.ftl"]
</head>
<body>
	<!--<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.memberLanguage.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>-->
	<section class="wrapper">
		<!-- page start-->
		<div class="row">
			<div class="col-sm-12">
				<!--查询区域 start-->
				<section class="panel panel-default">
					<header class="panel-heading cust-header">
						查询条件 <span class="tools pull-right"> <a href="javascript:;"
							class="fa fa-chevron-down"></a>
						</span>
					</header>
					<div class="panel-body">
						<form class="form-horizontal" role="form" id="userList-query">
							<div class="form-group">
								<label for="topoID" class="col-lg-1 col-sm-1 control-label">
									日志级别 </label>
								<div class="col-lg-3 col-sm-3">
									<select class="form-control" id="logLevel" name="logLevel">
										<option></option>
										<option value="DEBUG">DEBUG</option>
										<option value="INFO">INFO</option>
										<option value="WARN">WARN</option>
										<option value="ERROR">ERROR</option>
										<option value="FATAL">FATAL</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-5 col-sm-4">
									<button id="query" type="button" class="btn cust-btn btn-sm">
										<i class="fa fa-search"></i>&nbsp;查询
									</button>
									&nbsp;&nbsp;
									<button id="clear" type="reset" class="btn cust-btn btn-sm">
										<i class="fa fa-eraser"></i>&nbsp;清空
									</button>
								</div>
							</div>
						</form>
					</div>
				</section>
				<!--查询区域 end-->
				<!--查询结果 start-->
				<section class="panel panel-default">
					<header class="panel-heading">
						<span class=""> 
						</span>
					</header>
					<div class="panel-body">
						<div class="adv-table">
							<table class="table table-bordered table-hover cust-table"
								id="userList">
							</table>
						</div>
					</div>
				</section>
				<!--查询结果 end-->
			</div>
		</div>
		<!-- page end-->
	</section>
	[#include "/admin/common/commonJS.ftl"]
	<script type="text/javascript" th:inline="javascript">
	$("#userList").dataTable({
		"sAjaxSource": "getLogList.do",
		"bAutoWidth" : true,
		"aoColumns" : [ {
			"sTitle" : "序号",
			"sName" : "userid",
			"mData" : "userid",
			"sClass":"text-center",
			"sWidth":"55px"
		}, {
			"sTitle" : "用户id",
			"sName" : "userid",
			"mData" : "userid",
			"sClass":"text-center col-sm-2 col-lg-2"
		} ,{
			"sTitle" : "用户名称",
			"sName" : "username",
			"mData" : "username",
			"sClass":"text-center col-sm-2 col-lg-2"
		}, {
			"sTitle" : "年龄",
			"sName" : "age",
			"mData" : "age",
			"sClass":"text-center col-sm-2 col-lg-2"
		}]
	});
	</script>
</body>
</html>