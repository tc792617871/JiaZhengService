[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.order.list")} - 家政服务平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.flag-options li{
	float:left; 
	margin:0 5px;
	}
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
</style>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.qtip-1.0.0-rc3.min.js"></script>	
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $listForm = $("#listForm");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");
	var $print = $("select[name='print']");
	var $selectClear = $("#selectClear");
	var $clearAll = $("#clearAll");
	var $selectAll = $("#selectAll");
	var $editorderButton = $("#editorderButton");
	var flag;
	var sellerMemo;	
	
 	var qtipOrderItemContent = $("#qtipOrderItemContent");
	var qtipOrderItemContentClone = qtipOrderItemContent.clone();
	qtipOrderItemContentClone.css('display','table');
	[@compress single_line = true]
	var $trHd = $(
					'<tr class="title">
						<th>
							${message("OrderItem.sn")}
						<\/th>
						<th>
							${message("OrderItem.name")}
						<\/th>
						<th>
							${message("OrderItem.price")}
						<\/th>
						<th>
							${message("OrderItem.quantity")}
						<\/th>
						<th>
							${message("OrderItem.subtotal")}
						<\/th>
					<\/tr>');
	[/@compress]
	
	
	$("[name='orderSn']").mouseenter(function(){
		var getSn = $(this).html();
		$.ajax({
			url: 'orderItemTooltip.jhtml',
			type: "GET",
			cache: false,
			async:false,
			data: {orderSn: getSn},
			dataType: "json",
			success: function(data){
				qtipOrderItemContentClone.empty();
				$trHd.appendTo(qtipOrderItemContentClone);			 	
			    var $trDh = '';
			    for(var i = 0,len=data.orderItems.length; i < len; i++){
			        var orderItem = data.orderItems[i];
			        var scale =  orderItem.discount;
			        var scaleMessage='${message("Order.member.memberRank.noScale")}';
			        if (scale != 1){
			        	scaleMessage=orderItem.discount * 10+'${message("Order.scale")}';
			        }
			        [@compress single_line = true]
			        $trDh = $(
			        '<tr>
			                <td>
								<a>'+ orderItem.sn +'<\/a>
							<\/td>
							<td>
								<span title="' + orderItem.name +'"> '+ orderItem.name.substring(0,49) + '...' +'<\/span>
							<\/td>
							<td>
							  '+ orderItem.price +' 
							<\/td>
							<td>
								'+ orderItem.quantity +' 
							<\/td>
							<td>
								'+ orderItem.subtotal +'
							<\/td>
						<\/tr>');
					[/@compress]				
					$trDh.appendTo(qtipOrderItemContentClone);
			    }
			    
	          
			},
			error: function(){
			   
		    }
		});	  	
	});	
	$("[name='orderSn']").qtip({
		//content: qtipOrderItemContentClone,
		content: {
		   text: qtipOrderItemContentClone,
		   title: {
		       text: '${message("admin.common.orderDetails")}',
		       button: '${message("admin.common.close")}'
		   }
		},
		style: {
			width: true,
			height: true,
			tip:{
				width: '90%',
				height: 200
			}
		},
		position: {
     		at: 'bottom left',
     	 	adjust:{
     	 		x:-80
     		}
     	},
     	show: {
		    solo: true, // ...and hide all other tooltips...
		},
		hide: false
	     
	});

	
	[@flash_message /]
	
	//订单状态筛选中 点击全部按钮
	$selectClear.click(function(){
		$filterOption.removeClass("checked");
		$listForm.submit();
	});
	
	// 订单筛选
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
		$clearAll.removeClass("checked");
		var $all = $("#" + $clearAll.attr("name"));
		$all.val("");
		
		var $dest = $("#" + $this.attr("name"));
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
		$listForm.submit();
		return false;
	});
	
	// 编辑订单状态
	$editorderButton.click(function() {
		if($("#listTable tr td input:checked").parent().parent().length!=1){
			$.dialog({
				type: "warn",
				content: "只能选择一条记录！",
				ok: message("admin.dialog.ok"),
				cancel: message("admin.dialog.cancel"),
				onOk: function() {
				
				}
			});
		}else{
			var ordersn=$("#listTable tr td input:checked").parent().next().text();
			$.dialog({
				title: "${message("admin.order.editorder")}",
				[@compress single_line = true]
					content: '
					<table id="moreTable" class="moreTable">
						<tr>
							<th>
								${message("Order.sn")}:
							<\/th>
							<td>'+ordersn+'<\/td>
						<\/tr>
						<tr>
							<th>
								${message("Order.orderStatus")}:
							<\/th>
							<td>
								<select name="orderStatusId" id="orderStatusId">
									<option value="">${message("admin.common.choose")}<\/option>
									[#list orderStatusList as orderStatus]
										<option value="${orderStatus}">
											${message("Order.OrderStatus." + orderStatus)}
										<\/option>
									[/#list]
								<\/select>
							<\/td>
						<\/tr>
						<tr>
							<th>
								${message("Order.paymentStatus")}:
							<\/th>
							<td>
								<select name="paymentStatusId" id="paymentStatusId">
									<option value="">${message("admin.common.choose")}<\/option>
									[#list paymentStatusList as paymentStatus]
										<option value="${paymentStatus}">
											${message("Order.PaymentStatus." + paymentStatus)}
										<\/option>
									[/#list]
								<\/select>
							<\/td>
						<\/tr>
						<tr>
							<th>
								${message("Order.shippingStatus")}:
							<\/th>
							<td>
								<select name="shippingStatusId" id="shippingStatusId">
									<option value="">${message("admin.common.choose")}<\/option>
									[#list shippingStatusList as shippingStatus]
										<option value="${shippingStatus}">
											${message("Order.ShippingStatus." + shippingStatus)}
										<\/option>
									[/#list]
								<\/select>
							<\/td>
						<\/tr>
					<\/table>',
				[/@compress]
				width: 370,
				modal: true,
				ok: "${message("admin.dialog.ok")}",
				cancel: "${message("admin.dialog.cancel")}",
				onOk: function() {
					var currentOrdersn=$("#listTable tr td input:checked").parent().next().text();
					var currentOrderorderStatus=$("#orderStatusId").val();
					var currentOrderpaymentStatus=$("#paymentStatusId").val();
					var currentOrdershippingStatus=$("#shippingStatusId").val();
					var orderidString="orderid"+$.trim(ordersn);
					var orderidVal=$("#"+orderidString).val();
					var data = "";
					data = data +"&id=" + orderidVal+"&currentOrdersn=" + currentOrdersn+"&currentOrderorderStatus=" + currentOrderorderStatus+"&currentOrderpaymentStatus=" + currentOrderpaymentStatus+"&currentOrdershippingStatus=" + currentOrdershippingStatus;
					$.ajax({
					url: "updateOrserStatus.jhtml",
					type: "get",
					data:data,
					dataType: "json",
					cache: false,
					success: function(data) {
						$.message(data);
						if (data.message.type == "success") {
							$.dialog({
								type: "warn",
								content: '操作成功！',
								ok: message("admin.dialog.ok"),
								cancel: message("admin.dialog.cancel"),
								onOk: function() {
								
								}
							});
							setTimeout(function() {
									location.reload(true);
							}, 3000);
						}
					}
					});
				}
			});
			var orderStatusString="orderStatus"+$.trim(ordersn);
			var paymentStatusString="paymentStatus"+$.trim(ordersn);
			var shippingStatusString="shippingStatus"+$.trim(ordersn);
			var orderStatusVal=$("#"+orderStatusString).val();
			var paymentStatusVal=$("#"+paymentStatusString).val();
			var shippingStatusVal=$("#"+shippingStatusString).val();
			$("#orderStatusId option[value="+orderStatusVal+"]").attr("selected","selected");
			$("#paymentStatusId option[value="+paymentStatusVal+"]").attr("selected","selected");
			$("#shippingStatusId option[value="+shippingStatusVal+"]").attr("selected","selected");
			
		}
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.order.list")} <span>(${message("admin.page.total", page.count)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="status" name="status" value="${status}" />
		<input type="hidden" id="orderStatus" name="orderStatus" value="${orderStatus}" />
		<input type="hidden" id="paymentStatus" name="paymentStatus" value="${paymentStatus}" />
		<input type="hidden" id="shippingStatus" name="shippingStatus" value="${shippingStatus}" />
		<input type="hidden" id="hasExpired" name="hasExpired" value="[#if hasExpired??]${hasExpired?string("true", "false")}[/#if]" />
		<div class="bar">
			${message("admin.salesRanking.beginDate")}: <input type="text" id="beginDate" name="beginDate" class="text Wdate" value="${(beginDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({maxDate: '#F{$dp.$D(\'endDate\')}'});" />
			${message("admin.salesRanking.endDate")}: <input type="text" id="endDate" name="endDate" class="text Wdate" value="${(endDate?string('yyyy-MM-dd'))!}" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'beginDate\')}'});" />
			<input type="submit" class="button" value="${message("admin.common.submit")}" />
		</div>
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						${message("admin.order.filter")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
						 	<li>
						 		<a href="javascript:;" id="clearAll" name="status" val="allStatus"[#if status == "allStatus"] class="checked" [/#if]><span id="selectClear">${message("Order.status.all")}</span></a>	
						 	</li>
							<li class="separator">
								<a href="javascript:;" name="orderStatus" val="1"[#if orderStatus == "1"] class="checked"[/#if]>${message("Order.OrderStatus.unconfirmed")}</a>
							</li>
							<li>
								<a href="javascript:;" name="orderStatus" val="2"[#if orderStatus == "2"] class="checked"[/#if]>${message("Order.OrderStatus.confirmed")}</a>
							</li>
							<li>
								<a href="javascript:;" name="orderStatus" val="3"[#if orderStatus == "3"] class="checked"[/#if]>${message("Order.OrderStatus.completed")}</a>
							</li>
							<li>
								<a href="javascript:;" name="orderStatus" val="4"[#if orderStatus == "4"] class="checked"[/#if]>${message("Order.OrderStatus.cancelled")}</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="paymentStatus" val="1"[#if paymentStatus == "1"] class="checked"[/#if]>${message("Order.PaymentStatus.unpaid")}</a>
							</li>
							<li>
								<a href="javascript:;" name="paymentStatus" val="3"[#if paymentStatus == "3"] class="checked"[/#if]>${message("Order.PaymentStatus.paid")}</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="shippingStatus" val="1"[#if shippingStatus == "1"] class="checked"[/#if]>${message("Order.ShippingStatus.unshipped")}</a>
							</li>
							<li>
								<a href="javascript:;" name="shippingStatus" val="3"[#if shippingStatus == "3"] class="checked"[/#if]>${message("Order.ShippingStatus.shipped")}</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="hasExpired" val="true"[#if hasExpired?? && hasExpired] class="checked"[/#if]>${message("admin.order.hasExpired")}</a>
							</li>
							<li>
								<a href="javascript:;" name="hasExpired" val="false"[#if hasExpired?? && !hasExpired] class="checked"[/#if]>${message("admin.order.unexpired")}</a>
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
			<!--[@shiro.hasPermission name = "admin:order_button_editorderButton"]
			<div class="menuWrap">
					<a href="javascript:;" id="editorderButton" class="iconButton">
						<span class="editorderIcon">&nbsp;</span>${message("admin.order.editorder")}<span class="arrowNoSelect">&nbsp;</span>
					</a>
			</div>
			[/@shiro.hasPermission]-->
			</div>
			<div class="menuWrap">
				<div class="search">
					<label id="searchPropertySelectValue" class="value">${message("Page.searchPropertyValue")}</label>
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${pageable.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "sn"] class="current"[/#if] val="sn">${message("Order.sn")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if pageable.searchProperty == "username"] class="current"[/#if] val="username">${message("Member.username")}</a>
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
					<a href="javascript:;" class="sort" name="sn">${message("Order.sn")}</a>
				</th>
				<th>
					<span>${message("Order.amount")}</span>
				</th>
				<th>
					<span>${message("Order.member")}</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="consignee">${message("Order.consignee")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="phone">${message("Order.phone")}</a>
				</th>
				<th>
					<span>${message("Order.orderStatus")}</span>
				</th>
				<th>
					<span>${message("Order.paymentStatus")}</span>
				</th>
				<th>
					<span>${message("Order.shippingStatus")}</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="create_date">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("Order.payTime")}</span>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list content as order]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${order.id}" />
						<input type="hidden" name="orderStatus${order.sn}" id="orderStatus${order.sn}" value="${order.orderStatus}" />
						<input type="hidden" name="paymentStatus${order.sn}" id="paymentStatus${order.sn}" value="${order.paymentStatus}" />
						<input type="hidden" name="shippingStatus${order.sn}" id="shippingStatus${order.sn}" value="${order.shippingStatus}" />
						<input type="hidden" name="orderid${order.sn}" id="orderid${order.sn}" value="${order.id}" />
					</td>
					<td>
						<a name="orderSn" href="view.jhtml?id=${order.id}&paymentPluginId=${order.paymentPluginId}">${order.sn}</a>
						[#if order.orderSource == "mobile"]
							[<span style="color: red;">${message("Order.orderSource.mobile")}</span>]
						[/#if]
						[#if order.orderSource == "wap"]
							[<span style="color: red;">手机wap端订单</span>]
						[/#if]
					</td>
					<td>
						${currency(order.amount, true)}
					</td>
					<td>
						${order.tMember.username}
					</td>
					<td>
						${order.consignee}
					</td>
					<td>
						${order.phone}
					</td>
					<td>
						${message("Order.OrderStatus." + order.orderStatus)}
						[#if order.expired]<span class="gray">(${message("admin.order.hasExpired")})</span>[/#if]
					</td>
					<td>
						${message("Order.PaymentStatus." + order.paymentStatus)}
					</td>
					<td>
						${message("Order.ShippingStatus." + order.shippingStatus)}
					</td>
					<td>
						${order.createDate?string("yyyy-MM-dd HH:mm:ss")}
					</td>
					<td>	
						[#if order.payTime]
							${order.payTime?string("yyyy-MM-dd HH:mm:ss")}
						[#else] 
							-
						[/#if]
					</td>
					<td>
						<div>
							<a href="view.jhtml?id=${order.id}&paymentPluginId=${order.paymentPluginId}">[${message("admin.common.view")}]</a>
						<!--[@shiro.hasPermission name = "admin:order_a_edit"]
							[#if !order.expired && order.orderStatus == "1"]
								<a href="edit.jhtml?id=${order.id}">[${message("admin.common.edit")}]</a>
							[#else]
								<span title="${message("admin.order.editNotAllowed")}">[${message("admin.common.edit")}]</span>
							[/#if]
						[/@shiro.hasPermission]-->
						</div>
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.current totalPages = page.total]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
	
	<!--显示商品详情 -->
	<table id="qtipOrderItemContent" class="input tabContent" style="display:none;">
	</table>
</body>
</html>
