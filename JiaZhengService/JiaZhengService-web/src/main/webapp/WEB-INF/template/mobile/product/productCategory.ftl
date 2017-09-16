<!DOCTYPE html> 
<html>
<head>
	<title>产品菜单</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
	<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
</head>
<body class="body_margin">
	<div class="fullscreen">	
		<div class="moMobileContent">
		 <ul class="productCategory">
		       <li>
				  <a href="${base}/mobile/product/filterProduct.jhtml?brandId=[@brand_id]${currentBrandId}[/@brand_id]">
				      即时筛选
				  </a>
			   </li>
		      <li>
				  <a href="${base}/mobile/list.jhtml?brandId=[@brand_id]${currentBrandId}[/@brand_id]&productCategoryId=${productCategory.id}">
				      全部
				  </a>
			   </li>
			 [#if brand]
			  [#list productCategories as productCategory]
			   <li>
				  <a href="${base}/mobile/list.jhtml?brandId=${brand.id}&productCategoryId=${productCategory.id}">
				      ${productCategory.nameZh}
				  </a>
			   </li>
			  [/#list]
			 [#elseif tag ]
				 [#list productCategories as productCategory]
				 <li>
				  <a href="${base}/mobile/list.jhtml?tagIds=${tag.id}&productCategoryId=${productCategory.id}">
				      ${productCategory.nameZh}
				  </a>
				 </li>
				 [/#list]
			[/#if]
		</ul>
		</div>
 	   <!-- footer -->
		[#include "/mobile/include/footer.ftl" /]
		<!-- /footer -->
	</div>
</body>
</html>