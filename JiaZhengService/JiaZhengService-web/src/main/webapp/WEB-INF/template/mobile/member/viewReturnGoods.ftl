<!DOCTYPE html> 
<html>
<head>
<title>退单详情</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
	m$.header.titleContent.setTitle("退单详情");
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header.ftl" /]
			<div class="moMobileContent">
				<ul class="returnsGoodsHistory">
				[#list returns.returnsItems as returnsItem]
					    <li>
					       <table>
	                        <tr>
	                            <th>
	                               商品编号
	                            </th>
	                            <td>
	                               ${returnsItem.sn}
	                            </td>
	                        </tr>
	                         <tr>
	                            <td>
	                               商品名称
	                            </td>
	                            <td>
	                               ${abbreviate(returnsItem.name, 50, "...")}
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                               数量
	                            </td>
	                            <td>
	                               ${returnsItem.quantity}
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                               退货申请结算额
	                            </td>
	                            <td>
	                               ${currency(returnsItem.returnsAppliedAmount, true)!"-"}
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                               退货结算额
	                            </td>
	                            <td>
	                               ${currency(returnsItem.returnsAmount, true)!"-"}
	                            </td>
	                        </tr>
	                    </table>
					    </li>
				    [/#list]
				    <li>
				    </li>
				</ul>
            </div>
	   [#include "/mobile/include/footer.ftl" /]
	</div>
</body>
</html>