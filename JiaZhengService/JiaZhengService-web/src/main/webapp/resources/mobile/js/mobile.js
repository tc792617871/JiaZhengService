var cookie = function(name, value, options) {
    if (typeof value != 'undefined') {
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString();
        }
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure': '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else {
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
},
t$ = function(b) {
    var a = typeof b == "string" ? document.getElementById(b) : b;
    if (a != null) {
        return a;
    } else {}
    return null;
},
c$ = function(a) {
    return document.createElement(a);
},
detectMobile = function() {
    var agent = navigator.userAgent || navigator.vendor || window.opera;
    if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(agent) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(agent.substr(0, 4))) return true
    else return false;
},
trim = function(h) {
    try {
        return h.replace(/^\s+|\s+$/g, "");
    } catch(j) {
        return h;
    }
},
subStitute = function(str, obj) {
    if (! (Object.prototype.toString.call(str) === '[object String]')) {
        return '';
    }
    if (! (Object.prototype.toString.call(obj) === '[object Object]' && 'isPrototypeOf' in obj)) {
        return str;
    }
    return str.replace(/\{([^{}]+)\}/g,
    function(match, key) {
        var value = obj[key];
        return (value !== undefined) ? '' + value: '';
    });
};
var domainName = window.location.hostname.substring(window.location.hostname.indexOf('.')),
href = window.location.href,
place = '',
place = (typeof(__at) != 'undefined') ? __at: '',
direction = function(dom) {
    var startX, startY, directionY, directionX;
    dom.addEventListener('touchstart',
    function(e) {
        var touch = e.touches[0];
        var x = Number(touch.pageX);
        var y = Number(touch.pageY);
        startX = x;
        startY = y;
        direction = '';
    });
    dom.addEventListener('touchmove',
    function(e) {
        var touch = e.touches[0];
        var x = Number(touch.pageX);
        var y = Number(touch.pageY);
        if ((y - startY) > 30) directionY = 'down';
        else if ((y - startY) < -30) directionY = 'up';
        if ((x - startX) > 30) directionX = 'right';
        else if ((x - startX) < -30) directionX = 'left';
        if (directionX && directionY) {
            if ((directionX == 'right') && (directionY == 'down')) {
                if ((x - startX) > (y - startY)) direction = 'right';
                else direction = 'down';
            } else if ((directionX == 'right') && (directionY == 'up')) {
                if ((x - startX) > (0 - y - startY)) direction = 'right';
                else direction = 'up';
            } else if ((directionX == 'left') && (directionY == 'down')) {
                if ((0 - x - startX) > (y - startY)) direction = 'left';
                else direction = 'down';
            } else if ((directionX == 'left') && (directionY == 'up')) {
                if ((0 - x - startX) > (0 - y - startY)) direction = 'left';
                else direction = 'up';
            }
        } else if (!directionY) direction = directionX;
        else if (!directionX) direction = directionY;
        else direction = '';
    })
},
m$ = {};
m$.ui = {};
m$.business = {};
m$.listShow = {}; 
(function() {
    var agent = window.navigator.userAgent;
    var url = window.location.href;
    var weixin = false;
    var isApp = false;
    if (/micromessenger/.test(window.navigator.userAgent.toLowerCase())) {
    	weixin = true;
    }
    if (agent.indexOf('TrendyApp') >= 0) {
        isApp = true;
    } else {
        isApp = (agent.indexOf('iPhone') >= 0 || agent.indexOf('iPod') >= 0 || agent.indexOf('iPad') >= 0) && agent.substr(agent.indexOf('Mobile/')).indexOf(' ') < 0;
    }
})();

function _listPop(str, action) {
    if (str.indexOf('listimageurl=') > 0) {
        var srcStart = str.indexOf('listimageurl=');
        var srcEnd = str.indexOf('&') > 0 ? str.indexOf('&', srcStart + 13) : str.length;
        var listimageurl = str.substring(str.indexOf('listimageurl=') + 13, srcEnd);
        if (action == 'get') {
            $('#listBox').before('<div class="list_pop_box"><img src= http://' + window.location.host + unescape(listimageurl) + ' width="320"></div>');
        } else {
        	return str.substring(0, srcStart) + 'listimageurl=' + encodeURIComponent(listimageurl) + str.substring(srcEnd, str.length);
        }
    } else{
    	return str;
    } 
}


// 判断是否包含
function contains(array, values) {
	var contains = true;
	for(i in values) {
		if ($.inArray(values[i], array) < 0) {
			contains = false;
			break;
		}
	}
	return contains;
}

/**
 * 获取参数列表
 */
function getListParam(pageParams,type){
	var listParam = '';
	if(!type){
	  //listParam =  'brandId='+pageParams.brandId + '&promotionId=' + pageParams.promotionId+ '&productCategoryId=' + pageParams.productCategoryId;
		listParam =  'brandId='+pageParams.brandId + '&promotionId=' + pageParams.promotionId+ '&productCategoryId=' + pageParams.productCategoryId+ '&tagIds=' + pageParams.tagIds;
		listParam += '&orderType=' + pageParams.orderType + '&pageNumber=' + pageParams.pageNumber + '&pageSize=' + pageParams.pageSize;
	}else if(type == 'search'){
		listParam =  'searchValue='+pageParams.searchValue;
		listParam += '&orderType=' + pageParams.orderType + '&pageNumber=' + pageParams.pageNumber + '&pageSize=' + pageParams.pageSize;
	}else if(type == 'filter'){
		listParam = 'brandId='+pageParams.brandId + '&isNewArrival=' + pageParams.isNewArrival+'&isBestSeller=' + pageParams.isBestSeller + '&isPromotion='+ pageParams.isPromotion;
		listParam += '&salesValumeOrderBy='+ pageParams.salesValumeOrderBy + '&yearOrderBy=' + pageParams.yearOrderBy + '&productCatagoryIds='+pageParams.productCatagoryIds;
		listParam += '&colorIds=' +  pageParams.colorIds + '&prices=' + pageParams.prices + '&sizeIds=' + pageParams.sizeIds;
		listParam += '&orderType=' + pageParams.orderType + '&priceOrderBy='+ pageParams.priceOrderBy  +'&pageNumber='+ pageParams.pageNumber+'&pageSize='+pageParams.pageSize;
	}
	return listParam;
}

/**
 * 获取商品列表
 */
function getList(listUrl, listParam, asyType) {
    var site = listUrl + listParam;
    var asyType = asyType || false;
    $.ajax({
        url: site,
        dataType: 'json',
        cache: false,
        async: asyType,
        success: function(data) {
            /** 商品列表*/
            var productList = data.page.content;
            assembleListBox(productList);
           
        }
    })
};

/**
 * 商品列表组装
 * @param productList
 */
function assembleListBox(productList){
	 for (var i = 0; i < productList.length; i++) {
         var product = productList[i];
         /** 分类*/
         var brand = product.brand;
         var brandId = 0;
         if(brand){
         	brandId =  brand['id'];;
         }
         
         var productName = product.name;
         
         var contentUrl = moshop.base + '/mobile/product/content.jhtml?brandId='+brandId+'&productCategoryId='+ product.productCategory.id +'&productId='+product.id;
         var productImage = product.listCoverImage + '@360w_100Q_1x.jpg';
         
         if(productName.length > 11){
	    		 productName = productName.substring(0,10) + '...';
	    	}
         var isNewArrival = '';
         if(product.isNewArrival){
         	isNewArrival = '<span>NEW</span>';
         }
         
         var isSale = '';
         if(product.validPromotions.length>0){
        	 isSale += '<span>SALE</span> ';
         }
         
         var showMarktPrice = '';
         if(product.price != product.marketPrice || product.validPromotions.length>0){
         	if(product.effectivePrice != 0){
         		showMarktPrice = '- <del style="color:#9a9a9a">'+currency(product.marketPrice,true)+'</del>';
         	}
         }
         var crruentPrice = currency(product.price,true);
         if(product.validPromotions.length>0){
         	if (product.effectivePrice == 0){
         		crruentPrice = currency(product.price,true);
         	}else{
         		crruentPrice = currency(product.effectivePrice,true);
         	}
         }
         nextPageHtml = nextPageHtml + '<li><a href="' + contentUrl + '"><img datasrc="' + productImage + '" src="' + productImage + '" width="150"></a><span class="list_price"> ' + isNewArrival + productName + '</span><span class="list_price">' + isSale + crruentPrice + showMarktPrice +'</span></li>';
     }
}


/**
 * 获取订单列表
 */
function getOrderList(listUrl, listParam, asyType) {
    var site = listUrl + listParam;
    var asyType = asyType || false;
    $.ajax({
        url: site,
        dataType: 'json',
        cache: false,
        async: asyType,
        success: function(data) {
    	    /** 总页数*/
            var totalPage = data.page.totalPages;
            var orderList = data.page.content;
            for (var i = 0; i < orderList.length; i++) {
                var order = orderList[i];
                var orderSn = order.sn;
                var orderStatus = message("Order.OrderStatus." + order.orderStatus);
                var paymentStatus = message("Order.PaymentStatus." + order.paymentStatus);
                var shippingStatus = message("Order.ShippingStatus." + order.shippingStatus);
                var orderCreateDate = order.createDate;
                var orderQuantity = order.quantity;
                var orderAmount = currency(order.amount, true);
                var productImage = order.orderItems[0].product.listCoverImage + '@100w_100Q_1x.jpg';
                nextOrderPageHtml = nextOrderPageHtml + '<li onClick="window.location='+moshop.base+'/mobile/member/orderDetails.jhtml?id='+order.id+';">';
	            nextOrderPageHtml = nextOrderPageHtml + '<table>';
	            nextOrderPageHtml = nextOrderPageHtml   +'<tr>';
	            nextOrderPageHtml = nextOrderPageHtml       +'<td rowspan="7">';
	            nextOrderPageHtml = nextOrderPageHtml            +'<img src="'+ productImage +'"  datasrc="'+ productImage +'"  haslazy="true" />';
	            nextOrderPageHtml = nextOrderPageHtml        +'</td>';
	            nextOrderPageHtml = nextOrderPageHtml        +'<th>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<label for="orderSn">订单编号：</label>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<span id="orderSn">'+orderSn+'</span>';
	            nextOrderPageHtml = nextOrderPageHtml        +'</th>';
	            nextOrderPageHtml = nextOrderPageHtml        +'<td rowspan="7">';
	            nextOrderPageHtml = nextOrderPageHtml            + '<img src="'+ moshop.base +'/resources/mobile/images/icon_rightarrow.png" datasrc="'+ moshop.base +'/resources/mobile/images/icon_rightarrow.png" width="8px">';
	            nextOrderPageHtml = nextOrderPageHtml        +'</td>';
	            nextOrderPageHtml = nextOrderPageHtml   +'</tr>';
	            nextOrderPageHtml = nextOrderPageHtml   +'<tr>';
	            nextOrderPageHtml = nextOrderPageHtml        +'<td>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<label for="orderStatus">订单状态：</label>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<span id="orderStatus">'+orderStatus+'</span>';
	            nextOrderPageHtml = nextOrderPageHtml        +'</td>';
	            nextOrderPageHtml = nextOrderPageHtml   +'</tr>';
	            nextOrderPageHtml = nextOrderPageHtml   +'<tr>';
	            nextOrderPageHtml = nextOrderPageHtml        +'<td>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<label for="paymentStatus">支付状态：</label>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<span id="paymentStatus">'+ paymentStatus +'</span>';
	            nextOrderPageHtml = nextOrderPageHtml        +'</td>';
	            nextOrderPageHtml = nextOrderPageHtml   +'</tr>';
	            nextOrderPageHtml = nextOrderPageHtml   +'<tr>';
	            nextOrderPageHtml = nextOrderPageHtml        +'<td>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<label for="shippingStatus">配送状态：</label>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<span id="shippingStatus">'+ shippingStatus +'</span>';
	            nextOrderPageHtml = nextOrderPageHtml        +'</td>';
	            nextOrderPageHtml = nextOrderPageHtml   +'</tr>';
	            nextOrderPageHtml = nextOrderPageHtml   +'<tr>';
	            nextOrderPageHtml = nextOrderPageHtml        +'<td>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<label for="orderCreateDate">成交日期：</label>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<span id="orderCreateDate">'+ orderCreateDate +'</span>';
	            nextOrderPageHtml = nextOrderPageHtml        +'</td>';
	            nextOrderPageHtml = nextOrderPageHtml   +'</tr>';
	            nextOrderPageHtml = nextOrderPageHtml   +'<tr>';
	            nextOrderPageHtml = nextOrderPageHtml        +'<td>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<label for="orderQuantity">商品总数：</label>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<span id="orderQuantity">'+ orderQuantity +'</span>';
	            nextOrderPageHtml = nextOrderPageHtml        +'</td>';
	            nextOrderPageHtml = nextOrderPageHtml   +'</tr>';
	            nextOrderPageHtml = nextOrderPageHtml   +'<tr>';
	            nextOrderPageHtml = nextOrderPageHtml        +'<td>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<label for="orderAmount">实付金额：</label>';
	            nextOrderPageHtml = nextOrderPageHtml            +'<span id="orderAmount">'+ orderAmount +'</span>';
	            nextOrderPageHtml = nextOrderPageHtml        +'</td>';
	            nextOrderPageHtml = nextOrderPageHtml   +'</tr>';
                nextOrderPageHtml = nextOrderPageHtml+'</li>';
               
            }
            document.write(nextOrderPageHtml);
        }
    })
}; 

(function(window, m$, $, undefined) {
    var login = {
         loginSubmit: function(redirectUrl){
	    	var $loginForm = $("#loginForm");
	    	var $username = $("#username");
	    	var $password = $("#password");
	    	var $loginSubmit = $("#loginSubmit");
	    	var $openId = $("#openId");
	    	if(!$username.val()){
				m$.ui.dialog.dialogShow({
				    'title': '提示',
				    'content':'电子邮件不能为空'
				},
				[{
				    'text': '确定'
				}]); 
	    		return false;
	    	}
	    	if(!$password.val()){
	    		m$.ui.dialog.dialogShow({
				    'title': '提示',
				    'content':'密码不能为空'
				},
				[{
				    'text': '确定'
				}]); 
	    		return false;
	    	}
	    	$.ajax({
				url:  moshop.base + "/common/public_key.jhtml",
				type: "GET",
				dataType: "json",
				cache: false,
				beforeSend: function() {
	    		    $loginSubmit.prop("disabled", true);
				},
				success: function(data) {
					var rsaKey = new RSAKey();
					rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
					var enPassword = hex2b64(rsaKey.encrypt($password.val()));
					$.ajax({
						url: $loginForm.attr("action"),
						type: "POST",
						data: {
							username: $username.val(),
							enPassword: enPassword,
							openId: $openId.val()
						},
						dataType: "json",
						cache: false,
						success: function(message) {
							$loginSubmit.prop("disabled", false);
							if (message.type == "success") {
							    if(redirectUrl){
							    	location.href = redirectUrl;
							    }else{
							    	location.href = moshop.base +"/mobile/member/index.jhtml";
							    }
							} else {
								m$.ui.dialog.dialogShow({
								    'title': '提示',
								    'content':message['content']
								},
								[{
								    'text': '忘记密码？',
				                    'func': function() {
				                        document.location.href = moshop.base + '/mobile/login/forgetPwd.jhtml';
				                    }
								},{
								    'text': '确定'
								}]);
							}
						}
					});
				},
				complete: function() {
					$loginSubmit.prop("disabled", false);
				}
			});
	    }
    },
    cart = {
        goods: null,
        initShow: false,
        linkPosition: {},
        cartShowTimer: null,
        cids: {
            'num': 1
        },
        currCid: {
            'cid': null,
            'size': null,
            'num': null
        },
        readReady: false,
        stateRead: false,
        addCart: function(specificationValuesSize,$currentProductId) {
        	var $specificationValue = $(".sys_item_specpara li");
    	    var $specificationsTitle = $(".specificationsTitle");
    		var specificationValueIds = new Array();
    		$specificationValue.filter(".selected").each(function(i) {
    			specificationValueIds[i] = $(this).attr("data-aid");
    		});
    		if (specificationValueIds.length != specificationValuesSize) {
    			$specificationsTitle.show();
    			return false;
    		}else{
    		    $specificationsTitle.hide();
    		}
    		var $quantity = $("#quantity");
    		var quantity = $quantity.val();
			if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
				$.ajax({
					url: moshop.base + "/cart/add.jhtml",
					type: "POST",
					data: {id: $currentProductId.val() , quantity: quantity},
					dataType: "json",
					cache: false,
					success: function(message) {
					    if(message['type'] == 'success'){
						    m$.ui.dialog.dialogShow({
			                    'title': '成功加入购物袋',
			                    'content':message['content']
			                },
			                [{
			                    'text': '确定'
			                },
			                {
			                    'text': '结算',
			                    'func': function() {
			                        document.location.href = moshop.base + '/mobile/cart/index.jhtml';
			                    }
			                }]); 
					    }else{
						    m$.ui.dialog.dialogShow({
				                'title': '提示',
				                'content': message['content']
				            },
				            [{
				                'text': '确定'
				            }]);
					    }
						
					}
				});
			} else {
				 m$.ui.dialog.dialogShow({
	                'title': '遇到错误',
	                'content': '购买数量必须为正整数'
	            },
	            [{
	                'text': '确定'
	            }]);
			}
        },
        deleteCartItem: function(cartItemId){
        	m$.ui.dialog.dialogShow({
        		'title': '提示',
        		'content': '确定要删除吗？'
        	},
        	[{
        		'text': '取消'
        	},
        	{
        		'text': '确定',
        		'func': function() {
        			$.ajax({
        				url: moshop.base + "/mobile/cart/delete.jhtml",
        				type: "POST",
        				data: {
        					id: cartItemId
        				},
        				dataType: "json",
        				cache: false,
        				success: function(data) {
        					location.reload();
        				},
        				complete: function() {
        					location.reload();
        				}
        			});
        		}
        	}]);
            return false;
        },
        increase: function() {
        	var $quantity = $("#quantity");
        	var quantity = $quantity.val();
    		if (/^\d*[1-9]\d*$/.test(quantity)) {
    			$quantity.val(parseInt(quantity) + 1);
    			$quantity.html(parseInt(quantity) + 1); 
    		} else {
    			$quantity.val(1);
    			$quantity.html(1); 
    		}
    	},
        decrease: function() {
        	var $quantity = $("#quantity");
    		var quantity = $quantity.val();
    		if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 1) {
    			$quantity.val(parseInt(quantity) - 1);
    			$quantity.html(parseInt(quantity) - 1); 
    		} else {
    			$quantity.val(1);
    			$quantity.html(1); 
    			
    		}
    	},
    	submitCart: function(){
    		if (!$.checkLogin()) {
    			m$.ui.dialog.dialogShow({
    				'title': '提示',
    				'content': '必须登录后才能提交订单'
    			},
    			[{
    				'text': '确定',
    				'func': function() {
    					$.redirectLogin(moshop.base + "/mobile/cart/index.jhtml");
    				}
    			}]);
    			return false;
    		}else{
    			window.location=moshop.base +  '/mobile/member/order/info.jhtml';
    		}
    	},
    	submitOrderInfo: function(){
			var $orderForm = $("#orderForm");
			var $receiverId = $("#receiverId");
			var $cartToken = $("#cartToken");
			var $paymentPluginId = $("#paymentPluginId");
			var $shippingMethodId = $('input[name="shippingMethodId"]:checked');
			var $invoiceTypeId = $("#invoiceTypeId");
			var $invoiceTitle = $("#invoiceTitle");
			var $isInvoice = $("#isInvoice");
			var $markinfo = $("#markinfo");
			var $code = $("#code");
			if(!$receiverId.val()){
				m$.ui.dialog.dialogShow({
    				'title': '提示',
    				'content': '请选择收货信息'
    			},
    			[{
    				'text': '确定'
    			}]);
    			return false;
			}
			if(!$cartToken.val()){
				m$.ui.dialog.dialogShow({
    				'title': '提示',
    				'content': '购物车信息有误'
    			},
    			[{
    				'text': '确定'
    			}]);
    			return false;
			}
			if(!$paymentPluginId.val()){
				m$.ui.dialog.dialogShow({
    				'title': '提示',
    				'content': '请选择支付方式'
    			},
    			[{
    				'text': '确定'
    			}]);
    			return false;
			}
			if(!$shippingMethodId.val()){
				m$.ui.dialog.dialogShow({
    				'title': '提示',
    				'content': '请选择寄送方式'
    			},
    			[{
    				'text': '确定'
    			}]);
    			return false;
			}
			$.ajax({
				url: $orderForm.attr("action"),
				type: "POST",
				data: {
					receiverId: $receiverId.val(),
					cartToken: $cartToken.val(),
					paymentPluginId: $paymentPluginId.val(),
					shippingMethodId: $shippingMethodId.val(),
					invoiceTypeId: $invoiceTypeId.val(),
					invoiceTitle: $invoiceTitle.val(),
					isInvoice: $isInvoice.val(),
					markinfo:$markinfo.val(),
					code:$code.val()
				},
				dataType: "json",
				cache: false,
				success: function(message) {
					if (message.type == "success") {
						window.location= moshop.base +  '/mobile/member/order/payment.jhtml?sn=' + message['content'];
					} else {
						m$.ui.dialog.dialogShow({
						    'title': '提示',
						    'content':message['content']
						},
						[{
						    'text': '确定',
		    				'func': function() {
		    					window.location= moshop.base +  '/mobile/cart/index.jhtml';
		    				}
						}]);
					}
				}
			});
    	},
    	cancel: function(orderSn){
    		m$.ui.dialog.dialogShow({
			    'title': '提示',
			    'content':'您确定要取消该订单吗？'
			},
			[{
        		'text': '取消'
        	},{
			    'text': '确定',
				'func': function() {
					$.ajax({
	    				url: moshop.base + "/mobile/member/order/applyForRefund.jhtml?sn="+orderSn,
	    				type: "POST",
	    				dataType: "json",
	    				cache: false,
	    				success: function(message) {
	    					if (message.type == "success") {
	    						location.reload(true);
	    					} else {
	    						m$.ui.dialog.dialogShow({
	    						    'title': '提示',
	    						    'content':message['content']
	    						},
	    						[{
	    						    'text': '确定'
	    						}]);
	    					}
	    				}
	    			});
				}
			}]);
    		return false;
    	},
    	 addAddress: function(receiverModifyAreaSpan, areaSelects) {
    		 var $receiverFormAdd = $("#receiverFormAdd");
    		 var $address =  $receiverFormAdd.find("input[name='address']");
    		 var $consignee =  $receiverFormAdd.find("input[name='consignee']");
    		 var $phone =  $receiverFormAdd.find("input[name='phone']");
	          for (var i = 0; i < areaSelects.length; i++) {
	              if (!areaSelects[i].value) {
	                  m$.ui.dialog.dialogShow({
	                      'title': '提示',
	                      'content': "请选择所在地区"
	                  },
	                  [{
	                      'text': '确定'
	                  }]);
	                  return false;
	              }
	          }
	          if(!$address.val()){
					m$.ui.dialog.dialogShow({
					    'title': '提示',
					    'content': "请填写寄送地址"
					},
					[{
					    'text': '确定'
					}]);
					return false;
	          }
	          if(!$consignee.val()){
					m$.ui.dialog.dialogShow({
					    'title': '提示',
					    'content': "请填写收货人"
					},
					[{
					    'text': '确定'
					}]);
					return false;
	          }
	          if(!$phone.val()){
					m$.ui.dialog.dialogShow({
					    'title': '提示',
					    'content': "请填写电话"
					},
					[{
					    'text': '确定'
					}]);
					return false;
	          }
	          
	          $.ajax({
	              url: moshop.base + "/mobile/member/submitNewAddress.jhtml",
	              type: "post",
	              data: $receiverFormAdd.serialize(),
	              dataType: "json",
	              cache: false,
	              async: false,
	              success: function(message) {
	                  if (message.type == "success") {
	                     location.reload();
	                  } else {
	                      m$.ui.dialog.dialogShow({
	                          'title': '提示',
	                          'content': message.content
	                      },
	                      [{
	                          'text': '确定'
	                      }]);
	                  }
	              }
	          });
      },
        // 点击数
        hits: function(productId){
        	$.ajax({
        		url: moshop.base + "/product/wapHits/"+productId+".jhtml",
        		type: "GET"
        	});
        },
        fill: function(asyType, fillData) {
            var cartNum = cookie('cart_num');
            if (cartNum == null) {
                var asyType = asyType || false;
                if (fillData) var fillData = fillData;
                else var fillData = true;
                this.getData(asyType, fillData);
            } else {
                $('#bag').html(cartNum);
            }
        },
        favorites: function(productId) {
        	var username = getCookie('username');
        	if (username) {
        	    $.ajax({
        	        url: moshop.base + "/mobile/member/productAddFavorite.jhtml",
        	        type: "GET",
        	        data: {
        	            id: productId
        	        },
        	        dataType: "json",
        	        cache: false,
        	        success: function(message) {
        	            m$.ui.dialog.dialogShow({
        	                'title': '提示',
        	                'content': message.content
        	            },
        	            [{
        	                'text': '确定'
        	            }]);
        	        }
        	    });
        	} else {
        	    m$.ui.dialog.dialogShow({
        	        'title': '提示',
        	        'content': '必须登录后才能收藏商品'
        	    },
        	    [{
        	        'text': '确定',
        	        'func': function() {
        	            $.redirectLogin(moshop.base + "/mobile/product/content.jhtml?productId=" + productId);
        	        }
        	    }]);
        	    return false;
        	}
        }
    },
    product = {
    	clearfilterSelected: function(){
    		$(".filterProduct").each(function(){
    			var $this=$(this);
    			var $filterProduct=$this.find("a");
    			$filterProduct.removeClass("filterSelected");
    		});
    	},
    	submitProductFilter:function(){
    		var $moMobileContent = $(".moMobileContent");
    		var $filterResultContent = $("#filterResultContent");
    		var $brandId = $("#brandId");
    		var $newArrivalFilter = $("#newArrivalFilter");
    		var $baseSellerFilter = $("#baseSellerFilter");
    		var $promotionFilter = $("#promotionFilter");
    		var $salesVolumeFilter = $("#salesVolumeFilter").find("a");
    		var $yearFilter = $("#yearFilter").find("a");
    		var $productCategoryFilter = $("#productCategoryFilter").find("a");
    		var $colorFilter = $("#colorFilter").find("a");
    		var $priceFilter = $("#priceFilter").find("a");
    		var $sizeFilter = $("#sizeFilter").find("a");
    		var $priceOrderByFilter = $("#priceOrderByFilter").find("a");
    		
    		pageParams.brandId = $brandId.val();
    		pageParams.isNewArrival = $newArrivalFilter.hasClass("filterSelected");
    		pageParams.isBestSeller  = $baseSellerFilter.hasClass("filterSelected");
    		pageParams.isPromotion = $promotionFilter.hasClass("filterSelected");
    		
    		for(var i = 0; i<$salesVolumeFilter.length; i++){
    			var $this = $salesVolumeFilter[i];
    			if($this.className == "filterSelected"){
    				pageParams.salesValumeOrderBy = $this.getAttribute('val');
    				break;
    			}
    		}
    		
    		for(var i = 0; i<$yearFilter.length; i++){
    			var $this = $yearFilter[i];
    			if($this.className == "filterSelected"){
    				pageParams.yearOrderBy = $this.getAttribute('val');
    				break;
    			}
    		}
    		
    		var productCatagoryIds = [];
    		for(var i = 0; i<$productCategoryFilter.length; i++){
    			var $this = $productCategoryFilter[i];
    			if($this.className == "filterSelected"){
    				productCatagoryIds.push($this.getAttribute('val'));
    			}
    		}
    		pageParams.productCatagoryIds = productCatagoryIds.toString();
    		
    		var colorIds = [];
    		for(var i = 0; i<$colorFilter.length; i++){
    			var $this = $colorFilter[i];
    			if($this.className == "filterSelected"){
    				colorIds.push($this.getAttribute('val'));
    			}
    		}
    		pageParams.colorIds = colorIds.toString();
    		
    		var prices = [];
    		for(var i = 0; i<$priceFilter.length; i++){
    			var $this = $priceFilter[i];
    			if($this.className == "filterSelected"){
    				prices.push($this.getAttribute('val'));
    			}
    		}
    		pageParams.prices = prices.toString();
    		
    		var sizeIds = [];
    		for(var i = 0; i<$sizeFilter.length; i++){
    			var $this = $sizeFilter[i];
    			if($this.className == "filterSelected"){
    				sizeIds.push($this.getAttribute('val'));
    			}
    		}
    		pageParams.sizeIds = sizeIds.toString();
    		
    		for(var i = 0; i<$priceOrderByFilter.length; i++){
    			var $this = $priceOrderByFilter[i];
    			if($this.className == "filterSelected"){
    				pageParams.priceOrderBy = $this.getAttribute('val');
    				break;
    			}
    		}
    		
    		$moMobileContent.hide();
    		var listParam = getListParam(pageParams,'filter');
            $.ajax({
                url: listUrl+listParam, 
                dataType: 'json',
                cache: false,
                async: false,
                success: function (data) {
                    if ($('#pageLoading').prevAll().length != 0) {
                        $('#pageLoading').prevAll().remove();
                    }
                    var productList = data.page.content;
                    if (data.page && productList.length > 0) {
                    	assembleListBox(productList);
                        $('#pageLoading').before(nextPageHtml);
                        pageParams.pageCount = data.totalPage;
                        pageParams.pageNumber = 2;
                        listParam = getListParam(pageParams, 'filter');
                        nextPageHtml = '';
                        if (pageParams.pageCount == 2) {
                            getList(listUrl, listParam, false);
                        } else {
                            nextPageIndex = pageParams.pageNumber + 1;
                            if (nextPageIndex <= pageParams.pageCount) {
                                getList(listUrl, listParam, false);
                            } else {
                                $('#pageLoading .loading').css('display', 'none');
                            }
                        }
                        m$.ui.lazy.init('listBox', 'filter');
                    } else {
                    	 var favListHTML = '';
                    	 favListHTML  += '<span>';
                    	 favListHTML  +=  message("未找到符合结果");
                    	 favListHTML  += '</span>';
                    	 $('#pageLoading').before(favListHTML);
                    }
                }
            });
            $filterResultContent.show();
    	}
    };
    m$.business.login = login;
    m$.business.cart = cart;
    m$.business.product = product;
})(window, m$, $);

(function(window, m$, $, undefined) {
    var msgBox = {
        html: '{msg}',
        init: function() {
            this.div = c$('div');
            this.div.className = 'pop_box';
            this.div.id = 'popBox';
            document.body.appendChild(this.div);
        },
        show: function(msg, param) {
            if (!m$.ui.msgBox.div) m$.ui.msgBox.init();
            m$.ui.msgBox.div.innerHTML = subStitute(m$.ui.msgBox.html, {
                'msg': msg
            });
            var winH = document.documentElement.clientHeight;
            var winW = $(window).width();
            var winL = parseInt(winW / 2) - 60;
            var popBottom = parseInt(winH / 2) - 120;
            $('#popBox').css({
                'bottom': popBottom + 'px',
                'left': winL + 'px',
                '-webkit-transform': 'scale3d(1, 1, 1)',
                '-webkit-transition': '-webkit-transform 0s ease-in-out, bottom 0s ease-in-out, left 0s ease-in-out'
            });
            $('#popBar').css('bottom', 0);
            winL = winL + 160;
            setTimeout("$('#popBox').css({'bottom': '-90px', 'left' : '" + winL + "px', '-webkit-transform':'scale3d(0.4, 0.4, 0.4)', '-webkit-transition':'-webkit-transform 0.9s ease-in-out, bottom 0.7s ease-in-out, left 0.7s ease-in-out'})", 1000);
            setTimeout("$('#popBar').css('bottom','-30px')", 5000);
        }
    },
    dialog = {
        dialogShow: function(param, btns) {
            var dg = document.createElement('div');
            dg.className = 'dialog_frame';
            dg.id = 'dialogFrame';
            var dt = '<div class="dialog_title">' + param.title + '</div>';
            var dc = '<div class="dialog_content">' + param.content + '</div>';
            if (!btns) {
                var db = '<div class="dialog_btn" id="dialogBtns"><span id="btnDiaClose">确定</span></div>';
            } else {
                var db = '<div class="dialog_btn" id="dialogBtns"></div>';
            }
            dg.innerHTML = '<div class="dialog">' + dt + dc + db + '</div>';
            document.body.appendChild(dg);
            if (!btns) {
                var btnClose = document.getElementById('btnDiaClose');
                btnClose.ontouchend = this.dialogClose;
            } else {
                for (var i = 0; i < btns.length; i++) { (function(i, b) {
                        var bt = document.createElement('span');
                        bt.innerHTML = btns[i].text;
                        if (btns[i].func) {
                            bt.onclick = function() {
                                if (btns[i].obj) {
                                    btns[i].func.apply(btns[i].obj, btns[i].args);
                                } else {
                                    btns[i].func.apply(window, btns[i].args);
                                }
                                dialog.dialogClose();
                            }
                        } else {
                            bt.onclick = function() {
                                dialog.dialogClose();
                            }
                        }
                        document.getElementById('dialogBtns').appendChild(bt);
                    })(i, btns)
                }
                if (btns.length > 1) {
                    document.getElementById('dialogBtns').className = 'dialog_btn dialog_btn_' + btns.length;
                }
            }
        },
        dialogClose: function() {
            var dg = document.getElementById('dialogFrame');
            if (dg) {
                document.body.removeChild(dg);
            }
        }
    },
    rollpic = {
        roll: function(i, act, moveX) {
            var move = true;
            var totalNum = $('#proBigPic li').size();
            var movePx = (i * -320) + moveX;
            if ((act == 'right') && (i < 0)) move = false;
            else if ((act == 'left') && (i > totalNum - 1)) move = false;
            else if ((movePx >= 0) && (act == 'right')) move = false;
            else if ((movePx <= (totalNum - 1) * -320) && (act == 'left')) move = false;
            if (move == true) {
                $('.show_box').css({
                    'bottom': '-250px',
                    'opacity': 0
                });
                $('.show_box').removeClass('active');
                $('#rollPageBox span').removeClass('active');
                if (!moveX) {
                    $('#rollPageBox').children().eq(i).addClass('active');
                    var moveToI = '-' + (i * 320) + 'px';
                    $('#proBigPic').css({
                        '-webkit-transition-duration': '0.2s',
                        'left': moveToI
                    });
                    picLocalNum = i;
                    this.imgShow(i);
                } else {
                    if (act == 'left') {
                        this.imgShow(i);
                    }
                    $('#proBigPic').css({
                        '-webkit-transition-duration': '0s',
                        'left': ((i * -320) + moveX) + 'px'
                    });
                }
            }
        },
        imgShow: function(i) {
            var proImgs = document.getElementById('proBigPic').getElementsByTagName('img');
            if (!proImgs[i].hasLazy) {
                proImgs[i].setAttribute('src', proImgs[i].getAttribute('datasrc'));
                proImgs[i].setAttribute('hasLazy', true);
            }
        }
    },
    lazy = {
        proImgs: null,
        init: function(id,type) {
            if (!document.getElementById(id)) return false;
            this.proImgs = document.getElementById(id).getElementsByTagName('img');
            if (this.proImgs.length < 1) return false;
            for (var i = 0,
            j = this.proImgs.length; i < j; i++) {
                this.proImgs[i].setAttribute('hasLazy', false);
            }
            this.show($(window).scrollTop(), $(window).height());
            window.onscroll = function() {
                var scrollTop = $(window).scrollTop();
                var screenHeight = $(window).height();
                if (id == 'listBox') {
                    if (scrollbarLocation < scrollTop) {
                        if (nextPageHtml != '') {
                            if (($('#pageLoading').offset().top - scrollTop - screenHeight) < 10) {
                                $('#pageLoading').before(nextPageHtml);
                                nextPageHtml = '';
                                pageParams.pageNumber += 1;
                                var listParam =  getListParam(pageParams,type);
                                if (pageParams.pageNumber <= pageParams.pageCount) {
                                    getList(listUrl, listParam, false);
                                    scrollbarLocation = scrollTop;
                                } else {
                                	$('#pageLoading .loading').css('display', 'none');
                                }
                            }
                        }
                    }
                }
                m$.ui.lazy.show(scrollTop, screenHeight);
            }
        },
        show: function(scrollTop, screenHeight) {
            for (var i = 0; i < this.proImgs.length; i++) {
                if (!this.proImgs[i].hasLazy) {
                    if (($(this.proImgs[i]).offset().top - scrollTop - screenHeight) < 200) {
                        this.proImgs[i].setAttribute('src', this.proImgs[i].getAttribute('datasrc'));
                        this.proImgs[i].setAttribute('hasLazy', true); 
                        (function(i) {
                            m$.ui.lazy.proImgs[i].onload = function() {
                                m$.ui.lazy.proImgs[i].style.opacity = 1;
                                $(m$.ui.lazy.proImgs[i]).next('.loading').detach();
                            }
                        })(i);
                    }
                }
            }
        }
    },
    tranAct = {
        even: true,
        detailInfo: function() {
            document.getElementById('fullscreen').style.height = (document.documentElement.clientHeight) + 'px';
            document.getElementById('fullscreen').style.background = 'none';
            document.getElementById('infoBox').style.height = (document.documentElement.clientHeight - 128) + 'px';
        },
        timedCount: function(floatDiv, topTop) {
            var t;
            floatDiv.css({
                'top': floatDiv.css('top') + 1
            });
            if (topTop > 0 - floatDiv.css('top')) t = setTimeout("timedCount()", 1);
            else clearTimeout(t)
        },
        imageShow: function(id) {
            var img = document.getElementById(id).getElementsByTagName('img');
            for (var i = 0; i < img.length; i++) { (function(i) {
                    if (i == 0) {
                        img[i].src = img[i].getAttribute('datasrc');
                    }
                    img[i].onload = function() {
                        img[i].style.opacity = 1;
                        $(img[i]).next('.loading').detach();
                        if (i + 1 < img.length) {
                            img[i + 1].src = img[i + 1].getAttribute('datasrc');
                        }
                    }
                })(i);
            }
        }
    },
    fixed = {
    	 fixedWatch: function(el){
		     if (document.activeElement.nodeName == 'INPUT') {
			     el.css('position', 'static');
			 } else {
			     el.css('position', 'fixed');
			 }
         },
         fixedTop: function(el){
	         if (document.activeElement.nodeName == 'INPUT') {
	    	     el.css('position', 'static');
	    	 } else {
	    	     el.css('position', 'fixed');
	    	 }
         },
         fixedBody: function(el){
    	     if (document.activeElement.nodeName == 'INPUT') {
    	        el.css('margin-top', '0px');
    	     } else {
    	        el.css('margin-top', '41px');
    	     }
         }
    }
    m$.ui.msgBox = msgBox;
    m$.ui.dialog = dialog;
    m$.ui.rollpic = rollpic;
    m$.ui.lazy = lazy;
    m$.ui.tranAct = tranAct;
    m$.ui.fixed = fixed;
})(window, m$, $);


m$.myAccount = {}; 
(function(window, m$, $, undefined) {
    var lazyLoadOrder = {
        proImgs: null,
        init: function(id,type) {
            if (!document.getElementById(id)) return false;
            this.proImgs = document.getElementById(id).getElementsByTagName('img');
            if (this.proImgs.length < 1) return false;
            for (var i = 0,
            j = this.proImgs.length; i < j; i++) {
                this.proImgs[i].setAttribute('hasLazy', false);
            }
            this.show($(window).scrollTop(), $(window).height());
            window.onscroll = function() {
                var scrollTop = $(window).scrollTop();
                var screenHeight = $(window).height();
                if (id == 'myOrderList') {
                    if (scrollbarLocation < scrollTop) {
                        if (nextOrderPageHtml != '') {
                            if (($('#pageLoading').offset().top - scrollTop - screenHeight) < 10) {
                                $('#pageLoading').before(nextOrderPageHtml);
                                nextOrderPageHtml = '';
                                pageParams.pageNumber += 1;
                                var listParam =  getListParam(pageParams,type);
                                if (pageParams.pageNumber <= pageParams.pageCount) {
                                	getOrderList(listUrl, listParam, false);
                                    scrollbarLocation = scrollTop;
                                } else {
                                	$('#pageLoading .loading').css('display', 'none');
                                }
                            }
                        }
                    }
                }
                m$.myAccount.lazyLoadOrder.show(scrollTop, screenHeight);
            }
        },
        show: function(scrollTop, screenHeight) {
            for (var i = 0; i < this.proImgs.length; i++) {
                if (!this.proImgs[i].hasLazy) {
                    if (($(this.proImgs[i]).offset().top - scrollTop - screenHeight) < 200) {
                        this.proImgs[i].setAttribute('src', this.proImgs[i].getAttribute('datasrc'));
                        this.proImgs[i].setAttribute('hasLazy', true); 
                        (function(i) {
                        	m$.myAccount.lazyLoadOrder.proImgs[i].onload = function() {
                        		m$.myAccount.lazyLoadOrder.proImgs[i].style.opacity = 1;
                                $(m$.myAccount.lazyLoadOrder.proImgs[i]).next('.loading').detach();
                            }
                        })(i);
                    }
                }
            }
        },
        confirmOrder: function (orderItemId,sn){
           m$.ui.dialog.dialogShow({
                'title': '提示',
                'content': '确认收货吗?'
            },
            [{
                'text': '取消',
            },
            {
                'text': '确定',
                'func': function() {

						$.ajax({
						    url: moshop.base +"/member/order/confirmReceiver.jhtml?orderItemId="+orderItemId+"&sn="+sn,
						    type: "GET",
						dataType: "json",
						cache: false,
						success: function(message) {
						  if (message.type == "success") {
						    location.reload(true);
						  } else {
							  m$.ui.dialog.dialogShow({
	                                'title': '提示',
	                                'content': message.content
	                            },
	                            [{
	                                'text': '确定'
	                            }]);
						  }
						}
						});

                }

            }]);
        },
        applyForRefund: function(sn){
        	m$.ui.dialog.dialogShow({
                'title': '您的订单即将发货，发货请按取消',
                'content': '原因：<select class="applyForRefundSelect" id="applyForRefundSelect"></select>'
            },
            [{
                'text': '取消',
            },
            {
                'text': '确定',
                'func': function() {
            	    var $refuseReasonId = $("#refuseReasonId").val();
	            	$.ajax({
	    				url: moshop.base +"/mobile/member/order/applyForRefund.jhtml",
	    				type: "POST",
	    				dataType: "json",
		            	data: {
	            		   sn: sn,
	            	       refuseReasonId:$refuseReasonId
	                    },
	    				cache: false,
	    				success: function(message) {
	    					if (message.type == "success") {
	    						m$.ui.dialog.dialogShow({
	    						      'title': '申请退款请求成功',
	    						      'content': '将在3－5个工作日内，处理您的退款订单'
	    						  },
	    						  [{
	    						      'text': '确定',
	    						      'func': function() {
	    							       location.reload(true);
	    						       }
	    						  }]);
	    					} else {
	    						m$.ui.dialog.dialogShow({
	    						      'title': '提示',
	    						      'content': message.content
	    						  },
	    						  [{
	    						      'text': '确定'
	    						}]);
	    					}
	    				}
	    			});
                }

            }]);
        	
        	$.ajax({
        		url: moshop.base+ "/common/refuseReason.jhtml",
				type: "get",
				dataType: "json",
	        	data: {
        		   type: 1
	            },
				cache: false,
				success: function(data) {
					var $applyForRefundSelect = $("#applyForRefundSelect");
					$applyForRefundSelect.empty();
					$.each(data, function(value, name) {
						$applyForRefundSelect.append("<option value='"+value+"'>"+name+"</option>"); 
					});
	            }
	    	});
        	 
        },
        returnGoodsApply: function(orderId){
        	window.location= moshop.base +  '/mobile/member/order/parcelList.jhtml?orderId='+orderId;
        },
        returnGoodsHistory: function(sn){
        	window.location= moshop.base +  '/mobile/member/order/returnsGoodsHistory.jhtml?sn='+sn;
        },
        //
        submitReturnsGoods: function(sn){
        	var $refundReason = $("#refundReason").val();
        	var $refundQuantitys = $(".returnsGoodsList .defaultSelect");
        	var count = 0;
        	var len = $refundQuantitys.length
        	for(var i=0; i<len; i++){
			    var qty = $refundQuantitys[i].value;
			    if(qty == 0){
			        count += 1;
			    }
				if(len == count){
					m$.ui.dialog.dialogShow({
					      'title': '提示',
					      'content': '\u7533\u8bf7\u9000\u8d27\u6570\u91cf\u4e0d\u80fd\u5168\u90e8\u7b49\u4e8e0'
					  },
					  [{
					      'text': '确定'
				    }]);
	        	   return false;
				}
        	}
        	if(!$refundReason){
        		m$.ui.dialog.dialogShow({
				      'title': '提示',
				      'content': '请选择退货原因'
				  },
				  [{
				      'text': '确定'
				  }]);
        		return false;
        	}
			$.ajax({
				url: moshop.base +"/mobile/member/order/submitReturnsGoods.jhtml",
				type: "POST",
			    data:$('#returnsGoodsForm').serialize(),
				cache: false,
				success: function(message) {
					if (message.type == "success") {
						m$.ui.dialog.dialogShow({
						      'title': '申请退货请求成功',
						      'content': '将在3－5个工作日内，处理您的退货订单'
						  },
						  [{
						      'text': '确定',
						      'func': function() {
							       location.reload(true);
						       }
						  }]);
					} else {
						m$.ui.dialog.dialogShow({
						      'title': '提示',
						      'content': message.content
						  },
						  [{
						      'text': '确定'
						}]);
					}
				}
			});

        }
    },
    
    modifyAddress = {
        deleteConfirm: function(id) {
            m$.ui.dialog.dialogShow({
                'title': '提示',
                'content': '确认删除?'
            },
            [{
                'text': '取消',
            },
            {
                'text': '确定',
                'func': function() {
                    m$.myAccount.modifyAddress.deleteAddress(id);
                }

            }]);
        },
        deleteAddress: function(id) {
            if (id == '') {
                m$.ui.dialog.dialogShow({
                    'title': '提示',
                    'content': '请选择删除的地址！'
                },
                [{
                    'text': '确定'
                }]);
            } else {
                $.ajax({
                    url: moshop.base + "/mobile/member/deletesendAddress.jhtml",
                    type: "POST",
                    data: {
                        id: id
                    },
                    cache: false,
                    success: function(message) {
                        if (message.type == "success") {
                            location.reload();
                        } else {
                            m$.ui.dialog.dialogShow({
                                'title': '提示',
                                'content': message.content
                            },
                            [{
                                'text': '确定'
                            }]);
                        }
                    }
                });
            }
        },
        addAddress: function(receiverModifyAreaSpan, areaSelects) {
            var $address = $("#address");
            var $consignee = $("#consignee");
            var $zipCode = $("#zipCode");
            var $phone = $("#phone");
        	for (i = 0; i < areaSelects.length; i++) {
                if (!areaSelects[i].value) {
                    m$.ui.dialog.dialogShow({
                        'title': '提示',
                        'content': "请选择所在地区"
                    },
                    [{
                        'text': '确定'
                    }]);
                    return false;
                }
            }
            if(!$address.val()){
   	    	 m$.ui.dialog.dialogShow({
                    'title': '提示',
                    'content': '请填写寄送地址'
                },
                [{
                    'text': '确定'
                }]);
   	    	 return false;
        	}
            if(!$consignee.val()){
      	    	 m$.ui.dialog.dialogShow({
                       'title': '提示',
                       'content': '请填写收件人'
                   },
                   [{
                       'text': '确定'
                   }]);
      	    	 return false;
           	}
            if(!$phone.val()){
     	    	 m$.ui.dialog.dialogShow({
                      'title': '提示',
                      'content': '请填写电话'
                  },
                  [{
                      'text': '确定'
                  }]);
     	    	 return false;
          	}
            /**
            if(!$zipCode.val()){
    	    	 m$.ui.dialog.dialogShow({
                     'title': '提示',
                     'content': '请填写邮编'
                 },
                 [{
                     'text': '确定'
                 }]);
    	    	 return false;
         	}**/
            $.ajax({
                url: moshop.base + "/mobile/member/submitNewAddress.jhtml",
                type: "post",
                data: $("#receiverFormModify").serialize(),
                dataType: "json",
                cache: false,
                async: false,
                success: function(message) {
                    if (message.type == "success") {
                        window.location.href = moshop.base + "/mobile/member/sendAddress.jhtml";
                    } else {
                        m$.ui.dialog.dialogShow({
                            'title': '提示',
                            'content': message.content
                        },
                        [{
                            'text': '确定'
                        }]);
                    }
                }
            });
        },
        editAddress: function(receiverModifyAreaSpan, areaSelects) {
	    	 var $address = $("#address");
	         var $consignee = $("#consignee");
	         var $zipCode = $("#zipCode");
	         var $phone = $("#phone");
	         for (i = 0; i < areaSelects.length; i++) {
	            if (!areaSelects[i].value) {
	                m$.ui.dialog.dialogShow({
	                    'title': '提示',
	                    'content':"请选择所在地区"
	                },
	                [{
	                    'text': '确定'
	                }]);
	                return false;
	            }
	        }
          if(!$address.val()){
   	    	 m$.ui.dialog.dialogShow({
                    'title': '提示',
                    'content': '请填写寄送地址'
                },
                [{
                    'text': '确定'
                }]);
   	    	 return false;
        	}
            if(!$consignee.val()){
      	    	 m$.ui.dialog.dialogShow({
                       'title': '提示',
                       'content': '请填写收件人'
                   },
                   [{
                       'text': '确定'
                   }]);
      	    	 return false;
           	}
            if(!$phone.val()){
     	    	 m$.ui.dialog.dialogShow({
                      'title': '提示',
                      'content': '请填写电话'
                  },
                  [{
                      'text': '确定'
                  }]);
     	    	 return false;
          	}
            /**
            if(!$zipCode.val()){
    	    	 m$.ui.dialog.dialogShow({
                     'title': '提示',
                     'content': '请填写邮编'
                 },
                 [{
                     'text': '确定'
                 }]);
    	    	 return false;
         	}**/
            $.ajax({
                url: moshop.base + "/mobile/member/updateAddress.jhtml",
                type: "post",
                data: $("#receiverFormModify").serialize(),
                dataType: "json",
                cache: false,
                async: false,
                success: function(message) {
                    if (message.type == "success") {
                        window.location.href = moshop.base + "/mobile/member/sendAddress.jhtml";
                    } else {
                        m$.ui.dialog.dialogShow({
                            'title': '提示',
                            'content': message.content
                        },
                        [{
                            'text': '确定'
                        }]);
                    }
                }
            });
        }
    },
    changeEmail = {
            submit: function(password, newEmail, confirmEmail) {
            	
            	var emailRegular = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
            	
        	    if(!password){
        	    	 m$.ui.dialog.dialogShow({
                         'title': '提示',
                         'content': '请输入密码!'
                     },
                     [{
                         'text': '确定'
                     }]);
        	    	 return false;
        	    }
        	    if(!newEmail){
        	    	 m$.ui.dialog.dialogShow({
                         'title': '提示',
                         'content': '请输入新邮件!'
                     },
                     [{
                         'text': '确定'
                     }]);
        	    	 return false;
        	    }
        	    if(!emailRegular.test(newEmail)){
        	    	m$.ui.dialog.dialogShow({
                        'title': '提示',
                        'content': '请输入正确的邮箱格式!'
                    },
                    [{
                        'text': '确定'
                    }]);
       	    	 	return false;
        	    }
        	    if(!confirmEmail){
        	    	 m$.ui.dialog.dialogShow({
                         'title': '提示',
                         'content': '请输入新邮件确认!'
                     },
                     [{
                         'text': '确定'
                     }]);
        	    	 return false;
        	    }
                if (newEmail != confirmEmail) {
                    m$.ui.dialog.dialogShow({
                        'title': '提示',
                        'content': '两次邮件输入不一致！'
                    },
                    [{
                        'text': '确定'
                    }]);
                    return false;
                    
                } else {
                    $.ajax({
                        url: moshop.base + "/mobile/member/submitEmail.jhtml",
                        type: "get",
                        data: {
                            password: password,
                            newEmail: newEmail,
                            confirmEmail: confirmEmail,
                        },
                        dataType: "json",
                        cache: false,
                        async: false,
                        success: function(message) {
                            if (message.type == "success") {
                                m$.ui.dialog.dialogShow({
                                    'title': '提示',
                                    'content': '修改成功'
                                },
                                [{
                                    'text': '确定',
                                    'func': function() {
                                        window.location.href = moshop.base + "/mobile/member/index.jhtml";
                                    }
                                }]);
                            } else {
                                m$.ui.dialog.dialogShow({
                                    'title': '提示',
                                    'content': message.content
                                },
                                [{
                                    'text': '确定'
                                }]);
                            }
                        }
                    });
                }
            }
        },
        changePhoneNum = {
                submit: function(password, newPhoneNum, confirmPhoneNum) {
                	
                	var mobileRegular = /1[3-8]+\d{9}/;
                	
            	    if(!password){
            	    	 m$.ui.dialog.dialogShow({
                             'title': '提示',
                             'content': '请输入密码!'
                         },
                         [{
                             'text': '确定'
                         }]);
            	    	 return false;
            	    }
            	    if(!newPhoneNum){
            	    	 m$.ui.dialog.dialogShow({
                             'title': '提示',
                             'content': '请输入新手机号码!'
                         },
                         [{
                             'text': '确定'
                         }]);
            	    	 return false;
            	    }
            	    if(!mobileRegular.test(newPhoneNum)){
            	    	 m$.ui.dialog.dialogShow({
                             'title': '提示',
                             'content': '请输入正确的手机号码格式!'
                         },
                         [{
                             'text': '确定'
                         }]);
            	    	 return false;
            	    }
            	    if(!confirmPhoneNum){
            	    	 m$.ui.dialog.dialogShow({
                             'title': '提示',
                             'content': '请输入手机号码确认!'
                         },
                         [{
                             'text': '确定'
                         }]);
            	    	 return false;
            	    }
                    if (newPhoneNum != confirmPhoneNum) {
                        m$.ui.dialog.dialogShow({
                            'title': '提示',
                            'content': '两次手机号码输入不一致！'
                        },
                        [{
                            'text': '确定'
                        }]);
                        return false;
                        
                    } else {
                        $.ajax({
                            url: moshop.base + "/mobile/member/submitPhoneNum.jhtml",
                            type: "get",
                            data: {
                                password: password,
                                newPhoneNum: newPhoneNum,
                                confirmPhoneNum: confirmPhoneNum,
                            },
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function(message) {
                                if (message.type == "success") {
                                    m$.ui.dialog.dialogShow({
                                        'title': '提示',
                                        'content': '修改成功'
                                    },
                                    [{
                                        'text': '确定',
                                        'func': function() {
                                            window.location.href = moshop.base + "/mobile/member/index.jhtml";
                                        }
                                    }]);
                                } else {
                                    m$.ui.dialog.dialogShow({
                                        'title': '提示',
                                        'content': message.content
                                    },
                                    [{
                                        'text': '确定'
                                    }]);
                                }
                            }
                        });
                    }
                }
            },
    changePasssword = {
        show: function(oldPassword, newPassword, confirmPassword) {
    	    if(!oldPassword){
    	    	 m$.ui.dialog.dialogShow({
                     'title': '提示',
                     'content': '请输入原始密码!'
                 },
                 [{
                     'text': '确定'
                 }]);
    	    	 return false;
    	    }
    	    if(!newPassword){
    	    	 m$.ui.dialog.dialogShow({
                     'title': '提示',
                     'content': '请输入新密码!'
                 },
                 [{
                     'text': '确定'
                 }]);
    	    	 return false;
    	    }
    	    if(!confirmPassword){
    	    	 m$.ui.dialog.dialogShow({
                     'title': '提示',
                     'content': '请再次输入新密码!'
                 },
                 [{
                     'text': '确定'
                 }]);
    	    	 return false;
    	    }
            if (newPassword != confirmPassword) {
                m$.ui.dialog.dialogShow({
                    'title': '提示',
                    'content': '两次密码输入不一致！'
                },
                [{
                    'text': '确定'
                }]);
                return false;
                
            } else {
                $.ajax({
                    url: moshop.base + "/mobile/member/submitPassword.jhtml",
                    type: "get",
                    data: {
                        oldPassword: oldPassword,
                        newPassword: newPassword,
                        confirmPassword: confirmPassword,
                    },
                    dataType: "json",
                    cache: false,
                    async: false,
                    success: function(message) {
                        if (message.type == "success") {
                            m$.ui.dialog.dialogShow({
                                'title': '提示',
                                'content': '修改成功'
                            },
                            [{
                                'text': '确定',
                                'func': function() {
                                    window.location.href = moshop.base + "/mobile/member/index.jhtml";
                                }
                            }]);
                        } else {
                            m$.ui.dialog.dialogShow({
                                'title': '发送失败',
                                'content': message.content
                            },
                            [{
                                'text': '确定'
                            }]);
                        }
                    }
                });
            }
        }
    },
    contact = {
        sendContactUs: function() {
          var title = $("#store_select_txt_provice").text();
          var content = $("#content").val();
            if (title == '请选择') {
                m$.ui.dialog.dialogShow({
                    'title': '提示',
                    'content': '请选择主题！'
                },
                [{
                    'text': '确定'
                }]);
                return false;
                
            } else if (content == '') {
                m$.ui.dialog.dialogShow({
                    'title': '提示',
                    'content': '请填写内容！'
                },
                [{
                    'text': '确定'
                }]);
                return false;
                
            } else {
                $.ajax({
                    url: moshop.base + "/mobile/member/sendContactUs.jhtml",
                    type: "get",
                    data: {
                        title: title,
                        content: content
                    },
                    dataType: "json",
                    cache: false,
                    async: false,
                    success: function(message) {
                        if (message.type == "success") {
                            m$.ui.dialog.dialogShow({
                                'title': '提示',
                                'content': '发送成功'
                            },
                            [{
                                'text': '确定',
                                'func': function() {
                                    window.location.href = moshop.base + "/mobile/member/index.jhtml";
                                }
                            }]);
                        } else {
                            m$.ui.dialog.dialogShow({
                                'title': '发送失败',
                                'content': message.content
                            },
                            [{
                                'text': '确定'
                            }]);
                        }
                    }
                });
            }
        }
    }
    m$.myAccount.modifyAddress = modifyAddress;
    m$.myAccount.changePasssword = changePasssword;
    m$.myAccount.changeEmail = changeEmail;
    m$.myAccount.changePhoneNum = changePhoneNum;
    m$.myAccount.contact = contact;
    m$.myAccount.lazyLoadOrder = lazyLoadOrder;
})(window, m$, $);

m$.storeInfo = {}; 
(function(window, m$, $, undefined) {
    var searchArea = {
        getProvince: function() {
            var parentId = null;
            var cache = {};
            $.ajax({
                url: moshop.base + "/common/shopArea.jhtml",
                type: "GET",
                data: parentId != null ? {
                    parentId: parentId
                }: null,
                dataType: "json",
                cache: false,
                async: false,
                success: function(data) {
                    cache[parentId] = data;
                }
            });

            var data = cache[parentId];
            if (!$.isEmptyObject(data)) {
                var my_provice = "";
                $.each(data,
                function(value, name) {
                    my_provice = my_provice + '<a onclick="getCity(' + value + ');" id="' + value + '">' + name + '</a>';
                });
                $("#provice_select_p").append(my_provice);
            }
            var $option_p = $(".option_p a");
            var $select_box_p = $(".select_box_p");
            var $store_select_txt_provice = $("#store_select_txt_provice");
            var $proviceSelectp = $("#provice_select_p");
            var $selectOpenProvice = $("#selectOpenProvice");
            var $selectCityValue = $("#selectCityValue");
            $store_select_txt_provice.click(function(event) {
                event.stopPropagation();
                $selectCityValue.val('');
                $proviceSelectp.show();
            });
            $selectOpenProvice.click(function(event) {
                event.stopPropagation();
                $selectCityValue.val('');
                $proviceSelectp.show();
            });
            $option_p.click(function() {
                var value = $(this).text();
                $(this).parent().siblings(".select_txt").text(value);
                $proviceSelectp.hide();
            });

            $("ul").mouseleave(function() {
                $proviceSelectp.hide();
            });
        },
        getCity: function(parentId) {
            var $selectProvinceValue = $("#selectProvinceValue");
            var $selectCityValue = $("#selectCityValue");
            $selectProvinceValue.val(parentId);
            $("#city_select_b").empty();
            $("#select_txt_city_b").text("城市");
            var cache = {};
            $.ajax({
                url: moshop.base + "/common/shopArea.jhtml",
                type: "GET",
                data: parentId != null ? {
                    parentId: parentId
                }: null,
                dataType: "json",
                cache: false,
                async: false,
                success: function(data) {
                    cache[parentId] = data;
                }
            });
            var data = cache[parentId];
            if (!$.isEmptyObject(data)) {
                var my_city = "";
                $.each(data,
                function(value, name) {
                    my_city = my_city + '<a id="' + value + '">' + name + '</a>';
                });
                $("#city_select_b").append(my_city);
            }

            var $select_box_b2 = $(".select_box_b2");
            var $option_b2 = $(".option_b2 a");
            var $select_value = $("#select_value");
            var $selectTxtCityb = $("#select_txt_city_b");
            var $citySelectb = $("#city_select_b");
            var $selectOpenCity = $("#selectOpenCity");
            $selectTxtCityb.click(function(event) {
                event.stopPropagation();
                $citySelectb.show();
            });
            $selectOpenCity.click(function(event) {
                event.stopPropagation();
                $citySelectb.show();
            });
            $(document).click(function(event) {
                var eo = $(event.target);
                if ($select_box_b2.is(":visible") && eo.attr("class") != "option_b2" && !eo.parent(".option_b2").length) $citySelectb.hide();
            });
            $option_b2.click(function() {
                var value = $(this).text();
                var id = $(this).attr('id');
                $selectCityValue.val(id);
                $(this).parent().siblings(".select_txt").text(value);
                $citySelectb.hide();
            });

            $("ul").mouseleave(function() {
                $citySelectb.hide();
            });
        },
        submit: function () {
      	  var $inputForm = $("#inputForm");
      	  var $selectProvinceValue = $("#selectProvinceValue");
      	  var $selectCityValue = $("#selectCityValue");

      	  if(!$selectProvinceValue.val()){
				m$.ui.dialog.dialogShow({
				    'title': '提示',
				    'content':'请选择省份'
				},
				[{
				    'text': '确定'
				}]); 
	    		return false;
	    	}
	    	if(!$selectCityValue.val()){
	    		m$.ui.dialog.dialogShow({
				    'title': '提示',
				    'content':'请选择城市'
				},
				[{
				    'text': '确定'
				}]); 
	    		return false;
	    	}
	    	 $inputForm.submit();
       }
    }
    m$.storeInfo.searchArea = searchArea;
})(window, m$, $);


/*创建和初始化地图函数：*/
function initMap(x, y, address, name, tel, shopCoordinates) {
    setMapEvent(); //设置地图事件
    addMapControl(); //向地图添加控件
    if (shopCoordinates && shopCoordinates.length > 0) {
        for (var n = 0; n < shopCoordinates.length; n++) {
            //坐标跟地址的数组
            var shopCoordinateSingle = shopCoordinates[n];
            var coordinateSingleArr = shopCoordinateSingle[0];
            var coordinateSingle = coordinateSingleArr.split(",");
            var coors = coordinateSingle[1] + "|" + coordinateSingle[0];
            var markerArr = [{
                title: shopCoordinateSingle[2],
                content: shopCoordinateSingle[1],
                tel: shopCoordinateSingle[3],
                point: coors,
                isOpen: 0,
                icon: {
                    w: 21,
                    h: 21,
                    l: 0,
                    t: 0,
                    x: 6,
                    lb: 5
                }
            }];
            addMarker(markerArr); //向地图中添加marker
        }
    } else {
        var coors = x + "|" + y;
        var markerArr = [{
            title: name,
            content: address,
            tel: tel,
            point: coors,
            isOpen: 0,
            icon: {
                w: 21,
                h: 21,
                l: 0,
                t: 0,
                x: 6,
                lb: 5
            }
        }];
        addMarker(markerArr); //向地图中添加marker
    }
}

/*地图事件设置函数：*/
function setMapEvent() {
    map.enableDragging(); //启用地图拖拽事件，默认启用(可不写)
    map.enableScrollWheelZoom(); //启用地图滚轮放大缩小
    map.enableDoubleClickZoom(); //启用鼠标双击放大，默认启用(可不写)
    map.enableKeyboard(); //启用键盘上下左右键移动地图
}
/*/地图控件添加函数：*/
function addMapControl() {
    //向地图中添加缩放控件
    var ctrl_nav = new BMap.NavigationControl({
        anchor: BMAP_ANCHOR_TOP_LEFT,
        type: BMAP_NAVIGATION_CONTROL_LARGE
    });
    map.addControl(ctrl_nav);
    //向地图中添加缩略图控件
    var ctrl_ove = new BMap.OverviewMapControl({
        anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
        isOpen: 1
    });
    map.addControl(ctrl_ove);
    //向地图中添加比例尺控件
    var ctrl_sca = new BMap.ScaleControl({
        anchor: BMAP_ANCHOR_BOTTOM_LEFT
    });
    map.addControl(ctrl_sca);
}

/*创建marker*/
function addMarker(markerArr) {

    for (var i = 0; i < markerArr.length; i++) {
        var json = markerArr[i];
        var p0 = json.point.split("|")[0];
        var p1 = json.point.split("|")[1];
        var point = new BMap.Point(p0, p1);
        var iconImg = createIcon(json.icon);
        var marker = new BMap.Marker(point, {
            icon: iconImg
        });
        var iw = createInfoWindow(markerArr, i);
        map.addOverlay(marker); (function() {
            var index = i;
            var _iw = createInfoWindow(markerArr, i);
            var _marker = marker;
            _marker.addEventListener("click",
            function() {
                this.openInfoWindow(_iw);
            });
            if ( !! json.isOpen) {
                _marker.openInfoWindow(_iw);
            }
        })();
    }
}
/*创建InfoWindow*/
function createInfoWindow(markerArr, i) {
    var json = markerArr[i];
    var opts = {
        width: 250,  // 信息窗口宽度
        height: 80, // 信息窗口高度
    };
    var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content' style='font-size: 13px;  margin-top: 10px;'>地址:" + json.content + "</div>" + "<div class='iw_poi_tel' style='font-size: 13px;  margin-top: 8px;'>电话:" + json.tel + "</div>", opts);
    return iw;
}
/*创建一个Icon*/
function createIcon(json) {
    var icon = new BMap.Icon(moshop.base + "/resources/mobile/images/iconAddress.png", new BMap.Size(json.w, json.h), {
        imageOffset: new BMap.Size( - json.l, -json.t),
        infoWindowOffset: new BMap.Size(json.lb + 5, 1),
        offset: new BMap.Size(json.x, json.h)
    }) ;
    return icon;
}

m$.search = {};
(function (window, m$, $, undefined) {
    var search = {
        submit: function () {
            var searchValue = $("#searchValue").val();
            var $searchForm  = $("#searchForm");
            if (searchValue == '') {
                m$.ui.dialog.dialogShow({
                    'title': '提示',
                    'content': '请输入关键字'
                }, [{
                    'text': '确定'
                }]);
                return false;
            } else {
                $.ajax({ 
                    url: moshop.base +"/mobile/search/listSearchProduct.jhtml", 
                    type: "get",
                    data: {
                        searchValue: searchValue
                    },
                    dataType: "json",
                    cache: false,
                    async: false,
                    success: function (data) {
                        if ($('#pageLoading').prevAll().length != 0) {
                            $('#pageLoading').prevAll().remove();
                        }
                        $('#hotSearch').remove();
                        if (data.page && data.page.content.length > 0) {
                        	var productList = data.page.content;
                        	assembleListBox(productList);
                            $('#pageLoading').before(nextPageHtml);
                            pageParams.pageNumber = 2;
                            pageParams.searchValue = data.searchValue;
                            listParam = getListParam(pageParams, 'search');
                            nextPageHtml = '';
                            if (pageParams.pageCount == 2) {
                                getList(listUrl, listParam, false);
                            } else {
                                nextPageIndex = pageParams.pageNumber + 1;
                                if (nextPageIndex <= pageParams.pageCount) {
                                    getList(listUrl, listParam, false);
                                } else {
                                    $('#pageLoading .loading').css('display', 'none');
                                }
                            }
                            m$.ui.lazy.init('listBox', 'search');
                        } else {
                        	 var favListHTML = '';
                        	 favListHTML  += '<span>';
                        	 favListHTML  +=  message("未找到符合结果");
                        	 favListHTML  += '</span>';
                        	 $('#pageLoading').before(favListHTML);
                        }
                    }
                });
            }
        }
    }
    m$.search.search = search;
})(window, m$, $);

m$.header = {};
(function (window, m$, $, undefined) {
    var titleContent = {
          setTitle: function (title) {
        	 var titleHTML = '';
        	 titleHTML  += '<h2 class="header_title">';
        	 titleHTML  +=  title;
        	 titleHTML  += '</h2>';
        	 $('#headerTitleContent').after(titleHTML);
         }
     }
    m$.header.titleContent = titleContent;
})(window, m$, $);

m$.register = {};
(function (window, m$, $, undefined) {
    var registerUser = {
          submit: function () {
        	  var $registerForm = $("#registerForm");
        	  var $email = $("#email");
        	  var $password = $("#password");
        	  var $confirmPsd = $("#confirmPsd");
        	  var $name = $("#name");
        	  var $address = $("#address");
        	  var $mobile = $("#mobile");
        	  var mobileRegular = /1[3-8]+\d{9}/;
        	  
        	  if(!$email.val()){
  				m$.ui.dialog.dialogShow({
  				    'title': '提示',
  				    'content':'请填写电子邮件'
  				},
  				[{
  				    'text': '确定'
  				}]); 
  	    		return false;
  	    	}
        	if(!$mobile.val()){
  				m$.ui.dialog.dialogShow({
  				    'title': '提示',
  				    'content':'请填写手机号码'
  				},
  				[{
  				    'text': '确定'
  				}]); 
  	    		return false;
  	    	}
        	if(!mobileRegular.test($mobile.val())){
        		m$.ui.dialog.dialogShow({
  				    'title': '提示',
  				    'content':'手机号码格式不正确'
  				},
  				[{
  				    'text': '确定'
  				}]);
		        return false;
		    }
  	    	if(!$password.val()){
  	    		m$.ui.dialog.dialogShow({
  				    'title': '提示',
  				    'content':'请填写密码'
  				},
  				[{
  				    'text': '确定'
  				}]); 
  	    		return false;
  	    	}
  	    	if(!$confirmPsd.val()){
  	    		m$.ui.dialog.dialogShow({
  				    'title': '提示',
  				    'content':'请填写确认密码'
  				},
  				[{
  				    'text': '确定'
  				}]); 
  	    		return false;
  	    	}
  	    	if($password.val() != $confirmPsd.val()){
  	    		m$.ui.dialog.dialogShow({
  				    'title': '提示',
  				    'content':'两次密码不同'
  				},
  				[{
  				    'text': '确定'
  				}]); 
  	    		return false;
  	    	}
  	    	if(!$name.val()){
  	    		m$.ui.dialog.dialogShow({
  				    'title': '提示',
  				    'content':'请填写姓名'
  				},
  				[{
  				    'text': '确定'
  				}]); 
  	    		return false;
  	    	}
  	    	if(!$address.val()){
  	    		m$.ui.dialog.dialogShow({
  				    'title': '提示',
  				    'content':'请填写地址！'
  				},
  				[{
  				    'text': '确定'
  				}]); 
  	    		return false;
  	    	}
        	$.ajax({
        		url: moshop.base + "/common/public_key.jhtml",
	    		type: "GET",
	    		dataType: "json",
	    		cache: false,
	    		success: function(data) {
	    			var rsaKey = new RSAKey();
	    			rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
	    			var enPassword = hex2b64(rsaKey.encrypt($password.val()));
	    			var isThirdPart = false;
	    			$.ajax({
	    				url: $registerForm.attr("action"),
	    				type: "POST",
	    				data: {
		    				password:$password.val(),
			   			     email:$email.val(),
			   			     name:$name.val(),
			   			     address:$address.val(),
			   			     mobile:$mobile.val()
	    				},
	    				dataType: "json",
	    				cache: false,
	    				success: function(message) {
	          			  if (message.type == "success") {
	        				  m$.ui.dialog.dialogShow({
	                              'title': '提示',
	                              'content': message.content
	                          },
	                          [{
	                             'text': '绑定VIP卡号?',
	                             'func': function() {
	                            	  location.href = moshop.base +"/mobile/member/viewBindVipCard.jhtml";
	                              }
                               },{
	                              'text': '确定',
	                              'func': function() {
	                            	  location.href = moshop.base +"/mobile/login/index.jhtml";
	                              }
	                          }]);
	        				} else {
	        					 m$.ui.dialog.dialogShow({
	                                 'title': '提示',
	                                 'content': message.content
	                             },
	                             [{
	                                 'text': '确定'
	                             }]);
	        			 }
	          		  }
	    			});
	    		}
	    	});
         },
         getValidateCode: function (second){
        	var $phoneNumber =  $("#phoneNumber");
        	var $getValidateCode = $("#getValidateCode");
    		if($phoneNumber.val()){
    			var mobielRegex = /1[3-8]+\d{9}/;
    			if(mobielRegex.test($phoneNumber.val())){
					if(second > 0){
						if(second == 60){
							 $.ajax({
					         		url: moshop.base + "/mobile/login/getValidateCode.jhtml",
					 	    		type: "GET",
					 	    		dataType: "json",
					 	    		data: {
					 	    			phoneNumber:$phoneNumber.val()
									},
					 	    		cache: false,
					 	    		success: function(data) {
					 	    			if(data.msg == "success"){
					 	    				cookie('validateCode',data.validateCode);
					 	    				cookie('phoneNumber',$phoneNumber.val());
					 	    				$getValidateCode.attr('disabled',"true");
											$phoneNumber.attr('disabled',"true");
					 	    			}else{
					   					     m$.ui.dialog.dialogShow({
					                            'title': '提示',
					                            'content': data.msg
					                        },
					                        [{
					                            'text': '确定'
					                        }]);
					   					    second = 0;
					   					    $getValidateCode.removeAttr('disabled');
											$phoneNumber.removeAttr('disabled');
											$getValidateCode.text("获取验证码");
					 	    			}
					 	    		}
					 	    	});
						}
						second--;
						$getValidateCode.text(second+"s后重新获取");
						setTimeout(function(){m$.register.registerUser.getValidateCode(second);},1000);
					}else{
						$getValidateCode.removeAttr('disabled');
						$phoneNumber.removeAttr('disabled');
						$getValidateCode.text("获取验证码");
					}
    			}else{
    				 m$.ui.dialog.dialogShow({
 	                    'title': '提示',
 	                    'content': '手机号码格式错误'
 	                },
 	                [{
 	                    'text': '确定'
 	                }]);
        		        return false;
    			}
    		}else{
	       		 m$.ui.dialog.dialogShow({
	                    'title': '提示',
	                    'content': '请填写手机号码'
	                },
	                [{
	                    'text': '确定'
	                }]);
       		        return false;
    		}
         },
         forgetPwdNext: function(){
        	 var $validateCode = $("#validateCode");
        	 var $phoneNumber =  $("#phoneNumber");
        	 if(!$phoneNumber.val()){
        		 m$.ui.dialog.dialogShow({
                     'title': '提示',
                     'content': '请填写手机号码'
                 },
                 [{
                     'text': '确定'
                 }]);
        		 return false;
        	 }
        	 if(!$validateCode.val()){
        		 m$.ui.dialog.dialogShow({
                     'title': '提示',
                     'content': '请填写验证码'
                 },
                 [{
                     'text': '确定'
                 }]);
        		 return false;
        	 }
        	 var orgValidateCode = cookie('validateCode');
        	 if(orgValidateCode != $validateCode.val()){
        		 m$.ui.dialog.dialogShow({
                     'title': '提示',
                     'content': '验证码错误'
                 },
                 [{
                     'text': '确定'
                 }]);
        	 }else{
        		 location.href = moshop.base +"/mobile/login/resetPwd.jhtml?phoneNumber=" + $phoneNumber.val() + '&validateCode=' + $validateCode.val();
        	 }
         }
     }
    m$.register.registerUser = registerUser;
})(window, m$, $);

/**
 * 获取收藏商品列表
 */
function getFavouriteProductList(listUrl,pageNumber) {
	var site = listUrl + pageNumber;
    $.ajax({
        url: site,
        dataType: 'json',
        cache: false,
        async: false,
        success: function(data) {
    	    /** 总页数*/
            var totalPage = data.page.totalPages;
            /** 商品列表*/
            var productList = data.page.content;
          
            for (var i = 0; i < productList.length; i++) {
                var product = productList[i];
	            
	            var productName = product.name;
	            
	            var contentUrl = moshop.base + '/mobile/product/content.jhtml?productId='+product.id;
                var productImage = product.listCoverImage + '@180w_100Q_1x.jpg';
                
	            if(productName.length > 11){
		    		 productName = productName.substring(0,10) + '...';
		    	}
	            var isNewArrival = '';
	            if(product.isNewArrival){
	            	isNewArrival = '<span>NEW</span>';
	            }
	            var showMarktPrice = '';
	            if(product.price != product.marketPrice){
	            	showMarktPrice = '- <del style="color:#9a9a9a">'+currency(product.marketPrice,true)+'</del>';
	            }
	            nextPageHtml = nextPageHtml + '<li class="favouriteProductList"><i onClick="deleteFavourite('+ product.id +')"></i><input type="hidden" id="productId" value="'+product.id+'"/><a href="' + contentUrl + '"><img datasrc="' + productImage + '" src="' + productImage + '" width="150"></a><span class="list_price"> ' + isNewArrival + productName + '</span><span class="list_price">'+currency(product.price,true) + showMarktPrice +'</span></li>';
            }
        }
    })
}; 

m$.myFavourite = {};
(function (window, m$, $, undefined) {
    var favouriteLazy = {
            proImgs: null,
            init: function(id,type) {
                if (!document.getElementById(id)) return false;
                this.proImgs = document.getElementById(id).getElementsByTagName('img');
                if (this.proImgs.length < 1) return false;
                for (var i = 0,
                j = this.proImgs.length; i < j; i++) {
                    this.proImgs[i].setAttribute('hasLazy', false);
                }
                this.show($(window).scrollTop(), $(window).height());
                window.onscroll = function() {
                    var scrollTop = $(window).scrollTop();
                    var screenHeight = $(window).height();
                    if (id == 'listBox') {
                        if (scrollbarLocation < scrollTop) {
                            if (nextPageHtml != '') {
                                if (($('#pageLoading').offset().top - scrollTop - screenHeight) < 10) {
                                    $('#pageLoading').before(nextPageHtml);
                                    nextPageHtml = '';
                                    pageParams.pageNumber += 1;
                                    if (pageParams.pageNumber <= pageParams.pageCount) {
                                    	getFavouriteProductList(listUrl, pageParams.pageNumber);
                                        scrollbarLocation = scrollTop;
                                    } else {
                                    	$('#pageLoading .loading').css('display', 'none');
                                    }
                                }
                            }
                        }
                    }
                    m$.myFavourite.favouriteLazy.show(scrollTop, screenHeight);
                }
            },
            show: function(scrollTop, screenHeight) {
                for (var i = 0; i < this.proImgs.length; i++) {
                    if (!this.proImgs[i].hasLazy) {
                        if (($(this.proImgs[i]).offset().top - scrollTop - screenHeight) < 200) {
                            this.proImgs[i].setAttribute('src', this.proImgs[i].getAttribute('datasrc'));
                            this.proImgs[i].setAttribute('hasLazy', true); 
                            (function(i) {
                            	m$.myFavourite.favouriteLazy.proImgs[i].onload = function() {
                            		m$.myFavourite.favouriteLazy.proImgs[i].style.opacity = 1;
                                    $(m$.myFavourite.favouriteLazy.proImgs[i]).next('.loading').detach();
                                }
                            })(i);
                        }
                    }
                }
            }
        }
    m$.myFavourite.favouriteLazy = favouriteLazy;
})(window, m$, $);