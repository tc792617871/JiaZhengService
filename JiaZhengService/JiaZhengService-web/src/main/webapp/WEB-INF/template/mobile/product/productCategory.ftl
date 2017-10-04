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
	<script type="text/javascript" src="${base}/resources/mobile/js/jquery.scrollTo.js"></script>
	<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
	<script type="text/javascript">
	$().ready(function() {
		m$.header.titleContent.setTitle('全部服务');
		$(".header_2 .cart_area").remove();
	});
	</script>
	<style>
	</style>
</head>
<body class="body_margin hidden_flow">
	<div class="categries-page hidden_flow">
		[#include "/mobile/include/header_2.ftl" /]
		<table cellspacing="0" cellpadding="0" border="0" width="100%" height="100%">
			<tbody>
				<tr>
					<td class="first-category-td">
						<div class="first-category">
							[#list productCategories as productCategory]
							<span id="nav_${productCategory.id}" onclick="click_nav(this);" class="[#if productCategory_index == 0]selected[/#if]">
								${productCategory.nameZh}
							</span>
							[/#list]
						</div> 
					</td>
					<td class="allproducts-td">
						<div id="allproducts" onscroll="myscroller()">
							[#list productCategories as productCategory]
							<div class="p_area" id="${productCategory.id}">
								<label>${productCategory.nameZh}</label>
								[#if productCategory.products ??]
									[#list productCategory.products as product]
									<div class="product_item" onclick="window.location.href='${base}/mobile/product/content.jhtml?productId=${product.id}'">
										<img src="${product.image}">
										<span class="title">${product.name}</span>
										<span class="description">${product.memo}</span>
									</div>
									[/#list]
								[/#if]
							</div>
							[/#list]
							<div id="bottom_area"></div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<script>
		window.onload=function(){
			var H = window.innerHeight;
			$('#bottom_area').height(H-$('.p_area').last().height());
			$('#allproducts').height(H);
			
			$('#nav_${productCategoryId}').trigger('click');	
		}
		function click_nav(obj){
			var fenge_index = obj.id.indexOf('_');
			var xm_id = obj.id.substring(fenge_index+1);
			$('#allproducts').scrollTo('#'+xm_id,500);
		}
	
		function myscroller(){
			var scroll_top = $('#allproducts').scrollTop();//滚动条距离
			var xms = $('#allproducts .p_area');
			for(var i=0;i<xms.length;i++){
				var min_dis = xms[i].offsetTop;//元素顶部距容器顶部距离
				var max_dis = $(xms[i]).height()+min_dis;//元素底部距容器顶部距离
				if(scroll_top>=min_dis&&scroll_top<=max_dis){
					$('.first-category span').removeClass('selected');
					$('#nav_'+xms[i].id).addClass('selected');
				}
			}
		}
	</script>
	<span id="sbmarwusasv5"></span>
</body>
</html>