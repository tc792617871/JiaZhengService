<!DOCTYPE html> 
<html>
<head>
<title>联系我们</title>
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
$().ready(function() {
	setInterval(function () {
	  m$.ui.fixed.fixedBody($('#bdmg'));
	}, 500);
	setInterval(function () {
	  m$.ui.fixed.fixedTop($('#header'));
	}, 500);
	setInterval(function () {
	  m$.ui.fixed.fixedWatch($('#footer'));
	}, 500);
});
</script>
<script type="text/javascript">
$().ready(function(){ 

    m$.header.titleContent.setTitle("联系我们");
    
	var $option_p = $(".option_p a");
	var $store_select_txt_provice	= $("#store_select_txt_provice");
	var $proviceSelectp = $("#provice_select_p");
	var $selectOpenProvice = $("#selectOpenProvice");
	var $contactUsSubmit = $("#contactUsSubmit");
	$store_select_txt_provice.click(function(event){   
        event.stopPropagation();
        $proviceSelectp.show();
    });
    $selectOpenProvice.click(function(event){   
        event.stopPropagation();
        $proviceSelectp.show();
    });
	$option_p.click(function(){
        var value=$(this).text();
        $(this).parent().siblings(".contactus_select_txt").text(value);
        $proviceSelectp.hide();
    });
    
	$(".select_box_p").mouseleave(function(){
		$proviceSelectp.hide();
	});
	
	 $contactUsSubmit.click(function(){
		m$.myAccount.contact.sendContactUs();
	});
 });
 
 </script>
</head>
<body class="body_margin" id='bdmg'>
	<div class="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->		
		<div style="margin: 40px 12px 100px 12px;">
			<div>
				<div class="contactus-theme">
					<!--<span style="font-size: 18px;color: #000;">主题</span>-->
					<div class="select_box_p" style="width: 100%;">
					<span class="contactus_theme_txt">主题</span>
		       		<span id="store_select_txt_provice" class="contactus_select_txt">${message("shop.info.select")}</span>
		        	<a class="selet_open" id="selectOpenProvice" style="height: 30px;">
    			 	  <b></b>
        			</a> 
        			<div id="provice_select_p" class="option_p" style="width: 100%;">
        			  [#if titles??]
						[#list titles as title]
							<a > ${title}</a>
						[/#list]
					  [/#if]
        			</div>
        		</div>	
        		</div>
				<div>
					<textarea rows="10" id="content" cols="20" class="contactus-textarea" placeholder="内容"></textarea>
				</div>
			</div>
			<div style="margin-bottom: 60px;">
				<button type="button" id="contactUsSubmit">发送</button>
			</div>
		</div>
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->
	</div>
</body>
</html>