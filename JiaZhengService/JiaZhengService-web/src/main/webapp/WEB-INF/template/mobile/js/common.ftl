var jiazhengservice = {
	base: "${base}",
	locale: "${locale}"
};

var setting = {
	priceScale: "${setting.priceScale}",
	priceRoundType: "${setting.priceRoundType}",
	currencySign: "${setting.currencySign}",
	currencyUnit: "${setting.currencyUnit}",
	stockAlertCount:"${setting.stockAlertCount}",
	uploadImageExtension: "${setting.uploadImageExtension}",
	uploadFlashExtension: "${setting.uploadFlashExtension}",
	uploadMediaExtension: "${setting.uploadMediaExtension}",
	uploadFileExtension: "${setting.uploadFileExtension}",
	passwordMinLength:"${setting.passwordMinLength}",
	passwordMaxLength:"${setting.passwordMaxLength}"
};

var messages = {
	"shop.message.success": "${message("shop.message.success")}",
	"Order.OrderStatus.unconfirmed":"${message("Order.OrderStatus.unconfirmed")}",
	"Order.OrderStatus.confirmed":"${message("Order.OrderStatus.confirmed")}",
	"Order.OrderStatus.completed":"${message("Order.OrderStatus.completed")}",
	"Order.OrderStatus.cancelled":"${message("Order.OrderStatus.cancelled")}",
	"Order.OrderStatus.receipt":"${message("Order.OrderStatus.receipt")}",
	"Order.PaymentStatus.unpaid":"${message("Order.PaymentStatus.unpaid")}",
	"Order.PaymentStatus.partialPayment":"${message("Order.PaymentStatus.partialPayment")}",
	"Order.PaymentStatus.paid":"${message("Order.PaymentStatus.paid")}",
	"Order.PaymentStatus.partialRefunds":"${message("Order.PaymentStatus.partialRefunds")}",
	"Order.PaymentStatus.refunded":"${message("Order.PaymentStatus.refunded")}",
	"Order.PaymentStatus.applyRefunded":"${message("Order.PaymentStatus.applyRefunded")}",
	"Order.ShippingStatus.unshipped":"${message("Order.ShippingStatus.unshipped")}",
	"Order.ShippingStatus.partialShipment":"${message("Order.ShippingStatus.partialShipment")}",
	"Order.ShippingStatus.shipped":"${message("Order.ShippingStatus.shipped")}",
	"Order.ShippingStatus.partialReturns":"${message("Order.ShippingStatus.partialReturns")}",
	"Order.ShippingStatus.returned":"${message("Order.ShippingStatus.returned")}"
};

// 添加Cookie
function addCookie(name, value, options) {
	if (arguments.length > 1 && name != null) {
		if (options == null) {
			options = {};
		}
		if (value == null) {
			options.expires = -1;
		}
		if (typeof options.expires == "number") {
			var time = options.expires;
			var expires = options.expires = new Date();
			expires.setTime(expires.getTime() + time * 1000);
		}
		document.cookie = encodeURIComponent(String(name)) + "=" + encodeURIComponent(String(value)) + (options.expires ? "; expires=" + options.expires.toUTCString() : "") + (options.path ? "; path=" + options.path : "") + (options.domain ? "; domain=" + options.domain : ""), (options.secure ? "; secure" : "");
	}
}

// 获取Cookie
function getCookie(name) {
	if (name != null) {
		var value = new RegExp("(?:^|; )" + encodeURIComponent(String(name)) + "=([^;]*)").exec(document.cookie);
		return value ? decodeURIComponent(value[1]) : null;
	}
}

// 移除Cookie
function removeCookie(name, options) {
	addCookie(name, null, options);
}

//删除Cookie
function  delCookie(name){
    var  exp  =  new  Date();
    exp.setTime  (exp.getTime()  -  1);
    var  cval  =  getCookie(name);
    document.cookie  =  name  +  "="  +  cval  +  ";  expires="+  exp.toGMTString();
}

// 货币格式化
function currency(value, showSign, showUnit) {
	if (value != null) {
		var price;
		if (setting.priceRoundType == "roundHalfUp") {
			price = (Math.round(value * Math.pow(10, setting.priceScale)) / Math.pow(10, setting.priceScale)).toFixed(setting.priceScale);
		} else if (setting.priceRoundType == "roundUp") {
			price = (Math.ceil(value * Math.pow(10, setting.priceScale)) / Math.pow(10, setting.priceScale)).toFixed(setting.priceScale);
		} else {
			price = (Math.floor(value * Math.pow(10, setting.priceScale)) / Math.pow(10, setting.priceScale)).toFixed(setting.priceScale);
		}
		if (showSign) {
			price = setting.currencySign + price;
		}
		if (showUnit) {
			price += setting.currencyUnit;
		}
		return price;
	}
}

// 多语言
function message(code) {
	if (code != null) {
		var content = messages[code] != null ? messages[code] : code;
		if (arguments.length == 1) {
			return content;
		} else {
			if ($.isArray(arguments[1])) {
				$.each(arguments[1], function(i, n) {
					content = content.replace(new RegExp("\\{" + i + "\\}", "g"), n);
				});
				return content;
			} else {
				$.each(Array.prototype.slice.apply(arguments).slice(1), function(i, n) {
					content = content.replace(new RegExp("\\{" + i + "\\}", "g"), n);
				});
				return content;
			}
		}
	}
}

(function($) {

	var zIndex = 100;

    // 消息框
	var $message;
	var messageTimer;
	$.message = function() {
		var message = {};
		if ($.isPlainObject(arguments[0])) {
			message = arguments[0];
		} else if (typeof arguments[0] === "string" && typeof arguments[1] === "string") {
			message.type = arguments[0];
			message.content = arguments[1];
		} else {
			return false;
		}
		
		if (message.type == null || message.content == null) {
			return false;
		}
		
		if ($message == null) {
			$message = $('<div class="xxMessage"><div class="messageContent message' + message.type + 'Icon"><\/div><\/div>');
			if (!window.XMLHttpRequest) {
				$message.append('<iframe class="messageIframe"><\/iframe>');
			}
			$message.appendTo("body");
		}
		
		$message.children("div").removeClass("messagewarnIcon messageerrorIcon messagesuccessIcon").addClass("message" + message.type + "Icon").html(message.content);
		$message.css({"margin-left": - parseInt($message.outerWidth() / 2), "z-index": zIndex ++}).show();
		
		clearTimeout(messageTimer);
		messageTimer = setTimeout(function() {
			$message.hide();
		}, 3000);
		return $message;
	}

	// 检测登录
	$.checkLogin = function() {
		var result = false;
		$.ajax({
			url: jiazhengservice.base + "/mobile/common/check.jhtml",
			type: "GET",
			dataType: "json",
			cache: false,
			async: false,
			success: function(data) {
				result = data;
			}
		});
		return result;
	}
	
	// 查询当前商品会员已经成功购买的数量
	$.alreadyPurchasedQty = function(productId) {
		var result = 0;
		$.ajax({
			url: jiazhengservice.base + "/cart/alreadyPurchasedQty.jhtml",
			type: "GET",
			data: {productId: productId},
			dataType: "json",
			cache: false,
			async: false,
			success: function(data) {
				result = data.purchasedQty;
			}
		});
		return result;
	}

	// 跳转登录
	$.redirectLogin = function (redirectUrl, message) {
		var href = jiazhengservice.base + "/mobile/login/index.jhtml";
		if (redirectUrl != null) {
			href += "?redirectUrl=" + encodeURIComponent(redirectUrl);
		}
		if (message != null) {
			setTimeout(function() {
				location.href = href;
			}, 1000);
		} else {
			location.href = href;
		}
	}

	// 令牌	
	$(document).ajaxSend(function(event, request, settings) {
		if (!settings.crossDomain && settings.type != null && settings.type.toLowerCase() == "post") {
			var token = getCookie("token");
			if (token != null) {
				request.setRequestHeader("token", token);
			}
		}
	});
	
	$(document).ajaxComplete(function(event, request, settings) {
		var loginStatus = request.getResponseHeader("loginStatus");
		var tokenStatus = request.getResponseHeader("tokenStatus");
		
		if (loginStatus == "accessDenied") {
			$.redirectLogin(location.href, "${message("shop.login.accessDenied")}");
		} else if (tokenStatus == "accessDenied") {
			var token = getCookie("token");
			if (token != null) {
				$.extend(settings, {
					global: false,
					headers: {token: token}
				});
				$.ajax(settings);
			}
		}
	});
	
	

})(jQuery);

//表单令牌
$().ready(function() {
	$("form").submit(function() {
		var $this = $(this);
		if ($this.attr("method") != null && $this.attr("method").toLowerCase() == "post" && $this.find("input[name='token']").size() == 0) {
			var token = getCookie("token");
			if (token != null) {
				$this.append('<input type="hidden" name="token" value="' + token + '" \/>');
			}
		}
	});
	
	//getCartNumber();

});


//删除数组的元素
//emp.remove('test')
Array.prototype.remove = function(val) {
	var index = this.indexOf(val);
	if (index > -1) {
		this.splice(index, 1);
	}
};

//日期时间转换成字符串
function timeStamp2String(time){
	    var datetime = new Date();
	    datetime.setTime(time);
	    var year = datetime.getFullYear();
	    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
	    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
	    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
	    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
	    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
	    return year + "-" + month + "-" + date;
}

	
/**
 * 获取购物车数量
 */
function getCartNumber(){
	var $navCartQuantity = $("#navCartQuantity");
	$.ajax({
		url: jiazhengservice.base+"/cart/quantity.jhtml",
		type: "GET",
		dataType: "json",
		cache: false,
		success:function(data){
			 if(data > 0){
				 $navCartQuantity.text(data);
			 }
		}
	});
}


/**
 * 检查限购数量
 */
function checkPurchaseCount(productId,purchaseCount,quantity){
    var $pop_title = $("#pop-title");
    var $pupPanel = $("#pupPanel");
    var $logonPanel = $("#logonPanel");
    var $purchasedQty = parseInt($.alreadyPurchasedQty(productId)) + parseInt(quantity);
    if(!$.checkLogin()){
        m$.ui.dialog.dialogShow({
			'title': '提示',
			'content': '此商品为限购商品，需要登录后才能继续购买！'
		},
		[{
			'text': '确定',
			'func': function() {
               $.redirectLogin(location.href);
             }
		}]);
		return false;
    }else if(parseInt($purchasedQty) > parseInt(purchaseCount)){
        $.message('warn',"此商品每人限购" + purchaseCount +",您购买的数量超过了！");
         m$.ui.dialog.dialogShow({
			'title': '提示',
			'content': '此商品每人限购' + purchaseCount +',您购买的数量超过了！'
		},
		[{
			'text': '确定'
		}]);
        return false;
    }
    return true;
}
