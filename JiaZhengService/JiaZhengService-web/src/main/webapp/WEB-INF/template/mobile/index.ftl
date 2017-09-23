<!DOCTYPE html>
<html lang="en"> 
<head>
<title>${setting.siteName}</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/mobile/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<style>
	.slider{display:none}
	.focus span{width:10px;height:10px;margin-right:10px;border-radius:50%;background:#666;font-size:0}
	.focus span.current{background:#fff}
</style>
</head>
<body>
	<div id="container">
		<div class="slider">
		  <ul>
		    <li><a href=""><img src="../resources/mobile/images/1.jpg"></a></li>
			<li><a href=""><img src="../resources/mobile/images/2.jpg">测试标题一</a></li>
			<li><a href=""><img src="../resources/mobile/images/3.jpg">测试标题一</a></li>
			<li><a href=""><img src="../resources/mobile/images/4.jpg">测试标题一</a></li>
			<li><a href=""><img src="../resources/mobile/images/5.jpg">测试标题一</a></li>
		  </ul>
		</div>
		<div class="ui-categorys">
			<div class="category-item">
				<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487560983465/钟点保洁.jpg#钟点保洁.jpg">
				<span class="title">钟点保洁</span>
				<span class="description">把时间留给自己，把打扫交给我们</span>
			</div>
			<div class="category-item">
				<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1501828924834/钟点保洁.jpg#钟点保洁.jpg">
				<span class="title">星级·钟点保洁</span>
				<span class="description">星级保洁为工作三年以上的阿姨为您服务</span>
			</div>
			<div class="category-item">
				<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1501829467399/地板.jpg#地板.jpg">
				<span class="title">星级·定期保洁</span>
				<span class="description">星级保洁为工作三年以上的阿姨为您服务</span>
			</div>
		</div>
		<div class="tags">
			<div class="tag-title">
				<p>热门推荐</p>
			</div>
			<ul class="tag-content">
				<li class="content-item odd">
					<div class="content-container">
						<span class="title">星级·定期保洁</span>
						<span class="description">星级保洁为工作三年以上的阿姨为您服务</span>
						<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1500713453628/15.jpg#15.jpg">
					</div>
				</li>
				<li class="content-item even">
					<div class="content-container">
						<span class="title">星级·定期保洁</span>
						<span class="description">星级保洁为工作三年以上的阿姨为您服务</span>
						<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1500713453628/15.jpg#15.jpg">
					</div>
				</li>
				<li class="content-item odd">
					<div class="content-container">
						<span class="title">星级·定期保洁</span>
						<span class="description">星级保洁为工作三年以上的阿姨为您服务</span>
						<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1500713453628/15.jpg#15.jpg">
					</div>
				</li>
				<li class="content-item even">
					<div class="content-container">
						<span class="title">星级·定期保洁</span>
						<span class="description">星级保洁为工作三年以上的阿姨为您服务</span>
						<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1500713453628/15.jpg#15.jpg">
					</div>
				</li>
			</ul>
		</div>
	</div>
	[#include "/mobile/include/footer.ftl" /]
	<script type="text/javascript" src="${base}/resources/mobile/js/mobileSlider.js"></script>
	<script type="text/javascript">
    	$(".slider").yxMobileSlider({width:640,height:320,during:3000})
    </script>
</body>
</html>
