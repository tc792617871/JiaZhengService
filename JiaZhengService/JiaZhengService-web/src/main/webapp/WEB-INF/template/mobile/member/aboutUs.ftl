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
					xxx家庭服务有限公司是一家经过政府备案、工商注册的专业家政服务连锁培训机构，拥有强大的自主服务平台，拥有多年的专业服务终端运营经验。美爱洁家政作为运营比较成熟的终端服务型平台，凭借“品牌+资源”、“服务+口碑”的管理模式走向全国。<BR>
					</font>
					<font color=#787878 size=3><BR>拥有一套完善的科学管理终端系统<BR><BR>
					xxx家政积累了一套丰富完善的科学管理终端运营体系，在企业品牌逐渐扩大走向全国的同时，持续不断地完善升级目前终端运营管理。通过不定期的出国考察，学习国外先进管理制度和管理经验，优化企业管理，提升企业核心竞争力，扩大企业品牌在全国影响力，让每个家庭都能享受到我们高品质的家庭服务。<BR><BR>　　
					一站式高端家政服务公司<BR><BR>　　
					美爱洁家政在商业模式上力求创新，敢于变革传统经营管理模式，并建立O2O线上线下预定服务平台，为客户提供更全面更方便快捷的一站式家庭服务。公司通过电脑PC端、400电话、微信、官网，以及手机App等多种便捷方式为客户提供便捷服务，做到一键预约保洁服务、洗护服务、家居保养、家电清洗等服务。
					</font>
				</p>
				<p>
					<span class="imgArea">
						<img src="${base}/resources/mobile/images/1.jpg"/>
					</span>
				</p>
			</div>	
		</div>
	</div>
</body>
</html>