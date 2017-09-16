<!DOCTYPE html>
<html>
<head>
[@seo type = "productContent"]
	<title>[#if product.seoTitle??]${product.seoTitle}[#elseif seo.title??][@seo.title?interpret /][/#if]</title>
	[#if product.seoKeywords??]
		<meta name="keywords" content="${product.seoKeywords}" />
	[#elseif seo.keywords??]
		<meta name="keywords" content="[@seo.keywords?interpret /]" />
	[/#if]
	[#if product.seoDescription??]
		<meta name="description" content="${product.seoDescription}" />
	[#elseif seo.description??]
		<meta name="description" content="[@seo.description?interpret /]" />
	[/#if]
[/@seo]
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<style>
html {
  height: 100%;
}
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 13px;
  line-height: 1.5;
  position: relative;
  height: 100%;
}

.fullscreen {
	position: relative;
	width: 100%;
	margin: 0 auto;
	padding: 0 0 0px;
	background-color: #ffffff;
	overflow: hidden;
}
</style>

<script type="text/javascript">
$().ready(function() {
	var $specification = $("#sys_item_specpara");
	var $specificationTitle = $("#specification div");
	var $quantity = $("#quantity");
	var $increase = $("#increase");
	var $decrease = $("#decrease");
	var $addCart = $("#addCart");
	var $currentProductId = $("#currentProductId");
	var $parameterContent = $(".parameterContent");
	var $parameterTitle = $(".parameterTitle");
	var productMap = {};
	var $addFavorite = $("#addFavorite");
	var $buyNow = $("#buyNow");
	//数量初始值
	$quantity.val(1);
	[@compress single_line = true]
	    var availableStock = 0;
	    if (${product.stock} != null && ${product.allocatedStock} != null) {
			availableStock = ${product.stock} - ${product.allocatedStock};
			if (availableStock < 0) {
				availableStock = 0;
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
		productMap[${product.id}] = {
		    id:"${product.id}",
		    stockNum:availableStock,
			isMarketable:"${product.isMarketable}",
			colorThumb:"${product.colorImageThumbnail}",
			productImages:productImagesArray,
			specificationValues: [
				[#list product.specificationValues as specificationValue]
					"${specificationValue.id}"[#if specificationValue_has_next],[/#if]
				[/#list]
			]
		};
	[#list product.siblings as product]
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
		productMap[${product.id}] = {
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
	$quantity.keypress(function(event) {
		var key = event.keyCode ? event.keyCode : event.which;
		if ((key >= 48 && key <= 57) || key==8) {
			return true;
		} else {
			return false;
		}
	});
	
	// 增加购买数量
	$increase.click(function() {
		 m$.business.cart.increase();
	});
	
	// 减少购买数量
	$decrease.click(function() {
	    
	     m$.business.cart.decrease();
	});
	
	// 加入购物车
	$addCart.click(function() {
         // 限购商品
		[#if product.goods.purchase]
		    var $quantity = $("#quantity");
            var quantity = $quantity.val();
		    var purchaseCount = '${product.goods.purchaseCount}';
		    if(!checkPurchaseCount($currentProductId.val(),purchaseCount,quantity)){
		        return false;
		    }
		[/#if]
		
	    m$.business.cart.addCart(${product.specificationValues?size},$currentProductId);
	});
	
	// 点击数
	m$.business.cart.hits(${product.id});
	
	var $specificationValue = $("#sys_item_specpara dl a");
	
	//尺码的集合
	var sizeMap = new Array();
	//颜色的集合
	var colorMap = new Array();
	$.each(productMap, function(i, product) {
		var color_id = product.specificationValues[0];
		var size_id = product.specificationValues[1];
		if(product.isMarketable){
			sizeMap.push(size_id);
		    colorMap.push(color_id);
		}
	});
	//尺码颜色值去重
	var sizeMapUnique = $.unique(sizeMap);
	var colorMapUnique = $.unique(colorMap);
	
	/** 点击商品 */
	$(".sys_item_specpara").each(function(){
		var $this=$(this);
		var $specificationLi=$this.find("ul>li");
		var id=$(this).attr("id");
		var p=$(".sys_item_specpara").filter("[id!='"+ id +"']");
		var i=p.find("ul>li");
		$specificationLi.click(function(){
				if(!!$(this).hasClass("locked")){
					return;
				}else{
				if(!!$(this).hasClass("selected")){
					$(this).removeClass("selected");
					i.each(function(){
						$(this).removeClass("locked");
					});
				}else{
					$(this).addClass("selected").siblings("li").removeClass("selected");
					i.each(function(){
						$(this).removeClass("locked");
					});
					var tempSpecifications = new Array();
					if($(this).attr("data-code")=="color"){
						tempSpecifications[parseInt($this.attr("data-sid"))-1] = $(this).attr("data-aid");
						$.each(productMap, function(i, product) {
							sizeMapUnique.forEach(function(e){
							tempSpecifications[1] = e;
							if((product.specificationValues.toString() == tempSpecifications.toString()) && product.stockNum <= 0){
							     $("li[data-aid='"+ e +"']").addClass("locked"); 
							     return false;
							}
							});
						});
					}else{
						tempSpecifications[parseInt($this.attr("data-sid"))-1] = $(this).attr("data-aid");
						$.each(productMap, function(i, product) {
							colorMapUnique.forEach(function(e){
							tempSpecifications[0] = e;
							if((product.specificationValues.toString() == tempSpecifications.toString()) && product.stockNum <= 0){
							     $("li[data-aid='"+ e +"']").addClass("locked");
							     return false;
							}
							});
						});
					}
					$this.attr("data-attrval",$(this).attr("data-aid"))
				}
			}
			
			var $specificationValue = $(".sys_item_specpara li");
			[#if product.specifications?has_content]
				var specificationValueIds = new Array();
				$specificationValue.filter(".selected").each(function(i) {
					specificationValueIds[i] = $(this).attr("data-aid");
				});
				
				$.each(productMap, function(i, product) {
					if(product.specificationValues.toString() == specificationValueIds.toString()){
					     $currentProductId.val(product.id); 
					     return false;
					}
				});
				
				$.each(productMap, function(i, product) {
					if(product.specificationValues.toString() == specificationValueIds.toString()){
					     $currentProductId.val(product.id); 
					     return false;
					}
				});
			[/#if]
		});
	});
	
	//设置颜色缩略图
	$.each(productMap, function(i, product) {
	    var color_id = product.specificationValues[0];
		var size_id = product.specificationValues[1];
		var stock_number = product.stockNum;
		var isMarketable = product.product;
	    if(product.isMarketable){
		    $(".productColorThumbImage").each(function(){
	            if($(this).attr('data-aid') == color_id.replace("\"","")){
	                $(this).find('img').attr('src',product.colorThumb);
	            }
		     });
	    }else{
	        notMarketableSizeMap.push(color_id + "_" + size_id);
	    }
	});
	
	//初始化面料成分，对于没有属性值得面料成分不展示标题
	$parameterContent.each(function(){
	    if($(this).has("span").length == 0){
	         $(this).siblings(".parameterTitle").each(function(){
	             $(this).text("");
	             $(this).parent('.parameter_title_content').css({'margin-bottom':'0'});
	         });
	    }
	});
	
	// 添加商品收藏
    $addFavorite.click(function() {
        m$.business.cart.favorites(${product.id})
    });
	
	// 立即购买
	$buyNow.click(function() {
	     // 限购商品
		[#if product.goods.purchase]
		    var $quantity = $("#quantity");
            var quantity = $quantity.val();
		    var purchaseCount = '${product.goods.purchaseCount}';
		    if(!checkPurchaseCount($currentProductId.val(),purchaseCount,quantity)){
		        return false;
		    }
		[/#if]
	    buyNow(${product.specificationValues?size},$currentProductId);
	});
	
});

function buyNow(specificationValuesSize,$currentProductId) {
        	var $specificationValue = $(".sys_item_specpara li");
    	    var $specificationsTitle = $(".specificationsTitle");
    		var specificationValueIds = new Array();
    		$specificationValue.filter(".selected").each(function(i) {
    			specificationValueIds[i] = $(this).attr("data-aid");
    		});
    		if (specificationValueIds.length != specificationValuesSize) {
    			$specificationsTitle.show();
    			return false;
    		}else{
    		    $specificationsTitle.hide();
    		}
    		var $quantity = $("#quantity");
    		var quantity = $quantity.val();
			if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
				$.ajax({
					url: moshop.base + "/cart/add.jhtml",
					type: "POST",
					data: {id: $currentProductId.val() , quantity: quantity},
					dataType: "json",
					cache: false,
					success: function(message) {
					    if(message['type'] == 'success'){
			                        document.location.href = moshop.base + '/mobile/member/order/info.jhtml';
					    }else{
						    m$.ui.dialog.dialogShow({
				                'title': '提示',
				                'content': message['content']
				            },
				            [{
				                'text': '确定'
				            }])
					    }
					}
				});
			} else {
				 m$.ui.dialog.dialogShow({
	                'title': '错误',
	                'content': '购买数量必须为正整数'
	            },
	            [{
	                'text': '确定'
	            }])
			}
        }
</script>

</head>
<body>
<div class="fullscreen swiper-container" >
<!-- start 图片切换区域 -->
	<div class="swiper-wrapper">
        [#if productImages ?has_content]
			[#list productImages as productImage]
				 <div class="swiper-slide">
				      [#if product.goods.purchase]
					      <img src="${productImage.image}@640w_100Q_1x.jpg" onclick="javascript:getImgUrl('http://images.mo-co.com/upload/image/201508/0d396d9d-b55d-4bed-a840-7c4d5411cb71.jpg');" title="${productImage.title}"/>
					  [#else]
					      <img src="${productImage.image}@640w_100Q_1x.jpg"  title="${productImage.title}"/>
					  [/#if]
		        </div>
			[/#list]
		[#else]
		 <div class="swiper-slide">
		    <img src="${base}/resources/shop/images/default_thumbnail.png" width="320px"/>
		 </div>
		[/#if]
	</div>
	<!--
	<div class="productName">
	    <ul>
            <li>
               <h3 style="word-wrap: break-word;"> ${product.name} </h3>
            </li>
        </ul>
	</div>
	-->
	<div class="choiceAndBuyProduct">
        <ul>
        <!--
            <li>
                <label for="merchantNumber">${message("mobile.product.merchantNumber")}</label>
                <span id="merchantNumber">${product.goods.merchantNumber}</span>
            </li>
           -->
            <li>
                <button class="md-trigger plusInfoButton" data-modal="plusInfoModal" />
            </li>
        </ul>
	</div>
<!-- end 图片切换区域 -->
<!-- start 尺码选择区 和 商品详情区 -->
<div class="md-modal md-plusInfoModal" id="plusInfoModal">
	<div class="md-content"> 
		<div>
			<ul style="padding: 0px 0px 0px 0px;" id="specification">
			    <li>
			        <h4>${product.name}</h4>
			        <label for="merchantNumber">${message("mobile.product.merchantNumber")}</label>
                    <span id="merchantNumber">${product.goods.merchantNumber}</span>
                    <br />
                   <!-- <label for="productPrice">￥</label>-->
                    <span id="productPrice">
					 [#if product.validPromotions?? && product.validPromotions?size>0]
						        [#if product.effectivePrice == 0]
							        ${currency(product.price, true)}
							    [#else]
							        ${currency(product.effectivePrice, true)}
							    [/#if] 
					[#else]
					     ${currency(product.price, true)}
					[/#if] 
				    
				    [#if (setting.isShowMarketPrice && product.price != product.marketPrice) ||( product.validPromotions?? && product.validPromotions?size>0 )]
				          [#if product.effectivePrice != 0]
						     - <del style="color:#9a9a9a">${currency(product.marketPrice, true)}</del>
						  [/#if] 
					[/#if]
                    </span>
			    </li>
				<li>
				    <div class="plusLinkInfo">
				         <ul>
				             <li>
				                 <button class="md-trigger plusInfoOtherButton" data-modal="compositionAndMaintenanceModal">成分和保养</button>
				             </li>
				              <li>
				                 |
				             </li>
				              <li>
				                 <button class="md-trigger plusInfoOtherButton" data-modal="sizeGuideModal">尺码</button>
				             </li>
				             <li>
				                 |
				             </li>
				             <li>
				                <button class="md-trigger plusInfoOtherButton" data-modal="sendModal">寄送</button>
				             </li>
				             <li>
				                 |
				             </li>
				             <li>
				                 <button class="md-trigger plusInfoOtherButton" data-modal="returnGoodsModal">退货</button>
				             </li>
				             [#if product.validPromotions?has_content]
					             <li>
					                 |
					             </li>
					              <li>
					                  <button class="md-trigger plusInfoOtherButton" data-modal="promotionModal">促销</button>
					             </li>
				             [/#if]
				         </ul>
				    </div>
				</li>
				<li>
				   <div class="specificationsTitle">请选择您要的商品信息</div>
				   <input type="hidden" id="currentProductId" value="" />
                  <!--颜色-->
					<dl id="productColor" class="clearfix iteminfo_parameter sys_item_specpara" data-sid="1">
						<dt>${message("颜色")}</dt>
						<dd>
								[#if !product.isGift]
								    [#if product.specifications?has_content]
								        [#assign specificationValues = product.goods.specificationValues /]
								            [#list product.specifications as specification]
								                ${specification.key}
											    [#if specification.code == 'color']
											        <ul class="sys_spec_img" style="padding: 0 0 0px 0px;">
											        [#list specification.specificationValues as specificationValue]
											            [#if specificationValues?seq_contains(specificationValue)]
															 <li class="productColorThumbImage" data-aid="${specificationValue.id}" data-code="${specification.code}">
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
					<dl id="productSize" class="clearfix iteminfo_parameter sys_item_specpara" data-sid="2">
						<dt>${message("尺码")}</dt>
						<dd>
								[#if !product.isGift]
								    [#if product.specifications?has_content]
								        [#assign specificationValues = product.goods.specificationValues /]
								            [#list product.specifications as specification]
								                ${specification.key}
											    [#if specification.code == 'size' || specification.code == 'shoes_size' || specification.code == 'pants_size']
											        <ul class="sys_spec_text" style="padding: 0 0 0px 0px;">
											        [#list specification.specificationValues as specificationValue]
											            [#if specificationValues?seq_contains(specificationValue)]
															 <li class="productSizeThumb" data-aid="${specificationValue.id}" data-code="${specification.code}">
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
						     <input type="button" id="decrease" class="decrease" value="-" />
						    <label  id="quantity" name="quantity" class="quantity"  value="1"  maxlength="4" onpaste="return false;" readonly="readonly">1</label>
						    <input type="button" id="increase" class="increase" value="+" />
	                	</dd>
					</dl>
                </li>
			</ul>
			<div id="cart_favoriteBtn">
				[#if product.isOutOfStock]
					<button id="addCart" style="width: 45%;float: left;margin-left: 10px;background-color: white;border: 1px black solid;">
						<font style="color:black">放进购物篮</font>
                    </button>
				[#else]
					<button id="addCart" style="width: 45%;float: left;margin-left: 10px;background-color: white;border: 1px black solid;">
						<font style="color:black;padding-left:8px;">放进购物篮</font></button>
				[/#if]
				<button id="addFavorite" style="width:45%; margin-right: 10px;background-color: white;border: 1px black solid;">
					<font style="color:black;padding-left:8px;">收藏商品</font></button>
			</div>
			<button id="buyNow" style="width: 92.5%;margin-top: 10px;">立即购买</button>
		</div>
	</div> 
</div>
<!-- the overlay element -->
<div class="md-overlay"></div>

<!-- end 尺码选择区 和 商品详情区 -->


<!-- start 成分和保养-->
<div class="md-modal md-compositionAndMaintenanceModal" id="compositionAndMaintenanceModal">
	<div class="md-content"> 
		<div>
			<ul>
			    <li>
					${product.component}
			    </li>
				<li>
				   [#if product.goods.washingInstructionss?has_content]
			          [#list product.goods.washingInstructionss as washingInstructions]
					   <dl>
							<dt><img src="${washingInstructions.washingIcon}" width="15px"/></dt>
							<dd>
								<span>${washingInstructions.instructions}</span>
							</dd>
						</dl>
						<br />
					[/#list]
		          [/#if]
				</li>
				<li>
				    <label for="merchantNumber">${message("注意事项:")}</label>
                    <span id="merchantNumber">${product.mattersNeedingAttention}</span> 
				</li>
			</ul>
			<button class="md-close">关闭</button>
		</div>
	</div>
</div>
<!-- end 成分和保养-->


<!-- start 尺码指南-->
<div class="md-modal md-sizeGuideModal" id="sizeGuideModal">
	<div class="md-content"> 
		<div>
		    [#if !product.goods.purchase]
		        <img src="${setting.productSizeGuideImage}" />
		     [/#if]
			 [#if product.goods.goodsSizeGuides?exists]
			     [#if product.goods.goodsSizeGuides?has_content]
				    [#list product.goods.goodsSizeGuides as goodsSizeGuide]
						<img src="${goodsSizeGuide.sizeGuideImg}"/>
					[/#list]
				[/#if]
			 [/#if]
			<button class="md-close">关闭</button>
		</div>
	</div>
</div>
<!-- end 尺码指南-->

<!-- start 寄送-->
<div class="md-modal md-sendModal" id="sendModal">
	<div class="md-content">
		<div>
			<ul>
			    <li>
			      [@product_transmit_list]
									 ${productTransmits.transmitCn}
					[/@product_transmit_list]
			    </li>
			</ul>
			<button class="md-close">关闭</button>
		</div>
	</div>
</div>
<!-- end 寄送-->


<!-- start 退货-->
<div class="md-modal md-returnGoodsModal" id="returnGoodsModal">
	<div class="md-content">
		<div>
			<ul>
			    <li>
			       [@product_transmit_list]
								        ${productTransmits.returnGoodsCn}
					[/@product_transmit_list]
			    </li>
			</ul>
			<button class="md-close">关闭</button>
		</div>
	</div>
</div>
<!-- end 退货-->


[#if product.validPromotions?has_content]
<!-- start 促销-->
<div class="md-modal md-promotionModal" id="promotionModal">
	<div class="md-content">
		<div>
			<ul>
				<li>
				   [#list product.validPromotions as promotion]
							 ${promotion.introduction}<br />
					[/#list]
				</li>
			</ul>
			<button class="md-close">关闭</button>
		</div>
	</div>
</div>
<!-- end 促销-->
 [/#if]
 
 <!-- footer -->
  [#include "/mobile/include/footer.ftl" /]
 <!-- footer -->
</div>
<script type="text/javascript" src="${base}/resources/mobile/js/modernizr.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/idangerous.swiper.min.js"></script>
<script>
  var productContentSwiper = new Swiper('.swiper-container',{
    paginationClickable: true,
    mode: 'vertical'
  })
</script>
<div id="a1" style="position:fixed;top:0;left:0;background:#fff; display:none;z-index: 2000;width:100%;height:100%" >
	<img src="" id="a2" /><a id="left_btn" class="prev"></a><a id="right_btn" class="next"></a>
</div>
<script>
	function getImgUrl(dq_img){
		$("#a2").attr({src:''});
		body_w = $(window).width();	
		$("#a2").attr({src:dq_img,width:'100%'});
		$("body").css('overflow','hidden');
		$(".main").hide();
		$("#a1").fadeIn();
	}
	$("#a2").mousemove(function(e){
		body_h = $(window).height();
		img_h  = $("#a2").height();
		mouse_y = e.clientY;
		bfb     = mouse_y/body_h;
		y       = (img_h*bfb);
		if (y-body_h<0)return;
		$("#a1").css("top",-(y-body_h));
	})
	$("#a2").click(function(){
		$("#a1").hide();
		$("body").css('overflow','auto');
		$(".main").show();
	})
</script>
</body>
</html>