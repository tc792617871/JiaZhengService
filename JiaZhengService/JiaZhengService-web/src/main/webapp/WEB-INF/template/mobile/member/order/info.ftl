<!DOCTYPE html> 
<html>
<head>
<title>${setting.siteName}</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/mobile/css/order.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $orderForm = $("#orderForm");
	var $receiverId = $("#receiverId");
	var $consignee = $("#consignee");
	var $phone = $("#phone");
	var $address = $("#address");
	var $zipCode = $("#zipCode");
	var $code = $("#code");

	m$.header.titleContent.setTitle("处理订单");
	$(".header_2 .cart_area").remove();
	$(".header_2 .home_area").remove();
	
	$("#modify_orderAreaId").lSelect({
	    url: "${base}/mobile/common/area.jhtml"
	});
	
	/**收货地址选择*/
	$(document).on("click", ".receiverList ul>li", function(event) {
		var $consigneeTR = $("#consigneeTR");
		var $phoneTR = $("#phoneTR");
		var $addressTR = $("#addressTR");
		var $zipCodeTR = $("#zipCodeTR");
		var $addBtn = $("#addBtn");
		if(!!$(this).hasClass("selected")){
			$(this).removeClass("selected");
			$consigneeTR.hide();
			$phoneTR.hide();
			$addressTR.hide();
			$zipCodeTR.hide();
			$receiverId.val("");
			$addBtn.show();
		}else{
			$(this).addClass("selected").siblings("li").removeClass("selected");
			$receiverId.val($(this).attr("dataid"));
			$consignee.html($(this).find("#receiverConsignee").html());
			$phone.html($(this).find("#receiverPhone").html());
			$address.html($(this).find("#receiverAddress").html());
			$zipCode.html($(this).find("#receiverZipCode").html());
			$consigneeTR.show();
			$phoneTR.show();
			$addressTR.show();
			$zipCodeTR.show();
			$addBtn.hide();
			$("#receiverModal").find("button.md-close").click();
		}
	});
	
	/**优惠券选择*/
	$("#couponsModal").each(function(){
		var i=$(this);
		var p=i.find("ul>li");
		p.click(function(){
			if(!!$(this).hasClass("selected")){
				$(this).removeClass("selected");
			}else{
				$(this).addClass("selected").siblings("li").removeClass("selected");
				$code.val($(this).attr("dataid"));
			}
			calculate();
		});
	});
});

// 计算
function calculate() {
	var $orderForm = $("#orderForm");
	var $couponDiscount = $("#couponDiscount");
	var $beEconomical = $("#beEconomical");
	var $amountPayable = $("#amountPayable");
	var $effectivePrice = $("#effectivePrice");
	$.ajax({
		url: "calculate.jhtml",
		type: "POST",
		data: $orderForm.serialize(),
		dataType: "json",
		cache: false,
		success: function(data) {
			if (data.message.type == "success") {
				if (data.couponDiscount > 0) {
					$couponDiscount.text(currency(data.couponDiscount, true));
					$beEconomical.text(currency(data.couponDiscount, true));
					$couponDiscount.parent().parent().show();
				} else {
					$couponDiscount.parent().parent().hide();
				}
				$amountPayable.text(currency(data.amountPayable, true, false));
				$effectivePrice.text(currency(data.amountPayable, true, false));
			} else {
				$.message(data.message);
				setTimeout(function() {
					location.reload(true);
				}, 3000);
			}
		}
	});
}

function addNewAddress(){
   var $receiverModifyAreaSpan = $("#receiverModifyAreaSpan");
   var $areaSelects = $receiverModifyAreaSpan.find("select");
   m$.business.cart.addAddress($receiverModifyAreaSpan,$areaSelects);
}

</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
		<div class="moMobileContent orderInfo">
			<form id="orderForm" action="create.jhtml" method="post" onsubmit="return false;"> 
				<input type="hidden" id="receiverId" name="receiverId"[#if defaultReceiver??] value="${defaultReceiver.id}"[/#if] />
				<input type="hidden" id="cartItemIds" name="cartItemIds" value="${cartItemIds}" />
				<input type="hidden" id="productId" name="productId" value="${productId}" />
				<input type="hidden" id="specificationId" name="specificationId" value="${specificationId}" />
				<input type="hidden" id="quantity" name="quantity" value="${quantity}" />
				
				<!--<input type="hidden" id="paymentPluginId" name="paymentPluginId" value="alipayWapPlugin" />-->
				<input type="hidden" id="paymentPluginId" name="paymentPluginId" value="wxJsPlugin" />
				<input type="hidden" name="code" id="code" value=""/>
				<div class="orderInfoContent">
					<div>
						<ul>
						    <li class="md-trigger order-items" data-modal="orderProductInfoModal">
						        <table>
						        	<tr>
						                <td>
						                	<div class="order-items-brief">
							                    <img src="${base}/resources/mobile/icons/default_order_item_pic.jpg">
												<span class="description">${order.quantity}件产品</span>
												<span class="price">实付金额:<span id="amountPayable">${currency(order.amountPayable, true, false)}</span></span>
											</div>
						                </td>
						                 <td>
						                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="rightArrow"/>
						                </td>
						            </tr>
						        </table>
						    </li>
						    <li class="md-trigger" data-modal="receiverModal">
						        <table>
						            <tr>
						                <td>
						                    <img src="${base}/resources/mobile/icons/location.png" class="imgIcon">
						                    <span class="tableSpan">收货信息</span>
						                </td>
						                <td>
						                   <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="rightArrow"/>
						                </td>
						            </tr>
						            [#if defaultReceiver??] 
							            <tr>
							                <td>
							                    <label for="consignee">收件人:</label>
							                    <span id="consignee">${defaultReceiver.consignee}</span>
							                </td>
							            </tr>
							            <tr>
							                <td>
							                    <label for="phone">手机号码:</label>
							                    <span id="phone">${defaultReceiver.phone}</span>
							                </td>
							            </tr>
							            <tr>
							                <td>
							                    <label for="address">地址:</label>
							                    <span id="address">
												  ${defaultReceiver.areaName}${defaultReceiver.address}
							                    </span>
							                </td>
							            </tr>
							            <tr>
							                <td>
							                    <label for="zipCode">邮编:</label>
							                    <span id="zipCode">${defaultReceiver.zipCode}</span>
							                </td>
							            </tr>
							         [#else]
							             <tr id="addBtn">
							                <td>
							                    点击新增收货地址
							                </td>
							            </tr>
							            <tr id="consigneeTR" style="display:none;">
							                <td>
							                    <label for="consignee">收件人:</label>
							                    <span id="consignee">${defaultReceiver.consignee}</span>
							                </td>
							            </tr>
							            <tr id="phoneTR" style="display:none;">
							                <td>
							                    <label for="phone">手机号码:</label>
							                    <span id="phone">${defaultReceiver.phone}</span>
							                </td>
							            </tr>
							            <tr id="addressTR" style="display:none;">
							                <td>
							                    <label for="address">地址:</label>
							                    <span id="address">
												  ${defaultReceiver.areaName}${defaultReceiver.address}
							                    </span>
							                </td>
							            </tr>
							            <tr id="zipCodeTR" style="display:none;">
							                <td>
							                    <label for="zipCode">邮编:</label>
							                    <span id="zipCode">${defaultReceiver.zipCode}</span>
							                </td>
							            </tr>
						             [/#if]
						         </table>
						    </li>
						    <li class="md-trigger" data-modal="orderServiceTimeModal">
						        <table>
						            <tr>
						                <td>
						                    <img src="${base}/resources/mobile/icons/clock.png" class="imgIcon">
						                    <span class="tableSpan workTime">请选择服务时间</span>
						                    <input type="hidden" id="weekdays" name="weekdays"/> 
						                    <input type="hidden" id="timearea" name="timearea"/> 
						                    <input type="hidden" id="time" name="time"/>
						                </td>
						                <td>
						                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="rightArrow"/>
						                </td>
						            </tr>
						        </table>
						    </li>
						    [#if isSquare]
						    <li class="orderAreaSquare">
						        <table>
						            <tr>
						                <td style="width:25px;">
						                </td>
						                <td>
				                    		<input type="text" name="areaSquare" id="areaSquare" placeholder="房屋面积"/>㎡ (请正确填写平米数)
						                </td>
						            </tr>
						        </table>
						    </li>
						    [/#if]
						    <!--
						    <li class="md-trigger" data-modal="paymentPluginModal">
						         <table>
						            <tr>
						                <th>
						                   支付方式
						                </th>
						                <td rowspan="2" class="rightArrow">
						                   <img src="${base}/resources/mobile/images/icon_rightarrow.png" width="8px"/>
						                </td>
						            </tr>
						            <tr>
						                <td>
							               <span id="paymentPluginText">微信支付</span>
						                </td>
						            </tr>
						         </table>
						    </li>
						    -->
						    <li class="order-info-memo">
						         <table>
						            <tr>
						                <td>
						                    <textarea id="memo" placeholder="备注（非必填 最多100字）还有什么要求写在这里吧" name="memo"></textarea>
						                </td>
						            </tr>
						         </table>
						    </li>
						    <li class="md-trigger" data-modal="couponsModal">
						         <table>
						            <tr>
						                <td>
						                    <img src="${base}/resources/mobile/icons/money.png" class="imgIcon">
						                    <span class="tableSpan">优惠券</span>
						                </td>
						                <td>
						                   <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="rightArrow"/>
						                </td>
						            </tr>
						            <tr style="display:none">
						                <td>
						                    <label for="couponDiscount">优惠金额:</label>
						                    <span id="couponDiscount">${currency(order.couponDiscount, true, false)}</span>
						                </td>
						            </tr>
						         </table>
						     </li>
						    <li>
						    </li>
						</ul>
						<div class="nextBtnDiv">
						    <button type="button" id="submitOrderInfo" onclick="m$.business.cart.submitOrderInfo();">提交订单</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!-- end 订单详情 -->
		<!-- the overlay element -->
		<div class="md-overlay"></div>
		
		<div class="md-modal md-orderProductInfoModal" id="orderProductInfoModal">
			<div class="md-content">
				<div>
					[#if order?? && order.orderItems?has_content]
						<ul>
							[#list order.orderItems as orderItem]
							    <li>
							         <table cellpadding="5" cellspacing="0">
							             <tbody>
							                 <tr>
							                     <td rowspan="3">
							                         <a href="${base}/mobile/product/content.jhtml?productId=${orderItem.product}">
							                            <img src="${(orderItem.thumbnail)!}" style="width:70px"/>
							                         </a>
							                     </td>
							                     <td colspan="2" style="width: 100%;">
							                         <a  href="${base}/mobile/product/content.jhtml?productId=${orderItem.product}">
							                             <strong>${(orderItem.name)!}</strong>
							                         </a>
							                     </td>
							                     <td colspan="2" style="vertical-align: top;">
							                       
							                     </td>
							                  </tr>
							                  <tr>
							                   <td>
												  ${currency(orderItem.subtotal, true, false)}
							                   </td>
							                 </tr>
							                 <tr>
												<td>
						                     		<div class="little-border" id="quantityVal">
														<div class="little-boder-item">
															<span>${(orderItem.quantity)!}件</span>
														</div>
													</div>
												</td>
							                 </tr>
							             </tbody>
							         </table>
							    </li>
							[/#list]
						</ul>
						<table style="padding-top: 10px;font-size: 13px;padding-bottom: 30px;width: 100%;">
						    <tr>
						        <td>
						            <label for="cartQuantity">${(order.quantity)!}</label>
						            <span id="cartQuantity">件商品&nbsp;&nbsp;</span>
						        </td>
						        <td style="text-align: right;">
						            <label for="sellingPrice">商品总额:</label>
						            <span id="sellingPrice">${currency(order.sellingPrice, true, false)}</span>
						        </td>
						    </tr>
						    <tr>
						        <td style="text-align: right;" colspan="2" >
						            <label for="beEconomical">节省:</label>
							        <span id="beEconomical">${currency(order.couponDiscount, true, false)}</span>
						        </td>
						    </tr>
						    <tr>
						        <td style="text-align: right;" colspan="2" >
						            <label for="effectivePrice">实付款:</label>
							        <span id="effectivePrice">${currency(order.amountPayable, true, false)}</span>
						        </td>
						    </tr>
						</table>
						[#else]
							<div class="cartEmpty">${message("shop.cart.empty")}</div>
						[/#if]
						<button class="md-close">关闭</button>
				</div>
			</div>
		</div>
		<!-- end 产品信息 -->
		
		<!-- start 收货信息 -->
		<div class="md-modal md-receiverModal" id="receiverModal">
			<div class="md-content">
				<div>
					[#if receivers?? ]
					<dl class="clearfix receiverList" >
						<dd>
							<ul class="receiverEntry">
								[#list receivers as receiver]
								<li dataid="${receiver.id}">
								    <a href="javascript:;">
										 <table>
								            <tr>
								                <td>
								                    <label for="receiverConsignee">收件人:</label>
								                    <span id="receiverConsignee">${receiver.consignee}</span>
								                </td>
								            </tr>
								            <tr>
								                <td>
								                    <label for="receiverPhone">手机号码:</label>
								                    <span id="receiverPhone">${receiver.phone}</span>
								                </td>
								            </tr>
								            <tr>
								                <td>
								                    <label for="receiverAddress">地址:</label>
								                    <span id="receiverAddress">
								                        [#if receiver.address?length lt 13] 
														     ${receiver.areaName}${receiver.address}
														[#else]
														     ${receiver.areaName}${receiver.address[0..11]}...
														[/#if]
								                    </span>
								                </td>
								            </tr>
								            <tr>
								                <td>
								                    <label for="receiverZipCode">邮编:</label>
								                    <span id="receiverZipCode">${receiver.zipCode}</span>
								                </td>
								            </tr>
								         </table>
								    </a>
								    <i></i>
								</li>
								[/#list]
							</ul>
						</dd>
					</dl>
					[/#if]
			        <button id="addReceiver" class="md-trigger" data-modal="addReceiverModal" style="margin-bottom: 10px;">新增</button>
					<button class="md-close">关闭</button>
				</div>
			</div>
		</div>
		<!-- end 收货信息 -->
		
		<!-- start 新增收货地址 -->
		<div class="md-modal md-addReceiverModal" id="addReceiverModal">
			<div class="md-content">
				<div>
				    <form id="receiverFormAdd" method="post" novalidate="novalidate">
				    	<div class="box">
							<span class="fieldSet" id="receiverModifyAreaSpan">
								<input type="hidden" id="modify_orderAreaId" name="modify_orderAreaId" treePath="${receiver.area.treePath}"/>
							</span>
						</div>
						<div class="box">
							<input type="text" name="address" class="box_input" placeholder="寄送地址"/>
						</div>
						<div class="box">
							<input type="text" name="consignee"  class="box_input" placeholder="收货人"/>
						</div>
						<div class="box">
							<input type="text" name="phone"  class="box_input" placeholder="手机号码"/>
						</div>
						<div class="box">
							<input type="text" name="zipCode"  class="box_input" placeholder="邮编"/>
						</div>
						<div class="address-btn">
							<button type="button" name="btn-confirm" onClick="addNewAddress()">确认</button>
						</div>
				    </form>	
				    <button class="md-close">取消</button>
				</div>
			</div>
		</div>
		<!-- end 新增收货地址 -->
		
		<!-- start 支付方式选择 -->
		<div class="md-modal md-paymentPluginModal" id="paymentPluginModal">
			<div class="md-content">
				<div>
					<ul class="paymentPluginEntry">
						<li dataid="wxJsPlugin" dataval="微信支付">
						    <a href="javascript:;">
						        <img src="http://images.mo-co.com/upload/image/201509/49027800-36d0-4997-9ebe-a899945dd86c.png" />
						        微信支付
						    </a>
						    <i></i>
						</li>
						<li dataid="alipayWapPlugin" dataval="支付宝支付">
						    <a href="javascript:;">
							    <img src="http://images.mo-co.com/upload/image/201509/64ff404e-47b4-4353-adac-f290d84fb2e5.png" />
							    支付宝支付
						    </a>
						    <i></i>
						</li>
					</ul>
					<button type="button"  class="md-close" style="width: 45%;float: left;margin-left: 10px;">确定</button>
				</div>
			</div>
		</div>
		<!-- end 支付方式选择 -->
		
		<!-- start 优惠券选择 -->
		<div class="md-modal md-couponsModal" id="couponsModal">
			<div class="md-content">
				<div>
					<ul class="couponsEntry">
						[#if couponCodes ?? && (couponCodes?size>0)]
							[#list couponCodes as couponCode]
							<li dataid="${couponCode.code}" dataval="${couponCode.couponName}">
							    <a href="javascript:;">
							        <img src="${base}/resources/mobile/images/coupon.png" />
							        <p>${couponCode.couponName}</p>
							    </a>
							    <i></i>
							</li>
							[/#list]
						[#else]
							<p style="text-align: center;font-size: 16px;">暂无优惠券</p>
						[/#if]
					</ul>
					<button class="md-close">确定</button>
				</div>
			</div>
		</div>
		<!-- end 优惠券选择 -->
		
		<!-- start 服务时间选择 -->
		<div class="md-modal md-orderServiceTimeModal" id="orderServiceTimeModal">
			<div class="md-content">
				<div class="modal-time-select">
					<div class="tip">
						建议多选，方便安排
					</div>
					<input type="hidden" id="weekdays_temp" name="weekdays_temp">
					<input type="hidden" id="weekdays_temp2" name="weekdays_temp2">
					<input type="hidden" id="timearea_temp" name="timearea_temp">
					<input type="hidden" id="time_temp" name="time_temp">
					<div id="weekDay_div">
						[#list times as time]
						<span class="nocheckDay" onclick="selectWeekDay(this)" id="${time.timeDate}" e="${time.timeWeek}">
							${time.timeWeek}<br>${time.timeDate2}
						</span>
						[/#list]
						<span class="nocheckDay" onclick="selectWeekDay(this)" alone="1" id="我们安排" e="你们安排">
							你们<br>安排
						</span>
					</div>
					<div id="timeArea_div">
						<span class="nocheckTimeArea" onclick="selectTimeArea(this)">上午</span>
						<span class="nocheckTimeArea" onclick="selectTimeArea(this)">下午</span>
						<span class="nocheckTimeArea" onclick="selectTimeArea(this)">全天</span>
					</div>
					<div id="times_div">
						
					</div>
					<button type="button" onclick="chooseTime();">确定选择</button>
				</div>
			</div>
		</div>
		<!-- end 服务时间选择 -->
		
		[#include "/mobile/include/footer_2.ftl" /]
	</div>
	<script type="text/javascript" src="${base}/resources/mobile/js/modernizr.js"></script>
	<script type="text/javascript">
		function selectWeekDay(obj) {
			if ($(obj).hasClass('checkday')) {
				$(obj).removeClass('checkday');
			} else {
				if ($(obj).attr('alone') == '1') {
					var alloption = $('#weekDay_div span');
					for (var i = 0; i < alloption.length; i++) {
						$(alloption[i]).removeClass('checkday');
					}
				} else {
					$('#weekDay_div span[alone="1"]').removeClass('checkday');
				}
				$(obj).addClass('checkday');
			}

			var weekdays = "";
			var weekdays_e = "";
			var checkedoption = $("#weekDay_div").find("span.checkday");
			for (var i = 0; i < checkedoption.length; i++) {
				if (weekdays == '') {
					weekdays += checkedoption[i].id;
					weekdays_e += $(checkedoption[i]).attr('e');
				} else {
					weekdays += "," + checkedoption[i].id;
					weekdays_e += "," + $(checkedoption[i]).attr('e');
				}
			}
			$('#weekdays_temp').val(weekdays);
			$('#weekdays_temp2').val(weekdays_e);
		}

		function selectTimeArea(obj) {
			if ($(obj).hasClass('checkTimeArea')) {
				$(obj).removeClass('checkTimeArea');
				$('#timearea_temp').val("");
			} else {
				var alloption = $('#timeArea_div span');
				for (var i = 0; i < alloption.length; i++) {
					$(alloption[i]).removeClass('checkTimeArea');
				}
				$(obj).addClass('checkTimeArea');
				$('#timearea_temp').val(obj.innerHTML);
			}
			$('#time_temp').val("");
			appendTimes();
		}
		
		function selectTime(obj) {
			if ($(obj).hasClass('checkTime')) {
				$(obj).removeClass('checkTime');
				$('#time_temp').val("");
			} else {
				var alloption = $('#times_div span');
				for (var i = 0; i < alloption.length; i++) {
					$(alloption[i]).removeClass('checkTime');
				}
				$(obj).addClass('checkTime');
				$('#time_temp').val($(obj).attr('val'));
			}
		}

		var timejson = {
			'am' : [ '07:00-08:00', '09:00-10:00' ],
			'pm' : [ '11:00-12:00', '13:00-14:00', '15:00-16:00', '17:00-18:00' ]
		}
		
		function appendTimes() {
			var timeArea = $('#timearea_temp').val();
			var temphtml = "";
			var timearr = [];
			switch (timeArea) {
				case '上午':
					timearr = timejson['am'];
					break;
				case '下午':
					timearr = timejson['pm'];
			}
			for (var i = 0; i < timearr.length; i++) {
				var tempArr = timearr[i].split('-');
				temphtml += '<span class="nocheckTime" onclick="selectTime(this)" val="' + timearr[i] + '">'
								+ tempArr[0]
								+ '<br>至<br>'
								+ tempArr[1] 
							+ '</span>';
			}
			$('#times_div').html(temphtml);

		}
		
		var chooseTime = function() {
			$('#weekdays').val($('#weekdays_temp').val());
			$('#timearea').val($('#timearea_temp').val());
			$('#time').val($('#time_temp').val());
			var workTimeHtml = $('#weekdays_temp2').val() + ($('#timearea').val() == '' ? '' : (' ' + $('#timearea').val())) + ($('#time').val() == '' ? '' : (' ' + $('#time').val()));
			if(workTimeHtml == ''){
				$('span.workTime').html('请选择服务时间');
			}
			else{
				$('span.workTime').html(workTimeHtml);
			}
			$("#orderServiceTimeModal").removeClass("md-show");
			$("#orderServiceTimeModal").removeClass("md-overflow");
		}
		
	</script>
</body>
</html>