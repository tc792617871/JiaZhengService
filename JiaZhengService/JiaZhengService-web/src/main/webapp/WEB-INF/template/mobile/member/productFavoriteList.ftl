<!DOCTYPE html> 
<html>
<head>
<title>收藏商品列表</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
   
	var nextPageHtml = '';
	var _serverName = 'moshop';
    var listData = '';
    var scrollbarLocation = 0;
    var pageParams = {
		pageNumber : 1,
		pageCount : ${totalPage},
	}
$().ready(function() {
	
	m$.header.titleContent.setTitle("收藏商品");
});

	function deleteFavourite(id){
		m$.ui.dialog.dialogShow({
        		'title': '提示',
        		'content': '确定要删除吗？'
        	},
        	[{
        		'text': '取消'
        	},
        	{
        		'text': '确定',
        		'func': function() {
        			$.ajax({
        				url: moshop.base + "/mobile/member/favoriteProductDelete.jhtml",
        				type: "POST",
        				data: {
        					productId: id
        				},
        				dataType: "json",
        				cache: false,
        				success: function(data) {
        					location.reload();
        				},
        				complete: function() {
        					location.reload();
        				}
        			});
        		}
        	}]);
	};
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header.ftl" /]
		<ul class="list_box" id="listBox">
			[#if page.content?has_content]
			  [#list page.content?chunk(2) as row]
			     [#list row as product]
					<li class="favouriteProductList">
						 <i onClick="deleteFavourite(${product.id})"></i>
						 <input type="hidden" id="productId" value="${product.id}"/>
					    <a href="${base}/mobile/product/content.jhtml?productId=${product.id}">
						<img src="${product.listCoverImage}@180w_100Q_1x.jpg" datasrc="${product.listCoverImage}@180w_100Q_1x.jpg" width="150" haslazy="true"/>
						</a>
						[#if product.name?length gt 11]
						    <span class="list_price">[#if product.isNewArrival]<span>NEW</span>[/#if] ${abbreviate(product.name, 20)}...</span>
						[#else]
						    <span class="list_price">[#if product.isNewArrival]<span>NEW</span>[/#if]${product.name}</span>
						[/#if]
						    <span class="list_price">
							    ${currency(product.price, true)}
								[#if setting.isShowMarketPrice && product.price != product.marketPrice ]
									 - <del style="color:#9a9a9a">${currency(product.marketPrice, true)}</del>
								[/#if]
						    </span>
					</li>
				[/#list]
			[/#list]
			<li class="page_loading" id="pageLoading"><div class="loading"><div class="rotate"></div></div></li>
			[#else]
				 暂无收藏商品
			[/#if]
 		</ul>
 		<script type="text/javascript">
			_listPop(window.location.href, 'get');
			var listUrl = "${base}/mobile/member/favoriteListProduct.jhtml?pageNumber=";
			var nextPageIndex = pageParams.pageNumber + 1;
			if (nextPageIndex <= pageParams.pageCount){
				getFavouriteProductList(listUrl, nextPageIndex);
				pageParams.pageNumber += 1;
			}else{
			    $('#pageLoading .loading').css('display', 'none');
			}
			m$.myFavourite.favouriteLazy.init('listBox');
		</script>
	   [#include "/mobile/include/footer.ftl" /]
	</div>
</body>
</html>