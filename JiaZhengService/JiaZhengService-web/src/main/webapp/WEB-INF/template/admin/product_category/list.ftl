[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.productCategory.list")} - 家政服务管理平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $delete = $("#listTable a.delete");
	
	[@flash_message /]

	// 删除
	$delete.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "${message("admin.dialog.deleteConfirm")}",
			onOk: function() {
				$.ajax({
					url: "delete.jhtml",
					type: "POST",
					data: {id: $this.attr("val")},
					dataType: "json",
					cache: false,
					success: function(message) {
						$.message(message);
						if (message.type == "success") {
							$this.closest("tr").remove();
						}
					}
				});
			}
		});
		return false;
	});
  //上移
    $("a.iconButton.upIcon").click(function() {
        var $tr = $(this).parents("tr");
        if ($tr.index() == 1) {
           $.message("warn", "${message("admin.productCategory.upbtnMessage")}");
            return false;
        }
        else{
          var $currentId= this.attributes.procuctCatOrder.nodeValue;
          var $changeId =  $tr.prev().find("td:eq(2)").find("a:eq(0)")[0].attributes.procuctCatOrder.nodeValue;
          $.ajax({
					url: "changeOrders.jhtml",
					type: "POST",
					data: {
					    currentId: $currentId, 
					    changeId: $changeId, 
					    btnType:"up"
						},
					dataType: "json",
					cache: false,
					async:false,
					success: function(message) {
					if (message.type == "success"){  
					    $tr.prev().before($tr);
				  }
				}
			});
        }
    });
    //下移
    var $downbtns = $("a.iconButton.downIcon");
    var len = $downbtns.length;
    $downbtns.click(function() {
        var $tr = $(this).parents("tr");
        if ($tr.index() == len) {
            $.message("warn", "${message("admin.productCategory.downbtnMessage")}");
            return false;
        }
        else{
          var $currentId= this.attributes.procuctCatOrder.nodeValue;
          var $changeId =  $tr.next().find("td:eq(2)").find("a:eq(0)")[0].attributes.procuctCatOrder.nodeValue;
          $.ajax({
					url: "changeOrders.jhtml",
					type: "POST",
					data: {
					    currentId: $currentId, 
					    changeId: $changeId, 
					    btnType:"down",
						},
					dataType: "json",
					cache: false,
					async:false,
					success: function(message) {
					if (message.type == "success"){  
					    $tr.next().after($tr);
				  	}
				  }
			  });
        }
    });
   
   
    //置顶
    $("a.iconButton.top").click(function() {
        var $tr = $(this).parents("tr");
        if ($tr.index() == 1) {
           $.message("warn", "${message("已经是第一行,不能置顶")}");
            return false;
        }
        else{
          var $currentId= this.attributes.orders.value;
          var $allTr =  $tr.prevAll();
          var $firstTr = $allTr[0];
          $.ajax({
					url: "topOrders.jhtml",
					type: "POST",
					data: {
					    id: $currentId
						},
					dataType: "json",
					cache: false,
					async:false,
					success: function(message) {
					if (message.type == "success"){  
					    location.reload();
				  }
				}
			});
        }
    });
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.productCategory.list")}
	</div>
	<div class="bar">
	[@shiro.hasPermission name = "admin:productCategory_icon_addIcon"]
		<a href="add.jhtml" class="iconButton">
			<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
		</a>
	[/@shiro.hasPermission]
		<a href="javascript:;" id="refreshButton" class="iconButton">
			<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
		</a>
	</div>
	<table id="listTable" class="list">
		<tr>
			<th>
				<span>${message("ProductCategory.name")}(Zh)</span>
			</th>
			<th>
				<span>${message("ProductCategory.name")}(En)</span>
			</th>
			<th>
				<span>${message("admin.common.order")}</span>
			</th>
			<th>
				<span></span>
			</th>
			<th>
				<span>${message("admin.common.handle")}</span>
			</th>
		</tr>
		[#list productCategoryTree as productCategory]
			<tr>
				<td>
					<span style="margin-left: ${productCategory.grade * 20}px;[#if productCategory.grade == 0] color: #000000;[/#if]">
						${productCategory.nameZh}
					</span>
				</td>
				<td>
					<span style="margin-left: ${productCategory.grade * 20}px;[#if productCategory.grade == 0] color: #000000;[/#if]">
						${productCategory.nameEn}
					</span>
				</td>
				<td>
				  <!-- <span style="margin-left;" id = "orderNum_${productCategory.id}">${productCategory.order}</span> -->
				    <a href="#"class="iconButton upIcon" procuctCatOrder="${productCategory.id}" style="float: none;"><span class="upIcon"></span></a>
				    <a href="#"class="iconButton downIcon" procuctCatOrder="${productCategory.id}" style="float: none;"><span class="downIcon"></span></a>
				</td>
				<td>
				    <a href="#"class="iconButton top"  orders="${productCategory.id}" style="float: none;"><span class="top">置顶</span></a>
				</td>
				<td>
					[@shiro.hasPermission name = "admin:productCategory_a_edit"]
						<a href="edit.jhtml?id=${productCategory.id}">[${message("admin.common.edit")}]</a>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name = "admin:productCategory_a_delete"]
						<a href="javascript:;" class="delete" val="${productCategory.id}">[${message("admin.common.delete")}]</a>
					[/@shiro.hasPermission]
				</td>
			</tr>
		[/#list]
	</table>
</body>
</html>