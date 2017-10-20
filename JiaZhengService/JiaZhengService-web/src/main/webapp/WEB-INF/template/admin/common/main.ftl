[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.main.title")} - 家政服务管理平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/admin/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<style type="text/css">
*{
	font: 12px tahoma, Arial, Verdana, sans-serif;
}
html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $nav = $("#nav a");
	var $menu = $("#menu dl");
	var $menuItem = $("#menu a");
	
	$nav.click(function() {
		var $this = $(this);
		$nav.removeClass("current");
		$this.addClass("current");
		var $currentMenu = $($this.attr("href"));
		$menu.hide();
		$currentMenu.show();
		return false;
	});
	
	$menuItem.click(function() {
		var $this = $(this);
		$menuItem.removeClass("current");
		$this.addClass("current");
	});

});
</script>
</head>
<body>
	<script type="text/javascript">
		if (self != top) {
			top.location = self.location;
		};
	</script>
	<table class="main">
		<tr>
			<th class="logo">
				<a href="main.jhtml">
					<img src="${base}/resources/admin/images/login_logo.png" alt="${setting.siteName}" width="160px" />
				</a>
			</th>
			<th>
				<div id="nav" class="nav">
					<ul>
						[#list ["admin:product", "admin:productCategory"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#product">${message("admin.main.productNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:order", "admin:payment"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#order">${message("admin.main.orderNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:member"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#member">${message("admin.main.memberNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:tag", "admin:template", "admin:cache", "admin:static"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#content">${message("admin.main.contentNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:coupon"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#marketing">${message("admin.main.marketingNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
						[#list ["admin:setting", "admin:area", "admin:paymentMethod", "admin:paymentPlugin", "admin:storagePlugin", "admin:admin", "admin:role", "admin:message", "admin:mailMessage", "admin:log", "admin:customerService", "admin:alipayService", "admin:mailSendService"] as permission]
							[@shiro.hasPermission name = permission]
								<li>
									<a href="#system">${message("admin.main.systemNav")}</a>
								</li>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
					</ul>
				</div>
				<div class="link">
					<strong>[@shiro.principal /]</strong>
					${message("admin.main.hello")}!
					<a href="../profile/edit.jhtml" target="iframe">[${message("admin.main.profile")}]</a>
					<a href="../logout.jsp" target="_top">[${message("admin.main.logout")}]</a>
				</div>
			</th>
		</tr>
		<tr>
			<td id="menu" class="menu">
				<dl id="product" class="default">
					[#list ["admin:product", "admin:productCategory"] as permission]
							[@shiro.hasPermission name = permission]
								<dt>${message("admin.main.productGroup")}</dt>
								[#break /]
							[/@shiro.hasPermission]
					[/#list]
					[@shiro.hasPermission name="admin:product"]
						<dd>
							<a href="../product/list.jhtml" target="iframe">${message("admin.main.product")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:productCategory"]
						<dd>
							<a href="../product_category/list.jhtml" target="iframe">${message("admin.main.productCategory")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<dl id="order">
						[#list ["admin:order"] as permission]
							[@shiro.hasPermission name = permission]
								<dt>${message("admin.main.orderGroup")}</dt>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
					[@shiro.hasPermission name="admin:order"]
						<dd>
							<a href="../order/list.jhtml" target="iframe">${message("admin.main.order")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<dl id="member">
						[#list ["admin:member"] as permission]
							[@shiro.hasPermission name = permission]
								<dt>${message("admin.main.memberGroup")}</dt>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
					[@shiro.hasPermission name="admin:member"]
						<dd>
							<a href="../member/list.jhtml" target="iframe">${message("admin.main.member")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<dl id="content">
					[#list ["admin:tag", "admin:template", "admin:cache", "admin:static"] as permission]
						[@shiro.hasPermission name = permission]
							<dt>${message("admin.main.contentGroup")}</dt>
							[#break /]
						[/@shiro.hasPermission]
					[/#list]
					[@shiro.hasPermission name="admin:tag"]
						<dd>
							<a href="../tag/list.jhtml" target="iframe">${message("admin.main.tag")}</a>
						</dd>
					[/@shiro.hasPermission]
					<!--[@shiro.hasPermission name="admin:template"]
						<dd>
							<a href="../template/list.jhtml" target="iframe">${message("admin.main.template")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:cache"]
						<dd>
							<a href="../cache/clear.jhtml" target="iframe">${message("admin.main.cache")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:static"]
						<dd>
							<a href="../static/build.jhtml" target="iframe">${message("admin.main.static")}</a>
						</dd>
					[/@shiro.hasPermission]-->
				</dl>
				<dl id="marketing">
					[#list ["admin:coupon"] as permission]
							[@shiro.hasPermission name = permission]
								<dt>${message("admin.main.marketingGroup")}</dt>
								[#break /]
							[/@shiro.hasPermission]
						[/#list]
					[@shiro.hasPermission name="admin:coupon"]
						<dd>
							<a href="../coupon/list.jhtml" target="iframe">${message("admin.main.coupon")}</a>
						</dd>
					[/@shiro.hasPermission]
				</dl>
				<dl id="system">
					[#list ["admin:setting", "admin:area", "admin:paymentMethod", "admin:shippingMethod", "admin:deliveryCorp", "admin:paymentPlugin", "admin:storagePlugin", "admin:admin", "admin:role", "admin:message", "admin:mailMessage", "admin:log", "admin:customerService", "admin:alipayService", "admin:mailSendService"] as permission]
						[@shiro.hasPermission name = permission]
							<dt>${message("admin.main.systemGroup")}</dt>
							[#break /]
						[/@shiro.hasPermission]
					[/#list]
					[@shiro.hasPermission name="admin:setting"]
						<dd>
							<a href="../setting/edit.jhtml" target="iframe">${message("admin.main.setting")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:area"]
						<dd>
							<a href="../area/list.jhtml" target="iframe">${message("admin.main.area")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:paymentMethod"]
						<dd>
							<a href="../payment_method/list.jhtml" target="iframe">${message("admin.main.paymentMethod")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:paymentPlugin"]
						<dd>
							<a href="../payment_plugin/list.jhtml" target="iframe">${message("admin.main.paymentPlugin")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:storagePlugin"]
						<dd>
							<a href="../storage_plugin/list.jhtml" target="iframe">${message("admin.main.storagePlugin")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:admin"]
						<dd>
							<a href="../admin/list.jhtml" target="iframe">${message("admin.main.admin")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:role"]
						<dd>
							<a href="../role/list.jhtml" target="iframe">${message("admin.main.role")}</a>
						</dd>
					[/@shiro.hasPermission]
					<!--[@shiro.hasPermission name="admin:message"]
						<dd>
							<a href="../message/list.jhtml" target="iframe">${message("admin.main.message")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:message"]
						<dd>
							<a href="../message/draft.jhtml" target="iframe">${message("admin.main.draft")}</a>
						</dd>
					[/@shiro.hasPermission]
					[@shiro.hasPermission name="admin:log"]
						<dd>
							<a href="../log/list.jhtml" target="iframe">${message("admin.main.log")}</a>
						</dd>
					[/@shiro.hasPermission]-->
				</dl>
			</td>
			<td>
				<iframe id="iframe" name="iframe" src="index.jhtml" frameborder="0"></iframe>
			</td>
		</tr>
	</table>
</body>
</html>