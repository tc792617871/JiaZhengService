<!DOCTYPE html> 
<html>
<head>
<title>订单详情</title>
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
	m$.header.titleContent.setTitle("订单详情");
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header.ftl" /]
			<div class="moMobileContent orderInfo">
				 <div class="orderInfoContent">
                  <div>
                   <ul>
                    <li  class="md-trigger" data-modal="orderProductInfoModal">
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
                                <span id="amountPayable">${currency(order.amount, true, false)}</span>
                            </td>
                        </tr>
                    </table>
                </li>
                        <li>
                    <table>
                        <tr>
                            <th>
                               收货信息
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <label for="consignee">收件人:</label>
                                <span id="consignee">${order.consignee}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="phone">手机:</label>
                                <span id="phone">${order.phone}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="address">地址:</label>
                                <span id="address">
                                    ${order.areaName}${order.address}
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="zipCode">邮编:</label>
                                <span id="zipCode">${order.zipCode}</span>
                            </td>
                        </tr>
                     </table>
                </li>
                        <li>
                     <table>
                        <tr>
                            <th>
                               支付方式
                            </th>
                        </tr>
                        <tr>
                            <td>
                              <label for="paymentMethodName"></label>
                               <span id="paymentMethodName">${order.paymentMethodName}
                               </span>
                            </td>
                        </tr>
                     </table>
                </li>
                <li></li>
                	<div class="orderDetailBtnPanle">
                	    [#if !order.expired && (order.orderStatus == "unconfirmed" || order.orderStatus == "confirmed") && (order.paymentStatus == "unpaid" || order.paymentStatus == "partialPayment")]
							<button onclick="window.location='${base}/mobile/member/order/payment.jhtml?sn=${order.sn}'"  style="width: 45%;">支付</button>
						[/#if]
						[#if !order.expired && order.orderStatus == "unconfirmed" && order.paymentStatus == "unpaid"]
							<button onclick="m$.business.cart.cancel(${order.sn})" style="float: right;width: 45%;">取消订单</button>
						[/#if]
						[#if (order.shippingStatus == "partialShipment" || order.shippingStatus == "shipped") && order.orderStatus != 'receipt' && 
      order.orderStatus != "completed"]
							<button onclick="m$.myAccount.lazyLoadOrder.confirmOrder(0,${order.sn})" >确认收货</button>
						[/#if]
						[#if order.paymentStatus == "paid" && order.shippingStatus == "unshipped" && !order.hasReturns]
							<button onclick="m$.myAccount.lazyLoadOrder.applyForRefund(${order.sn})" >${message("shop.member.order.applyRefund")}</button>
						[/#if]
						[#if (order.orderStatus == "receipt" && order.paymentStatus != "refunded") && order.shippingStatus != 'returned']
							<button onclick="m$.myAccount.lazyLoadOrder.returnGoodsApply(${order.sn})" >${message("shop.personalCenter.returnGoodsApply")}</button>
						[/#if]
						[#if order.returns?size > 0]
							<button onclick="m$.myAccount.lazyLoadOrder.returnGoodsHistory(${order.sn})" >${message("shop.personalCenter.returnGoodsHistory")}</button>
						[/#if]
					</div>
               </ul>
			</div>
		  </div>
		</div> 
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
						        <span id="effectivePrice">${currency(order.amount, true, false)}</span>
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
                    <div class="cartEmpty">
                        ${message("shop.cart.empty")}
                    </div>
                    [/#if]
                    <button class="md-close">
                        关闭
                    </button>
                </div>
            </div>
        </div>
        <!-- end 产品信息 -->
	   [#include "/mobile/include/footer.ftl" /]
	</div>
  <script type="text/javascript" src="${base}/resources/mobile/js/modernizr.js"></script>
</body>
</html>