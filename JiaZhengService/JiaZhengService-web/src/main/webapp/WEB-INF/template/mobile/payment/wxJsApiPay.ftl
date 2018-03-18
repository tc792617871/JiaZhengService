<!DOCTYPE html> 
<html>
<head>
<title>微信支付</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<script type="text/javascript">
function onBridgeReady(){
   WeixinJSBridge.invoke(
       'getBrandWCPayRequest', {
           "appId":"${appid}",
           "timeStamp":"${timestamp}",
           "nonceStr":"${nonceStr}",
           "package":"${packageValue}",
           "signType":"${signType}",
           "paySign":"${paySign}"
       },
       function(res){
           if(res.err_msg == "get_brand_wcpay_request:ok"){
              window.location.href = "${base}/mobile/payment/wxJsApiNotify/sync/${paymentSn}.jhtml";
           }
           if(res.err_msg == "get_brand_wcpay_request:cancel"){
               window.location.href = "${base}/mobile/member/order/payment.jhtml?sn=${orderSn}";
           }
           if(res.err_msg == "get_brand_wcpay_request:fail"){
               alert("支付失败了，请重新尝试支付。");
               window.location.href = "${base}/mobile/member/order/payment.jhtml?sn=${orderSn}";
           }
       }
   );
}

if(typeof WeixinJSBridge == "undefined"){
   if(document.addEventListener){
       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
   }else if(document.attachEvent){
       document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
   }
}else{
   onBridgeReady();
}
</script>
</head>
</html>