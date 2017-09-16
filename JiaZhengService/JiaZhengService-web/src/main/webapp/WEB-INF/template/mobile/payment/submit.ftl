<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=[#if requestCharset?has_content]${requestCharset}[#else]utf-8[/#if]" />
<title>${message("shop.payment.submit")} - MO&Co.</title>
<meta name="author" content="广州爱帛服饰有限公司 Team" />
<meta name="copyright" content="广州爱帛服饰有限公司" />
<script type="text/javascript" src="${base}/resources/mobile/js/ap.js?time=${.now?date}${.now?time}"></script>
<script type="text/javascript">
function payOrder(){
    var queryParam = '';
    Array.prototype.slice.call(document.querySelectorAll("input[type=hidden]")).forEach(function (ele) {
        if(ele.name === 'req_data') {
            queryParam += ele.name + "=" + ele.value + '&';
        } else {
            queryParam += ele.name + "=" + encodeURIComponent(ele.value) + '&';
        }
    });
    var gotoUrl = document.querySelector("#payForm").getAttribute('action') + '' + queryParam;
    _AP.pay(gotoUrl);
    return false;
}
</script>
</head>
<!-- onload="javascript: document.forms[0].submit();" -->
[#if requestUrl == 'wxJsApiPay.jhtml?showwxpaytitle=1'] 
<body onload="javascript: document.forms[0].submit();">
[#else]
<body onload="javascript: payOrder();">
[/#if]
	<form id="payForm" action="${requestUrl}"[#if requestMethod??] method="${requestMethod}"[/#if][#if requestCharset?has_content] accept-charset="${requestCharset}"[/#if]>
		[#list parameterMap.entrySet() as entry]
			<input type="hidden" name="${entry.key}" value="${entry.value}" />
		[/#list]
		<input id="payButton" type="submit" style="display:none;" /> 
	</form>
</body>
</html>