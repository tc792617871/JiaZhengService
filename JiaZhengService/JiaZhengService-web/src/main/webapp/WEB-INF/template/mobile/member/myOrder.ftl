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
<link href="${base}/resources/mobile/css/myOrder.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("我的订单");
	$(".header_2 .cart_area").remove();
	$(".header_2 .home_area").remove();
	
	//setCheckCate(document.getElementById('noend'),'noend');
});
</script>
</head>
<body class="body_margin">
	<div id="container">
		[#include "/mobile/include/header_2.ftl" /]
		<div id="bigcates">
			<input type="hidden" id="currid" name="currid" value="">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td class="nocheckCate checkCate" id="noend" onClick="setCheckCate(this,'noend')">未完成订单</td>
					<td class="nocheckCate" id="end" onClick="setCheckCate(this,'end')">已完成订单</td>
					<td class="nocheckCate" id="noPJ" onClick="setCheckCate(this,'noPJ')">待评价订单</td>
					<td class="nocheckCate" id="DQ" onClick="setCheckCate(this,'DQ')">定期服务</td>
				</tr>
			</table>
		</div>
		<div class="order-list">
			<div id="smallcates">
				<div class="pgdarea" onclick="window.location='${base}/mobile/member/orderDetails.jhtml'">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center" class="pgdnum">111111</td>
							<td align="right" class="pgdstatus"><span style="color:#FF4000" >取消</span></td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" >
						<tr><td class="pgddetail">服务项目：1111</td></tr>
					    <tr><td class="pgddetail">服务地址：11111</td></tr>
						<tr><td class="pgddetail">开始时间：1111</td></tr>
					 </table><span class="rightArrow"></span>
				  </div>
				  <div class="pgdarea" onclick="window.location='${base}/mobile/member/orderDetails.jhtml'">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center" class="pgdnum">111111</td>
							<td align="right" class="pgdstatus"><span style="color:#FF4000" >取消</span></td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" >
						<tr><td class="pgddetail">服务项目：1111</td></tr>
					    <tr><td class="pgddetail">服务地址：11111</td></tr>
						<tr><td class="pgddetail">开始时间：1111</td></tr>
					 </table><span class="rightArrow"></span>
				  </div>
				  <div class="pgdarea" onclick="window.location='${base}/mobile/member/orderDetails.jhtml'">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center" class="pgdnum">111111</td>
							<td align="right" class="pgdstatus"><span style="color:#FF4000" >取消</span></td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" >
						<tr><td class="pgddetail">服务项目：1111</td></tr>
					    <tr><td class="pgddetail">服务地址：11111</td></tr>
						<tr><td class="pgddetail">开始时间：1111</td></tr>
					 </table><span class="rightArrow"></span>
				  </div>
				  <div class="pgdarea" onclick="window.location='${base}/mobile/member/orderDetails.jhtml'">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center" class="pgdnum">111111</td>
							<td align="right" class="pgdstatus"><span style="color:#FF4000" >取消</span></td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" >
						<tr><td class="pgddetail">服务项目：1111</td></tr>
					    <tr><td class="pgddetail">服务地址：11111</td></tr>
						<tr><td class="pgddetail">开始时间：1111</td></tr>
					 </table><span class="rightArrow"></span>
				  </div>
			</div>
		</div>
		<script type="text/javascript">
			function setCheckCate(obj,bigcate){
				var container_clientwidth = $('#bigcates').innerWidth();
				var width = $(obj).outerWidth(false);//返回元素的宽度（包括元素宽度、内边距和边框，不包括外边距）参数为true，包括外边距
				var dis = (container_clientwidth-width)/2;//滚动后元素距左侧距离
				var offleft = obj.offsetLeft ;//$(obj).position().left;//相对于容器左边距离
				//$('#bigcates').scrollLeft(offleft-dis);
				$('#bigcates').animate({ scrollLeft: offleft-dis }, 300);
		
				if($('#bigcates .checkCate').length>0){
					$('#bigcates .checkCate').removeClass('checkCate');
				}
				$(obj).addClass('checkCate');
				$('#currid').val(bigcate);
				if(bigcate=='DQ'){
					getDQ();
				}else{
					getsmallcates(bigcate);
				}
			}
			function getsmallcates(bigcate){
				$.loader.show('加载中...');
				$.ajax({  
					type:'post',   
					async:true,
					url:'http://meiaijie.wx.toohuu.com:80/wx/jzbj/json/paigongdan.jsp?pgdstatus='+bigcate,
					complete:function(data){
						$.loader.hide();
						eval ('huiyuan_danci = '+data.responseText); 
						list_json = huiyuan_danci['huiyuan'];
						//console.log(list_json);
						var currid = $('#currid').val();
						var html = "";
						for(inx in list_json){
							new_json = list_json[inx];
							html += '<div class="pgdarea" onclick="gotourl(\'http://meiaijie.wx.toohuu.com:80/wx/jzbj/tpgd_show.jsp?pgdid='+new_json.tid120416182220667+'&currid='+currid+'\')">'
								  + '<table width="100%" border="0" cellspacing="0" cellpadding="0">'
								  + '<tr>'
									+ '<td align="center" class="pgdnum">'+new_json.c120416182510645+'</td>'
									+ '<td align="right" class="pgdstatus"><span style="color:#FF4000" >'+new_json.c120417141759268+'</span></td>'
								  + '</tr>'
								  + '</table>'
								  + '<table width="100%" border="0" cellspacing="0" cellpadding="0" >'
								  + '<tr><td class="pgddetail">服务项目：'+(new_json.c140805163445556||new_json.c140805163445556)+'</td></tr>'	
								  +	'<tr><td class="pgddetail">服务地址：'+new_json.c12041618311183+'</td></tr>'
								  +	'<tr><td class="pgddetail">开始时间：'+(new_json.c120416182856132==null?'':new_json.c120416182856132)+'</td></tr>'
								  + '</table><span class="rightArrow"></span></div>';
						}
						$('#smallcates').html(html);
					}
				})
			}
			function getDQ(){
				$.loader.show('加载中...');
				$.ajax({  
					type:'post',   
					async:true,
					url:'http://meiaijie.wx.toohuu.com:80/wx/jzbj/json/DQ.jsp?_r=1506184803309',
					complete:function(data){
						$.TooHuuLoader.hide();
						eval ('list_json = '+data.responseText); 
						//console.log(list_json);
						var html = "";
						for(inx in list_json){
							new_json = list_json[inx];
							html += '<div class="pgdarea" _onclick="gotourl(\'http://meiaijie.wx.toohuu.com:80/wx/jzbj/DQ_show.jsp?tid='+new_json.tid170112122420783+'\')">'
								  + '<table width="100%" border="0" cellspacing="0" cellpadding="0">'
								  + '<tr>'
									+ '<td align="center" class="pgdnum">'+new_json.c170112140843465+'</td>'
								  + '</tr>'
								  + '</table>'
								  + '<table width="100%" border="0" cellspacing="0" cellpadding="0" >'
								  + '<tr><td class="pgddetail">服务项目：'+new_json.c120419104352520+'</td></tr>'	
								  +	'<tr><td class="pgddetail">服务地址：'+new_json.c170112141046400+'</td></tr>'
								  +	'<tr><td class="pgddetail">定期余额：'+new_json.c170112152844367+'</td></tr>'
								  + '</table><span class="rightArrow"></span></div>';
						}
						$('#smallcates').html(html);
					}
				})
			}
		</script>
	   [#include "/mobile/include/footer.ftl" /]
	</div>
</body>
</html>