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
	});
</script>

</head>
<body>
<div class="fullscreen" >
	[#include "/mobile/include/header_2.ftl" /]
	<div class="product_content">
		<div>
			<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1489753786439/12.jpg#12.jpg" width="100%">
		</div>
		<div style="margin:0 0px;margin-top:10px;1border-top:1px solid #f6f6f6;">
			<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1505349234104.jpg" style="display:block;width:100%;margin-bottom:1px;">
		</div>
	</div>
	<div id="cartOrbuy_area" class="buy_footer">
		<div class="add_cart" onclick="addCart_show();">加入购物车</div>
		<div class="buy_show" onclick="buy_show();">立即购买</div>
	</div>
	<div id="attrSets_area">
		<span class="attr_hide" onclick="attrHide()">×</span>
		<div class="product_detail">
			<div class="goods_name" id="goodsName">
				钟点保洁
			</div>
			<div class="goods_price" id="goodsPrice">
				25.0元/小时/人
			</div>
		</div>
		<div class="choose_attr_area" id="wrapper">
			<div class="attrs_area">
				<label class="choose_attr">选择属性</label>
				<span class="attribute attr_select" onclick="select_attr(this,'10183');">钟点保洁</span>
				<span class="attribute" onclick="select_attr(this,'10184');">钟点保洁（17：00后）</span>
				<span class="attribute" onclick="select_attr(this,'10209');">钟点保洁补拍专用</span>
				<span class="attribute" onclick="select_attr(this,'10210');">钟点保洁（17:00后）补拍专用</span>
			</div>
		</div>
		<div class="choose_num_area">
			<input type="hidden" id="xiangmupk" name="xiangmupk" value="10183">
			<input type="hidden" id="minnum" name="minnum" value="2.0">
			<input type="hidden" id="maxnum" name="maxnum" value="9999999.0">
			<label class="choose_num">选择数量</label>
			<div class="num_input">
				<label id="subBtn" class="add_sub_disabled" onclick="setNum(-1)">-</label>
				<input type="number" id="_num" name="_num" value="2.0" onchange="checkNum()" style="">
				<label id="addBtn" class="add_sub_abled" onclick="setNum(1)" onclick="setNum(1)">+</label>
			</div>
		</div>
		<div id="allsubmit_btn">加入购物车/立即购买</div>
	</div>
	<div id="cover" ontouchmove="event.preventDefault()"></div>
</div>
<script>
	var xmjson = {"10183":{"c120504002249533":"","c12041910441512":25.0,"tid120419104310340":10183,"c170109095347491":"钟点保洁","c161008165520564":"","c120419104404971":"小时/人","c161009153010364":9999999.0,"c161009152940408":2.0,"c1610081532143":"家庭单位保洁","c161117172008470":null,"c120419104352520":"钟点保洁"},"10209":{"c120504002249533":"","c12041910441512":25.0,"tid120419104310340":10209,"c170109095347491":"钟点保洁","c161008165520564":"","c120419104404971":"小时/人","c161009153010364":9999999.0,"c161009152940408":0.5,"c1610081532143":"家庭单位保洁","c161117172008470":null,"c120419104352520":"钟点保洁补拍专用"},"10184":{"c120504002249533":"","c12041910441512":30.0,"tid120419104310340":10184,"c170109095347491":"钟点保洁","c161008165520564":"","c120419104404971":"小时/人","c161009153010364":9999999.0,"c161009152940408":2.0,"c1610081532143":"家庭单位保洁","c161117172008470":null,"c120419104352520":"钟点保洁（17：00后）"},"10210":{"c120504002249533":"","c12041910441512":30.0,"tid120419104310340":10210,"c170109095347491":"钟点保洁","c161008165520564":"","c120419104404971":"小时/人","c161009153010364":9999999.0,"c161009152940408":0.5,"c1610081532143":"家庭单位保洁","c161117172008470":null,"c120419104352520":"钟点保洁（17:00后）补拍专用"}};
	function select_attr(obj,tid){
		var attrs = $('#attrSets_area .attribute');
		for(var i=0;i<attrs.length;i++){
			$(attrs[i]).removeClass("attr_select");
		}
		$(obj).addClass("attr_select");
		$('#attrSets_area #xiangmupk').val(xmjson[tid].tid120419104310340);
		$('#attrSets_area #goodsName').html(xmjson[tid].c120419104352520);
		$('#attrSets_area #goodsPrice').html(xmjson[tid].c12041910441512+'元/'+xmjson[tid].c120419104404971);
		$('#attrSets_area #_num').val(xmjson[tid].c161009152940408);
		$('#attrSets_area #minnum').val(xmjson[tid].c161009152940408);
		$('#attrSets_area #maxnum').val(xmjson[tid].c161009153010364);
		//$('#attrSets_area #num_area').html(xmjson[tid].c161009152940408);
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
		//$('#num_area').html(num);
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