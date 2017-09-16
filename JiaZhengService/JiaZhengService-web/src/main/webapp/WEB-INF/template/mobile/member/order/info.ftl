<!DOCTYPE html> 
<html>
<head>
<title>处理订单</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("处理订单");
	var $orderForm = $("#orderForm");
	var $receiverId = $("#receiverId");
	var $consignee = $("#consignee");
	var $phone = $("#phone");
	var $address = $("#address");
	var $zipCode = $("#zipCode");
	var $invoiceTypeSelect = $(".select_box");
	var $code = $("#code");
	
	var $invoiceTypeIdInput = $("#invoiceTypeIdInput");
	var $invoiceTypeInput = $("#invoiceTypeInput");
	var $invoiceTitleInput =$("#invoiceTitleInput");
	
	var $invoiceTypeSpan = $("#invoiceTypeSpan");
	var $invoiceTypeContentSpan =$("#invoiceTypeContentSpan");
	
	var $invoiceTypeId = $("#invoiceTypeId");
	var $invoiceTitle = $("#invoiceTitle");
	var $isInvoice = $("#isInvoice");
	var $confirmBut = $("#confirmBut");
	var $cancelBut = $("#cancelBut");
	var $paymentPluginId = $("#paymentPluginId");
	
	var $amountPayable = $("#amountPayable");
	var $couponDiscount = $("#couponDiscount");
	
	
	$("#modify_orderAreaId").lSelect({
	    url: "${base}/common/area.jhtml"
	});
	
	/**收货地址*/
	$(".receiverList").each(function(){
		var i=$(this);
		var p=i.find("ul>li");
		p.click(function(){
			if(!!$(this).hasClass("selected")){
				$(this).removeClass("selected");
			}else{
				$(this).addClass("selected").siblings("li").removeClass("selected");
				$receiverId.val($(this).attr("dataid"));
				$consignee.html($(this).find("#receiverConsignee").html());
				$phone.html($(this).find("#receiverPhone").html());
				$address.html($(this).find("#receiverAddress").html());
				$zipCode.html($(this).find("#receiverZipCode").html());
			}
		})
	});
	
	/**微信选择*/
	$("#paymentPluginModal").each(function(){
		var i=$(this);
		var $paymentPluginText = $("#paymentPluginText")
		var p=i.find("ul>li");
		p.click(function(){
			if(!!$(this).hasClass("selected")){
				$(this).removeClass("selected");
			}else{
				$(this).addClass("selected").siblings("li").removeClass("selected");
				$paymentPluginId.val($(this).attr("dataid"));
				$paymentPluginText.html($(this).attr("dataval"));
			}
		})
	});
	
	$("#option_invoice a").click(function(){
		$invoiceTypeIdInput.attr("value",$(this).attr("val"));
		$invoiceTypeInput.attr("value",$(this).html());
	});
	
	$invoiceTypeSelect.click(function(){
		$("#option_invoice").toggle();
	});
	
	$invoiceTypeIdInput.change(function(){
		if(!$invoiceTypeIdInput.val()){
			$invoiceTitleInput.val("");
		}
	});
	
	$("#confirm").click(function(){
		if($invoiceTypeIdInput.val()){
			var selectText = $invoiceTypeIdInput.find("option:selected").text();
			$invoiceTypeId.val($invoiceTypeIdInput.val());
			$invoiceTitle.val($invoiceTitleInput.val());
			$("#isInvoice").val(true);
			
			$invoiceTypeSpan.html(selectText);
			$invoiceTypeContentSpan.html($invoiceTitleInput.val());
			$(".invoiceTypeInfo").each(function(){
				//$(this).css("display","block");
			});
		}
		else{
			$("#isInvoice").val(false);
			//$invoiceTitleInput.val("");
			
			$invoiceTypeSpan.html("-");
			$invoiceTypeContentSpan.html("-");
			$(".invoiceTypeInfo").each(function(){
				//$(this).css("display","none");
			});
		}
		$("#invoiceInfoModal").removeClass("md-show");
		$("#invoiceInfoModal").removeClass("md-overflow");
	});
	
	/** 优惠券信息确认*/
	$confirmBut.click(function(){
		var $couponCode = $("#couponCode");
		if ($code.val() == "") {
			if ($.trim($couponCode.val()) == "") {
				return false;
			}
		$.ajax({
				url: moshop.base + "/mobile/member/order/couponValidate.jhtml",
				type: "POST",
				data: {
					code: $couponCode.val()
				},
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$confirmBut.prop("disabled", true);
				},
				success: function(data) {
					if(data.message.type == "success"){
						$code.val($couponCode.val());
						$confirmBut.text("${message("shop.order.codeCancel")}");
						calculate();
					}
					else{
						m$.ui.dialog.dialogShow({
					         'title': '提示',
					         'content': data.message.content
							       				},
						       [{
						         'text': '确定'
						       }]);
							  
						}
				},
				complete: function() {
					$confirmBut.prop("disabled", false);
				}
			});
		} else {
			$code.val("");
			$confirmBut.text("${message("shop.order.codeConfirm")}");
			calculate();
		}
	});
	
	// 计算
	function calculate() {
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
						$couponDiscount.parent().parent().show();
					} else {
						$couponDiscount.parent().parent().hide();
					}
					$amountPayable.text(currency(data.amountPayable, true, false));
				} else {
					$.message(data.message);
					setTimeout(function() {
						location.reload(true);
					}, 3000);
				}
			}
		});
	}
});

function addNewAddress(){
   var $receiverModifyAreaSpan = $("#receiverModifyAreaSpan");
   var $areaSelects = $receiverModifyAreaSpan.find("select");
   m$.business.cart.addAddress($receiverModifyAreaSpan,$areaSelects);
}

</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->	
		<!-- start 订单详情 -->
		<div class="moMobileContent orderInfo">
		<form id="orderForm" action="create.jhtml" method="post" onsubmit="return false;"> 
				<input type="hidden" id="receiverId" name="receiverId"[#if defaultReceiver??] value="${defaultReceiver.id}"[/#if] />
				<input type="hidden" id="cartToken" name="cartToken" value="${cartToken}" />
				<!--
				<input type="hidden" id="paymentPluginId" name="paymentPluginId" value="alipayWapPlugin" />
				-->
				<input type="hidden" id="paymentPluginId" name="paymentPluginId" value="wxJsPlugin" />
				<input type="hidden" id="invoiceTypeId" name="invoiceTypeId">
				<input type="hidden" id="invoiceTitle" name="invoiceTitle">
				<div class="orderInfoContent">
					<div>
						<ul>
						    <li class="md-trigger" data-modal="orderProductInfoModal">
						        <table>
						            <tr>
						                <th>
						                    产品信息
						                </th>
						                <td rowspan="3" class="rightArrow">
						                   <img src="${base}/resources/mobile/images/icon_rightarrow.png" width="8px"/>
						                </td>
						            </tr>
						            <tr>
						                <td>
						                    ${order.quantity}件产品
						                </td>
						            </tr>
						            <tr>
						                <td>
						                    <label for="amountPayable">实付金额:</label>
						                    <span id="amountPayable">${currency(order.amountPayable, true, false)}</span>
						                </td>
						            </tr>
						        </table>
						    </li>
						    <li class="md-trigger" data-modal="receiverModal">
						        <table>
						            <tr>
						                <th>
						                   收货信息
						                </th>
						                <td rowspan="5" class="rightArrow">
						                   <img src="${base}/resources/mobile/images/icon_rightarrow.png" width="8px"/>
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
							             <tr>
							                <td>
							                    点击新增收货地址
							                </td>
							            </tr>
						             [/#if]
						         </table>
						    </li>
						    <!--
						    <li  class="md-trigger" data-modal="paymentPluginModal">
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
						    <li class="md-trigger" data-modal="invoiceInfoModal">
						         <table>
						            <tr>
						                <th>
						                   发票信息	
						                </th>
						                <td rowspan="3" class="rightArrow">
						                   <img src="${base}/resources/mobile/images/icon_rightarrow.png" width="8px"/>
						                </td>
						                <input type="hidden" id="isInvoice" name="isInvoice">
						            </tr>
						            <tr class="invoiceTypeInfo">
						                <td>
					                   		<label for="invoiceType">发票类型：</label>
							                    <span id="invoiceTypeSpan">
												  -
							                    </span>
							                 </label>
						                </td>
						            </tr>
						            <tr class="invoiceTypeInfo">
						                <td>
					                   		<label for="invoiceTypeContent">发票抬头：</label>
							                    <span id="invoiceTypeContentSpan">
												  -
							                    </span>
							                 </label>
						                </td>
						            </tr>
						         </table>
						    </li>
						    <li>
						         <table>
						            <tr>
						                <th>
						                   备注
						                </th>
						            </tr>
						            <tr>
						                <td>
						                   <input type="text" class="box_input" placeholder="备注" id="markinfo" name="markinfo">
						                </td>
						            </tr>
						         </table>
						    </li>
						    <li>
						         <table>
						            <tr>
						                <th>
						                   优惠券
						                </th>
						            </tr>
						            <tr>
						            <!-- 
						                [#if couponCode??]
						                <td>
						                	<input type="hidden" name="code" id="code" value="${couponCode.code}"/>
						                	<input type="text" class="box_input" id="couponName" name="couponName" value="${couponCode.code}" style="width:85%;border-right:none;float:left;"/>
						                	<img id="cancelBut" src="${base}/resources/mobile/images/wrong.png" style="width: 36px;height: 36px;cursor: pointer;"/>
						                	<button  type="button"  class="couponButton" id="cancelBut">${message("shop.order.codeCancel")}</button>
					                	</td>
						                [#else] [/#if]
						                	<img id="confirmBut" src="${base}/resources/mobile/images/right.png" style="width: 36px;height: 36px;cursor: pointer;"/>
						                -->
					                	<td>
					                	    <input type="hidden" id="code" name="code" maxlength="200" />
						                	<input type="text" class="box_input" placeholder="优惠码" id="couponCode" name="couponCode" style="width:76%;border-right:none;float:left;"/>
						                	<button  type="button"  class="couponButton" id="confirmBut">${message("shop.order.codeConfirm")}</button>
					                	</td>
					                   
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
						<dl id="shippingMethod" style="display:none">
							    <dt>${message("shop.order.shippingMethod")}</dt>
							    [#list shippingMethods as shippingMethod]
									<dd>
										<label for="shippingMethod_${shippingMethod.id}">
											<input class="shippingMethod" type="radio" id="shippingMethod_${shippingMethod.id}" [#if shippingMethod_index == 1]checked="checked"[/#if] name="shippingMethodId" value="${shippingMethod.id}" />
											<span>
												[#if shippingMethod.icon??]
													<em style="border-right: none; background: url() center no-repeat;">&nbsp;</em>
												[/#if]
												<strong>${shippingMethod.name}</strong>
											</span>
											<span>${abbreviate(shippingMethod.description, 80, "...")}</span>
										</label>
									</dd>
							    [/#list]
						</dl>
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
		
		<!-- start 产品信息 -->
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
							                         <a href="${base}/mobile/product/content.jhtml?productId=${orderItem.product.id}">
							                            <img src="${(orderItem.product.listCoverImage)!}@100w_100Q_1x.jpg" style="width:70px"/>
							                          </a>
							                     </td>
							                      <td  colspan="2" style="width: 100%;">
							                         <a  href="${base}/mobile/product/content.jhtml?productId=${orderItem.product.id}">
							                             <strong>${(orderItem.product.name)!}</strong>
							                         </a>
							                         <br />
							                         <lable for="merchantNumber">编号:</lable> 
								                     <span id="merchantNumber">${(orderItem.product.goods.merchantNumber)!}</span>
							                     </td>
							                      <td colspan="2" style="vertical-align: top;">
							                       
							                     </td>
							                 </tr>
							                 
							                  <tr>
							                   <td colspan="2">
							                       <label for="productSize">
						                     		    尺码
						                     		</label>
				                     		        <span id="productSize">
													   ${(orderItem.product.sizeVal)!}
													</span>
							                   </td>
							                   <td>
												  ${currency(orderItem.subtotal, true, false)}
							                   </td>
							                 </tr>
							                 <tr>
												<td>
													<label for="productColor">
						                     		    颜色
						                     		</label>
				                     		        <span id="productColor">
													    [#if orderItem.product.colorVal?length lt 5] 
														     ${orderItem.product.colorVal}
														[#else]
														     ${orderItem.product.colorVal[0..4]}
														[/#if]
													</span>
												</td>
												<td>
						                     		
												</td>
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
						            <label for="effectivePrice">实付款:</label>
							        <span id="effectivePrice">${currency(order.amountPayable, true, false)}</span>
						        </td>
						    </tr>
						    <tr>
						        <td style="text-align: right;" colspan="2" >
						            <label for="beEconomical">节省:</label>
							        <span id="beEconomical">${currency(order.promotionDiscount, true, false)}</span>
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
				[#if defaultReceiver?? ]
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
					<button class="md-close">确定</button>
					[#else]
					<table style="width: 100%;">
					    <tr>
						    <td>
						        <button id="addReceiver" class="md-trigger" data-modal="addReceiverModal">新增</button>
						    </td>
						    <td>
						        <button class="md-close">关闭</button>
						    </td>
					    </tr>
					</table>
					[/#if]
				</div>
			</div>
		</div>
		<!-- end 收货信息 -->
		
		<!-- start 新增收货地址 -->
		<div class="md-modal md-addReceiverModal" id="addReceiverModal">
			<div class="md-content">
				<div>
				    <form id="receiverFormAdd" action="${base}/mobile/member/submitNewAddress.jhtml" method="post" novalidate="novalidate">
				    	<div class="box">
							<span class="fieldSet" id="receiverModifyAreaSpan">
								<input type="hidden" id="modify_orderAreaId" name="modify_orderAreaId" treePath="${receiver.area.treePath}"/>
							</span>
						</div>
						<div class="box">
							<input type="text" name="address" class="box_input" placeholder="&nbsp;&nbsp;寄送地址"/>
						</div>
						<div class="box">
							<input type="text" name="consignee"  class="box_input" placeholder="&nbsp;&nbsp;收货人"/>
						</div>
						<div class="box">
							<input type="text" name="phone"  class="box_input" placeholder="&nbsp;&nbsp;手机号码"/>
						</div>
						<div class="box">
							<input type="text" name="zipCode"  class="box_input" placeholder="&nbsp;&nbsp;邮编"/>
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
		
		<!-- start 发票信息 -->
		<div class="md-modal md-invoiceInfoModal" id="invoiceInfoModal">
			<div class="md-content" style="margin-top:250px">
				<div>
					<div class="box">
						<select name="invoiceTypeIdInput" id="invoiceTypeIdInput" class="box_input" style="width: 98%;">
								<option value="">请选择发票类型</option>
								[#list invoiceTypes as invoiceType]
									<option value="${invoiceType.id}">${invoiceType.invoiceTypeName}</option>
								[/#list]
				        </select>
			        </div>
                 	<div class="box">
						 <input type="text" id="invoiceTitleInput" class="box_input" placeholder="发票抬头"/>
					</div>
					<button type="button" id="confirm" style="width: 45%;float: left;margin-left: 10px;">确定</button>
					<button type="button" class="md-close" style="width:45%; margin-right: 10px;">取消</button>
				</div>
			</div>
		</div>
		<!-- end 发票信息 -->
		
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
		
		<!-- footer -->
		[#include "/mobile/include/footer.ftl" /]
		<!-- /footer -->
	</div>
	<script type="text/javascript" src="${base}/resources/mobile/js/modernizr.js"></script>
</body>
</html>