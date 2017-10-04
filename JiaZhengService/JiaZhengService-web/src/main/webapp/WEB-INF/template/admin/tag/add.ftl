<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.tag.add")} - 家政服务管理平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/admin/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/uploadify/jquery.uploadify.min.js?time=${.now?date}${.now?time}"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $browserButton = $("#browserButton");
	var $columnCoverImageUploadMO = $("#columnCoverImageUploadMO");
	var $showColumnCoverImageMO = $("#showColumnCoverImageMO");
	var $columnCoverImageUploadED = $("#columnCoverImageUploadED");
	var $showColumnCoverImageED = $("#showColumnCoverImageED");
	[@flash_message /]
	
	$browserButton.browser();
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			code: "required",
			orders: "digits"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.tag.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Tag.name")}:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Tag.code")}:
				</th>
				<td>
					<input type="text" name="code" class="text" maxlength="100" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Tag.type")}:
				</th>
				<td>
					<select name="type">
						[#list types as type]
							<option value="${type.code}">${message("Tag.Type." + type.code)}</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					${message("Tag.icon")}:
				</th>
				<td>
					<input type="text" name="icon" class="text" maxlength="200" />
					<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
				</td>
			</tr>
			<!--<tr>
				<th>
					${message("admin.mobile.mobileCover")}(MO):
				</th>
				<td>
					<input type="file" id="columnCoverImageUploadMO" />
					<img src="#" style="display: none;" height="20%" id="showColumnCoverImageMO" />
				   <input type="hidden" name="moMobileCover"  class="text" id="mobileCoverMO" />
				</td>
			 </tr>
			 <tr>
				<th>
					${message("admin.mobile.mobileCover")}(ED):
				</th>
				<td>
					<input type="file" id="columnCoverImageUploadED" />
					<img src="#" style="display: none;" height="20%" id="showColumnCoverImageED" />
				   <input type="hidden" name="edMobileCover"  class="text" id="mobileCoverED" />
				</td>
			 </tr>-->
			 <tr>
			     <th>
			         是否展示
			     </th>
			     <td>
			         <input type="checkbox" name="isEnabled" value="true"/>${message("是否展示")}
					<input type="hidden" name="_isEnabled" value="false" />
			     </td>
			 </tr>
			<tr>
				<th>
					${message("Tag.memo")}:
				</th>
				<td colspan="4">
					<input type="text" name="memo" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.order")}:
				</th>
				<td>
					<input type="text" name="orders" class="text" maxlength="9" />
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