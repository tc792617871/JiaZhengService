var cookie = function(name, value, options) {
	if (typeof value != 'undefined') {
		options = options || {};
		if (value === null) {
			value = '';
			options.expires = -1;
		}
		var expires = '';
		if (options.expires
				&& (typeof options.expires == 'number' || options.expires.toUTCString)) {
			var date;
			if (typeof options.expires == 'number') {
				date = new Date();
				date.setTime(date.getTime()
						+ (options.expires * 24 * 60 * 60 * 1000));
			} else {
				date = options.expires;
			}
			expires = '; expires=' + date.toUTCString();
		}
		var path = options.path ? '; path=' + (options.path) : '';
		var domain = options.domain ? '; domain=' + (options.domain) : '';
		var secure = options.secure ? '; secure' : '';
		document.cookie = [ name, '=', encodeURIComponent(value), expires,
				path, domain, secure ].join('');
	} else {
		var cookieValue = null;
		if (document.cookie && document.cookie != '') {
			var cookies = document.cookie.split(';');
			for (var i = 0; i < cookies.length; i++) {
				var cookie = jQuery.trim(cookies[i]);
				if (cookie.substring(0, name.length + 1) == (name + '=')) {
					cookieValue = decodeURIComponent(cookie
							.substring(name.length + 1));
					break;
				}
			}
		}
		return cookieValue;
	}
}, t$ = function(b) {
	var a = typeof b == "string" ? document.getElementById(b) : b;
	if (a != null) {
		return a;
	} else {
	}
	return null;
}, c$ = function(a) {
	return document.createElement(a);
}, detectMobile = function() {
	var agent = navigator.userAgent || navigator.vendor || window.opera;
	if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i
			.test(agent)
			|| /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i
					.test(agent.substr(0, 4)))
		return true
	else
		return false;
}, trim = function(h) {
	try {
		return h.replace(/^\s+|\s+$/g, "");
	} catch (j) {
		return h;
	}
}, subStitute = function(str, obj) {
	if (!(Object.prototype.toString.call(str) === '[object String]')) {
		return '';
	}
	if (!(Object.prototype.toString.call(obj) === '[object Object]' && 'isPrototypeOf' in obj)) {
		return str;
	}
	return str.replace(/\{([^{}]+)\}/g, function(match, key) {
		var value = obj[key];
		return (value !== undefined) ? '' + value : '';
	});
};
var domainName = window.location.hostname.substring(window.location.hostname
		.indexOf('.')), href = window.location.href, place = '', place = (typeof (__at) != 'undefined') ? __at
		: '', direction = function(dom) {
	var startX, startY, directionY, directionX;
	dom.addEventListener('touchstart', function(e) {
		var touch = e.touches[0];
		var x = Number(touch.pageX);
		var y = Number(touch.pageY);
		startX = x;
		startY = y;
		direction = '';
	});
	dom.addEventListener('touchmove', function(e) {
		var touch = e.touches[0];
		var x = Number(touch.pageX);
		var y = Number(touch.pageY);
		if ((y - startY) > 30)
			directionY = 'down';
		else if ((y - startY) < -30)
			directionY = 'up';
		if ((x - startX) > 30)
			directionX = 'right';
		else if ((x - startX) < -30)
			directionX = 'left';
		if (directionX && directionY) {
			if ((directionX == 'right') && (directionY == 'down')) {
				if ((x - startX) > (y - startY))
					direction = 'right';
				else
					direction = 'down';
			} else if ((directionX == 'right') && (directionY == 'up')) {
				if ((x - startX) > (0 - y - startY))
					direction = 'right';
				else
					direction = 'up';
			} else if ((directionX == 'left') && (directionY == 'down')) {
				if ((0 - x - startX) > (y - startY))
					direction = 'left';
				else
					direction = 'down';
			} else if ((directionX == 'left') && (directionY == 'up')) {
				if ((0 - x - startX) > (0 - y - startY))
					direction = 'left';
				else
					direction = 'up';
			}
		} else if (!directionY)
			direction = directionX;
		else if (!directionX)
			direction = directionY;
		else
			direction = '';
	})
}, m$ = {};
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
		isApp = (agent.indexOf('iPhone') >= 0 || agent.indexOf('iPod') >= 0 || agent
				.indexOf('iPad') >= 0)
				&& agent.substr(agent.indexOf('Mobile/')).indexOf(' ') < 0;
	}
})();

// 判断是否包含
function contains(array, values) {
	var contains = true;
	for (i in values) {
		if ($.inArray(values[i], array) < 0) {
			contains = false;
			break;
		}
	}
	return contains;
}

(function(window, m$, $, undefined) {
	var login = {
		loginSubmit : function(redirectUrl) {
			var $loginForm = $("#loginForm");
			var $username = $("#username");
			var $password = $("#password");
			var $loginSubmit = $("#loginSubmit");
			var $openId = $("#openId");
			if (!$username.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '登录账号不能为空'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$password.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '密码不能为空'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			$.ajax({
				url : jiazhengservice.base + "/mobile/common/public_key.jhtml",
				type : "GET",
				dataType : "json",
				cache : false,
				beforeSend : function() {
					$loginSubmit.prop("disabled", true);
				},
				success : function(data) {
					var rsaKey = new RSAKey();
					rsaKey.setPublic(b64tohex(data.modulus),
							b64tohex(data.exponent));
					var enPassword = hex2b64(rsaKey.encrypt($password
							.val()));
					$.ajax({
						url : $loginForm.attr("action"),
						type : "POST",
						data : {
							username : $username.val(),
							enPassword : enPassword,
							openId : $openId.val()
						},
						dataType : "json",
						cache : false,
						success : function(message) {
							$loginSubmit.prop("disabled", false);
							if (message.type == "success") {
								if (redirectUrl) {
									location.href = redirectUrl;
								} else {
									location.href = jiazhengservice.base
											+ "/mobile/member/index.jhtml";
								}
							} else {
								m$.ui.dialog.dialogShow(
									{
										'title' : '提示',
										'content' : message['content']
									},[{
											'text' : '忘记密码？',
											'func' : function() {
												document.location.href = jiazhengservice.base + '/mobile/login/forgetPwd.jhtml';
											}
										},
										{
											'text' : '确定'
									}]);
							}
						}
					});
				},
				complete : function() {
					$loginSubmit.prop("disabled", false);
				}
			});
		}
	}, cart = {
		goods : null,
		initShow : false,
		linkPosition : {},
		cartShowTimer : null,
		cids : {
			'num' : 1
		},
		currCid : {
			'cid' : null,
			'size' : null,
			'num' : null
		},
		readReady : false,
		stateRead : false,
		addCart : function(specificationValuesSize, $currentProductId) {
			var $specificationValue = $(".sys_item_specpara li");
			var $specificationsTitle = $(".specificationsTitle");
			var specificationValueIds = new Array();
			$specificationValue.filter(".selected").each(function(i) {
				specificationValueIds[i] = $(this).attr("data-aid");
			});
			if (specificationValueIds.length != specificationValuesSize) {
				$specificationsTitle.show();
				return false;
			} else {
				$specificationsTitle.hide();
			}
			var $quantity = $("#quantity");
			var quantity = $quantity.val();
			if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
				$.ajax({
					url : jiazhengservice.base + "/cart/add.jhtml",
					type : "POST",
					data : {
						id : $currentProductId.val(),
						quantity : quantity
					},
					dataType : "json",
					cache : false,
					success : function(message) {
						if (message['type'] == 'success') {
							m$.ui.dialog
									.dialogShow(
											{
												'title' : '成功加入购物袋',
												'content' : message['content']
											},
											[
													{
														'text' : '确定'
													},
													{
														'text' : '结算',
														'func' : function() {
															document.location.href = jiazhengservice.base
																	+ '/mobile/cart/index.jhtml';
														}
													} ]);
						} else {
							m$.ui.dialog.dialogShow({
								'title' : '提示',
								'content' : message['content']
							}, [ {
								'text' : '确定'
							} ]);
						}

					}
				});
			} else {
				m$.ui.dialog.dialogShow({
					'title' : '遇到错误',
					'content' : '购买数量必须为正整数'
				}, [ {
					'text' : '确定'
				} ]);
			}
		},
		deleteCartItem : function(cartItemId) {
			m$.ui.dialog.dialogShow({
				'title' : '提示',
				'content' : '确定要删除吗？'
			}, [ {
				'text' : '取消'
			}, {
				'text' : '确定',
				'func' : function() {
					$.ajax({
						url : jiazhengservice.base + "/mobile/cart/delete.jhtml",
						type : "POST",
						data : {
							id : cartItemId
						},
						dataType : "json",
						cache : false,
						success : function(data) {
							location.reload();
						},
						complete : function() {
							location.reload();
						}
					});
				}
			} ]);
			return false;
		},
		increase : function() {
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
		decrease : function() {
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
		submitCart : function() {
			if (!$.checkLogin()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '必须登录后才能提交订单'
				}, [ {
					'text' : '确定',
					'func' : function() {
						$.redirectLogin(jiazhengservice.base
								+ "/mobile/cart/index.jhtml");
					}
				} ]);
				return false;
			} else {
				window.location = jiazhengservice.base
						+ '/mobile/member/order/info.jhtml';
			}
		},
		submitOrderInfo : function() {
			var $orderForm = $("#orderForm");
			var $receiverId = $("#receiverId");
			var $paymentPluginId = $("#paymentPluginId");
			var $cartItemIds = $("#cartItemIds");
			var $productId = $("#productId");
			var $specificationId = $("#specificationId");
			var $quantity = $("#quantity");
			var $weekdays = $("#weekdays");
			var $timearea = $("#timearea");
			var $time = $("#time");
			var $areaSquare = $("#areaSquare");
			var $memo = $("#memo");
			var $code = $("#code");
			if (!$receiverId.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请选择收货信息'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$paymentPluginId.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请选择支付方式'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$weekdays.val() || !$timearea.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请选择服务时间'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if ($areaSquare.length > 0 && !$areaSquare.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入房屋面积'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			$.ajax({
				url : $orderForm.attr("action"),
				type : "POST",
				data : {
					receiverId : $receiverId.val(),
					paymentPluginId : $paymentPluginId.val(),
					cartItemIds : $cartItemIds.val(),
					productId : $productId.val(),
					specificationId : $specificationId.val(),
					quantity : $quantity.val(),
					weekdays : $weekdays.val(),
					timearea : $timearea.val(),
					time : $time.val(),
					areaSquare : $areaSquare.val(),
					memo : $memo.val(),
					code : $code.val()
				},
				dataType : "json",
				cache : false,
				success : function(message) {
					if (message.type == "success") {
						window.location = jiazhengservice.base
								+ '/mobile/member/order/payment.jhtml?sn='
								+ message['content'];
					} else {
						m$.ui.dialog.dialogShow({
							'title' : '提示',
							'content' : message['content']
						}, [ {
							'text' : '确定',
							'func' : function() {
								window.location = jiazhengservice.base
										+ '/mobile/member/cart/index.jhtml';
							}
						} ]);
					}
				}
			});
		},
		cancel : function(orderSn) {
			m$.ui.dialog
					.dialogShow(
							{
								'title' : '提示',
								'content' : '您确定要取消该订单吗？'
							},
							[
									{
										'text' : '取消'
									},
									{
										'text' : '确定',
										'func' : function() {
											$.ajax({
												url : jiazhengservice.base
														+ "/mobile/member/order/applyForRefund.jhtml?sn="
														+ orderSn,
												type : "POST",
												dataType : "json",
												cache : false,
												success : function(
														message) {
													if (message.type == "success") {
														location
																.reload(true);
													} else {
														m$.ui.dialog
																.dialogShow(
																		{
																			'title' : '提示',
																			'content' : message['content']
																		},
																		[ {
																			'text' : '确定'
																		} ]);
													}
												}
											});
										}
									} ]);
			return false;
		},
		addAddress : function(receiverModifyAreaSpan, areaSelects) {
			var $receiverFormAdd = $("#receiverFormAdd");
			var $address = $receiverFormAdd.find("input[name='address']");
			var $consignee = $receiverFormAdd.find("input[name='consignee']");
			var $phone = $receiverFormAdd.find("input[name='phone']");
			for (var i = 0; i < areaSelects.length; i++) {
				if (!areaSelects[i].value) {
					m$.ui.dialog.dialogShow({
						'title' : '提示',
						'content' : "请选择所在地区"
					}, [ {
						'text' : '确定'
					} ]);
					return false;
				}
			}
			if (!$address.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : "请填写寄送地址"
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$consignee.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : "请填写收货人"
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$phone.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : "请填写电话"
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}

			$.ajax({
				url : jiazhengservice.base + "/mobile/member/submitNewAddress.jhtml",
				type : "post",
				data : $receiverFormAdd.serialize(),
				dataType : "json",
				cache : false,
				async : false,
				success : function(message) {
					if (message.type == "success") {
						$.ajax({
							url : jiazhengservice.base + "/mobile/member/myReceiverList.jhtml",
							type : "post",
							dataType : "json",
							cache : false,
							async : false,
							success : function(data) {
								var templateHtml = '<li dataid="$RECEIVERID">'
									+'<a href="javascript:;">'
										+'<table>'
				            				+'<tr>'
				                				+'<td>'
				                    				+'<label for="receiverConsignee">收件人:</label>'
														+'<span id="receiverConsignee">$RECEIVERCONSIGNEE</span>'
				                				+'</td>'
				            				+'</tr>'
				            				+'<tr>'
				                				+'<td>'
				                    				+'<label for="receiverPhone">手机号码:</label>'
				                    					+'<span id="receiverPhone">$RECEIVERPHONE</span>'
												+'</td>'
			            					+'</tr>'
				            				+'<tr>'
				                				+'<td>'
				                    				+'<label for="receiverAddress">地址:</label>'
				                    					+'<span id="receiverAddress">$RECEIVERADDRESS</span>'
				                				+'</td>'
				            				+'</tr>'
			            					+'<tr>'
				                				+'<td>'
				                    				+'<label for="receiverZipCode">邮编:</label>'
														+'<span id="receiverZipCode">$RECEIVERZIPCODE</span>'
				                				+'</td>'
				            				+'</tr>'
				         				+'</table>'
									+'</a>'
									+'<i></i>'
								+'</li>';
								var receivers = data.receivers;
								var html = '';
								receivers.forEach(function(receiver){  
									var item = templateHtml.replace("$RECEIVERID",receiver.id).replace("$RECEIVERCONSIGNEE",receiver.consignee).replace("$RECEIVERPHONE",receiver.phone).replace("$RECEIVERADDRESS",receiver.areaName + receiver.address).replace("$RECEIVERZIPCODE",receiver.zipCode);
									html += item;  
								});
								$("ul.receiverEntry").html(html);
							}
						});
					} else {
						m$.ui.dialog.dialogShow({
							'title' : '提示',
							'content' : message.content
						}, [ {
							'text' : '确定'
						} ]);
					}
					$("#addReceiverModal").find("button.md-close").click();
				}
			});
		},
		// 点击数
		hits : function(productId) {
			$.ajax({
				url : jiazhengservice.base + "/product/wapHits/" + productId + ".jhtml",
				type : "GET"
			});
		},
		fill : function(asyType, fillData) {
			var cartNum = cookie('cart_num');
			if (cartNum == null) {
				var asyType = asyType || false;
				if (fillData)
					var fillData = fillData;
				else
					var fillData = true;
				this.getData(asyType, fillData);
			} else {
				$('#bag').html(cartNum);
			}
		},
		favorites : function(productId) {
			var username = getCookie('username');
			if (username) {
				$.ajax({
					url : jiazhengservice.base
							+ "/mobile/member/productAddFavorite.jhtml",
					type : "GET",
					data : {
						id : productId
					},
					dataType : "json",
					cache : false,
					success : function(message) {
						m$.ui.dialog.dialogShow({
							'title' : '提示',
							'content' : message.content
						}, [ {
							'text' : '确定'
						} ]);
					}
				});
			} else {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '必须登录后才能收藏商品'
				}, [ {
					'text' : '确定',
					'func' : function() {
						$.redirectLogin(jiazhengservice.base
								+ "/mobile/product/content.jhtml?productId="
								+ productId);
					}
				} ]);
				return false;
			}
		}
	}, product = {
		clearfilterSelected : function() {
			$(".filterProduct").each(function() {
				var $this = $(this);
				var $filterProduct = $this.find("a");
				$filterProduct.removeClass("filterSelected");
			});
		},
		submitProductFilter : function() {
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
			pageParams.isNewArrival = $newArrivalFilter
					.hasClass("filterSelected");
			pageParams.isBestSeller = $baseSellerFilter
					.hasClass("filterSelected");
			pageParams.isPromotion = $promotionFilter
					.hasClass("filterSelected");

			for (var i = 0; i < $salesVolumeFilter.length; i++) {
				var $this = $salesVolumeFilter[i];
				if ($this.className == "filterSelected") {
					pageParams.salesValumeOrderBy = $this.getAttribute('val');
					break;
				}
			}

			for (var i = 0; i < $yearFilter.length; i++) {
				var $this = $yearFilter[i];
				if ($this.className == "filterSelected") {
					pageParams.yearOrderBy = $this.getAttribute('val');
					break;
				}
			}

			var productCatagoryIds = [];
			for (var i = 0; i < $productCategoryFilter.length; i++) {
				var $this = $productCategoryFilter[i];
				if ($this.className == "filterSelected") {
					productCatagoryIds.push($this.getAttribute('val'));
				}
			}
			pageParams.productCatagoryIds = productCatagoryIds.toString();

			var colorIds = [];
			for (var i = 0; i < $colorFilter.length; i++) {
				var $this = $colorFilter[i];
				if ($this.className == "filterSelected") {
					colorIds.push($this.getAttribute('val'));
				}
			}
			pageParams.colorIds = colorIds.toString();

			var prices = [];
			for (var i = 0; i < $priceFilter.length; i++) {
				var $this = $priceFilter[i];
				if ($this.className == "filterSelected") {
					prices.push($this.getAttribute('val'));
				}
			}
			pageParams.prices = prices.toString();

			var sizeIds = [];
			for (var i = 0; i < $sizeFilter.length; i++) {
				var $this = $sizeFilter[i];
				if ($this.className == "filterSelected") {
					sizeIds.push($this.getAttribute('val'));
				}
			}
			pageParams.sizeIds = sizeIds.toString();

			for (var i = 0; i < $priceOrderByFilter.length; i++) {
				var $this = $priceOrderByFilter[i];
				if ($this.className == "filterSelected") {
					pageParams.priceOrderBy = $this.getAttribute('val');
					break;
				}
			}

			$moMobileContent.hide();
			var listParam = getListParam(pageParams, 'filter');
			$.ajax({
				url : listUrl + listParam,
				dataType : 'json',
				cache : false,
				async : false,
				success : function(data) {
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
								$('#pageLoading .loading').css('display',
										'none');
							}
						}
						m$.ui.lazy.init('listBox', 'filter');
					} else {
						var favListHTML = '';
						favListHTML += '<span>';
						favListHTML += message("未找到符合结果");
						favListHTML += '</span>';
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
		html : '{msg}',
		init : function() {
			this.div = c$('div');
			this.div.className = 'pop_box';
			this.div.id = 'popBox';
			document.body.appendChild(this.div);
		},
		show : function(msg, param) {
			if (!m$.ui.msgBox.div)
				m$.ui.msgBox.init();
			m$.ui.msgBox.div.innerHTML = subStitute(m$.ui.msgBox.html, {
				'msg' : msg
			});
			var winH = document.documentElement.clientHeight;
			var winW = $(window).width();
			var winL = parseInt(winW / 2) - 60;
			var popBottom = parseInt(winH / 2) - 120;
			$('#popBox')
					.css(
							{
								'bottom' : popBottom + 'px',
								'left' : winL + 'px',
								'-webkit-transform' : 'scale3d(1, 1, 1)',
								'-webkit-transition' : '-webkit-transform 0s ease-in-out, bottom 0s ease-in-out, left 0s ease-in-out'
							});
			$('#popBar').css('bottom', 0);
			winL = winL + 160;
			setTimeout(
					"$('#popBox').css({'bottom': '-90px', 'left' : '"
							+ winL
							+ "px', '-webkit-transform':'scale3d(0.4, 0.4, 0.4)', '-webkit-transition':'-webkit-transform 0.9s ease-in-out, bottom 0.7s ease-in-out, left 0.7s ease-in-out'})",
					1000);
			setTimeout("$('#popBar').css('bottom','-30px')", 5000);
		}
	}, dialog = {
		dialogShow : function(param, btns) {
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
				for (var i = 0; i < btns.length; i++) {
					(function(i, b) {
						var bt = document.createElement('span');
						bt.innerHTML = btns[i].text;
						if (btns[i].func) {
							bt.onclick = function() {
								if (btns[i].obj) {
									btns[i].func.apply(btns[i].obj,
											btns[i].args);
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
					document.getElementById('dialogBtns').className = 'dialog_btn dialog_btn_'
							+ btns.length;
				}
			}
		},
		dialogClose : function() {
			var dg = document.getElementById('dialogFrame');
			if (dg) {
				document.body.removeChild(dg);
			}
		}
	}, rollpic = {
		roll : function(i, act, moveX) {
			var move = true;
			var totalNum = $('#proBigPic li').size();
			var movePx = (i * -320) + moveX;
			if ((act == 'right') && (i < 0))
				move = false;
			else if ((act == 'left') && (i > totalNum - 1))
				move = false;
			else if ((movePx >= 0) && (act == 'right'))
				move = false;
			else if ((movePx <= (totalNum - 1) * -320) && (act == 'left'))
				move = false;
			if (move == true) {
				$('.show_box').css({
					'bottom' : '-250px',
					'opacity' : 0
				});
				$('.show_box').removeClass('active');
				$('#rollPageBox span').removeClass('active');
				if (!moveX) {
					$('#rollPageBox').children().eq(i).addClass('active');
					var moveToI = '-' + (i * 320) + 'px';
					$('#proBigPic').css({
						'-webkit-transition-duration' : '0.2s',
						'left' : moveToI
					});
					picLocalNum = i;
					this.imgShow(i);
				} else {
					if (act == 'left') {
						this.imgShow(i);
					}
					$('#proBigPic').css({
						'-webkit-transition-duration' : '0s',
						'left' : ((i * -320) + moveX) + 'px'
					});
				}
			}
		},
		imgShow : function(i) {
			var proImgs = document.getElementById('proBigPic')
					.getElementsByTagName('img');
			if (!proImgs[i].hasLazy) {
				proImgs[i].setAttribute('src', proImgs[i]
						.getAttribute('datasrc'));
				proImgs[i].setAttribute('hasLazy', true);
			}
		}
	}, lazy = {
		proImgs : null,
		init : function(id, type) {
			if (!document.getElementById(id))
				return false;
			this.proImgs = document.getElementById(id).getElementsByTagName(
					'img');
			if (this.proImgs.length < 1)
				return false;
			for (var i = 0, j = this.proImgs.length; i < j; i++) {
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
								var listParam = getListParam(pageParams, type);
								if (pageParams.pageNumber <= pageParams.pageCount) {
									getList(listUrl, listParam, false);
									scrollbarLocation = scrollTop;
								} else {
									$('#pageLoading .loading').css('display',
											'none');
								}
							}
						}
					}
				}
				m$.ui.lazy.show(scrollTop, screenHeight);
			}
		},
		show : function(scrollTop, screenHeight) {
			for (var i = 0; i < this.proImgs.length; i++) {
				if (!this.proImgs[i].hasLazy) {
					if (($(this.proImgs[i]).offset().top - scrollTop - screenHeight) < 200) {
						this.proImgs[i].setAttribute('src', this.proImgs[i]
								.getAttribute('datasrc'));
						this.proImgs[i].setAttribute('hasLazy', true);
						(function(i) {
							m$.ui.lazy.proImgs[i].onload = function() {
								m$.ui.lazy.proImgs[i].style.opacity = 1;
								$(m$.ui.lazy.proImgs[i]).next('.loading')
										.detach();
							}
						})(i);
					}
				}
			}
		}
	}, tranAct = {
		even : true,
		detailInfo : function() {
			document.getElementById('fullscreen').style.height = (document.documentElement.clientHeight)
					+ 'px';
			document.getElementById('fullscreen').style.background = 'none';
			document.getElementById('infoBox').style.height = (document.documentElement.clientHeight - 128)
					+ 'px';
		},
		timedCount : function(floatDiv, topTop) {
			var t;
			floatDiv.css({
				'top' : floatDiv.css('top') + 1
			});
			if (topTop > 0 - floatDiv.css('top'))
				t = setTimeout("timedCount()", 1);
			else
				clearTimeout(t)
		},
		imageShow : function(id) {
			var img = document.getElementById(id).getElementsByTagName('img');
			for (var i = 0; i < img.length; i++) {
				(function(i) {
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
	}, fixed = {
		fixedWatch : function(el) {
			if (document.activeElement.nodeName == 'INPUT') {
				el.css('position', 'static');
			} else {
				el.css('position', 'fixed');
			}
		},
		fixedTop : function(el) {
			if (document.activeElement.nodeName == 'INPUT') {
				el.css('position', 'static');
			} else {
				el.css('position', 'fixed');
			}
		},
		fixedBody : function(el) {
			if (document.activeElement.nodeName == 'INPUT') {
				el.css('margin-top', '0px');
			} else {
				el.css('margin-top', '51px');
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
		proImgs : null,
		init : function(id, type) {
			if (!document.getElementById(id))
				return false;
			this.proImgs = document.getElementById(id).getElementsByTagName(
					'img');
			if (this.proImgs.length < 1)
				return false;
			for (var i = 0, j = this.proImgs.length; i < j; i++) {
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
								var listParam = getListParam(pageParams, type);
								if (pageParams.pageNumber <= pageParams.pageCount) {
									getOrderList(listUrl, listParam, false);
									scrollbarLocation = scrollTop;
								} else {
									$('#pageLoading .loading').css('display',
											'none');
								}
							}
						}
					}
				}
				m$.myAccount.lazyLoadOrder.show(scrollTop, screenHeight);
			}
		},
		show : function(scrollTop, screenHeight) {
			for (var i = 0; i < this.proImgs.length; i++) {
				if (!this.proImgs[i].hasLazy) {
					if (($(this.proImgs[i]).offset().top - scrollTop - screenHeight) < 200) {
						this.proImgs[i].setAttribute('src', this.proImgs[i]
								.getAttribute('datasrc'));
						this.proImgs[i].setAttribute('hasLazy', true);
						(function(i) {
							m$.myAccount.lazyLoadOrder.proImgs[i].onload = function() {
								m$.myAccount.lazyLoadOrder.proImgs[i].style.opacity = 1;
								$(m$.myAccount.lazyLoadOrder.proImgs[i]).next(
										'.loading').detach();
							}
						})(i);
					}
				}
			}
		},
		confirmOrder : function(orderItemId, sn) {
			m$.ui.dialog
					.dialogShow(
							{
								'title' : '提示',
								'content' : '确认收货吗?'
							},
							[
									{
										'text' : '取消',
									},
									{
										'text' : '确定',
										'func' : function() {

											$.ajax({
												url : jiazhengservice.base
														+ "/member/order/confirmReceiver.jhtml?orderItemId="
														+ orderItemId
														+ "&sn=" + sn,
												type : "GET",
												dataType : "json",
												cache : false,
												success : function(
														message) {
													if (message.type == "success") {
														location
																.reload(true);
													} else {
														m$.ui.dialog
																.dialogShow(
																		{
																			'title' : '提示',
																			'content' : message.content
																		},
																		[ {
																			'text' : '确定'
																		} ]);
													}
												}
											});
										}
									} ]);
		},
		applyForRefund : function(sn) {
			m$.ui.dialog
					.dialogShow(
							{
								'title' : '您的订单即将发货，发货请按取消',
								'content' : '原因：<select class="applyForRefundSelect" id="applyForRefundSelect"></select>'
							},
							[
									{
										'text' : '取消',
									},
									{
										'text' : '确定',
										'func' : function() {
											var $refuseReasonId = $(
													"#refuseReasonId").val();
											$.ajax({
												url : jiazhengservice.base
														+ "/mobile/member/order/applyForRefund.jhtml",
												type : "POST",
												dataType : "json",
												data : {
													sn : sn,
													refuseReasonId : $refuseReasonId
												},
												cache : false,
												success : function(
														message) {
													if (message.type == "success") {
														m$.ui.dialog
																.dialogShow(
																		{
																			'title' : '申请退款请求成功',
																			'content' : '将在3－5个工作日内，处理您的退款订单'
																		},
																		[ {
																			'text' : '确定',
																			'func' : function() {
																				location
																						.reload(true);
																			}
																		} ]);
													} else {
														m$.ui.dialog
																.dialogShow(
																		{
																			'title' : '提示',
																			'content' : message.content
																		},
																		[ {
																			'text' : '确定'
																		} ]);
													}
												}
											});
										}
									} ]);

			$.ajax({
				url : jiazhengservice.base + "/common/refuseReason.jhtml",
				type : "get",
				dataType : "json",
				data : {
					type : 1
				},
				cache : false,
				success : function(data) {
					var $applyForRefundSelect = $("#applyForRefundSelect");
					$applyForRefundSelect.empty();
					$.each(data, function(value, name) {
						$applyForRefundSelect.append("<option value='" + value
								+ "'>" + name + "</option>");
					});
				}
			});

		},
		returnGoodsApply : function(orderId) {
			window.location = jiazhengservice.base
					+ '/mobile/member/order/parcelList.jhtml?orderId='
					+ orderId;
		},
		returnGoodsHistory : function(sn) {
			window.location = jiazhengservice.base
					+ '/mobile/member/order/returnsGoodsHistory.jhtml?sn=' + sn;
		},
		//
		submitReturnsGoods : function(sn) {
			var $refundReason = $("#refundReason").val();
			var $refundQuantitys = $(".returnsGoodsList .defaultSelect");
			var count = 0;
			var len = $refundQuantitys.length
			for (var i = 0; i < len; i++) {
				var qty = $refundQuantitys[i].value;
				if (qty == 0) {
					count += 1;
				}
				if (len == count) {
					m$.ui.dialog
							.dialogShow(
									{
										'title' : '提示',
										'content' : '\u7533\u8bf7\u9000\u8d27\u6570\u91cf\u4e0d\u80fd\u5168\u90e8\u7b49\u4e8e0'
									}, [ {
										'text' : '确定'
									} ]);
					return false;
				}
			}
			if (!$refundReason) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请选择退货原因'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			$.ajax({
				url : jiazhengservice.base
						+ "/mobile/member/order/submitReturnsGoods.jhtml",
				type : "POST",
				data : $('#returnsGoodsForm').serialize(),
				cache : false,
				success : function(message) {
					if (message.type == "success") {
						m$.ui.dialog.dialogShow({
							'title' : '申请退货请求成功',
							'content' : '将在3－5个工作日内，处理您的退货订单'
						}, [ {
							'text' : '确定',
							'func' : function() {
								location.reload(true);
							}
						} ]);
					} else {
						m$.ui.dialog.dialogShow({
							'title' : '提示',
							'content' : message.content
						}, [ {
							'text' : '确定'
						} ]);
					}
				}
			});

		}
	},

	modifyAddress = {
		deleteConfirm : function(id) {
			m$.ui.dialog.dialogShow({
				'title' : '提示',
				'content' : '确认删除?'
			}, [ {
				'text' : '取消',
			}, {
				'text' : '确定',
				'func' : function() {
					m$.myAccount.modifyAddress.deleteAddress(id);
				}

			} ]);
		},
		deleteAddress : function(id) {
			if (id == '') {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请选择删除的地址！'
				}, [ {
					'text' : '确定'
				} ]);
			} else {
				$.ajax({
					url : jiazhengservice.base
							+ "/mobile/member/deletesendAddress.jhtml",
					type : "POST",
					data : {
						id : id
					},
					cache : false,
					success : function(message) {
						if (message.type == "success") {
							location.reload();
						} else {
							m$.ui.dialog.dialogShow({
								'title' : '提示',
								'content' : message.content
							}, [ {
								'text' : '确定'
							} ]);
						}
					}
				});
			}
		},
		addAddress : function(receiverModifyAreaSpan, areaSelects) {
			var $address = $("#address");
			var $consignee = $("#consignee");
			var $zipCode = $("#zipCode");
			var $phone = $("#phone");
			for (i = 0; i < areaSelects.length; i++) {
				if (!areaSelects[i].value) {
					m$.ui.dialog.dialogShow({
						'title' : '提示',
						'content' : "请选择所在地区"
					}, [ {
						'text' : '确定'
					} ]);
					return false;
				}
			}
			if (!$address.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写寄送地址'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$consignee.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写收件人'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$phone.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写电话'
				}, [ {
					'text' : '确定'
				} ]);
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
				url : jiazhengservice.base + "/mobile/member/submitNewAddress.jhtml",
				type : "post",
				data : $("#receiverFormModify").serialize(),
				dataType : "json",
				cache : false,
				async : false,
				success : function(message) {
					if (message.type == "success") {
						setTimeout(function() {
							window.location = jiazhengservice.base + "/mobile/member/sendAddress.jhtml";
						}, 1000);
					} else {
						m$.ui.dialog.dialogShow({
							'title' : '提示',
							'content' : message.content
						}, [ {
							'text' : '确定'
						} ]);
					}
				}
			});
		},
		editAddress : function(receiverModifyAreaSpan, areaSelects) {
			var $address = $("#address");
			var $consignee = $("#consignee");
			var $zipCode = $("#zipCode");
			var $phone = $("#phone");
			for (i = 0; i < areaSelects.length; i++) {
				if (!areaSelects[i].value) {
					m$.ui.dialog.dialogShow({
						'title' : '提示',
						'content' : "请选择所在地区"
					}, [ {
						'text' : '确定'
					} ]);
					return false;
				}
			}
			if (!$address.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写寄送地址'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$consignee.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写收件人'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$phone.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写电话'
				}, [ {
					'text' : '确定'
				} ]);
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
				url : jiazhengservice.base + "/mobile/member/updateAddress.jhtml",
				type : "post",
				data : $("#receiverFormModify").serialize(),
				dataType : "json",
				cache : false,
				async : false,
				success : function(message) {
					if (message.type == "success") {
						window.location.href = jiazhengservice.base
								+ "/mobile/member/sendAddress.jhtml";
					} else {
						m$.ui.dialog.dialogShow({
							'title' : '提示',
							'content' : message.content
						}, [ {
							'text' : '确定'
						} ]);
					}
				}
			});
		}
	}, changeEmail = {
		submit : function(password, newEmail, confirmEmail) {

			var emailRegular = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;

			if (!password) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入密码!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!newEmail) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入新邮件!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!emailRegular.test(newEmail)) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入正确的邮箱格式!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!confirmEmail) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入新邮件确认!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (newEmail != confirmEmail) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '两次邮件输入不一致！'
				}, [ {
					'text' : '确定'
				} ]);
				return false;

			} else {
				$.ajax({
					url : jiazhengservice.base + "/mobile/member/submitEmail.jhtml",
					type : "get",
					data : {
						password : password,
						newEmail : newEmail,
						confirmEmail : confirmEmail,
					},
					dataType : "json",
					cache : false,
					async : false,
					success : function(message) {
						if (message.type == "success") {
							m$.ui.dialog.dialogShow({
								'title' : '提示',
								'content' : '修改成功'
							}, [ {
								'text' : '确定',
								'func' : function() {
									window.location.href = jiazhengservice.base
											+ "/mobile/member/index.jhtml";
								}
							} ]);
						} else {
							m$.ui.dialog.dialogShow({
								'title' : '提示',
								'content' : message.content
							}, [ {
								'text' : '确定'
							} ]);
						}
					}
				});
			}
		}
	}, changePhoneNum = {
		submit : function(password, newPhoneNum, confirmPhoneNum) {

			var mobileRegular = /1[3-8]+\d{9}/;

			if (!password) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入密码!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!newPhoneNum) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入新手机号码!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!mobileRegular.test(newPhoneNum)) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入正确的手机号码格式!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!confirmPhoneNum) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入手机号码确认!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (newPhoneNum != confirmPhoneNum) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '两次手机号码输入不一致！'
				}, [ {
					'text' : '确定'
				} ]);
				return false;

			} else {
				$.ajax({
					url : jiazhengservice.base + "/mobile/member/submitPhoneNum.jhtml",
					type : "get",
					data : {
						password : password,
						newPhoneNum : newPhoneNum,
						confirmPhoneNum : confirmPhoneNum,
					},
					dataType : "json",
					cache : false,
					async : false,
					success : function(message) {
						if (message.type == "success") {
							m$.ui.dialog.dialogShow({
								'title' : '提示',
								'content' : '修改成功'
							}, [ {
								'text' : '确定',
								'func' : function() {
									window.location.href = jiazhengservice.base
											+ "/mobile/member/index.jhtml";
								}
							} ]);
						} else {
							m$.ui.dialog.dialogShow({
								'title' : '提示',
								'content' : message.content
							}, [ {
								'text' : '确定'
							} ]);
						}
					}
				});
			}
		}
	}, changePasssword = {
		show : function(oldPassword, newPassword, confirmPassword) {
			if (!oldPassword) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入原始密码!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!newPassword) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请输入新密码!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!confirmPassword) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请再次输入新密码!'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (newPassword != confirmPassword) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '两次密码输入不一致！'
				}, [ {
					'text' : '确定'
				} ]);
				return false;

			} else {
				$.ajax({
					url : jiazhengservice.base + "/mobile/member/submitPassword.jhtml",
					type : "get",
					data : {
						oldPassword : oldPassword,
						newPassword : newPassword,
						confirmPassword : confirmPassword,
					},
					dataType : "json",
					cache : false,
					async : false,
					success : function(message) {
						if (message.type == "success") {
							m$.ui.dialog.dialogShow({
								'title' : '提示',
								'content' : '修改成功'
							}, [ {
								'text' : '确定',
								'func' : function() {
									window.location.href = jiazhengservice.base
											+ "/mobile/member/index.jhtml";
								}
							} ]);
						} else {
							m$.ui.dialog.dialogShow({
								'title' : '发送失败',
								'content' : message.content
							}, [ {
								'text' : '确定'
							} ]);
						}
					}
				});
			}
		}
	}, contact = {
		sendContactUs : function() {
			var title = $("#store_select_txt_provice").text();
			var content = $("#content").val();
			if (title == '请选择') {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请选择主题！'
				}, [ {
					'text' : '确定'
				} ]);
				return false;

			} else if (content == '') {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写内容！'
				}, [ {
					'text' : '确定'
				} ]);
				return false;

			} else {
				$.ajax({
					url : jiazhengservice.base + "/mobile/member/sendContactUs.jhtml",
					type : "get",
					data : {
						title : title,
						content : content
					},
					dataType : "json",
					cache : false,
					async : false,
					success : function(message) {
						if (message.type == "success") {
							m$.ui.dialog.dialogShow({
								'title' : '提示',
								'content' : '发送成功'
							}, [ {
								'text' : '确定',
								'func' : function() {
									window.location.href = jiazhengservice.base
											+ "/mobile/member/index.jhtml";
								}
							} ]);
						} else {
							m$.ui.dialog.dialogShow({
								'title' : '发送失败',
								'content' : message.content
							}, [ {
								'text' : '确定'
							} ]);
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

m$.header = {};
(function(window, m$, $, undefined) {
	var titleContent = {
		setTitle : function(title) {
			var titleHTML = '';
			titleHTML += '<h2 class="header_title">';
			titleHTML += title;
			titleHTML += '</h2>';
			$('#headerTitleContent').after(titleHTML);
		}
	}
	m$.header.titleContent = titleContent;
})(window, m$, $);

m$.register = {};
(function(window, m$, $, undefined) {
	var registerUser = {
		submit : function() {
			var $registerForm = $("#registerForm");
			var $email = $("#email");
			var $password = $("#password");
			var $confirmPsd = $("#confirmPsd");
			var $name = $("#name");
			var $address = $("#address");
			var $mobile = $("#mobile");
			var mobileRegular = /1[3-8]+\d{9}/;
			var $validateCode = $("#validateCode");
			var openid = $("#openId").val();

			if (!$mobile.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写手机号码'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!mobileRegular.test($mobile.val())) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '手机号码格式不正确'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			/*if (!$validateCode.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写验证码'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}*/
			if (!$password.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写密码'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$confirmPsd.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写确认密码'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if ($password.val() != $confirmPsd.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '两次密码不同'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$name.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写姓名'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			/*var orgsafeKeyExpireTime = cookie('safeKeyExpireTime');
			var today = new Date();
			if (orgsafeKeyExpireTime < today.getTime()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '验证码已过期'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			var orgValidateCode = cookie('validateCode');
			if (orgValidateCode != $validateCode.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '验证码错误'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}*/
			$.ajax({
				url : jiazhengservice.base + "/mobile/common/public_key.jhtml",
				type : "GET",
				dataType : "json",
				cache : false,
				success : function(data) {
					var rsaKey = new RSAKey();
					rsaKey.setPublic(b64tohex(data.modulus),b64tohex(data.exponent));
					var enPassword = hex2b64(rsaKey.encrypt($password.val()));
					$.ajax({
						url : $registerForm.attr("action"),
						type : "POST",
						data : {
							password : $password.val(),
							email : $email.val(),
							name : $name.val(),
							address : $address.val(),
							mobile : $mobile.val(),
							openId : openid
						},
						dataType : "json",
						cache : false,
						success : function(message) {
							if (message.type == "success") {
								m$.ui.dialog.dialogShow(
									{
										'title' : '提示',
										'content' : message.content
									},[ {
										'text' : '确定',
										'func' : function() {
											location.href = jiazhengservice.base
													+ "/mobile/login/index.jhtml";
										}
									} ]);
							} else {
								m$.ui.dialog.dialogShow({
									'title' : '提示',
									'content' : message.content
								}, [ {
									'text' : '确定'
								} ]);
							}
						}
					});
				}
			});
		},
		getRegisterValidateCode : function(second) {
			var $mobile = $("#mobile");
			var $getValidateCode = $("#getValidateCode");
			if ($mobile.val()) {
				var mobielRegex = /1[3-8]+\d{9}/;
				if (mobielRegex.test($mobile.val())) {
					if (second > 0) {
						if (second == 60) {
							$.ajax({
								url : jiazhengservice.base
										+ "/mobile/register/getRegisterValidateCode.jhtml",
								type : "GET",
								dataType : "json",
								data : {
									mobile : $mobile.val()
								},
								cache : false,
								success : function(data) {
									if (data.msg == "success") {
										cookie('validateCode',
												data.validateCode);
										cookie('safeKey',
												data.safeKey);
										cookie('safeKeyExpireTime',
												data.safeKeyExpireTime);
										cookie('phoneNumber',
												$mobile.val());
										$getValidateCode.attr(
												'disabled', "true");
										$mobile.attr('disabled',
												"true");
									} else {
										m$.ui.dialog.dialogShow({
											'title' : '提示',
											'content' : data.msg
										}, [ {
											'text' : '确定'
										} ]);
										second = 0;
										$getValidateCode
												.removeAttr('disabled');
										$mobile
												.removeAttr('disabled');
										$getValidateCode.text("获取验证码");
									}
								}
							});
						}
						second--;
						$getValidateCode.text(second + "s后重新获取");
						setTimeout(function() {
							m$.register.registerUser.getRegisterValidateCode(second);
						}, 1000);
					} else {
						$getValidateCode.removeAttr('disabled');
						$mobile.removeAttr('disabled');
						$getValidateCode.text("获取验证码");
					}
				} else {
					m$.ui.dialog.dialogShow({
						'title' : '提示',
						'content' : '手机号码格式错误'
					}, [ {
						'text' : '确定'
					} ]);
					return false;
				}
			} else {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写手机号码'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
		},
		getValidateCode : function(second) {
			var $phoneNumber = $("#phoneNumber");
			var $getValidateCode = $("#getValidateCode");
			if ($phoneNumber.val()) {
				var mobielRegex = /1[3-8]+\d{9}/;
				if (mobielRegex.test($phoneNumber.val())) {
					if (second > 0) {
						if (second == 60) {
							$
									.ajax({
										url : jiazhengservice.base
												+ "/mobile/login/getValidateCode.jhtml",
										type : "GET",
										dataType : "json",
										data : {
											phoneNumber : $phoneNumber.val()
										},
										cache : false,
										success : function(data) {
											if (data.msg == "success") {
												cookie('validateCode',
														data.validateCode);
												cookie('phoneNumber',
														$phoneNumber.val());
												$getValidateCode.attr(
														'disabled', "true");
												$phoneNumber.attr('disabled',
														"true");
											} else {
												m$.ui.dialog.dialogShow({
													'title' : '提示',
													'content' : data.msg
												}, [ {
													'text' : '确定'
												} ]);
												second = 0;
												$getValidateCode
														.removeAttr('disabled');
												$phoneNumber
														.removeAttr('disabled');
												$getValidateCode.text("获取验证码");
											}
										}
									});
						}
						second--;
						$getValidateCode.text(second + "s后重新获取");
						setTimeout(function() {
							m$.register.registerUser.getValidateCode(second);
						}, 1000);
					} else {
						$getValidateCode.removeAttr('disabled');
						$phoneNumber.removeAttr('disabled');
						$getValidateCode.text("获取验证码");
					}
				} else {
					m$.ui.dialog.dialogShow({
						'title' : '提示',
						'content' : '手机号码格式错误'
					}, [ {
						'text' : '确定'
					} ]);
					return false;
				}
			} else {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写手机号码'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
		},
		forgetPwdNext : function() {
			var $validateCode = $("#validateCode");
			var $phoneNumber = $("#phoneNumber");
			if (!$phoneNumber.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写手机号码'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			if (!$validateCode.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '请填写验证码'
				}, [ {
					'text' : '确定'
				} ]);
				return false;
			}
			var orgValidateCode = cookie('validateCode');
			if (orgValidateCode != $validateCode.val()) {
				m$.ui.dialog.dialogShow({
					'title' : '提示',
					'content' : '验证码错误'
				}, [ {
					'text' : '确定'
				} ]);
			} else {
				location.href = jiazhengservice.base
						+ "/mobile/login/resetPwd.jhtml?phoneNumber="
						+ $phoneNumber.val() + '&validateCode='
						+ $validateCode.val();
			}
		}
	}
	m$.register.registerUser = registerUser;
})(window, m$, $);

function switchView(from, to) {
	$('#' + from).hide();
	$('#' + to).fadeIn();
}
/**
 * 序列化表单元素
 * @param config
 * @return json对象
 */
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name] !== undefined) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};
$.MsgBox = {
	alert : function(config) {
		var defaults = {
			title : '提示',//标题
			message : '',//显示内容
			callback : null,//回调函数
			left : null,//距容器左边的距离
			top : null
		//距容器上方的距离
		};
		var config = $.extend(defaults, config);
		$("#msgbox").remove();
		//设置消息体
		var html = '<div id="msgbox">';
		html += '<div id="msg_cover" ontouchmove="event.preventDefault()"></div>';
		html += '<div id="msg_content">';
		html += '<span id="msg_title">' + config.title + '</span>';
		html += '<div id="msg_msg">' + config.message + '</div>';
		html += '<div id="msg_btn_box" >';
		html += '<input type="button" value="确定" id="msg_btn_ok"/>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		$('body').append(html);
		//设置消息样式
		$('#msg_cover').css({
			width : '100%',
			height : '100%',
			'z-index' : '999999',
			position : 'fixed',
			filter : 'alpha(opacity=50)',
			'-moz-opacity' : '0.5',
			opacity : '0.5',
			background : '#000',
			top : '0',
			left : '0'
		});
		$('#msg_content').css({
			width : '260px',
			position : 'fixed',
			'z-index' : '9999999',
			background : '#fff',
			'border-radius' : '12px',
			'-moz-border-radius' : '12px',
			'-webkit-border-radius' : '12px',
			top : '100px'
		});
		$('#msg_title').css({
			display : 'block',
			'font-size' : '14px',
			color : '#444',
			padding : '10px 15px',
			background : '#ddd',
			'border-radius' : '12px 12px 0 0',
			'-moz-border-radius' : '12px 12px 0 0',
			'-webkit-border-radius' : '12px 12px 0 0',
			'border-bottom' : '3px solid #DC0404',
			'font-weight' : 'bold'
		});
		$('#msg_msg').css({
			padding : '20px',
			'line-height' : '20px',
			'border-bottom' : '1px dashed #ddd',
			'font-size' : '14px'
		});
		$('#msg_btn_box').css({
			margin : '10px 0px 5px 0px',
			'text-align' : 'center'
		});
		$('#msg_btn_ok').css({
			width : '85px',
			height : '30px',
			color : '#fff',
			border : 'none',
			background : '#E45959'
		});
		var _width = window.parent.document ? window.parent.document.body.clientWidth
				: document.body.clientWidth; //屏幕宽
		var _height = window.parent.document ? window.parent.document.body.clientHeight
				: document.body.clientHeight; //屏幕高
		var boxWidth = $("#msg_content").width();
		var boxHeight = $("#msg_content").height();
		$('#msg_content').css({
			top : (_height - boxHeight) / 2 + 'px',
			left : (_width - boxWidth) / 2 + 'px'
		});

		//设置按钮事件
		$('#msg_btn_ok').click(function() {
			$('#msgbox').hide();
		});
		if (config.callback != null) {
			$('#msg_btn_ok').click(function() {
				config.callback();
			});
		}

	},
	confirm : function(config) {
		var defaults = {
			title : '提示',//标题
			message : '',//显示内容
			callback : null,//回调函数
			cancelback : null,
			left : null,//距容器左边的距离
			top : null, //距容器上方的距离
			ok : '确定',
			cancel : '取消'
		};
		var config = $.extend(defaults, config);
		$("#msgbox").remove();
		//设置消息体
		var html = '<div id="msgbox">';
		html += '<div id="msg_cover" ontouchmove="event.preventDefault()"></div>';
		html += '<div id="msg_content">';
		html += '<span id="msg_title" >' + config.title + '</span>';
		html += '<div id="msg_msg">' + config.message + '</div>';
		html += '<div id="msg_btn_box" >';
		html += '<input type="button" value="确定" id="msg_btn_ok"/>';
		html += '<input type="button" value="取消" id="msg_btn_cancel"/>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		$('body').append(html);
		//设置消息样式
		$('#msg_cover').css({
			width : '100%',
			height : '100%',
			'z-index' : '999999',
			position : 'fixed',
			filter : 'alpha(opacity=50)',
			'-moz-opacity' : '0.5',
			opacity : '0.5',
			background : '#000',
			top : '0',
			left : '0'
		});
		$('#msg_content').css({
			width : '260px',
			position : 'fixed',
			'z-index' : '9999999',
			background : '#fff',
			'border-radius' : '12px',
			'-moz-border-radius' : '12px',
			'-webkit-border-radius' : '12px',
			top : '100px'
		});
		$('#msg_title').css({
			display : 'block',
			'font-size' : '14px',
			color : '#444',
			padding : '10px 15px',
			background : '#ddd',
			'border-radius' : '12px 12px 0 0',
			'-moz-border-radius' : '12px 12px 0 0',
			'-webkit-border-radius' : '12px 12px 0 0',
			'border-bottom' : '3px solid #DC0404',
			'font-weight' : 'bold'
		});
		$('#msg_msg').css({
			padding : '20px',
			'line-height' : '20px',
			'border-bottom' : '1px dashed #ddd',
			'font-size' : '14px'
		});
		$('#msg_btn_box').css({
			margin : '10px 0px 5px 0px',
			'text-align' : 'center'
		});
		$('#msg_btn_ok').css({
			width : '85px',
			height : '30px',
			color : '#fff',
			border : 'none',
			background : '#E45959'
		});
		$('#msg_btn_cancel').css({
			width : '85px',
			height : '30px',
			color : '#fff',
			border : 'none',
			background : '#ccc',
			'margin-left' : '20px'
		});
		var _width = window.parent.document ? window.parent.document.body.clientWidth
				: document.body.clientWidth; //屏幕宽
		var _height = window.parent.document ? window.parent.document.body.clientHeight
				: document.body.clientHeight; //屏幕高
		var boxWidth = $("#msg_content").width();
		var boxHeight = $("#msg_content").height();
		$('#msg_content').css({
			top : (_height - boxHeight) / 2 + 'px',
			left : (_width - boxWidth) / 2 + 'px'
		});
		//设置按钮事件
		$('#msg_btn_ok').val(config.ok);
		$('#msg_btn_cancel').val(config.cancel);
		$('#msg_btn_ok').click(function() {
			$('#msgbox').hide();
		});
		if (config.callback != null) {
			$('#msg_btn_ok').click(function() {
				config.callback();
			});
		}
		$('#msg_btn_cancel').click(function() {
			$('#msgbox').hide();
			if (config.cancelback != null) {
				config.cancelback();
			}
		});
	},
	toast : function(config) {//模仿android里面的Toast效果，主要是用于在不打断程序正常执行的情况下显示提示数据
		var defaults = {
			message : '',//显示内容
			time : 3000,//持续时间
			left : null,//距容器左边的距离
			top : null
		//距容器上方的距离
		};
		var config = $.extend(defaults, config);
		$("#toastMessage").remove();
		//设置消息体
		var html = '<div id="toastMessage" ><span >' + config.message
				+ '</span></div>';
		$('body').append(html);
		//设置消息样式
		var left = config.left == null ? $('body').width() / 2
				- $("#toastMessage").find('span').width() / 2 : config.left;
		var top = config.top == null ? '150px' : config.top;
		$("#toastMessage").css({
			display : 'none',
			position : 'fixed',
			top : top,
			'z-index' : '999999',
			left : left,
			'background-color' : 'black',
			color : 'white',
			'font-size' : '18px',
			padding : '10px',
			'border-radius' : '5px',
			'-moz-border-radius' : '5px',
			'-webkit-border-radius' : '5px',
			'text-shadow' : '0 0 0 #000'
		});
		//显示动画
		$("#toastMessage").fadeIn(config.time / 2);
		$("#toastMessage").fadeOut(config.time / 2);
	}
}
/**
 * loading 加载中。。。效果
 */
$.loader = {
	show : function(message) {
		message = message || '';//显示内容
		$("#loaderbox").remove();
		//设置消息体
		var html = '<div id="loaderbox" ontouchmove="event.preventDefault()">';
		html += '<div id="loadermsg">';
		html += '<img src="/wx/images/loader.gif" ><br>' + message;
		html += '</div>';
		html += '</div>';
		$('body').append(html);
		//设置消息样式
		$('#loaderbox').css({
			position : 'fixed',
			top : '0',
			left : '0',
			'z-index' : '99999',
			width : '100%',
			background : 'black',
			filter : 'alpha(opacity=60)',
			'-moz-opacity' : '0.6',
			opacity : '0.6'
		});
		$('#loadermsg').css({
			color : 'white',
			margin : '150px auto',
			width : '200px',
			'text-align' : 'center'
		});
		$('#loadermsg > img').css({
			width : '30px',
			height : '30px'
		});
		var _height = window.parent.document ? window.parent.document.body.clientHeight
				: document.body.clientHeight; //屏幕高
		$("#loaderbox").height(_height);
		var boxHeight = $("#loadermsg").height();
		$('#loadermsg').css({
			'margin-top' : (_height - boxHeight) / 2 + 'px'
		});
	},
	hide : function() {
		$('#loaderbox').hide();
	}
}
