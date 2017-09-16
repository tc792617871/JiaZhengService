<!DOCTYPE html> 
<html>
<head>
	<title>即时筛选</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
	<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
	<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
	<script type="text/javascript" src="${base}/resources/shop/js/json2.js"></script>
	<script type="text/javascript">
	$().ready(function(){ 
		m$.header.titleContent.setTitle("即时筛选");
		/** 筛选*/
		$(".multiSelectPanel").each(function(){
			var $this=$(this);
			var $filterProduct=$this.find("a");
			$filterProduct.click(function(){
				if(!!$(this).hasClass("filterSelected")){
					$(this).removeClass("filterSelected");
					$this.removeAttr("data-aid");
				}else{
					$(this).addClass("filterSelected").siblings("a").removeClass("filterSelected");
					$this.attr("data-attrval",$(this).attr("data-aid"))
				}
			})
		})
		
		$(".singleSelectionPanel").each(function(){
			var $this=$(this);
			var $filterProduct=$this.find("a");
			$filterProduct.click(function(){
				if(!!$(this).hasClass("filterSelected")){
					$(this).removeClass("filterSelected");
					$this.removeAttr("data-aid");
				}else{
					//$(this).addClass("filterSelected").siblings("a").removeClass("filterSelected");
					$this.find("a").removeClass("filterSelected");
					$(this).addClass("filterSelected");
					$this.attr("data-attrval",$(this).attr("data-aid"))
				}
			})
		})
	});
	
	var nextPageHtml = '';
    var listData = '';
    var scrollbarLocation = 0;
    var pageParams = {
		brandId : '',
		isNewArrival : false,
		isBestSeller : false,
		isPromotion : false,
		salesValumeOrderBy : '',
		yearOrderBy : '',
		productCatagoryIds : '',
		colorIds : '',
		prices : '',
		sizeIds : '',
		orderType : '',
		priceOrderBy:'',
		pageNumber : 0,
		pageCount : '',
		pageSize : 12
	}
	 var nextPageIndex = 0;
	var listUrl = "${base}/mobile/product/doFilterProduct.jhtml?";
	</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
	    <!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->	
		<div class="moMobileContent">
		     <div style="border-top: 1px solid #000;text-align: center;font-weight: 800;font-size: 12px;line-height: 25px;">
			      可同时选择多个选项
			 </div>
			 <input type="hidden" value=${brandId} id="brandId"/>
			 <ul class="filterProduct">
			       <li class="multiSelectPanel">
					 <table style="width: 240px;">
					     <tr>
					        <td>
					            <a href="javascript:;" id="newArrivalFilter" >
					                最新货品
					            </a>
					        </td>
					        <td>
					            <a href="javascript:;" id="baseSellerFilter">
					               热销货品
					            </a>
					        </td>
					        <td>
					            <a href="javascript:;" id="promotionFilter">
					              促销货品
					            </a>
					        </td>
					     </tr>
					 </table>
				   </li>
				   <li class="singleSelectionPanel">
					 <table style="width: 160px;" id="salesVolumeFilter">
					     <tr>
					        <th>
					            <strong>销量</strong>
					        </th>
					     </tr>
					      <tr>
					        <td>
					            <a href="javascript:;" val="saleAmount2Asc">
					               ↑从低到高
					            </a>
					        </td>
					        <td>
					            <a href="javascript:;" val="saleAmount2Desc">
					                ↓从高到低
					             </a>
					        </td>
					     </tr>
					 </table>
				   </li>
				   <li class="singleSelectionPanel">
					 <table style="width: 160px;" id="yearFilter">
					     <tr>
					        <th>
					            <strong>年份</strong>
					        </th>
					     </tr>
					      <tr>
					        <td>
					            <a href="javascript:;" val="date2Asc">
					                ↑从低到高
					            </a>
					        </td>
					        <td>
					            <a href="javascript:;" val="date2Desc">
					               ↓从高到低
					            </a>
					        </td>
					     </tr>
					 </table>
				   </li>
				   <li class="multiSelectPanel">
					 <table id="productCategoryFilter">
					     <tr>
					        <th>
					            <strong>产品分类</strong>
					        </th>
					     </tr>
					     [#list productCategoryListPage as productCategoryList]
						         <tr>
								      [#list productCategoryList as productCategory]
									        <td>
									            <a href="javascript:;" val="${productCategory.id}">
									               ${productCategory.nameZh}
									            </a>
									        </td>
								       [/#list]
								  </tr>
					     [/#list]
					     
					 </table>
				   </li>
				   <!--
				    <li class="multiSelectPanel">
					 <table id="colorFilter">
					    <tr>
					        <th>
					            <strong>颜色</strong>
					        </th>
					     </tr>
						    [#list colorListPage as colorList]
						         <tr>
								      [#list colorList as color]
									        <td>
									            <a href="javascript:;" val="${color.id}">
									            ${color.mainName}
									            </a>
									        </td>
								       [/#list]
								  </tr>
					        [/#list]
					 </table>
				   </li>-->
				   
				   <li class="multiSelectPanel">
					 <table id="priceFilter">
					     <tr>
					        <th>
					            <strong>价格</strong>
					        </th>
					     </tr>
					       [#list priceListPage as priceList]
						         <tr>
								      [#list priceList as price]
									        <td>
									            <a href="javascript:;" val="${price}">
									               ${currency(price, true)}
									            </a>
									        </td>
								       [/#list]
								  </tr>
					        [/#list]
					 </table>
				   </li>
				   <li class="singleSelectionPanel">
					 <table id="priceOrderByFilter">
					      <tr>
						        <td>
						            <a href="javascript:;" val="price2Asc">
						               ↑价格由低到高
						            </a>
						        </td>
						        <td>
						            <a href="javascript:;" val="price2Desc">
						               ↓价格由高到低
						            </a>
						        </td>
						  </tr>
					 </table>
				   </li>
				   <li class="multiSelectPanel">
					 <table id="sizeFilter">
					      <tr>
					        <th>
					            <strong>尺寸</strong>
					        </th>
					     </tr>
					      <tr>
					        [#list sizeListPage as sizeList]
						         <tr>
								      [#list sizeList as size]
									        <td>
									            <a href="javascript:;" val="${size.id}">
									                ${size.name}
									            </a>
									        </td>
								       [/#list]
								  </tr>
					        [/#list]
					     </tr>
					 </table>
				   </li>
			 </ul>
			 <ul class="filterProductBtnPanel">
			     <li>
			         <button class="clearAll" onclick="m$.business.product.clearfilterSelected()">清除全部</button>
			     </li>
			     <li>
			         <button onclick="m$.business.product.submitProductFilter()">筛选</button>
			     </li>
			  </ul>
	   </div>
	   
	   <!--start 搜索结果页 -->
	   <div id="filterResultContent" style="display: none;">
	         <ul class="list_box" id="listBox">
                <li class="page_loading" id="pageLoading"><div class="loading" style="display: none;"><div class="rotate"></div></div></li>
             </ul>
	   </div>
	   <!--end 搜索结果页 -->
	   
 	   <!-- footer -->
		[#include "/mobile/include/footer.ftl" /]
		<!-- /footer -->
	</div>
</body>
</html>