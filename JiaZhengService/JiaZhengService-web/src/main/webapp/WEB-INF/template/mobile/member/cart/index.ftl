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
			<div class="cart-item">
				<div class="cart-item-select">
					<div class="cart-item-select-checkbox">
		            	<input type="checkbox">
		            	<a href="javascript:void(0);" id="item-delete" class="item-delete">删除</a>
		       	 	</div> 
				</div>
				<div class="cart-item-content">
					<img src="http://img13.360buyimg.com/n1/jfs/t3271/50/3320182148/85164/b1cfe23d/57ee25faN401020c0.jpg">
					<span class="title">钟点保洁</span>
					<span class="price">￥ 89/台</span>
					<div class="num_input">
						<label id="subBtn" class="add_sub_disabled" onclick="setNum(-1)">-</label>
						<input type="number" id="_num" name="_num" value="2.0" onchange="checkNum()" style="">
						<label id="addBtn" class="add_sub_abled" onclick="setNum(1)" onclick="setNum(1)">+</label>
					</div>
				</div>
			</div>
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