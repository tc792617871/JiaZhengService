<!DOCTYPE html> 
<html lang="en">
<head>
[#if productCategory??]
	[@seo type = "productList"]
		<title>[#if productCategory.seoTitle??]${productCategory.seoTitle}[#elseif seo.title??][@seo.title?interpret /][/#if][#if systemShowPowered] - MO&Co.[/#if]</title>
		[#if productCategory.seoKeywords??]
			<meta name="keywords" content="${productCategory.seoKeywords}" />
		[#elseif seo.keywords??]
			<meta name="keywords" content="[@seo.keywords?interpret /]" />
		[/#if]
		[#if productCategory.seoDescription??]
			<meta name="description" content="${productCategory.seoDescription}" />
		[#elseif seo.description??]
			<meta name="description" content="[@seo.description?interpret /]" />
		[/#if]
	[/@seo]
[#else]
	<title>${message("shop.product.title")}[#if systemShowPowered][/#if]</title>
[/#if]
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script>
	var nextPageHtml = '';
    var listData = '';
    var scrollbarLocation = 0;
    var pageParams = {
		productCategoryId : '${productCategoryId}',
		pageNumber : 1,
		pageCount : '${totalPage}',
		pageSize : 12,
		totalPages:0,
		orderType : '${orderType}',
		brand : '${brand.name}',
		brandId: '${brandId}',
		promotionId: '${promotionId}'
	}
</script>
</head>
<body >
	<div class="fullscreen">
	    <!-- header class="body_margin"  [#include "/mobile/include/header.ftl" /]-->
		
		<!-- /header -->
		<img src="${base}/resources/mobile/images/promotion.jpg" class="index_category" />
		<ul class="list_box" id="listBox">
		   <li class="page_loading" id="pageLoading"><div class="loading"><div class="rotate"></div></div></li>
	    </ul>
     <script type="text/javascript">
		var listUrl = "${base}/mobile/proProductList.jhtml?";
		var listParam =  getListParam(pageParams);
        var site = listUrl + listParam;
        $.ajax({
            url: site, 
            type: "get",
            dataType: "json",
            cache: false,
            async: false,
            success: function (data) {
                if ($('#pageLoading').prevAll().length != 0) {
                    $('#pageLoading').prevAll().remove();
                }
                if (data.page && data.page.content.length > 0) {
                     /** 总页数*/
		            var totalPage = data.page.totalPages;
		            /** 商品列表*/
		            var productList = data.page.content;
		            
                    assembleListBox(productList);
                    
                    $('#pageLoading').before(nextPageHtml);
                    
                    if(data.productCategoryId){
                         pageParams.productCategoryId = data.productCategoryId;
                    }
                    pageParams.pageNumber = 2;
                    pageParams.pageCount = data.totalPage;
                    pageParams.orderType = data.orderType;
                    if(data.brandId){
                         pageParams.brandId = data.brandId;
                    }
                    
                    if(data.promotionId){
                         pageParams.promotionId = data.promotionId;
                    }
                    
                    listParam = getListParam(pageParams);
                    nextPageHtml = '';
                    if (pageParams.pageCount == 2) {
                        getList(listUrl, listParam, false);
                    } else {
                        nextPageIndex = pageParams.pageNumber + 1;
                        if (nextPageIndex <= pageParams.pageCount) {
                            getList(listUrl, listParam, false);
                        } else {
                            $('#pageLoading .loading').css('display', 'none');
                        }
                    }
                    m$.ui.lazy.init('listBox');
                } else {
                	 $('#pageLoading').after('${message("shop.product.noListResult")}');
                }
            }
        });
	</script>
	  <!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->
	</div>
</body>
</html>