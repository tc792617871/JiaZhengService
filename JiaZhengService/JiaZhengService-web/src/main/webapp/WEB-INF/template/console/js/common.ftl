/*
 * Copyright 2012-2014 福州盛云软件技术有限公司.com.cn. All rights reserved.
 * Support: http://www.福州盛云软件技术有限公司.com.cn
 * License: http://www.福州盛云软件技术有限公司.com.cn/license
 * 
 * JavaScript - Common
 * Version: 3.0
 */

var preschoolEdu = {
	base: "${base}",
	locale: "${locale}"
};

var setting = {
	priceScale: "${setting.priceScale}",
	priceRoundType: "${setting.priceRoundType}",
	currencySign: "${setting.currencySign}",
	currencyUnit: "${setting.currencyUnit}",
	uploadImageExtension: "${setting.uploadImageExtension}",
	uploadFlashExtension: "${setting.uploadFlashExtension}",
	uploadMediaExtension: "${setting.uploadMediaExtension}",
	uploadFileExtension: "${setting.uploadFileExtension}",
	kineditorSite:"${setting.kineditorSite}"
};

var messages = {
	"console.message.success": "${message("console.message.success")}",
	"console.message.error": "${message("console.message.error")}",
	"console.dialog.ok": "${message("console.dialog.ok")}",
	"console.dialog.cancel": "${message("console.dialog.cancel")}",
	"console.dialog.deleteConfirm": "${message("console.dialog.deleteConfirm")}",
	"console.dialog.clearConfirm": "${message("console.dialog.clearConfirm")}",
	"console.browser.title": "${message("console.browser.title")}",
	"console.browser.upload": "${message("console.browser.upload")}",
	"console.browser.parent": "${message("console.browser.parent")}",
	"console.browser.orderType": "${message("console.browser.orderType")}",
	"console.browser.name": "${message("console.browser.name")}",
	"console.browser.size": "${message("console.browser.size")}",
	"console.browser.type": "${message("console.browser.type")}",
	"console.browser.select": "${message("console.browser.select")}",
	"console.upload.sizeInvalid": "${message("console.upload.sizeInvalid")}",
	"console.upload.typeInvalid": "${message("console.upload.typeInvalid")}",
	"console.upload.invalid": "${message("console.upload.invalid")}",
	"console.validate.required": "${message("console.validate.required")}",
	"console.validate.email": "${message("console.validate.email")}",
	"console.validate.url": "${message("console.validate.url")}",
	"console.validate.date": "${message("console.validate.date")}",
	"console.validate.dateISO": "${message("console.validate.dateISO")}",
	"console.validate.pointcard": "${message("console.validate.pointcard")}",
	"console.validate.number": "${message("console.validate.number")}",
	"console.validate.digits": "${message("console.validate.digits")}",
	"console.validate.minlength": "${message("console.validate.minlength")}",
	"console.validate.maxlength": "${message("console.validate.maxlength")}",
	"console.validate.rangelength": "${message("console.validate.rangelength")}",
	"console.validate.min": "${message("console.validate.min")}",
	"console.validate.max": "${message("console.validate.max")}",
	"console.validate.range": "${message("console.validate.range")}",
	"console.validate.accept": "${message("console.validate.accept")}",
	"console.validate.equalTo": "${message("console.validate.equalTo")}",
	"console.validate.remote": "${message("console.validate.remote")}",
	"console.validate.integer": "${message("console.validate.integer")}",
	"console.validate.positive": "${message("console.validate.positive")}",
	"console.validate.negative": "${message("console.validate.negative")}",
	"console.validate.decimal": "${message("console.validate.decimal")}",
	"console.validate.pattern": "${message("console.validate.pattern")}",
	"console.validate.extension": "${message("console.validate.extension")}",
	"console.dialog.archivedFirm":"${message("console.dialog.archivedFirm")}",
	"console.attendance.status.normal":"${message("console.attendance.status.normal")}",
	"console.attendance.status.late":"${message("console.attendance.status.late")}",
	"console.attendance.status.early":"${message("console.attendance.status.early")}",
	"console.attendance.status.leave":"${message("console.attendance.status.leave")}",
	"console.attendance.sunday":"${message("console.attendance.sunday")}",
	"console.attendance.monday":"${message("console.attendance.monday")}",
	"console.attendance.tuesday":"${message("console.attendance.tuesday")}",
	"console.attendance.wednesday":"${message("console.attendance.wednesday")}",
	"console.attendance.thursday":"${message("console.attendance.thursday")}",
	"console.attendance.friday":"${message("console.attendance.friday")}",
	"console.attendance.saturday":"${message("console.attendance.saturday")}",
	"console.attendance.morning":"${message("console.attendance.morning")}",
	"console.attendance.noon":"${message("console.attendance.noon")}",
	"console.attendance.afternoon":"${message("console.attendance.afternoon")}",
	"console.attendance.night":"${message("console.attendance.night")}",
	"console.attendance.IC":"${message("console.attendance.IC")}",
	"console.attendance.QR":"${message("console.attendance.QR")}",
	"console.attendance.BAR":"${message("console.attendance.BAR")}",
	"console.OperatingSystem.android":"${message("console.OperatingSystem.android")}",
	"console.OperatingSystem.ios":"${message("console.OperatingSystem.ios")}",
	"console.OperatingSystem.hybird":"${message("console.OperatingSystem.hybird")}",
	"console.OperatingSystem.hbuilder":"${message("console.OperatingSystem.hbuilder")}",
	"upload.image.error":"${message("upload.image.error")}"
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

	var zIndex = 1600;
	
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

	// 对话框
	$.dialog = function(options) {
		var settings = {
			width: 320,
			height: "auto",
			modal: true,
			ok: message("console.dialog.ok"),
			cancel: message("console.dialog.cancel"),
			onShow: null,
			onClose: null,
			onOk: null,
			onCancel: null
		};
		$.extend(settings, options);
		
		if (settings.content == null) {
			return false;
		}
		
		var $dialog = $('<div class="xxDialog"><\/div>');
		var $dialogTitle;
		var $dialogClose = $('<div class="dialogClose"><\/div>').appendTo($dialog);
		var $dialogContent;
		var $dialogBottom;
		var $dialogOk;
		var $dialogCancel;
		var $dialogOverlay;
		if (settings.title != null) {
			$dialogTitle = $('<div class="dialogTitle"><\/div>').appendTo($dialog);
		}
		if (settings.type != null) {
			$dialogContent = $('<div class="dialogContent dialog' + settings.type + 'Icon"><\/div>').appendTo($dialog);
		} else {
			$dialogContent = $('<div class="dialogContent"><\/div>').appendTo($dialog);
		}
		if (settings.ok != null || settings.cancel != null) {
			$dialogBottom = $('<div class="dialogBottom"><\/div>').appendTo($dialog);
		}
		if (settings.ok != null) {
			$dialogOk = $('<input type="button" class="btn btn-primary" value="' + settings.ok + '" \/>').appendTo($dialogBottom);
		}
		if (settings.cancel != null) {
			$dialogCancel = $('<input type="button" style="margin-left:3px;"class="btn btn-white" value="' + settings.cancel + '" \/>').appendTo($dialogBottom);
		}
		if (!window.XMLHttpRequest) {
			$dialog.append('<iframe class="dialogIframe"><\/iframe>');
		}
		$dialog.appendTo("body");
		if (settings.modal) {
			$dialogOverlay = $('<div class="dialogOverlay"><\/div>').insertAfter($dialog);
		}
		
		var dialogX;
		var dialogY;
		if (settings.title != null) {
			$dialogTitle.text(settings.title);
		}
		$dialogContent.html(settings.content);
		$dialog.css({"width": settings.width, "height": settings.height, "margin-left": - parseInt(settings.width / 2), "z-index": zIndex ++});
		dialogShow();
		
		if ($dialogTitle != null) {
			$dialogTitle.mousedown(function(event) {
				$dialog.css({"z-index": zIndex ++});
				var offset = $(this).offset();
				if (!window.XMLHttpRequest) {
					dialogX = event.clientX - offset.left;
					dialogY = event.clientY - offset.top;
				} else {
					dialogX = event.pageX - offset.left;
					dialogY = event.pageY - offset.top;
				}
				$("body").bind("mousemove", function(event) {
					$dialog.css({"top": event.clientY - dialogY, "left": event.clientX - dialogX, "margin": 0});
				});
				return false;
			}).mouseup(function() {
				$("body").unbind("mousemove");
				return false;
			});
		}
		
		if ($dialogClose != null) {
			$dialogClose.click(function() {
				dialogClose();
				return false;
			});
		}
		
		if ($dialogOk != null) {
			$dialogOk.click(function() {
				if (settings.onOk && typeof settings.onOk == "function") {
					if (settings.onOk($dialog) != false) {
						dialogClose();
					}
				} else {
					dialogClose();
				}
				return false;
			});
		}
		
		if ($dialogCancel != null) {
			$dialogCancel.click(function() {
				if (settings.onCancel && typeof settings.onCancel == "function") {
					if (settings.onCancel($dialog) != false) {
						dialogClose();
					}
				} else {
					dialogClose();
				}
				return false;
			});
		}
		
		function dialogShow() {
			if (settings.onShow && typeof settings.onShow == "function") {
				if (settings.onShow($dialog) != false) {
					$dialog.show();
					$dialogOverlay.show();
				}
			} else {
				$dialog.show();
				$dialogOverlay.show();
			}
		}
		function dialogClose() {
			if (settings.onClose && typeof settings.onClose == "function") {
				if (settings.onClose($dialog) != false) {
					$dialogOverlay.remove();
					$dialog.remove();
				}
			} else {
				$dialogOverlay.remove();
				$dialog.remove();
			}
		}
		return $dialog;
	}

	// 文件浏览
	$.fn.extend({
		browser: function(options) {
			var settings = {
				type: "image",
				title: message("console.browser.title"),
				isUpload: true,
				browserUrl: preschoolEdu.base + "/console/file/browser.ct",
				uploadUrl: preschoolEdu.base + "/console/file/upload.ct",
				callback: null
			};
			$.extend(settings, options);
			
			var token = getCookie("token");
			var cache = {};
			return this.each(function() {
				var browserFrameId = "browserFrame" + (new Date()).valueOf() + Math.floor(Math.random() * 1000000);
				var $browserButton = $(this);
				$browserButton.click(function() {
					var $browser = $('<div class="xxBrowser"><\/div>');
					var $browserBar = $('<div class="browserBar"><\/div>').appendTo($browser);
					var $browserFrame;
					var $browserForm;
					var $browserUploadButton;
					var $browserUploadInput;
					var $browserParentButton;
					var $browserOrderType;
					var $browserLoadingIcon;
					var $browserList;
					if (settings.isUpload) {
						$browserFrame = $('<iframe id="' + browserFrameId + '" name="' + browserFrameId + '" style="display: none;"><\/iframe>').appendTo($browserBar);
						$browserForm = $('<form action="' + settings.uploadUrl + '" method="post" encType="multipart/form-data" target="' + browserFrameId + '"><input type="hidden" name="token" value="' + token + '" \/><input type="hidden" name="fileType" value="' + settings.type + '" \/><\/form>').appendTo($browserBar);
						$browserUploadButton = $('<a href="javascript:;" class="browserUploadButton button">' + message("console.browser.upload") + '<\/a>').appendTo($browserForm);
						$browserUploadInput = $('<input type="file" name="file" \/>').appendTo($browserUploadButton);
					}
					$browserParentButton = $('<a href="javascript:;" class="button">' + message("console.browser.parent") + '<\/a>').appendTo($browserBar);
					$browserBar.append(message("console.browser.orderType") + ": ");
					$browserOrderType = $('<select name="orderType" class="browserOrderType"><option value="name">' + message("console.browser.name") + '<\/option><option value="size">' + message("console.browser.size") + '<\/option><option value="type">' + message("console.browser.type") + '<\/option><\/select>').appendTo($browserBar);
					$browserLoadingIcon = $('<span class="loadingIcon" style="display: none;">&nbsp;<\/span>').appendTo($browserBar);
					$browserList = $('<div class="browserList"><\/div>').appendTo($browser);
	
					var $dialog = $.dialog({
						title: settings.title,
						content: $browser,
						width: 470,
						modal: true,
						ok: null,
						cancel: null
					});
					
					browserList("/");
					
					function browserList(path) {
						var key = settings.type + "_" + path + "_" + $browserOrderType.val();
						if (cache[key] == null) {
							$.ajax({
								url: settings.browserUrl,
								type: "GET",
								data: {fileType: settings.type, orderType: $browserOrderType.val(), path: path},
								dataType: "json",
								cache: false,
								beforeSend: function() {
									$browserLoadingIcon.show();
								},
								success: function(data) {
									createBrowserList(path, data);
									cache[key] = data;
								},
								complete: function() {
									$browserLoadingIcon.hide();
								}
							});
						} else {
							createBrowserList(path, cache[key]);
						}
					}
					
					function createBrowserList(path, data) {
						var browserListHtml = "";
						$.each(data, function(i, fileInfo) {
							var iconUrl;
							var title;
							if (fileInfo.isDirectory) {
								iconUrl = preschoolEdu.base + "/resources/console/images/folder_icon.gif";
								title = fileInfo.name;
							} else if (new RegExp("^\\S.*\\.(jpg|jpeg|bmp|gif|png)$", "i").test(fileInfo.name)) {
								iconUrl = fileInfo.url;
								title = fileInfo.name + " (" + Math.ceil(fileInfo.size / 1024) + "KB, " + new Date(fileInfo.lastModified).toLocaleString() + ")";
							} else {
								iconUrl = preschoolEdu.base + "/resources/console/images/file_icon.gif";
								title = fileInfo.name + " (" + Math.ceil(fileInfo.size / 1024) + "KB, " + new Date(fileInfo.lastModified).toLocaleString() + ")";
							}
							browserListHtml += '<div class="browserItem"><img src="' + iconUrl + '" title="' + title + '" url="' + fileInfo.url + '" isDirectory="' + fileInfo.isDirectory + '" \/><div>' + fileInfo.name + '<\/div><\/div>';
						});
						$browserList.html(browserListHtml);
						
						$browserList.find("img").bind("click", function() {
							var $this = $(this);
							var isDirectory = $this.attr("isDirectory");
							if (isDirectory == "true") {
								var name = $this.next().text();
								browserList(path + name + "/");
							} else {
								var url = $this.attr("url");
								if (settings.input != null) {
									settings.input.val(url);
								} else {
									$browserButton.prev(":text").val(url);
								}
								if (settings.callback != null && typeof settings.callback == "function") {
									settings.callback(url);
								}
								$dialog.next(".dialogOverlay").andSelf().remove();
							}
						});
						
						if (path == "/") {
							$browserParentButton.unbind("click");
						} else {
							var parentPath = path.substr(0, path.replace(/\/$/, "").lastIndexOf("/") + 1);
							$browserParentButton.unbind("click").bind("click", function() {
								browserList(parentPath);
							});
						}
						$browserOrderType.unbind("change").bind("change", function() {
							browserList(path);
						});
					}
					
					$browserUploadInput.change(function() {
						var allowedUploadExtensions;
						if (settings.type == "flash") {
							allowedUploadExtensions = setting.uploadFlashExtension;
						} else if (settings.type == "media") {
							allowedUploadExtensions = setting.uploadMediaExtension;
						} else if (settings.type == "file") {
							allowedUploadExtensions = setting.uploadFileExtension;
						} else {
							allowedUploadExtensions = setting.uploadImageExtension;
						}
						if ($.trim(allowedUploadExtensions) == "" || !new RegExp("^\\S.*\\.(" + allowedUploadExtensions.replace(/,/g, "|") + ")$", "i").test($browserUploadInput.val())) {
							$.message("warn", message("console.upload.typeInvalid"));
							return false;
						}
						$browserLoadingIcon.show();
						$browserForm.submit();
					});
					
					$browserFrame.load(function() {
						var text;
						var io = document.getElementById(browserFrameId);
						if(io.contentWindow) {
							text = io.contentWindow.document.body ? io.contentWindow.document.body.innerHTML : null;
						} else if(io.contentDocument) {
							text = io.contentDocument.document.body ? io.contentDocument.document.body.innerHTML : null;
						}
						if ($.trim(text) != "") {
							$browserLoadingIcon.hide();
							var data = $.parseJSON(text);
							if (data.message.type == "success") {
								if (settings.input != null) {
									settings.input.val(data.url);
								} else {
									$browserButton.prev(":text").val(data.url);
								}
								if (settings.callback != null && typeof settings.callback == "function") {
									settings.callback(data.url);
								}
								cache = {};
								$dialog.next(".dialogOverlay").andSelf().remove();
							} else {
								$.message(data.message);
							}
						}
					});
					
				});
			});
		}
	});

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
			$.message("warn", "${message("console.login.accessDenied")}");
			setTimeout(function() {
				location.reload(true);
			}, 2000);
		} else if (loginStatus == "unauthorized") {
			$.message("warn", "${message("console.unauthorized.message")}");
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

// 令牌
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

});

/**
 * 合并单元格 
 * @tableId  表格对象
 * @tableColIndex 列索引
 */ 
function tableRowSpan(tableId,tableColIndex){  
        tableFirstTd = "";  
        tableCurrentTd = "";  
        tableSpanNum = 0;  
        tableObj = $(tableId + " tr td:nth-child(" + tableColIndex + ")");  
        tableObj.each(function(i){  
           if(i == 0){  
               tableFirstTd = $(this);  
               tableSpanNum = 1;  
           }else{  
               tableCurrentTd = $(this); 
               if(tableFirstTd.text()==tableCurrentTd.text()){  
                   tableSpanNum++;  
                   tableCurrentTd.remove(); 
                   tableFirstTd.attr("rowSpan",tableSpanNum);  
               }else{  
                   tableFirstTd = $(this);  
                   tableSpanNum = 1;  
               }  
           }  
       });   
   }  
   
/**
 * 合并单元格 (支持多列单元格合并)
 * @tbl  表格对象
 * @beginRow 开始行
 * @endRow 结束行
 * @colIdxes 需要合并的列
 */ 
function mergeSameCell(tbl,beginRow,endRow,colIdxes){
	var colIdx = colIdxes[0];
	var newColIdxes = colIdxes.concat();
	newColIdxes.splice(0,1)
	var delRows = new Array();
	var rs = tbl.rows;
	//endRow为0的时候合并到最后一行，小于0时表示最后有-endRow行不合并
	if(endRow === 0){
		endRow = rs.length - 1;
	}else if(endRow < 0){
		endRow = rs.length - 1 + endRow;
	}
	var rowSpan = 1; //要设置的rowSpan的值
	var rowIdx = beginRow; //要设置rowSpan的cell行下标
	var cellValue; //存储单元格里面的内容
	for(var i=beginRow; i<= endRow + 1; i++){
		if(i === endRow + 1){//过了最后一行的时候合并前面的单元格
			if(newColIdxes.length > 0){
				mergeSameCell(tbl,rowIdx,endRow,newColIdxes);
			}
			rs[rowIdx].cells[colIdx].rowSpan = rowSpan;
		}else{
			var cell = rs[i].cells[colIdx];
			if(i === beginRow){//第一行的时候初始化各个参数
				cellValue = cell.innerHTML;
				rowSpan = 1;
				rowIdx = i;
			}else if(cellValue != cell.innerHTML){//数据改变合并前面的单元格
				cellValue = cell.innerHTML;
				if(newColIdxes.length > 0){
					mergeSameCell(tbl,rowIdx,i - 1,newColIdxes);
				}
				rs[rowIdx].cells[colIdx].rowSpan = rowSpan;
				rowSpan = 1;
				rowIdx = i;
			}else if(cellValue === cell.innerHTML){//数据和前面的数据重复的时候删除单元格
				rowSpan++;
				delRows.push(i);
			}
		}
	}
	for(var j=0;j<delRows.length; j++){
		rs[delRows[j]].deleteCell(colIdx);
	}
}
 
/*加载上传控件*/
function loadUploadify($imageUpload,$imagePreview,$image){
    $imageUpload.uploadify({  
        'successTimeout' : 50000,
        'height'        : 27,   
        'width'         : 80,    
        'buttonText'    : '浏览',  
        'swf'           : '${base}/resources/console/uploadify/uploadify.swf',  
        'uploader'      : '${base}/console/file/upload.ct?fileType=image',  
        'auto'          : true,
        'multi'          : true, //是否支持多文件上传  
	    'simUploadLimit' : 1, //一次同步上传的文件数目     
	    'sizeLimit'      : 19871202, //设置单个文件大小限制     
	    'queueSizeLimit' : 1, //队列中同时存在的文件个数限制
	    'fileObjName'    :  'file',
	    'fileTypeDesc'  :  '*.jpg;*.gif;*.jpeg;*.png;*.bmp',//图片选择描述  
        'fileTypeExts'  :  '*.jpg;*.gif;*.jpeg;*.png;*.bmp',//允许的格式      
        'formData'      : {'token' : getCookie("token") },
        //上传成功  
        'onUploadSuccess' : function(file, data, response) {  
            var dataJson = JSON.parse(data);
            var contentImgFileUrl = dataJson['url'];
            var messageContent = dataJson['message']['content'];
            var messageType = dataJson['message']['type'];
            if(messageType == 'success'){
	            $imagePreview.attr("src",contentImgFileUrl);
	            $image.val(contentImgFileUrl);
            }else{
                $.message("warn", messageContent);
            }
        },
	    onError: function(event, queueID, fileObj) {     
	        alert("文件:" + fileObj.name + "上传失败");     
	    }
    });
}