<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.coupon.build")} - MO&Co.</title>
<meta name="author" content="广州爱帛服饰有限公司 Team" />
<meta name="copyright" content="广州爱帛服饰有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $totalCount = $("#totalCount");
	var releaseCount = ${circulation};
	var $count = $("#count");
	var $totalCount = $("#totalCount");
	
	[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			count: {
				required: true,
				integer: true,
				min: 1,
				max:${circulation}
			}
		},
		submitHandler: function(form) {
			var tempCount = parseInt($totalCount.html()) + parseInt($count.val());
			if(releaseCount < tempCount){
				$.message("warn",message('已生成的优惠码不能超过发行量'));
				return false;
			}
			$totalCount.text(tempCount);
			form.submit();
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.coupon.build")}
	</div>
	<form id="inputForm" action="submit_build.jhtml" method="post">
		<input type="hidden" name="id" value="${coupon.id}" />
		<table class="input">
			<tr>
				<th>
					${message("Coupon.name")}:
				</th>
				<td>
					${coupon.name}
				</td>
			</tr>
			<tr>
				<th>
					${message("Coupon.beginDate")}:
				</th>
				<td>
					[#if coupon.beginDate??]
						${coupon.beginDate?string("yyyy-MM-dd")}
					[#else]
						-
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("Coupon.endDate")}:
				</th>
				<td>
					[#if coupon.endDate??]
						${coupon.endDate?string("yyyy-MM-dd")}
					[#else]
						-
					[/#if]
				</td>
			</tr>
			<tr>
				<th>
					${message("发行量")}:
				</th>
				<td>
					${coupon.circulation}
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.coupon.totalCount")}:
				</th>
				<td>
					<span id="totalCount">${totalCount}</span>
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.coupon.usedCount")}:
				</th>
				<td>
					${usedCount}
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("admin.coupon.count")}:
				</th>
				<td>
					<input type="text" id="count" name="count" class="text" value="50" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>