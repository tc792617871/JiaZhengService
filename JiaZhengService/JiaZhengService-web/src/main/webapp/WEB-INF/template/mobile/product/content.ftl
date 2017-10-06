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
<link href="${base}/resources/mobile/css/product.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<style>
</style>

<script type="text/javascript">
	$().ready(function() {
		m$.header.titleContent.setTitle('星级.钟点保洁');
		$(".header_2 .cart_area").remove();
	});
</script>

</head>
<body>
<div class="fullscreen" >
	[#include "/mobile/include/header_2.ftl" /]
	<div class="product_content">
		${product.introduction}
	</div>
	<div id="cartOrbuy_area" class="buy_footer">
		<div class="add_cart" onclick="addCart_show();">加入购物车</div>
		<div class="buy_show" onclick="buy_show();">立即购买</div>
	</div>
	<div id="attrSets_area">
		<span class="attr_hide" onclick="attrHide()">×</span>
		<div class="product_detail">
			<div class="goods_name" id="goodsName">
				${defaultSpecification.name}
			</div>
			<div class="goods_price" id="goodsPrice">
				${defaultSpecification.price}元/${defaultSpecification.unit}
			</div>
		</div>
		<div class="choose_attr_area" id="wrapper">
			<div class="attrs_area">
				<label class="choose_attr">选择属性</label>
				[#list product.specifications as specification]
					<span class="attribute [#if specification_index == 0]attr_select[/#if]" onclick="select_attr(this,'${specification.id}');">${specification.name}</span>
				[/#list]
			</div>
		</div>
		<div class="choose_num_area">
			<input type="hidden" id="specificationId" name="specificationId" value="${defaultSpecification.id}">
			<input type="hidden" id="minnum" name="minnum" value="${defaultSpecification.minNum}">
			<input type="hidden" id="maxnum" name="maxnum" value="${defaultSpecification.maxNum}">
			<label class="choose_num">选择数量</label>
			<div class="num_input">
				<label id="subBtn" class="add_sub_disabled" onclick="setNum(-1)">-</label>
				<input type="number" id="_num" name="_num" value="${defaultSpecification.minNum}" onchange="checkNum()" style="">
				<label id="addBtn" class="add_sub_abled" onclick="setNum(1)" onclick="setNum(1)">+</label>
			</div>
		</div>
		<div id="allsubmit_btn">加入购物车/立即购买</div>
	</div>
	<div id="cover" ontouchmove="event.preventDefault()"></div>
</div>
<script>
	var specificationMap = {};
	[@compress single_line = true]
		[#list specifications as specification]
			specificationMap['${specification.id}']={
				id:'${specification.id}',
				name:'${specification.name}',
				price:${specification.price},
				unit:'${specification.unit}',
				minNum:${specification.minNum},
				maxNum:${specification.maxNum}				
			};
		[/#list]
	[/@compress]

	function select_attr(obj,tid){
		var attrs = $('#attrSets_area .attribute');
		for(var i=0;i<attrs.length;i++){
			$(attrs[i]).removeClass("attr_select");
		}
		$(obj).addClass("attr_select");
		$('#attrSets_area #specificationId').val(specificationMap[tid].id);
		$('#attrSets_area #goodsName').html(specificationMap[tid].name);
		$('#attrSets_area #goodsPrice').html(specificationMap[tid].price+'元/'+specificationMap[tid].unit);
		$('#attrSets_area #_num').val(specificationMap[tid].minNum);
		$('#attrSets_area #minnum').val(specificationMap[tid].minNum);
		$('#attrSets_area #maxnum').val(specificationMap[tid].maxNum);
	}
	function setBtn(){
		var minnum = Number($('#minnum').val());
		var maxnum = Number($('#maxnum').val());
		var num = Number($('#_num').val());
		if(num<=minnum){
			$('#subBtn').attr('class','add_sub_disabled');
			$('#addBtn').attr( "onclick",'');
		}else{
			$('#subBtn').attr('class','add_sub_abled');
			$('#subBtn').attr( "onclick",'setNum(-1)');
		}
		if(num>=maxnum){
			$('#addBtn').attr('class','add_sub_disabled');
			$('#addBtn').attr( "onclick",'' );
		}else{
			$('#addBtn').attr('class','add_sub_abled');
			$('#addBtn').attr( "onclick",'setNum(1)');
		}
	}
	function setNum(n){
		var minnum = Number($('#minnum').val());
		var maxnum = Number($('#maxnum').val());
		var num = Number($('#_num').val());
		if(num+n<minnum||num+n>maxnum){
			return;
		}
		num=num+n;
		$('#_num').val(num);
		setBtn();
	}
	function checkNum(){
		var minnum = Number($('#minnum').val());
		var maxnum = Number($('#maxnum').val());
		var num = Number($('#_num').val());
		if(num<minnum){
			$('#_num').val(minnum);
		}else if(num>maxnum){
			$('#_num').val(maxnum);
		}
		setBtn();
	}
	var isLogin;
	
	function addCart_show(){
		if(!isLogin){
			switchView('bigview','loginview');
			return;
		}
		//$('#cartOrbuy_area').hide();
		$('#cover').show();
		$('#allsubmit_btn').css({'background':'#FE9A2E'});
		$('#allsubmit_btn').html('加入购物车');
		$('#allsubmit_btn').attr('onclick','addCart()');
		$('#attrSets_area').slideDown(function(){initScroll();});
	}
	function buy_show(){
		//$('#cartOrbuy_area').hide();
		$('#cover').show();
		$('#allsubmit_btn').css({'background':'#DC0404'});
		$('#allsubmit_btn').html('立即购买');
		$('#allsubmit_btn').attr('onclick','buy()');
		$('#attrSets_area').slideDown(function(){initScroll();});
	}
	function buy(){
		gotourl('http://meiaijie.wx.toohuu.com:80/wx/appoint.jsp?xiangmupk='+$('#xiangmupk').val()+'&num='+$('#_num').val());
	}
	function attrHide(){
		$('#attrSets_area').slideUp();
		$('#cover').hide();
	}
	function addCart(){
		$.ajax({  
			type:'post',   
			async:true,
			url:'http://meiaijie.wx.toohuu.com:80/wx/jzbj/action.jsp?_r=1505805301196',
			data:{
					//kehu_id:$('#fwryzhanghao').val(),
					xiangmupk:$('#xiangmupk').val(),
					_num:$('#_num').val(),
					method:'addCart'
			},
			complete:function(data){
				if('1'==data.responseText){
					$.MsgBox.toast({message:'加入购物车成功！',top:(H-200)+'px'});
					attrHide();
				}else{
					$.MsgBox.alert({message:'加入购物车失败，请重试！'});
				}
			}  
		})
	}
	var myScroll;
	function initScroll () {
		if(!myScroll){
			myScroll = new IScroll('#wrapper', { mouseWheel: true,click:true});
		}
	}
</script>
<script type="text/javascript" src="${base}/resources/mobile/js/iscroll-lite.js"></script>
</body>
</html>