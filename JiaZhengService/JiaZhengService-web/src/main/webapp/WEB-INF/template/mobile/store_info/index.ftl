<!DOCTYPE html> 
<html>
<head>
<title>店铺</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<!--引用百度地图API-->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=9NRLHTxsqi5LDPpmLxwoTcCy"></script>
<!--引用微信SDK-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<!-- 坐标转换js-->
<script src="${base}/resources/mobile/js/coordinateConversor.js"></script>
<script type="text/javascript">
$().ready(function(){ 
	m$.storeInfo.searchArea.getProvince();
	var $storeinformationsearch = $("#storeinformationsearch");
	$storeinformationsearch.click(function(){
		m$.storeInfo.searchArea.submit();
	});
	//Test
	/*$("#nearbySearchTest").click(function(){
        var googleCoordinate = GPS.bd_decrypt(32.015136827495,118.77445094453);
        var latitude = googleCoordinate['lat'];
        var longitude = googleCoordinate['lon'];
		document.location.href = moshop.base + '/mobile/storeInfo/getNearbyStoreList.jhtml?latitude='+latitude+'&longitude='+longitude+'&cityName='+'南京市'+'&brandId=19';
	});*/
});
function getCity(parentId) {
    m$.storeInfo.searchArea.getCity(parentId);
}
</script>

</head>
<body>	
	<div class="fullscreen">
		<div>
			<img src="${base}/resources/mobile/images/shop.jpg" style="width: 100%;"/>
		</div>	
		<form id="inputForm" action="${base}/mobile/storeInfo/getStoreList.jhtml" method="get" style="margin:12px;">	
		<div>
		 <ul>
		     <li>
		    	<div class="select_box_p" style="width: 100%;">
		       		<span id="store_select_txt_provice" class="select_txt">省</span>
		        	<a class="selet_open" id="selectOpenProvice" style="height: 30px;">
    			 	  <b></b>
        			</a>
        			<div id="provice_select_p" class="option_p" style="width: 100%;">
        			</div>
    			</div>
    			<br clear="all" />
			</li>
			<li>
        		<div class="select_box_b2" style="width: 100%;">
            		<span id="select_txt_city_b" class="select_txt">城市</span>
            		<a class="selet_open" id="selectOpenCity" style="height: 30px;">
            		</a>
            		<div id="city_select_b" class="option_b2" style="width: 100%;">
            		</div>
        		</div>
    		</li>
		</ul>
		 <input type="hidden" id="selectProvinceValue" name="selectProvinceValue"/>
		 <input type="hidden" id="selectCityValue" name="selectCityValue"/>
		<div>
			<button type="button" id="storeinformationsearch" style="margin-top:10px;">搜索</button>
		</div>
		<div>
			<input id="cityName" type="hidden" value=""/>
			[#if brand.id == 19]
				<button type="button" id="nearbySearch" style="margin-top:10px;margin-bottom:100px;">附近的ED店铺</button>
		    [#else]
		        <button type="button" id="nearbySearch" style="margin-top:10px;margin-bottom:100px;">附近的MO店铺</button>
			[/#if]
		</div>
		</form>
		
	  </div>
	     [#include "/mobile/include/footer.ftl" /]
	</div>
</body>

<script type="text/javascript">
  window.onload = function(){
     wx.config({
	    debug: false, //开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	    appId: '${appId}', //必填，公众号的唯一标识
	    timestamp: '${timestamp}', // 必填，生成签名的时间戳
	    nonceStr: '${nonceStr}', // 必填，生成签名的随机串
	    signature: '${signature}',// 必填，签名
	    jsApiList: [// 必填，需要使用的JS接口列表
	      'getLocation' 
	    ] 
	});
  }
  
  wx.ready(function () {
		$("#nearbySearch").click(function(){
		    wx.getLocation({
		    	type: 'wgs84', //默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
		    	//WGS-84：是国际标准，GPS坐标（Google Earth使用、或者GPS模块）
				//GCJ-02：中国坐标偏移标准，Google Map、高德、腾讯使用
			    //BD-09：百度坐标偏移标准，Baidu Map使用
		    	success: function (res) {
		    		var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
			        var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
			        var speed = res.speed; // 速度，以米/每秒计
			        var accuracy = res.accuracy; // 位置精度
			        var baiduCoordinate = GPS.bd_encrypt(latitude,longitude);//使用百度坐标定位当前城市
			        var googleCoordinate = GPS.gcj_encrypt(latitude,longitude);//传到后台使用的是google坐标
			        getCityName(baiduCoordinate['lat'],baiduCoordinate['lon']);
			        var cityName = $("#cityName").val();
			        //alert('/mobile/storeInfo/getNearbyStoreList.jhtml?latitude='+googleCoordinate['lat']+'&longitude='+googleCoordinate['lon']+'&cityName='+cityName+'&brandId=${brand.id}');
			        document.location.href = moshop.base + '/mobile/storeInfo/getNearbyStoreList.jhtml?latitude='+googleCoordinate['lat']+'&longitude='+googleCoordinate['lon']+'&cityName='+cityName+'&brandId=${brand.id}';
		    	},
		        cancel: function (res) {
		        	alert('用户拒绝授权获取地理位置');
		        }
	        });
		});
    });
    
    wx.error(function (res) {
	  	//alert(res.errMsg);
	  	m$.ui.dialog.dialogShow({
        	'title': '提示',
        	'content': res.errMsg
    		},
        [{
        'text': '确定'
        }]);
	});
    
	//定位当前省份、城市、区、街道(使用百度地图API，将经纬度转换成城市名和街道地址)
	function getCityName(latitude, longitude) {
		$.ajax({
			url: 'http://api.map.baidu.com/geocoder/v2/?ak=9NRLHTxsqi5LDPpmLxwoTcCy&callback=renderReverse&location=' + latitude + ',' + longitude + '&output=json&pois=1',
			type: "get",
			dataType: "jsonp",
			async : false,
			jsonp: "callback",
			success: function (data) {
				var province = data.result.addressComponent.province;
				var cityname = (data.result.addressComponent.city);
				var district = data.result.addressComponent.district;
				var street = data.result.addressComponent.street;
				var street_number = data.result.addressComponent.street_number;
				var formatted_address = data.result.formatted_address;
				var data = {
					latitude: latitude,
					longitude: longitude,
					cityname: cityname
				};
				$("#cityName").val(cityname);
			},
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert('error');
	            alert(XMLHttpRequest.status);
	            alert(XMLHttpRequest.readyState);
	            alert(textStatus);
            } 
		});
	}
</script>
</html>