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
					<input type="hidden" id="itemId" value="${cartItem.id}"/>
					<div class="cart-item-select">
						<div class="cart-item-select-checkbox">
			            	<input type="checkbox" name="itemId" value="${cartItem.id}"/>
			            	<a href="javascript:void(0);" id="item-delete" class="item-delete">删除</a>
			       	 	</div> 
					</div>
					<div class="cart-item-content">
						<img src="${cartItem.tproduct.image}">
						<span class="title">${cartItem.tSpecification.name}</span>
						<input type ="hidden" id="spe_price" name="spe_price" value="${cartItem.tSpecification.price}"/>
						<span class="price">${currency(cartItem.tSpecification.price, true)}/${cartItem.tSpecification.unit}</span>
						<div class="num_input">
							<input type="hidden" name="minnum" value="${cartItem.tSpecification.minNum}"/>
							<input type="hidden" name="maxnum" value="${cartItem.tSpecification.maxNum}"/>
							<label id="subBtn" class="add_sub_abled" onclick="setNum(-1,this)">-</label>
							<input type="number" name="num" value="${cartItem.quantity}" onchange="checkNum(this)"/>
							<label id="addBtn" class="add_sub_abled" onclick="setNum(1,this)">+</label>
						</div>
					</div>
				</div>
				[/#list]	
			[#else]
				<div class="cartEmpty" style="margin-top: 40px;text-align: center;font-size: 18px;">购物车为空.</div>
			[/#if]
		</div>
		<div class="commonMargin"></div>
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
	<script>
		var $select_all = $("#cart_select_all_foot");
		var $items = $(".ui-cartList .cart-item .cart-item-select input[name='itemId']");
		var $buyGoods = $("#buyGoods");
		var $item_delete = $(".item-delete");
		var $total = $("#total");
	
		$().ready(function() {
			$select_all.click(function(){
				var $this = $(this);
				var $item = $(".ui-cartList .cart-item .cart-item-select input[name='itemId']");
				if ($this.prop("checked")) {
					$item.prop("checked", true);
				}
				else {
					$item.prop("checked", false);
				}
				calcuPrice();
			});
			
			$items.each(function(){
				var $this = $(this);
				$this.click(function(){
					calcuPrice();
				});
			});
			
			$item_delete.each(function(){
				var $this = $(this);
				$this.click(function(){
					var $checkbox = $this.closest("div").find("input[name='itemId']");
					if(!$checkbox.is(":checked")){
						return ;
					}
					var itemId = $this.closest("div").find("input[name='itemId']").val();
					if (!$.checkLogin()) {
						m$.ui.dialog.dialogShow({
							'title': '提示',
							'content': '必须登录后才能操作购物车'
						},
						[{
							'text': '确定',
							'func': function() {
								$.redirectLogin(jiazhengservice.base + "/mobile/member/cart/index.jhtml");
							}
						}]);
					}else{
						$.ajax({
							url : jiazhengservice.base + "/mobile/member/cart/delete.jhtml",
							type : "POST",
							data : {
								id : itemId
							},
							dataType : "json",
							cache : false,
							success : function(message) {
								if (message['type'] == 'success') {
									m$.ui.dialog.dialogShow({
										'title' : '删除购物项',
										'content' : message['content']
									}, [ {
										'text' : '确定',
										'func': function() {
											setTimeout(function() {
												location.href = jiazhengservice.base + "/mobile/member/cart/index.jhtml";
											}, 1000);
										}
									} ]);
								} else {
									m$.ui.dialog.dialogShow({
										'title' : '提示',
										'content' : message['content']
									}, [ {
										'text' : '确定'
									} ]);
								}
				
							}
						});
					}
				});
			});
			
			$buyGoods.click(function(){
				var $this = $(this);
				var $checkedItems = $items.filter(":checked");
				var length = $checkedItems.length;
				var cartItemIds = '';
				if(length == 0){
					return;
				}
				for(var index = 0 ; index < length; index++){
					cartItemIds += $($checkedItems[index]).val();
					if(index < length - 1){
						cartItemIds += "-";
					}
				}
				window.location.href = "${base}/mobile/member/order/info.jhtml?cartItemIds="+cartItemIds;
			});
		});
		
		function setBtn(minnum,maxnum,num,$this){
			var $num_input = $($this).closest("div.num_input")
			var $subBtn = $num_input.find("#subBtn");
			var $addBtn = $num_input.find("#addBtn");
			if(num<=minnum){
				$subBtn.attr('class','add_sub_disabled');
				$addBtn.attr("onclick",'');
			}else{
				$subBtn.attr('class','add_sub_abled');
				$addBtn.attr("onclick",'setNum(-1,this)');
			}
			if(num>=maxnum){
				$addBtn.attr('class','add_sub_disabled');
				$addBtn.attr("onclick",'');
			}else{
				$addBtn.attr('class','add_sub_abled');
				$addBtn.attr("onclick",'setNum(1,this)');
			}
		}
		function setNum(n,$this){
			if (!$.checkLogin()) {
				m$.ui.dialog.dialogShow({
					'title': '提示',
					'content': '必须登录后才能操作购物车'
				},
				[{
					'text': '确定',
					'func': function() {
						$.redirectLogin(jiazhengservice.base + "/mobile/member/cart/index.jhtml");
					}
				}]);
			}else{
				var $num_input = $($this).closest("div.num_input");
				var itemId = $($this).closest("div.cart-item").find("input[id='itemId']").val();
				var $minnum = $num_input.find("input[name='minnum']");
				var $maxnum = $num_input.find("input[name='maxnum']");
				var $num = $num_input.find("input[name='num']")
				var minnum = Number($minnum.val());
				var maxnum = Number($maxnum.val());
				var num = Number($num.val());
				if(num+n<minnum||num+n>maxnum){
					return;
				}
				num=num+n;
				$.ajax({
					url : jiazhengservice.base + "/mobile/member/cart/edit.jhtml",
					type : "POST",
					data : {
						id : itemId,
						quantity : num
					},
					dataType : "json",
					cache : false,
					success : function(message) {
						if (message['type'] == 'success') {
							$num.val(num);
							setBtn(minnum,maxnum,num,$this);
							calcuPrice();
						} else {
							m$.ui.dialog.dialogShow({
								'title' : '提示',
								'content' : message['content']
							}, [ {
								'text' : '确定'
							} ]);
						}
					}
				});
			}
		}
		function checkNum($this){
			if (!$.checkLogin()) {
				m$.ui.dialog.dialogShow({
					'title': '提示',
					'content': '必须登录后才能操作购物车'
				},
				[{
					'text': '确定',
					'func': function() {
						$.redirectLogin(jiazhengservice.base + "/mobile/member/cart/index.jhtml");
					}
				}]);
			}else{
				var $num_input = $($this).closest("div.num_input");
				var itemId = $($this).closest("div.cart-item").find("input[id='itemId']").val();
				var $minnum = $num_input.find("input[name='minnum']");
				var $maxnum = $num_input.find("input[name='maxnum']");
				var $num = $num_input.find("input[name='num']")
				var minnum = Number($minnum.val());
				var maxnum = Number($maxnum.val());
				var num = Number($num.val());
				var _num = num;
				if(num<minnum){
					_num = minnum;
				}else if(num>maxnum){
					_num = maxnum
				}
				$.ajax({
					url : jiazhengservice.base + "/mobile/member/cart/edit.jhtml",
					type : "POST",
					data : {
						id : itemId,
						quantity : _num
					},
					dataType : "json",
					cache : false,
					success : function(message) {
						if (message['type'] == 'success') {
							$num.val(_num);
							setBtn(minnum,maxnum,num,$this);
							calcuPrice();
						} else {
							m$.ui.dialog.dialogShow({
								'title' : '提示',
								'content' : message['content']
							}, [ {
								'text' : '确定'
							} ]);
						}
					}
				});
			}
		}
		
		// 计算价格
		function calcuPrice(){
			var $checkedItems = $items.filter(":checked");
			var length = $checkedItems.length;
			var result = currency(0, true);
			if(length > 0){
				var total = 0;
				for(var index = 0 ; index < length; index++){
					var price = $($checkedItems[index]).closest("div.cart-item").find(".cart-item-content input[name='spe_price']").val();
					var num = $($checkedItems[index]).closest("div.cart-item").find(".cart-item-content input[name='num']").val();
					var subTotal = parseFloat(price) * parseFloat(num);
					total = total + subTotal;
				}
				result = currency(total, true);
			}
			$total.html(result);
		}
	</script>
</body>
</html>