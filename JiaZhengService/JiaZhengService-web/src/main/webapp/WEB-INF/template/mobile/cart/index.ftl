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
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("购物篮");
});
</script>
</head>

<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
			<div class="cartList cartListInfo">
				<div class="md-content">
					<div>
						<ul>
						    <li>
						         <table cellpadding="5" cellspacing="0">
						             <tbody>
						                 <tr>
						                     <td rowspan="3">
						                         <a href="${base}/mobile/product/content.jhtml?productId=${cartItem.product.id}">
						                             <img src="${(cartItem.product.listCoverImage)!}@100w_100Q_1x.jpg" style="width:70px"/>
						                          </a>
						                     </td>
						                      <td  colspan="2" style="width: 100%;">
						                         <a  href="${base}/mobile/product/content.jhtml?productId=${cartItem.product.id}">
						                             <strong>${(cartItem.product.name)!}</strong>
						                         </a>
						                         <br />
						                         <lable for="merchantNumber">编号:</lable> 
							                     <span id="merchantNumber">${(cartItem.product.goods.merchantNumber)!}</span>
						                     </td>
						                      <td colspan="2" style="vertical-align: top;">
						                        <a  href="javascript:void(0);" onclick="m$.business.cart.deleteCartItem(${(cartItem.id)!})">
													<img src="${base}/resources/mobile/images/icon_delete.png" class="basket-icon-delete" id="del${(cartItem.id)!}" />
												</a>
						                     </td>
						                 </tr>
						                 <tr>
						                   <td colspan="2">
						                       <input type="hidden" name="cartItemId" id="cartItemId" value="${cartItem.id}">
					                     		<input type="hidden" name="stockAvai" id="stockAvai_${cartItem.id}" value="${cartItem.product.availableStock}">
						                       <label for="productSize">
					                     		    尺码
					                     		</label>
			                     		        <span id="productSize">
												   <span >${(cartItem.product.sizeVal)!}</span>
												</span>
						                   </td>
						                   <td>
						                      [#if cartItem.isLowStock]库存不足[/#if]
											   ${currency(cartItem.tempPrice, true, false)}
						                   </td>
						                 </tr>
						                 <tr>
											<td>
												<label for="productColor">
					                     		    颜色
					                     		</label>
			                     		        <span id="productColor">
												    [#if cartItem.product.colorVal?length lt 5] 
													     ${cartItem.product.colorVal}
													[#else]
													     ${cartItem.product.colorVal[0..4]}
													[/#if]
												</span>
											</td>
											<td>
					                     		<div class="little-border" style="float: right;">
													<div class="little-boder-item">
														<a class="md-trigger" href="#" data-modal="plusInfoModal_${cartItem.id}" >
															<span>修改</span>
														</a>
													</div>
												</div>
											</td>
											<td>
					                     		<div class="little-border" id="quantityVal">
													<div class="little-boder-item">
														<span>${(cartItem.quantity)!}件</span>
													</div>
												</div>
											</td>
						                 </tr>
						             </tbody>
						         </table>
						    </li>
						</ul>
						<table style="padding-top: 10px;font-size: 13px;padding-bottom: 30px;">
						    <tr>
						        <td>
						            <label for="cartQuantity">${(cart.quantity)!}</label>
						            <span id="cartQuantity">件商品&nbsp;&nbsp;</span>
						        </td>
						        <td style="text-align: right;">
						            <label for="sellingPrice">商品总额:</label>
						            <span id="sellingPrice">${currency(cart.sellingPrice, true, false)}</span>
						        </td>
						    </tr>
						    <tr>
						        <td style="text-align: right;" colspan="2" >
						            <label for="effectivePrice">实付款:</label>
							        <span id="effectivePrice">${currency(cart.effectivePrice, true, false)}</span>
						        </td>
						    </tr>
						    <tr>
						        <td style="text-align: right;" colspan="2" >
						            <label for="beEconomical">节省:</label>
							        <span id="beEconomical">${currency(cart.discount, true, false)}</span>
						        </td>
						    </tr>
						</table>
						<div class="nextBtnDiv">
						    <button id="submitCart" onClick="m$.business.cart.submitCart();">结算</button>
						</div>	
						<div class="cartEmpty">
						   您的购物篮是空的，<a href="#">立即去商城逛逛？</a>
						</div>
					</div>
				</div>
			</div>
			
			
			[#if cart?? && cart.cartItems?has_content]
				[#list cart.cartItems as cartItem]
			<!-- start 尺码选择区 和 商品详情区 -->
			<div class="md-modal md-plusInfoModal md-plusInfoModal_${cartItem.id}" id="plusInfoModal_${cartItem.id}" style="height:100%">
				<div class="md-content">
					<div>
						<ul style="padding: 0 0 0px 0px;">
							<li>
							   <div class="specificationsTitle_${cartItem.id} specificationsTitle">请选择您要的商品信息</div>
							   <input type="hidden" id="currentProductId_${cartItem.id}" value="${cartItem.product.id}" />
			                  <!--颜色-->
								<dl id="productColor" class="clearfix iteminfo_parameter sys_item_specpara_${cartItem.id} sys_item_specpara" data-sid="1">
									<dt>${message("颜色")}</dt>
									<dd>
											[#if !cartItem.product.isGift]
											    [#if cartItem.product.specifications?has_content]
											        [#assign specificationValues = cartItem.product.goods.specificationValues /]
											            [#list cartItem.product.specifications as specification]
											                ${specification.key}
														    [#if specification.code == 'color']
														        <ul class="sys_spec_img" style="padding: 0 0 0px 0px;">
														        [#list specification.specificationValues as specificationValue]
														            [#if specificationValues?seq_contains(specificationValue)]
																		 <li class="productColorThumbImage_${cartItem.id} [#if cartItem.product.colorVal == specificationValue.name]selected[/#if]" data-aid="${specificationValue.id}" data-code="${specification.code}">
																		     <a href="javascript:;" title="${specificationValue.name}">
																		         <img src="" alt="${specificationValue.name}" />
																		     </a>
																		     <i></i>
																		</li>
																	 [/#if]
										                         [/#list]
																</ul>
														        [/#if]
													[/#list]	        
											    [/#if]
											[/#if]
									</dd>
								</dl>
							</li>
							
							<li>
			                     <!--尺码-->
								<dl id="productSize" class="clearfix iteminfo_parameter sys_item_specpara_${cartItem.id} sys_item_specpara" data-sid="2">
									<dt>${message("尺码")}</dt>
									<dd>
											[#if !cartItem.product.isGift]
											    [#if cartItem.product.specifications?has_content]
											        [#assign specificationValues = cartItem.product.goods.specificationValues /]
											            [#list cartItem.product.specifications as specification]
											                ${specification.key}
														    [#if specification.code == 'size' || specification.code == 'shoes_size' || specification.code == 'pants_size']
														        <ul class="sys_spec_text" style="padding: 0 0 0px 0px;">
														        [#list specification.specificationValues as specificationValue]
														            [#if specificationValues?seq_contains(specificationValue)]
																		 <li class="productSizeThumb_${cartItem.id} [#if cartItem.product.sizeVal == specificationValue.name]selected[/#if]" data-aid="${specificationValue.id}" data-code="${specification.code}">
																		     <a href="javascript:;" title="${specificationValue.name}">
																		         ${specificationValue.name}
																		     </a>
																		     <i></i>
																		</li>
																	 [/#if]
										                         [/#list]
																</ul>
														        [/#if]
													[/#list]	        
											    [/#if]
											[/#if]
									</dd>
								</dl>
			                </li>
			                <li>
				                <dl id="buyQuantity" class="clearfix buyQuantity" data-sid="3">
									<dt>${message("数量")}</dt>
									<dd>
									     <input type="button" id="decrease_${cartItem.id}" class="decrease" value="-" />
									    <input type="text" id="quantity_${cartItem.id}" name="quantity" class="quantity"  value="${cartItem.quantity}" maxlength="4" onpaste="return false;" readonly>
									    <input type="button" id="increase_${cartItem.id}" class="increase" value="+" />
				                	</dd>
								</dl>
			                </li>
						</ul>
						<button id="modifyConfirm_${cartItem.id}" >确定</button>
					</div>
				</div>
			</div>
			<!-- end 尺码选择区 和 商品详情区 -->
			[/#list]
			[/#if]
			
			<!-- the overlay element -->
			<div class="md-overlay"></div>
		    <!-- footer -->
	  		[#include "/mobile/include/footer.ftl" /]
      		<!-- /footer -->
		</div>
<script type="text/javascript" src="${base}/resources/mobile/js/modernizr.js"></script>
</body>
</html>