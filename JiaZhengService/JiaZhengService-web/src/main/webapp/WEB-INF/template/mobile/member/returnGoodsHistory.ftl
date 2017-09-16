<!DOCTYPE html> 
<html>
<head>
<title>退货/退款记录</title>
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
	m$.header.titleContent.setTitle("退货/退款记录");
});
</script>
</head>
<body class="body_margin">
	<div class="fullscreen">
		[#include "/mobile/include/header.ftl" /]
			<div class="moMobileContent">
				<ul class="returnsGoodsHistory">
				[#list returnsList as returns]
					    <li onclick="window.location='${base}/mobile/member/order/viewReturnGoods.jhtml?id=${returns.id}'">
					       <table>
	                        <tr>
	                            <th>
	                                编号
	                            </th>
	                            <td>
	                               ${returns.sn}
	                            </td>
	                            <td rowspan="9" class="rightArrow">
                                   <img src="${base}/resources/mobile/images/icon_rightarrow.png" width="8px"/>
                                </td>
	                        </tr>
	                         <tr>
	                            <td>
	                                订单号
	                            </td>
	                            <td>
	                               ${returns.order.sn}
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                退货申请结算额
	                            </td>
	                            <td>
	                               ${currency(returns.returnsAppliedAmount, true)}
	                            </td>
	                        </tr>
	                        <tr>
	                             <td>
	                                配送方式
	                            </td>
	                            <td>
	                               ${(returns.shippingMethod)!"-"}
	                            </td>
	                        </tr>
	                        <tr>
	                             <td>
	                               物流公司
	                            </td>
	                            <td>
	                               ${(returns.deliveryCorp)!"-"}
	                            </td>
	                        </tr>
	                         <tr>
	                             <td>
	                               退货快递单号
	                            </td>
	                            <td>
	                               ${(returns.trackingNo)!"-"}
	                            </td>
	                        </tr>
	                        <tr>
	                             <td>
	                               发货人
	                            </td>
	                            <td>
	                               ${(returns.shipper)!"-"}
	                            </td>
	                        </tr>
	                        <tr>
	                             <td>
	                               创建日期
	                            </td>
	                            <td>
	                               ${returns.createDate?string("yyyy-MM-dd")}
	                            </td>
	                        </tr>
	                         <tr>
	                             <td>
	                               是否需要退货
	                            </td>
	                            <td>
	                                [#if returns.hasGoodReturn]
										${message("Returns.hasGoodReturn."+returns.hasGoodReturn)}
									[#else] 
									    -
									[/#if]
	                            </td>
	                        </tr>
	                         <tr>
	                             <td>
	                               审核状态
	                            </td>
	                            <td>
	                                [#if returns.agreeReturn == -1]
										${message("admin.returns.unaudited")}
									[#elseif returns.agreeReturn == 0] 
									    ${message("admin.returns.agree")}
									[#elseif returns.agreeReturn == 1] 
									    ${message("admin.returns.reject")}
								    [#elseif returns.agreeReturn == 2]
									   ${message("admin.returns.agreedRefund")}
									[/#if]
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