<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.product.add")} - 家政服务管理平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/admin/uploadify/uploadify.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/uploadify/jquery.uploadify.min.js?time=${.now?date}${.now?time}"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>

<style type="text/css">
	.specificationSelect {
		height: 100px;
		padding: 5px;
		overflow-y: scroll;
		border: 1px solid #cccccc;
	}
	
	.specificationSelect li {
		float: left;
		min-width: 150px;
		_width: 200px;
	}
</style>

<script type="text/javascript">

var parametersAll = new Array();

$().ready(function() {

	var $inputForm = $("#inputForm");
	
	var $productCategoryId = $("#productCategoryId");
	
	var $browserButton = $("#browserButton");
	$browserButton.browser();
		
	var $addSpecificationProduct = $("#addSpecificationProduct");
	var $specificationProductTable = $("#specificationProductTable");
	var $specificationProductTableTBody = $("#specificationProductTableTBody");
	var $deleteSpecification = $("#specificationProductTableTBody a.deleteSpecification");
	var specificationIndex = 0;
	// 增加规格商品
	$addSpecificationProduct.click(function() {
		$("a.iconButton").each(function(){
			$(this).unbind();
		    $(this).unbind();
		});
		 
		if($specificationProductTableTBody.find("tr").length == 0){
		    specificationIndex = 0;
		}
		[@compress single_line = true]
			var trHtml = 
			'<tr>
				<td>
					'+(specificationIndex==0 ? "当前规格" : "&nbsp;")+'
				<\/td>
				<td>
					<input type="text" name="specifications[' + specificationIndex + '].name" required="required" class="text" maxlength="200" style="width: 130px;"\/>
				<\/td>
				<td>
					<input type="text" name="specifications[' + specificationIndex + '].code" required="required" class="text" maxlength="200" style="width: 130px;"\/>
				<\/td>
				<td>
					<input type="text" name="specifications[' + specificationIndex + '].orders" required="required" class="text" maxlength="9" style="width: 30px;" readonly="true" value="'+(specificationIndex+1)+'"\/>
				<\/td>
				<td>
					<input type="text" name="specifications[' + specificationIndex + '].price" required="required" class="text number" placeholder="保留1位小数" maxlength="200" style="width: 75px;"\/>
				<\/td>
				<td>
					<input type="text" name="specifications[' + specificationIndex + '].unit" required="required" class="text" maxlength="200" style="width: 130px;"\/>
				<\/td>
				<td>
					<input type="text" name="specifications[' + specificationIndex + '].minNum" required="required" class="text number" placeholder="保留1位小数" maxlength="200" style="width: 75px;"\/>
				<\/td>
				<td>
					<input type="text" name="specifications[' + specificationIndex + '].maxNum" required="required" class="text number" placeholder="保留1位小数" maxlength="200" style="width: 75px;"\/>
				<\/td>
				<td>
					<a id= ""href="#" class="iconButton upIcon"  style="float: none;"><span class="upIcon"></span></a>
			        <a href="#" class="iconButton downIcon" style="float: none;"><span class="downIcon"></span></a>
				<\/td>
				<td>
					<a href="javascript:;" class="deleteSpecification">[${message("admin.common.delete")}]<\/a>
				<\/td>
			<\/tr>';
		[/@compress]
		$specificationProductTableTBody.append(trHtml);
		specificationIndex ++;
		
		//上移方法
		var upfn = function() {
	        var $tr = $(this).parents("tr");
	        if ($tr.index() == 0) {
	           $.message("warn", "${message("admin.productCategory.upbtnMessage")}");
	           return false;
	        }
	        else{
	          var currentOrder= $tr.find("td:eq(3)").find("input").attr("value");
	          var preOrder =  $tr.prev().find("td:eq(3)").find("input").attr("value");
	          $tr.find("td:eq(3)").find("input").attr("value",preOrder);
	          $tr.prev().find("td:eq(3)").find("input").attr("value",currentOrder);
	          $tr.prev().before($tr);
	        }
	    };
    
    	//下移方法
     	var downfn = function() {
	    	var rowCount = $("#specificationProductTableTBody tr").length;
	        var $tr = $(this).parents("tr");
	        if ($tr.index() == rowCount-1) {
	           $.message("warn", "${message("admin.productCategory.downbtnMessage")}");
	            return false;
	        }
	        else{
	          var currentOrder= $tr.find("td:eq(3)").find("input").attr("value");
	          var nextOrder =  $tr.next().find("td:eq(3)").find("input").attr("value");
	          $tr.find("td:eq(3)").find("input").attr("value",nextOrder);
	          $tr.next().find("td:eq(3)").find("input").attr("value",currentOrder);
	          $tr.next().after($tr);
	        }
	    };
		//上移
	    $("a.upIcon").click(upfn);
	    //下移
	    $("a.downIcon").click(downfn);
	});
	
	// 删除规格
	$deleteSpecification.live("click", function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("admin.dialog.deleteConfirm")}",
			onOk: function() {
				$this.closest("tr").remove();
			}
		});
	});
	
	[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			productCategoryId: "required",
			sn: {
				required: true,
				pattern: /^[0-9a-zA-Z_-]+$/,
				remote: {
					url: "check_sn.jhtml",
					cache: false
				}
			},
			name: "required",
			image:"required",
			introduction:"required",
			memo:"required"
		},
		messages: {
			sn: {
				pattern: "${message("admin.validate.illegal")}",
				remote: "${message("admin.validate.exist")}"
			}
		},
		submitHandler: function(form) {
			if($specificationProductTableTBody.find("tr").length == 0){
				return false;
			}
			form.submit();
		}
	});
	
	//商品介绍
	if(typeof(KindEditor) != "undefined") {
		KindEditor.ready(function(K) {
			editor = K.create("#introduction_editor", {
				height: "350px",
				items: [
					"source", "|", "undo", "redo", "|", "preview", "print", "template", "cut", "copy", "paste",
					"plainpaste", "wordpaste", "|", "justifyleft", "justifycenter", "justifyright",
					"justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent", "subscript",
					"superscript", "clearhtml", "quickformat", "selectall", "|", "fullscreen", "/",
					"formatblock", "fontname", "fontsize", "|", "forecolor", "hilitecolor", "bold",
					"italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image",
					"flash", "media", "insertfile", "table", "hr", "emoticons", "baidumap", "pagebreak",
					"anchor", "link", "unlink"
				],
				langType: jiazhengservice.locale,
				syncType: "form",
				filterMode: false,
				pagebreakHtml: '<hr class="pageBreak" \/>',
				allowFileManager: true,
				filePostName: "file",
				fileManagerJson: jiazhengservice.base + "/admin/file/browser.jhtml",
				uploadJson: jiazhengservice.base + "/admin/file/upload.jhtml",
				uploadImageExtension: setting.uploadImageExtension,
				uploadFlashExtension: setting.uploadFlashExtension,
				uploadMediaExtension: setting.uploadMediaExtension,
				uploadFileExtension: setting.uploadFileExtension,
				extraFileUploadParams: {
					token: getCookie("token")
				},
				afterChange: function() {
					this.sync();
				}
			});
		});
	}
	
});

</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.product.add")}
	</div>
	<form id="inputForm" action="save.jhtml" method="post" enctype="multipart/form-data">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.product.base")}" />
			</li>
			<li>
				<input type="button" value="${message("admin.product.specification")}" />
			</li>
		</ul>
		<table class="input tabContent">
		<input type="hidden" id="type" name="type" value="prompt">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Product.productCategory")}:
				</th>
				<td>
					<select id="productCategoryId" name="productCategoryId">
					    <option value="" selected="selected">
					        请选择
					    </option>
						[#list productCategoryTree as productCategory]
							<option value="${productCategory.id}">
								[#if productCategory.grade != 0]
									[#list 1..productCategory.grade as i]
										&nbsp;&nbsp;
									[/#list]
								[/#if]
								${productCategory.nameZh}
							</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Product.sn")}:
				</th>
				<td>
					<input type="text" name="sn" class="text" maxlength="50" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Product.name")}:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.memo")}:
				</th>
				<td>
					<textarea name="memo" rows="3" cols="20" class="text" maxlength="200" /></textarea>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Product.image")}${message("Product.productImageSize")}:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" name="image" class="text" maxlength="200" title="${message("admin.product.imageTitle")}" />
						<input type="button" id="browserButton" class="button" value="${message("admin.browser.select")}" />
						<img width="60px"/>
					</span>
				</td>
			</tr>
			<tr>
				<th>
					${message("Product.tags")}:
				</th>
				<td>
					[#list tags as tag]
						<label>
							<input type="checkbox" name="tagIds" value="${tag.id}" />${tag.name}
						</label>
					[/#list]
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.setting")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isMarketable" value="true" id="isMarketable"/>${message("Product.isMarketable")}
						<input type="hidden" name="_isMarketable" value="false" />
					</label>
					<label>
						<input type="checkbox" name="isSquare" value="true" id="isSquare"/>${message("Product.isSquare")}
						<input type="hidden" name="_isSquare" value="false" />
					</label>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("admin.product.introduction")}:
				</th>
				<td>
					<textarea id="introduction_editor" name="introduction" class="editor" style="width: 100%;"></textarea>
				</td>
			</tr>
		</table>
		<table class="input tabContent" id="specificationProductTable">
			<tr class="title">
				<td colspan="9">
					<a href="javascript:;" id="addSpecificationProduct" class="button">${message("admin.product.addSpecificationProduct")}</a>
				</td>
			</tr>
			<tr class="title">
				<td width="60">
					&nbsp;
				</td>
				<td>
					${message("Specification.name")}
				</td>
				<td>
					${message("Specification.code")}
				</td>
				<td>
					${message("Specification.order")}
				</td>
				<td>
					${message("Specification.price")}
				</td>
				<td>
					${message("Specification.unit")}
				</td>
				<td>
					${message("Specification.minNum")}
				</td>
				<td>
					${message("Specification.maxNum")}
				</td>
				<td>
					${message("Specification.order")}
				</td>
				<td>
					${message("admin.common.handle")}
				</td>
			</tr>
			<tbody id="specificationProductTableTBody">
			</tbody>
		</table>
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