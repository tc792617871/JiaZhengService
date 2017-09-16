<!DOCTYPE html> 
<html>
<head>
<title>包裹列表</title>
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
	m$.header.titleContent.setTitle("包裹列表");
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header.ftl" /]
			<div class="moMobileContent">
				<ul class="returnsGoodsHistory">
				[#list shippings as shipping]
				       <input type="hidden" name="returnss[${shipping_index}].shopStore.id" value="${(shipping.shopStore.id)!0}"/>
                       <input type="hidden" name="shippings[${shipping_index}].id]" value="${shipping.id}"/>
					    <li onclick="window.location='${base}/mobile/member/order/returnsGoods.jhtml?shippingId=${shipping.id}'">
					       <table>
	                        <tr>
	                            <th>
	                                包裹${shipping_index + 1}
	                            </th>
	                            <th>
	                              
	                            </th>
	                            <td rowspan="6" class="rightArrow">
                                   <img src="${base}/resources/mobile/images/icon_rightarrow.png" width="8px"/>
                                </td>
	                        </tr>
	                         <tr>
	                            <td>
	                                订单号
	                            </td>
	                            <td>
	                               ${shipping.order.sn}
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                物流公司
	                            </td>
	                            <td>
	                              ${shipping.deliveryCorp}
	                            </td>
	                        </tr>
	                        <tr>
	                             <td>
	                               运单号
	                            </td>
	                            <td>
	                               ${shipping.trackingNo}
	                            </td>
	                        </tr>
	                        <tr>
	                             <td>
	                               包裹发货地址
	                            </td>
	                            <td>
	                               ${shipping.shopStore.address}
	                            </td>
	                        </tr>
	                         <tr>
	                            <td>
	                               发货时间
	                            </td>
	                            <td>
	                               ${(shipping.createDate?string("yyyy-MM-dd HH:mm:ss"))!"-"}
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