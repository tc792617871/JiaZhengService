<!DOCTYPE html> 
<html lang="en">
<head>
<title>搜索</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>

<script type="text/javascript">
$().ready(function(){ 
    $("#searchValue").keydown(function(event){
		if(event.keyCode == 13){ 
		    m$.search.search .submit();
		 }
	   });
 });
 
</script>
<script type="text/javascript">
    var nextPageHtml = '';
	var _serverName = 'moshop';
	var listData = '';
	var scrollbarLocation = 0;
	var typeName = '';
	var typeId = '';
	var pageParams = {
	        pageNumber: 0,
	        pageCount:0,
	        pageSize: 0,
	        total: 0,
	        totalPages: 0,
	        searchValue: '',
	        orderType: ''
	};
  _listPop(window.location.href, 'get');
  var listUrl = "${base}/mobile/search/listSearchProduct.jhtml?";
  var listParam = '';
  var nextPageIndex = 0;

function divOnclick() {
    m$.search.search.submit();
}

function hotSreachOnclick(onclickItem) {
    var $hotSearchValue = onclickItem.attributes.hotsearch.value;
    $("#searchValue").val($hotSearchValue);
    m$.search.search.submit();
}

</script>


</head>
    <body>
        <div class="fullscreen" id="fullscreen">
            <div >
            <table cellpadding="0" cellspacing="0" border="0" style="margin-top:40px;height:40px;border:1px solid #000;margin-left: 10px;width: 90%;"">
                 <tr>
                     <td>
                         <input type="text" name="searchValue" id = "searchValue" placeholder="搜索产品" 
                        style="margin-left: 5px;height: 40px; width:95%;border:0;font-size:1em;"/>
                     </td>
                      <td style="width:19%">
							<div style="border-left:1px solid #000;float:right;height:40px;width: 80%;" id="searchBtn" onclick="divOnclick();">
			                    <img src="${base}/resources/mobile/images/search.png" style="width:24px;height:24px; padding-left: 15px;padding-top: 9px;"/>
			                </div>
                     </td>
                 </tr>
             </table>
            </div>
             <div id="hotSearch" style="margin-left: 12px;">
               <ul>
                  <li class="hotSearch-li-title"> 热门搜索</li>
                  [#if hotSreachs??]
                    [#list hotSreachs as hotSreach]
                      [#if hotSreach_index < 3]
                      <li class="hotSearch-li-content">
		                    <div  onclick="hotSreachOnclick(this);" hotsearch = "${hotSreach}">
		                       <div class="hotSearch-li_content_div_spe1" >${hotSreach_index +1}</div >
		                        <div class="hotSearch-li_content_div">${hotSreach}</div >
					        </div>
				      </li>
				      [#else]
				       <li class="hotSearch-li-content">
	                        <div  onclick="hotSreachOnclick(this);" hotsearch = "${hotSreach}">
	                          <div class="hotSearch-li_content_div_spe2"> ${hotSreach_index +1} </div>
	                          <div class="hotSearch-li_content_div"> ${hotSreach}</div>
					        </div>
				        </li>
				      [/#if]
                    [/#list]
                  [/#if]
                 </ul> 
             </div>
            <ul class="list_box" id="listBox">
                <li class="page_loading" id="pageLoading"><div class="loading" style="display: none;"><div class="rotate"></div></div></li>
            </ul>  
                [#include "/mobile/include/footer.ftl" /]
        </div>
    </body>
</html>