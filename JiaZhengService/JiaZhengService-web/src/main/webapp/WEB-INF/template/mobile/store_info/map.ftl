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
<!--引用百度地图API-->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=9NRLHTxsqi5LDPpmLxwoTcCy"></script>
<script type="text/javascript" src="${base}/resources/shop/js/convertor.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
</head>
<body>	
	<div class="fullscreen">
			<div class="store_map_info" style="position: relative;z-index: 2;">
			 <div style="position: absolute;z-index:3;"> 
			  <a href="${base}/mobile/storeInfo/index.jhtml">
			    <img src="${base}/resources/mobile/images/icon_delete_map.png" style="width: 70%;"/>
			  </a> 
			 </div> 
			    <div class="map_canvas" id="map_canvas">
			    </div>
			</div>    
	</div>
<script type="text/javascript">
$().ready(function(){
   var shopCoordinates = new Array();
    [#if shopinfoList??]
   //用户查询所有的店铺位置，二维数组来存储坐标的地址
     [#list shopinfoList as shopinfo]
      var corrdinate_address = new Array();
       [#if shopinfo.shopCoordinate ??]
            corrdinate_address.push("${shopinfo.shopCoordinate}","${shopinfo.shopAddressZh}","${shopinfo.shopNameZh}","${shopinfo.shopTel}");
            shopCoordinates.push(corrdinate_address);
       [/#if]
     [/#list]
    [/#if]
    
      for(var i = 0; i< shopCoordinates.length;i++) {
           var info = shopCoordinates[i];
           var defaultCoordinate = info[0];
		    $("#map_canvas").css({'display':'block'});
		    var defaultCoordinateArray;
		    if(defaultCoordinate){
		        defaultCoordinateArray = defaultCoordinate.split(",");
		    }
		    baiduMap(defaultCoordinateArray[1],defaultCoordinateArray[0],info[1],info[2],info[3],null);
      } 
});
</script>
<script type="text/javascript"> 
// 百度地图API功能
//谷歌坐标
var map = new BMap.Map("map_canvas");//在百度地图容器中创建一个地图
function baiduMap(x,y,address,name,tel,shopCoordinates){
	var ggPoint = new BMap.Point(x,y);
	BMap.Convertor.translate(ggPoint,2,function (point){
		var point = new BMap.Point(point.lng,point.lat);//定义一个中心点坐标
		map.centerAndZoom(point,10);//设定地图的中心点和坐标并将地图显示在地图容器中
		window.map = map;//将map变量存储在全局
		initMap(point.lng,point.lat,address,name,tel,shopCoordinates);//创建和初始化地图
	}); 
}
</script>
</body>
</html>