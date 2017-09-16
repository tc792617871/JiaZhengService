<!DOCTYPE html> 
<html>
<head>
<title>申请退货</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("申请退货");
	var $returnGoodsInfoSubmit = $("#returnGoodsInfoSubmit");
	$returnsItemsQuantity1.change(function(){
        var shippingReqQtyName = $(this)[0].name;
        var shippingReqQty = document.getElementById(shippingReqQtyName);
        shippingReqQty.value = $(this)[0].value;
	});
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header.ftl" /]
			<div class="moMobileContent">
			    <form action="#" method="post" id="returnsGoodsForm" name="returnsGoodsForm">
			    <input type="hidden" value="${orderId}" name="orderId"/>
			    <input type="hidden" name="returnss[0].shopStore.id" value="${(shipping.shopStore.id)!0}"/>
	            <input type="hidden" name="shippings[0].id]" value="${shipping.id}"/>
				<ul class="returnsGoodsList">
				[#list shippingItems as shippingItem]
				        <input type="hidden" name="returnss[0].returnsItems[${shippingItem_index}].shippingItemId" value="${shippingItem.id}"/>
                        <input type="hidden" name="returnss[0].returnsItems[${shippingItem_index}].sn" value="${shippingItem.sn}"/>
                        <input type="hidden" name="returnss[0].returnsItems[${shippingItem_index}].name" value="${shippingItem.name}"/>
                        <input type="hidden" name="shippings[0].shippingItems[${shippingItem_index}].id" value="${shippingItem.id}"/>
					    <li>
					       <table>
	                        <tr>
	                            <th colspan="2">
	                                ${shippingItem.sn}
	                            </th>
	                            <th>
	                              ${shippingItem.quantity}(${message("shop.order.quantity")})
	                            </th>
	                        </tr>
	                         <tr>
	                            <th colspan="3">
	                                ${shippingItem.name}
	                            </th>
	                        </tr>
	                         <tr>
	                            <td>
	                               退货数量 ${shippingItem.returnQuantity}
	                            </td>
	                            <td>
	                               申请退货数量
	                            </td>
	                            <td>
	                               <select class="defaultSelect returnGoodsInfoSubmit" name="returnss[0].returnsItems[${shippingItem_index}].quantity">
	                                  [#list shippingItem.canReturnQuantityList as canReturnQuantity]
	                                    <option value="${canReturnQuantity}">${canReturnQuantity}</option>
	                                  [/#list]
	                               </select>
			                       <input type="hidden" name="shippings[0].shippingItems[${shippingItem_index}].returnQuantity" value="0" id="returnss[0].returnsItems[${shippingItem_index}].quantity"/>
	                            </td>
	                        </tr>
	                    </table>
					    </li>
				    [/#list]
				</ul>
				 [#if canReturn]
				    <table class="returnsGoodsTable">
	                        <tr>
	                            <td>
	                              <strong> 退货原因</strong>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                              <select class="defaultSelect" id="refundReason" name="refundReason">
										<option value="">${message("admin.common.choose")}</option>
										[#list refuseReasons as refuseReason]
											<option value="${refuseReason.refuseReason}">${refuseReason.refuseReason}</option>
										[/#list]
									</select>
	                            </td>
	                        </tr>
	                         <tr>
	                            <td>
	                              <strong>退货说明</strong>(可不填)
	                            </td>
	                        </tr>
	                         <tr>
	                           <td>
	                              <input type="text" name="memo" class="box_input" placeholder="&nbsp;&nbsp;请输入退货说明" maxlength="500" />
	                           </td>
	                        </tr>
	                        <tr>
	                           <td style="padding-top: 20px;">
	                               <button type="button" id="submitReturnsGoods" onclick="m$.myAccount.lazyLoadOrder.submitReturnsGoods();">提交申请</button>
	                           </td>
	                        </tr>
	                    </table>
	                    [/#if]
	                   </form>
            </div>
	   [#include "/mobile/include/footer.ftl" /]
	</div>
</body>
</html>