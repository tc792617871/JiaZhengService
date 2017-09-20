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
	});
	</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header_2.ftl" /]
		<div class="category-area">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" height="100%">
				<tbody>
					<tr>
						<td style="width:30%;background:#F2F2F2;border-right:1px solid #DADADA;position:relative;" class="content">
							<div class="first-category">
								<span id="nav_10000" onclick="click_nav(this);" class="">
									家庭单位保洁
								</span>
								<span id="nav_10002" onclick="click_nav(this);" class="">
									家电清洗养护
								</span>
								<span id="nav_10003" onclick="click_nav(this);" class="selected">
									家居清洗养护
								</span>
							</div> 
						</td>
						<td style="background:#fff;padding-left:10px;vertical-align:top;height:300px;" class="content">
							<div id="allproducts" style="height: 899px; overflow: scroll;" onscroll="myscroller()">
								<div class="p_area" id="10000">
									<label>家庭单位保洁</label>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=钟点保洁');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487560983465/钟点保洁.jpg#钟点保洁.jpg">
										<span class="title">钟点保洁</span>
										<span class="description">把时间留给自己，把打扫交给我们</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=星级·钟点保洁');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1501828924834/钟点保洁.jpg#钟点保洁.jpg">
										<span class="title">星级·钟点保洁</span>
										<span class="description">星级保洁为工作三年以上的阿姨为您服务</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xmDQ_detail.jsp?smallXM=定期保洁');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487560961610/地板.jpg#地板.jpg">
										<span class="title">定期保洁</span>
										<span class="description">60元可以解决多数家庭一周的卫生烦恼</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=星级·定期保洁');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1501829467399/地板.jpg#地板.jpg">
										<span class="title">星级·定期保洁</span>
										<span class="description">星级保洁为工作三年以上的阿姨为您服务</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=新居开荒');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487559819922/新居开荒.jpg#新居开荒.jpg">
										<span class="title">新居开荒</span>
										<span class="description">交给我们，直接入住，放心舒心</span>
									</div>
								</div>
								
								<div class="p_area" id="10002">
									<label>家电清洗养护</label>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=洗衣机清洗');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487559693862/洗衣机.jpg#洗衣机.jpg">
										<span class="title">洗衣机清洗</span>
										<span class="description">拆开才能彻底清洗,减少皮肤病妇科病风险</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=空调清洗');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1489675950268/空调清洗.jpg#空调清洗.jpg">
										<span class="title">空调清洗</span>
										<span class="description">别再让肺当过滤网，不是洗洗过滤网这么简单</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=油烟机清洗');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487559725905/油烟机.jpg#油烟机.jpg">
										<span class="title">油烟机清洗</span>
										<span class="description">关爱家人身体，请定期清洗</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=冰箱清洗');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487559636736/冰箱.jpg#冰箱.jpg">
										<span class="title">冰箱清洗</span>
										<span class="description">别让冰箱变“病箱”</span>
									</div>
								</div>
								
								<div class="p_area" id="10003">
									<label>家居清洗养护</label>
									
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=窗户清洗');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487559043226/窗户.jpg#窗户.jpg">
										<span class="title">窗户清洗</span>
										<span class="description">看清窗外的美丽</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=窗帘清洗');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487559175399/窗帘.jpg#窗帘.jpg">
										<span class="title">窗帘清洗</span>
										<span class="description">让我们来爬高上梯</span>
									</div>
									
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=灯具清洗');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487560027799/灯.jpg#灯.jpg">
										<span class="title">灯具清洗</span>
										<span class="description">好看不好清洁，我们来解决</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=家居除螨');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487560040534/除螨.jpg#除螨.jpg">
										<span class="title">家居除螨</span>
										<span class="description">螨虫不咬人，它只制造过敏和瘙痒</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=布艺除螨清洗');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487559059624/布艺沙发.jpg#布艺沙发.jpg">
										<span class="title">布艺除螨清洗</span>
										<span class="description">再也不用怕弄脏了</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=地毯除螨清洗');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487559151940/地毯.jpg#地毯.jpg">
										<span class="title">地毯除螨清洗</span>
										<span class="description">洗干净才能放心玩耍</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=皮沙发清洁保养');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487559591184/沙发.jpg#沙发.jpg">
										<span class="title">皮沙发清洁保养</span>
										<span class="description">您买产品，我们服务，焕然一新，省钱省力</span>
									</div>
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=地板清洁养护');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487561006132/木质地板.jpg#木质地板.jpg">
										<span class="title">地板清洁养护</span>
										<span class="description">您买产品，我们服务，焕然一新，省钱省力</span>
									</div>
									
									<div class="product_item" onclick="gotourl('http://meiaijie.wx.toohuu.com:80/wx/xm_detail.jsp?smallXM=管道疏通');">
										<img src="http://meiaijie.wx.toohuu.com:80/data/uploadfile/1487560054619/管道.jpg#管道.jpg">
										<span class="title">管道疏通</span>
										<span class="description">明码标价，拒绝被宰</span>
									</div>
								</div>
								<div id="bottom_area" style="height: 152px;"></div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>	
	</div>
	<script>
		window.onload=function(){
			var H = document.body.clientHeight
			$('#bottom_area').height(H-51-$('.p_area').last().height());
			$('#allproducts').height(H-51);
			
			$('#nav_10000').trigger('click');	
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
</body>
</html>