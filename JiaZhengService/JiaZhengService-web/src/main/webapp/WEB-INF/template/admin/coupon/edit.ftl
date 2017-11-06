<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.coupon.edit")} - 家政服务平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/admin/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/resources/admin/uploadify/jquery.uploadify.min.js?time=${.now?date}${.now?time}"></script>
<style type="text/css">
</style>
<script type="text/javascript">


$().ready(function() {

	var $inputForm = $("#inputForm");
	
	[@flash_message /]
	
	$.validator.addMethod("compare", 
		function(value, element, param) {
			var parameterValue = $(param).val();
			if ($.trim(parameterValue) == "" || $.trim(value) == "") {
				return true;
			}
			try {
				return parseFloat(parameterValue) <= parseFloat(value);
			} catch(e) {
				return false;
			}
		},
		"${message("admin.coupon.compare")}"
	);
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			prefix: "required",
			minimumQuantity: "digits",
			maximumQuantity: {
				digits: true,
				compare: "#minimumQuantity"
			},
			minimumPrice: {
				min: 0,
				decimal: {
					integer: 12,
					fraction: ${setting.priceScale}
				}
			},
			maximumPrice: {
				min: 0,
				decimal: {
					integer: 12,
					fraction: ${setting.priceScale}
				},
				compare: "#minimumPrice"
			},
			priceExpression: {
				remote: {
					url: "check_price_expression.jhtml",
					cache: false
				}
			},
			circulation: {
			    min: 1,
				required: true,
				digits: true
			},
			limited: {
			    min: 1,
				required: true,
				digits: true
			}
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.coupon.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${coupon.id}" />
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.coupon.base")}" />
			</li>
		</ul>
		<div class="tabContent">
			<table class="input">
				<tr>
					<th>
						<span class="requiredField">*</span>${message("Coupon.name")}:
					</th>
					<td>
						<input type="text" name="name" class="text" value="${coupon.name}" maxlength="200" />
					</td>
				</tr>
				<tr style="display: none;">
					<th>
						<span class="requiredField">*</span>${message("Coupon.prefix")}:
					</th>
					<td>
						<input type="text" name="prefix" class="text" value="${coupon.prefix}" maxlength="200" />
					</td>
				</tr>
				<tr>
					<th>
						${message("Coupon.beginDate")}:
					</th>
					<td>
						<input type="text" id="beginDate" name="beginDate" class="text Wdate" value="[#if coupon.beginDate??]${coupon.beginDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
					</td>
				</tr>
				<tr>
					<th>
						${message("Coupon.endDate")}:
					</th>
					<td>
						<input type="text" id="endDate" name="endDate" class="text Wdate" value="[#if coupon.endDate??]${coupon.endDate?string("yyyy-MM-dd HH:mm:ss")}[/#if]" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
					</td>
				</tr>
				<tr>
					<th>
						${message("Coupon.minimumQuantity")}:
					</th>
					<td colspan="2">
						<input type="text" id="minimumQuantity" name="minimumQuantity" class="text" value="${coupon.minimumQuantity}" maxlength="9" />
					</td>
				</tr>
				<tr>
					<th>
						${message("Coupon.maximumQuantity")}:
					</th>
					<td colspan="2">
						<input type="text" name="maximumQuantity" class="text" value="${coupon.maximumQuantity}" maxlength="9" />
					</td>
				</tr>
				<tr>
					<th>
						${message("Coupon.minimumPrice")}:
					</th>
					<td colspan="2">
						<input type="text" id="minimumPrice" name="minimumPrice" class="text" value="${coupon.minimumPrice}" maxlength="16" />
					</td>
				</tr>
				<tr>
					<th>
						${message("Coupon.maximumPrice")}:
					</th>
					<td colspan="2">
						<input type="text" name="maximumPrice" class="text" value="${coupon.maximumPrice}" maxlength="16" />
					</td>
				</tr>
				<tr>
					<th>
						${message("Coupon.priceExpression")}:
					</th>
					<td colspan="2">
						<input type="text" name="priceExpression" class="text" value="${coupon.priceExpression}" maxlength="255" title="${message("admin.coupon.priceExpressionTitle")}" />
					</td>
				</tr>
				<tr>
					<th>
						${message("admin.common.setting")}:
					</th>
					<td>
						<label>
							<input type="checkbox" name="isEnabled" value="true"[#if coupon.isEnabled] checked="checked"[/#if] />${message("Coupon.isEnabled")}
							<input type="hidden" name="_isEnabled" value="false" />
						</label>
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("发行量")}:
					</th>
					<td>
						<input type="text" id="circulation" name="circulation"  value="${coupon.circulation}" class="text" maxlength="9" />
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>${message("每人限领")}:
					</th>
					<td>
						<input type="text" id="limited" name="limited" class="text" value="${coupon.limited}" maxlength="9" />
					</td>
				</tr>
			</table>
		</div>
		<table class="input">
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