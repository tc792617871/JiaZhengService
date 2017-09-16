<!DOCTYPE html>
<html lang="en"> 
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
[@seo type = "index"]
		<title>${setting.siteName}</title>
		[#if seo.keywords??]
			<meta name="keywords" content="[@seo.keywords?interpret /]" />
		[/#if]
		[#if seo.description??]
			<meta name="description" content="[@seo.description?interpret /]" />
		[/#if]
[/@seo]
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
</head>
<body>
	<div class="fullscreen">	
		<dl>	
			[#if message??]
				<dd>${content}</dd>
			[/#if]
			[#if constraintViolations?has_content]
				[#list constraintViolations as constraintViolation]
					<dd>[${constraintViolation.propertyPath}] ${constraintViolation.message}</dd>
				[/#list]
			[/#if]
			<dd>
				<a href="javascript:;" onclick="window.history.back(); return false;">&gt; ${message("shop.error.back")}</a>
			</dd>
			<dd>
				<a href="${base}/">&gt; ${message("shop.error.home")}</a>
			</dd>
	    </dl>
	</div>
</body>
</html>
