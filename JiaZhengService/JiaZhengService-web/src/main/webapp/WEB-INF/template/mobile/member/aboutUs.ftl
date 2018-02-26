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
<link href="${base}/resources/mobile/css/article.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function(){ 
    m$.header.titleContent.setTitle("关于我们");
    $(".header_2 .cart_area").remove();
 });
 
 </script>
</head>
<body class="body_margin">
	<div id="bigview" style="overflow:hidden;" class="fullview">
		[#include "/mobile/include/header_2.ftl" /]
		<div class="content">
			<div id="article_area">
				<p>
					<font color=#787878 size=3>
						&nbsp;&nbsp;&nbsp;&nbsp;靖江市便民服务求助中心位于城南办事处中鼎花苑东门4号楼，上下两层，总面积600平方米。中心是政府主导、相关部门负责、市场和社会主体有序参与，为群众尤其是全市社区居民提供生活便民服务的综合服务机构。<BR>
					</font>
					<font color=#787878 size=3>
						&nbsp;&nbsp;&nbsp;&nbsp;2017年7月起，我市多部门联合启动市便民服务求助中心建设，深入推进文明城市建设，创新社会治理，促进政府、社会、市场三者的联动互动，带动青年志愿服务便民、常态开展，真正打通联系服务群众的“最后一步路”。<BR>
						&nbsp;&nbsp;&nbsp;&nbsp;便民服务求助中心恪守“有问必答、有求必应、有难必帮”承诺，遵循规范公开的“少偿”原则，服务群众生活基本需求。目前，便民服务求助中心已开通24小时求助服务热线，接入“智慧靖江”链接，实现24小时便民服务。未来，中心还将实现相关部门联动服务，并以购买政府服务方式，向特殊群体发放定额“便民服务券”，并将输送“无偿”志愿服务。在志愿服务指导中心指导下，中心将整合全市志愿服务力量，提供居民喜闻乐见的家电维护、磨刀、理发、缝纫、量血压等身边的志愿服务，打造“靖江志愿”品牌。<BR>
						&nbsp;&nbsp;&nbsp;&nbsp;靖城、城南、滨江新区的市民可以拨打24小时热线：84911111，呼叫便捷的家政、应急维修服务。
					</font>
				</p>
				<p>
					<img src="${base}/resources/mobile/images/1.jpg" class="img_class"/>
				</p>
				<p>
					<img src="${base}/resources/mobile/images/2.jpg" class="img_class"/>
				</p>
				<p>
					<img src="${base}/resources/mobile/images/3.jpg" class="img_class"/>
				</p>
			</div>	
		</div>
	</div>
</body>
</html>