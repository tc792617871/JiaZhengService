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
		  </ul>
		</div>
		[#if productCategories ??]
		<div class="ui-categorys">
			[#list productCategories as productCategory]
				<div class="category-item" onclick="window.location.href='${base}/mobile/product/productCategory.jhtml?productCategoryId=${productCategory.id}'">
					<img src="${productCategory.logoImage}">
					<span class="title">${productCategory.nameZh}</span>
					<span class="description">${productCategory.seoDescription}</span>
				</div>
			[/#list]
		</div>
		[/#if]
		[#if tags ??]
		[#list tags as tag]
		<div class="tags">
			[#if tag.products ??]
			<div class="tag-title">
				<p>${tag.name}</p>
			</div>
			<ul class="tag-content">
				[#list tag.products as product]
				<li class="content-item [#if product_index%2 == 1]odd[#elseif product_index%2 == 0]even[/#if]" onclick="window.location.href='${base}/mobile/product/content.jhtml?productId=${product.id}'">
					<div class="content-container">
						<span class="title">${product.name}</span>
						<span class="description">${product.memo}</span>
						<img src="${product.pluImage}">
					</div>
				</li>
				[/#list]
			</ul>
			[/#if]
		</div>
		[/#list]
		[/#if]
	</div>
	[#include "/mobile/include/footer_2.ftl" /]
	<script type="text/javascript" src="${base}/resources/mobile/js/mobileSlider.js"></script>
	<script type="text/javascript">
    	$(".slider").yxMobileSlider({width:640,height:320,during:3000})
    </script>
</body>
</html>
