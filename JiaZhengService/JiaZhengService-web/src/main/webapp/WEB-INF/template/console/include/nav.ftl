[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!--  导航 -->
<style type="text/css">
	.fa-li-width:{
		width:20px;
	}
</style>
<script type="text/javascript">
	function changeNavHeight(){
		var height = $("#page-wrapper").height();
		var navHeight = $("#leftSideNavbar").height();
		//alert(height);
		if(height!=null&&navHeight!=null){
			if(height>navHeight){
				$("#leftSideNavbar").height(height);
			}
		}
	}
	$().ready(function() {
		changeNavHeight();
	});	
	$(window).resize(function(){
	  	changeNavHeight();
 	});
 	window.onload = function (){ 
 		changeNavHeight();
 	}
</script>
<nav id="leftSideNavbar" class="navbar-default navbar-static-side navbar-background" role="navigation" style="overflow-y: visible;">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header" style="width:200px;">
                <div class="dropdown profile-element" style="margin-left: 20px;"> 
                	<span>
                    	<img alt="image" class="img-circle" src="
                    	[#if Session["iconPhoto"]??]
                    	${Session['iconPhoto']}
                    	[#else]
                    	${base}/resources/console/images/userAvatar.jpg
                    	[/#if]
                    	" width="70px" height="70px"/>
                 	</span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <span class="clear"> 
                            <span class="block m-t-xs"> 
                                <strong class="font-bold"></strong>
                            </span>  
                            <span class="text-muted text-xs block">
                            	${Session["schoolName"]} <br>  
								${Session["realName"]}  
                                <b class="caret"></b>
                            </span>
                        </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li>
                            <a href="${base}/console/profile/edit.ct" >${message("console.main.personalData")}</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="${base}/console/logout.jsp">[${message("console.main.logout")}]</a>
                        </li>
                    </ul>
                </div>
                <div class="logo-element">
                    ${message("console.common.title")}
                </div>
            </li>
         	 <!--start 营销管理 -->
            <li name="menu">
               [#list ["console:coupon","console:couponCode","console:giftItem","console:promotion"] as permission]
                   [@shiro.hasPermission name = permission]
                    <a href="index.html">
                       <i class="fa fa-bar-chart-o fa-li-width"></i> 
                       <span class="nav-label">${message("营销管理")}</span> 
                       <span class="fa arrow"></span>
                    </a>
                    [#break /]
					[/@shiro.hasPermission]
                [/#list]
                
                <ul class="nav nav-second-level">
                    <!-- start 优惠券管理 -->
					[@shiro.hasPermission name="console:coupon"]
						<li id="menu.Coupon">
							<a href="${base}/console/coupon/list.ct" >${message("优惠券")}</a>
						</li>
					[/@shiro.hasPermission]
					<!-- end 优惠券管理 -->
					
					<!-- start 优惠券码 -->
					[@shiro.hasPermission name="console:couponCode"]
						<li id="menu.CouponCode">
							<a href="${base}/console/coupon_code/list.ct" >${message("优惠券码")}</a>
						</li>
					[/@shiro.hasPermission]
					<!-- end 优惠券码 -->
                
                    <!-- start 赠品项 -->
					[@shiro.hasPermission name="console:giftItem"]
						<li id="menu.GiftItem">
							<a href="${base}/console/giftItem/list.ct" >${message("赠品项")}</a>
						</li>
					[/@shiro.hasPermission]
					<!-- end 赠品项 -->
					
					<!-- start 促销管理 -->
					[@shiro.hasPermission name="console:promotion"]
					    <li id="menu.Promotion">
							<a href="${base}/console/promotion/list.ct" >${message("促销管理")}</a>
						</li>
					[/@shiro.hasPermission]
					<!-- end 促销管理 -->
					
					<!-- start 营销模板管理 -->
					[@shiro.hasPermission name="console:promotionTemplate"]
					    <li id="menu.PromotionTemplate">
							<a href="${base}/console/promotionTemplate/list.ct" >${message("营销模板管理")}</a>
						</li>
					[/@shiro.hasPermission]
					<!-- end 营销模板管理 -->
					<!-- start 会员等级 -->
					[@shiro.hasPermission name="console:memberRank"]
					    <li id="menu.MemberRank">
							<a href="${base}/console/memberRank/list.ct" >${message("会员等级")}</a>
						</li>
					[/@shiro.hasPermission]
					<!-- end 会员等级 -->
					<!-- start 积分来源 -->
					[@shiro.hasPermission name="console:pointBill"]
					    <li id="menu.PointBill">
							<a href="${base}/console/pointBill/list.ct" >${message("积分来源")}</a>
						</li>
					[/@shiro.hasPermission]
					<!-- end 积分来源 -->
                </ul>
            </li>
            <!-- end 营销管理 -->
            <!-- start 系统设置 -->
            <li name="menu">
               [#list ["console:setting", "console:area", "console:paymentPlugin", "console:storagePlugin", "console:admin", "console:role", "console:log"] as permission]
                    [@shiro.hasPermission name = permission]
                        <a href="index.html">
                        	<i class="fa fa-desktop fa-li-width"></i> 
                        	<span class="nav-label">${message("console.main.systemGroup")}</span>  
                            <span class="fa arrow"></span>
                        </a>
                        [#break /]
					[/@shiro.hasPermission]
               [/#list]
                <ul class="nav nav-second-level" style="  opacity: 1;background-color: #95CEE8;">
                    [@shiro.hasPermission name="console:setting"]
						<li id="menu.Setting">
							<a href="${base}/console/setting/edit.ct" >${message("console.main.setting")}</a>
						</li>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="console:systemDict"]
						<li id="menu.SystemDict">
							<a href="${base}/console/systemDict/list.ct" >${message("系统字典")}</a>
						</li>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="console:area"]
						<li id="menu.Area">
							<a href="${base}/console/area/list.ct" >${message("console.main.area")}</a>
						</li>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="console:paymentPlugin"]
						<li id="menu.PaymentPlugin">
							<a href="${base}/console/payment_plugin/list.ct" >${message("console.main.paymentPlugin")}</a>
						</li>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="console:storagePlugin"]
						<li id="menu.StoragePlugin">
							<a href="${base}/console/storage_plugin/list.ct" >${message("console.main.storagePlugin")}</a>
						</li>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="console:messagePushPlugin"]
						<li id="menu.MessagePushPlugin">
							<a href="${base}/console/message_push_plugin/list.ct" >${message("console.main.messagePushPlugin")}</a>
						</li>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="console:pointPlugin"]
						<li id="menu.PointPlugin">
							<a href="${base}/console/point_plugin/list.ct" >${message("console.main.pointPlugin")}</a>
						</li>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="console:admin"]
						<li id="menu.Admin">
							<a href="${base}/console/admin/list.ct" >${message("console.main.admin")}</a>
						</li>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="console:role"]
						<li id="menu.Role">
							<a href="${base}/console/role/list.ct" >${message("console.main.role")}</a>
						</li>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="console:log"]
						<li id="menu.Log">
							<a href="${base}/console/log/list.ct" >${message("console.main.log")}</a>
						</li>
					[/@shiro.hasPermission]
                </ul>
            </li>
            <!-- end 系统设置 -->
           
            <li><div class="for-nav-bottom-rainbow"></div></li>
        </ul>
    </div>
    <!-- <div class="for-nav-bottom-rainbow"></div>
    <div class="nav-bottom-rainbow"></div> -->
</nav>