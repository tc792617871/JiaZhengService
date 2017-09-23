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
<link href="${base}/resources/mobile/css/order.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("预约");
	$(".header_2 .cart_area").remove();
	$(".header_2 .home_area").remove();
});

</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
		<div class="order-content">
			<img src="http://img13.360buyimg.com/n1/jfs/t3271/50/3320182148/85164/b1cfe23d/57ee25faN401020c0.jpg">
			<span class="title">钟点保洁</span>
			<span class="price">￥ 89/台</span>
			<div class="num_input">
				<label id="subBtn" class="add_sub_disabled" onclick="setNum(-1)">-</label>
				<input type="number" id="_num" name="_num" value="2.0" onchange="checkNum()" style="">
				<label id="addBtn" class="add_sub_abled" onclick="setNum(1)" onclick="setNum(1)">+</label>
			</div>
		</div>
		<ul class="order-items">
		    <li class="md-trigger" data-modal="orderItemsModal">
		        <table>
		            <tr>
		                <td>
		                	<div class="order-items-brief">
			                    <img src="http://img13.360buyimg.com/n1/jfs/t3271/50/3320182148/85164/b1cfe23d/57ee25faN401020c0.jpg">
								<span class="title">挂式单台,滚筒不带烘干单台,顶吸/常规侧吸式单台</span>
								<span class="description">共3件商品</span>
							</div>
		                </td>
		                 <td>
		                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="rightArrow"/>
		                </td>
		            </tr>
		        </table>
		    </li>
	    </ul>
	    
	    <ul class="order-info">
		    <li class="md-trigger bottomBorder order-address" data-modal="receiverModal">
		        <table>
		            <tr>
		                <td>
		                    <img src="${base}/resources/mobile/icons/location_icon_mobile.png" class="imgIcon">
		                    <span class="tableSpan">收货信息</span>
		                </td>
		                <td>
		                   <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="rightArrow"/>
		                </td>
		            </tr>
		            <tr>
		                <td colspan="2">
		                    <label for="consignee">收件人:</label>
		                    <span id="consignee">xxxx</span>
		                </td>
		            </tr>
		            <tr>
		                <td colspan="2">
		                    <label for="phone">手机号码:</label>
		                    <span id="phone">xxx</span>
		                </td>
		            </tr>
		            <tr>
		                <td colspan="2">
		                    <label for="address">地址:</label>
		                    <span id="address">
							  	江苏省南京市栖霞区迈尧路611号
		                    </span>
		                </td>
		            </tr>
		            <tr>
		                <td colspan="2">
	                    	<label for="addAddress">点击新增收货地址</label>
		                </td>
		            </tr>
		         </table>
		    </li>
		    <li class="md-trigger bottomBorder" data-modal="orderServiceTimeModal">
		        <table>
		            <tr>
		                <td>
		                    <img src="${base}/resources/mobile/icons/location_icon_mobile.png" class="imgIcon">
		                    <span class="tableSpan">请选择服务时间</span>
		                </td>
		                <td>
		                    <img src="${base}/resources/mobile/images/icon_rightarrow.png" class="rightArrow"/>
		                </td>
		            </tr>
		        </table>
		    </li>
		    <li class="md-trigger orderAreaSquare" data-modal="orderAreaSquareModal">
		        <table>
		            <tr>
		                <td style="width:25px;">
		                </td>
		                <td>
                    		<input type="text" name="areaSquare" placeholder="&nbsp;&nbsp;房屋面积"/>㎡ (请正确填写平米数)
		                </td>
		            </tr>
		        </table>
		    </li>
	    </ul>
	    
	    <ul class="order-info-memo">
	    	<table>
	            <tr>
	                <td>
                		<input type="text" name="memo" placeholder="备注（非必填 最多100字）还有什么要求写在这里吧"/>
	                </td>
	            </tr>
	        </table>
	    </ul>
	    
	    <ul class="order-info-total">
		    <li class="md-trigger" data-modal="orderServiceTimeModal">
		        <table>
		            <tr>
		                <td>
		                    <img src="${base}/resources/mobile/icons/location_icon_mobile.png" class="imgIcon">
		                    <span class="tableSpan">合计</span>
		                </td>
		                <td>
		                    <span class="totalPrice">507.00</span>
		                </td>
		            </tr>
		        </table>
		    </li>
	    </ul>
	    
		<div class="submit_order_info_area">
			<div class="submit_order_info" onclick="">提交订单</div>
		</div>		
	</div>
</body>
</html>