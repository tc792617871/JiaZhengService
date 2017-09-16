<!DOCTYPE html> 
<html>
<head>
<title>查询结果(${shopInfoJsonObjects?size})</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/mobile/css/storeList.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
</head>
<body>	
	<div class="fullscreen">
		<div class="store_list">
			[#if shopInfoJsonObjects ?? && shopInfoJsonObjects?size > 0]
			<ul>
				[#list shopInfoJsonObjects as shopInfoJsonObject]
				<li [#if shopInfoJsonObject_index == (shopInfoJsonObjects?size)-1]style="margin-bottom:60px;"[/#if]>
			    	<div [#if brandId == 18]class="title_mo"[/#if][#if brandId == 19]class="title_ed"[/#if]>
			    		<span>${shopInfoJsonObject.shopInfoName}</span>
		    		</div>
		            <div class="radius_div">
				      	<label>Address:</label>
			        	<span>
			        		${shopInfoJsonObject.shopInfoAddress}
			        		<p>${shopInfoJsonObject.shopInfoAddressEn}</p>
		        		</span>
				        <hr>
				        <label>TEL:</label>
				        <span>
				        	${shopInfoJsonObject.shopInfoTel}
			        	</span>
		                <hr>
			        	<label>Distance:</label>
				        <span>
				        	${shopInfoJsonObject.distance}km
			        	</span>
		                <div class="clear_both"></div>
				    </div>
			    </li>
			    [/#list]
		    </ul>
		    [#else]
		    	<div class="radius_div">
		        	<span>
		        		附近没有找到相关店铺
		        		<p></p>
	        		</span>
			        <hr>
			    </div>
		    [/#if]
		</div>
		<div>
 		[#include "/mobile/include/footer.ftl" /]
 		</div>
	</div>
</body>
</html>