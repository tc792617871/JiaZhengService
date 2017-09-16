<!DOCTYPE html> 
<html>
<head>
<title>${message("shop.cart.title")}[#if systemShowPowered] - MO&Co.[/#if]</title>
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

	[#list cart.cartItems as cartItem]
	
	var $quantity_${cartItem.id} = $("#quantity_"+ ${cartItem.id});
	var $increase_${cartItem.id} = $("#increase_"+ ${cartItem.id});
	var $decrease_${cartItem.id} = $("#decrease_"+ ${cartItem.id});
	var $modifyConfirm_${cartItem.id} = $("#modifyConfirm_" + ${cartItem.id});
	var $currentProductId_${cartItem.id} = $("#currentProductId_"+ ${cartItem.id});
	var $parameterContent = $(".parameterContent");
	var $parameterTitle = $(".parameterTitle");
	var productMap_${cartItem.id} = {};
	
	[@compress single_line = true]
	    var availableStock = 0;
	    if (${cartItem.product.stock} != null && ${cartItem.product.allocatedStock} != null) {
			availableStock = ${cartItem.product.stock} - ${cartItem.product.allocatedStock};
			if (availableStock < 0) {
				availableStock = 0;
			}
		}
		var productImagesArray = new Array();
		[#if cartItem.product.productImages??]
		    [#list cartItem.product.productImages as productImage]
		       var productImageArray = new Array();
		       productImageArray.push("${productImage.large}");
		       productImageArray.push(${productImage.order});
		       productImagesArray.push(productImageArray);
		    [/#list]
		[/#if]
		productMap_${cartItem.id}[${cartItem.product.id}] = {
		    id:"${cartItem.product.id}",
		    stockNum:availableStock,
			isMarketable:"${cartItem.product.isMarketable}",
			colorThumb:"${cartItem.product.colorImageThumbnail}",
			productImages:productImagesArray,
			specificationValues: [
				[#list cartItem.product.specificationValues as specificationValue]
					"${specificationValue.id}"[#if specificationValue_has_next],[/#if]
				[/#list]
			]
		};
	[#list cartItem.product.siblings as product]
	    var availableStockS = 0;
	    if (${product.stock} != null && ${product.allocatedStock} != null) {
			availableStockS = ${product.stock} - ${product.allocatedStock};
			if (availableStockS < 0) {
				availableStockS = 0;
			}
		}
		var productImagesArray = new Array();
		[#if product.productImages??]
		    [#list product.productImages as productImage]
		       var productImageArray = new Array();
		       productImageArray.push("${productImage.large}");
		       productImageArray.push(${productImage.order});
		       productImagesArray.push(productImageArray);
		    [/#list]
		[/#if]
		productImagesArray.sort(function(x,y){
		    return x[1] - y[1];
		});
		productMap_${cartItem.id}[${product.id}] = {
		    id:"${product.id}",
		    stockNum:availableStockS,
			isMarketable:"${product.isMarketable}",
			colorThumb:"${product.colorImageThumbnail}",
			productImages:productImagesArray,
			specificationValues: [
				[#list product.specificationValues as specificationValue]
					"${specificationValue.id}"[#if specificationValue_has_next],[/#if]
				[/#list]
			]
		};
	[/#list]
	[/@compress]
	// 购买数量
	$quantity_${cartItem.id}.keypress(function(event) {
		var key = event.keyCode ? event.keyCode : event.which;
		if ((key >= 48 && key <= 57) || key==8) {
			return true;
		} else {
			return false;
		}
	});
	
	// 增加购买数量
	$increase_${cartItem.id}.click(function() {
		var quantity = $quantity_${cartItem.id}.val();
		var availStock = $("#stockAvai_" + ${cartItem.id}).val();
    		if (/^\d*[1-9]\d*$/.test(quantity)) {
    			if((parseInt(quantity)+1) <= parseInt(availStock)){
    				$quantity_${cartItem.id}.val(parseInt(quantity) + 1);
    			}
    			else{
    				 m$.ui.dialog.dialogShow({
			         'title': '提示',
			         'content': '库存不足！'
			        	},
			        	[{
				         'text': '确定'
			        	 }]);
    				}
    		} else {
    			$quantity_${cartItem.id}.val(1);
    		}
	});
	
	// 减少购买数量
	$decrease_${cartItem.id}.click(function() {
        	var quantity = $quantity_${cartItem.id}.val();
    		if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 1) {
    			$quantity_${cartItem.id}.val(parseInt(quantity) - 1);
    		} else {
    			$quantity_${cartItem.id}.val(1);
    		}
	});
	
	// 点击确定按钮
	$modifyConfirm_${cartItem.id}.click(function() {
	    var $specificationValue_${cartItem.id} = $(".sys_item_specpara_" + ${cartItem.id} + " li");
	    var $specificationsTitle_${cartItem.id} = $(".specificationsTitle_" + ${cartItem.id});
		var specificationValueIds_${cartItem.id} = new Array();
		var specificationValuesSize = ${cartItem.product.specificationValues?size};
		$specificationValue_${cartItem.id}.filter(".selected").each(function(i) {
			specificationValueIds_${cartItem.id}[i] = $(this).attr("data-aid");
		});
		if (specificationValueIds_${cartItem.id}.length != specificationValuesSize) {
			$specificationsTitle_${cartItem.id}.show();
			return false;
		}else{
		    $specificationsTitle_${cartItem.id}.hide();
		}
		var $quantity_${cartItem.id} = $("#quantity_"+${cartItem.id});
		var quantity = $quantity_${cartItem.id}.val();
		if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
			$.ajax({
				url: moshop.base + "/mobile/cart/modify.jhtml",
				type: "POST",
				data: {cartItemId: ${cartItem.id}, id: $currentProductId_${cartItem.id}.val() , quantity: quantity},
				dataType: "json",
				cache: false,
				success: function(message) {
					if(message.type == "success"){
    						location.reload(true);
    				}else{
						 m$.ui.dialog.dialogShow({
				         'title': '提示',
				         'content': message.content
				        	},
				        	[{
					         'text': '确定'
				        	 }]);
    					}
					  }
					});
		} else {
			 m$.ui.dialog.dialogShow({
                'title': '遇到错误',
                'content': '购买数量必须为正整数'
            },
            [{
                'text': '确定'
            }])
		}
	});
	
	/** 点击商品 */
	$(".sys_item_specpara_"+${cartItem.id}).each(function(){
		var i=$(this);
		var p=i.find("ul>li");
		p.click(function(){
			$this = $(this);  //专指这边的选中的li
			if(!!$(this).hasClass("selected")){
				$(this).removeClass("selected");
				i.removeAttr("data-attrval");
			}else{
				$(this).addClass("selected").siblings("li").removeClass("selected");
				i.attr("data-attrval",$(this).attr("data-aid"))
			}
			
			var $specificationValue_${cartItem.id} = $(".sys_item_specpara_" +${cartItem.id} + " li");
			[#if cartItem.product.specifications?has_content]
				var specificationValueIds_${cartItem.id} = new Array();
				$specificationValue_${cartItem.id}.filter(".selected").each(function(i) {
					specificationValueIds_${cartItem.id}[i] = $(this).attr("data-aid");
				});
				
				$.each(productMap_${cartItem.id}, function(i, product) {
					if(product.specificationValues.toString() == specificationValueIds_${cartItem.id}.toString()){
					     $currentProductId_${cartItem.id}.val(product.id); 
					     $("#stockAvai_" + ${cartItem.id}).val(product.stockNum);
					     return false;
					}
				});
			[/#if]
		})
		
		
	})
	
	//设置颜色缩略图
	$.each(productMap_${cartItem.id}, function(i, product) {
	    var color_id = product.specificationValues[0];
		var size_id = product.specificationValues[1];
		var stock_number = product.stockNum;
		var isMarketable = product.product;
	    if(product.isMarketable){
		    $(".productColorThumbImage_"+${cartItem.id}).each(function(){
	            if($(this).attr('data-aid') == color_id.replace("\"","")){
	                $(this).find('img').attr('src',product.colorThumb);
	            }
		     });
	    }else{
	        notMarketableSizeMap.push(color_id + "_" + size_id);
	    }
	});
	[/#list]
	
	m$.header.titleContent.setTitle("购物篮");
});
</script>
</head>

<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header.ftl" /]
			<div class="cartList cartListInfo">
				<div class="md-content">
					<div>
					[#if cart?? && cart.cartItems?has_content]
						<ul>
							[#list cart.cartItems as cartItem]
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
							[/#list]
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
						[#else]
							<div class="cartEmpty">
							   您的购物篮是空的，<a href="${base}/mobile/list.jhtml?brandId=[@brand_id]${currentBrandId}[/@brand_id]">立即去商城逛逛？</a>
							</div>
						[/#if]
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