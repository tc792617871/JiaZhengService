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
<link href="${base}/resources/mobile/css/cart.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("购物车");
	$(".header_2 .cart_area").remove();
});
</script>
</head>

<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
		<div class="ui-cartList">
			[#if cartItems ?? && (cartItems?size > 0)]
				[#list cartItems as cartItem]	
				<div class="cart-item">
					<div class="cart-item-select">
						<div class="cart-item-select-checkbox">
			            	<input type="checkbox" value="${cartItem.id}"/>
			            	<a href="javascript:void(0);" id="item-delete" class="item-delete">删除</a>
			       	 	</div> 
					</div>
					<div class="cart-item-content">
						<img src="${cartItem.tproduct.image}">
						<span class="title">${cartItem.tSpecification.name}</span>
						<span class="price">${currency(cartItem.tSpecification.price, true)}/${cartItem.tSpecification.unit}</span>
						<div class="num_input">
							<label id="subBtn" class="add_sub_disabled" onclick="setNum(-1)">-</label>
							<input type="number" id="_num" name="_num" value="${cartItem.quantity}" onchange="checkNum()" style="">
							<label id="addBtn" class="add_sub_abled" onclick="setNum(1)" onclick="setNum(1)">+</label>
						</div>
					</div>
				</div>
				[/#list]	
			[#else]
				<div class="cartEmpty" style="margin-top: 40px;text-align: center;font-size: 18px;">购物车为空.</div>
			[/#if]
		</div>
  		<div class="cart-total" id="cart-total">
	    	<div class="cart-total-cont">
	        	<div class="select-all">
		        	<div class="cart-checkbox">
		            	<input type="checkbox" id="cart_select_all_foot">
		       	 	</div>全选 
		    	</div>
	        	<div class="cart-but"> 
	        		<a href="javascript:void(0);" id="buyGoods" class="cart-but-sett yahei">去结算</a>
	            	<div class="cTotal-amo"><em>合计：</em><span id="total">￥0.00</span>元</div>
	        	</div>
	    		<div class="clear"></div>
      		</div>
		</div>
	</div>
</body>
</html>