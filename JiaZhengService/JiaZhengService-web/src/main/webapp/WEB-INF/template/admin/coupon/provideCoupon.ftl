<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.coupon.add")} - 家政服务平台</title>
<meta name="author" content="xxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript">

var notifyWays = new Array();
var memberRanks = new Array();

$().ready(function() {

	var $listForm = $("#listForm");
	var $listTable = $("#listTable");
	var $selectAll = $("#selectAll");
	var $ids = $("#listTable input[name='ids']");
	var $contentRow = $("#listTable tr:gt(0)");
	var $male = $("#male");
	var $female = $("#female");
	var $sexVal = $("#sexVal");
	var $message = $("#message");
	var $mail = $("#mail");
	var $notifyWays = $("#notifyWays");
	var $liveLocationAreaId = $("#liveLocationAreaId");
	var $sendSelect = $("#sendSelect");
	var $sendButton = $("#sendButton");
	var $searchSendButton = $("#searchSendButton");
	var $loading = $("#loading");
	var $reset = $("#reset");
	var $inputs4Checkbox = $("#filterTable input[type='checkbox']");
	[@flash_message /]
	
	// 全选
	$selectAll.click( function() {
		var $this = $(this);
		var $enabledIds = $("#listTable input[name='ids']:enabled");
		if ($this.prop("checked")) {
			$enabledIds.prop("checked", true);
			if ($enabledIds.filter(":checked").size() > 0) {
				$sendButton.removeClass("disabled");
				$contentRow.addClass("selected");
			} else {
				$sendButton.addClass("disabled");
			}
		} else {
			$enabledIds.prop("checked", false);
			$sendButton.addClass("disabled");
			$contentRow.removeClass("selected");
		}
	});
	
	// 选择
	$ids.click( function() {
		var $this = $(this);
		if ($this.prop("checked")) {
			$this.closest("tr").addClass("selected");
			$sendButton.removeClass("disabled");
		} else {
			$this.closest("tr").removeClass("selected");
			if ($("#listTable input[name='ids']:enabled:checked").size() > 0) {
				$sendButton.removeClass("disabled");
			} else {
				$sendButton.addClass("disabled");
			}
		}
	});
	
	//地区选择
	$liveLocationAreaId.lSelect({
		 url: "${base}/mobile/common/area.jhtml"
	});
	
	//设置选中的会员等级
	$inputs4Checkbox.each(function(){
	[#if memberRankIds ??]
		[#list memberRankIds as memberRankId]
			if($(this).attr("value") == ${memberRankId}){
				$(this).attr("checked",true);
			}
		[/#list]
	[/#if]
	});
	/** 点击性别radio给sexVal隐藏域赋值*/
	$male.click(function(){
		$sexVal.val($(this).attr("value")); 
	});
	
	$female.click(function(){
		$sexVal.val($(this).attr("value"));
	});
	
	/** 点击发送方式 多选框 给notifyWays数组初始化及给隐藏域赋值*/
	$message.click(function(){
		$this = $(this);
		if($this.prop("checked")){
			$this.attr("checked",true);
			notifyWays.push($this.attr("value"));
			$("#tr_"+$this.attr("id")).css("display","table-row");	
		}
		else{
			$this.attr("checked",false);
			notifyWays.pop($this.attr("value"));
			$("#"+$this.attr("id")+"_content").val("");
			$("#tr_"+$this.attr("id")).css("display","none");
		}
		$notifyWays.val(notifyWays); 
	});
	
	$mail.click(function(){
		$this = $(this);
		if($this.prop("checked")){
			$this.attr("checked",true);
			notifyWays.push($this.attr("value"));
			$("#tr_"+$this.attr("id")).css("display","table-row");	
		}
		else{
			$this.attr("checked",false);
			notifyWays.pop($this.attr("value"));
			$("#"+$this.attr("id")+"_content").val("");
			$("#tr_"+$this.attr("id")).css("display","none");
		}
		$notifyWays.val(notifyWays); 
	});
	
	/** 选择发送优惠券 */
	$sendButton.click(function(){
		var $this = $(this);
		if ($this.hasClass("disabled")) {
			return false;
		}
		var data = "";
		var $checkedIds = $("#listTable input[name='ids']:enabled:checked");
		var $number = $("#number");
		var $notifyWays = $("#notifyWays");
		var $message_content = $("#message_content");
		var $mail_content = $("#mail_content");
		if(!validateSendForm()){
			return false;
		}
		$loading.css("display","block");
		
		data = data + $checkedIds.serialize() + "&couponId=" + $("#couponId").val() + "&number=" + $number.val() + "&notifyWays=" + $notifyWays.val() + "&msgContent=" + $message_content.val() + "&mailContent=" + $mail_content.val();
		$.ajax({
				url: "${base}/admin/coupon/sendCouponToMember.jhtml",
				type: "GET",
				data:data,
				dataType: "json",
				cache: false,
				success: function(message) {
					$loading.css("display","none");
					$.message(message);
				}
			});
	});
	
	/** 搜索发送优惠券 */
	$searchSendButton.click(function(){
		$("form").attr("action","sendCouponToAllMember.jhtml");
		if(!validateSendForm()){
			return false;
		}
		$loading.css("display","block");
		$listForm.submit();
		$loading.css("display","none");
		$("form").attr("action","provideCoupon.jhtml");
	});
	
	// 发送优惠券鼠标飘过事件
	$sendSelect.mouseover( function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height()}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	//重置筛选区的所有输入框(hidden域、radio按钮、submit、reset按钮除外)
	$reset.click(function(){
		var $inputs4Text = $("#filterTable input[type='text']");
	    var $inputs4Checkbox = $("#filterTable input[type='checkbox']");
		$inputs4Checkbox.each(function(){
			if($(this).val()){
				$(this).attr("checked",false);
			}
		});
		$inputs4Text.each(function(){
			if($(this).val()){
				$(this).attr("value","");
			}
		});
	});
	
});

	/** 筛选区域表单验证 */
	function validateFilterForm(){
		var numReg = /^[0-9]*[1-9][0-9]*$/;
		var $pointFrom = $("#pointFrom");
		var $pointTo = $("#pointTo");
		var $amountFrom = $("#amountFrom");
		var $amountTo = $("#amountTo");
		
		if($pointFrom.val() && !numReg.test($pointFrom.val())){
			$.message("warn",message('输入的积分格式不对'));
			$pointFrom.focus();
			return false;
		}
		if($pointTo.val() && !numReg.test($pointTo.val())){
			$.message("warn",message('输入的积分格式不对'));
			$pointTo.focus();
			return false;
		}
		if($amountFrom.val() && !numReg.test($amountFrom.val())){
			$.message("warn",message('输入的消费金额格式不对'));
			$amountFrom.focus();
			return false;
		}
		if($amountTo.val() && !numReg.test($amountTo.val())){
			$.message("warn",message('输入的消费金额格式不对'));
			$amountTo.focus();
			return false;
		}
		return true;
	}
	
	/** 发送优惠券区域验证 */
	function validateSendForm(){
		var $number = $("#number");
		var $message_content = $("#message_content");
		var $mail_content = $("#mail_content");
		var $message = $("#message");
		var $mail = $("#mail");
		var numReg = /^[0-9]*[1-9][0-9]*$/;
		if(!$number.val()){
			$.message("warn",message('请输入发放数量'));
			$number.focus();
			return false;
		}
		if(!numReg.test($number.val())){
			$.message("warn",message('输入的数量格式不对'));
			$number.focus();
			return false;
		}
		if($message.prop("checked")){
			if(!$message_content.val()){
				$.message("warn",message('请输入发送短信内容'));
				$message_content.focus();
				return false;
			}
			else{
				var msg = $message_content.val();
				if(msg.length > 250){
					$.message("warn",message('请输入小于等于250字符'));
					$message_content.focus();
					return false;
				}
			}
		}
		if($mail.prop("checked")){
			if(!$mail_content.val()){
				$.message("warn",message('请输入邮件发送内容'));
				$mail_content.focus();
				return false;
			}
		}
		return true;
	}
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 站内发送优惠券
	</div>
	<form id="listForm" action="provideCoupon.jhtml" method="get" onsubmit="return validateFilterForm();">
		<fieldset style="border: 1px solid;-moz-border-radius:5px; padding:20px; margin:20px;">
			<legend  style="font-size:15pt;margin-left: 40px;">筛选区</legend>
			<center>
			<table id="filterTable" class="input">
				<tr>
					<th>
						${message("用户名")}:
					</th>
					<td>
						<input type="text" name="username" class="text" maxlength="200" value="${username}"/>
					</td>
					<th>
						${message("手机号码")}:
					</th>
					<td>
						<input type="text" name="mobile" class="text" maxlength="200" value="${mobile}"/>
					</td>
					<th>
						${message("姓名")}:
					</th>
					<td>
						<input type="text" name="name" class="text" maxlength="200" value="${name}"/>
					</td>
					<th>
						${message("注册时间")}:
					</th>
					<td>
						<input type="text" id="regDate" name="regDate" class="text Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});" value="${(regDate?string('yyyy-MM-dd'))!}"/>
					</td>
				</tr>
				<tr>
					<th>
						${message("区域")}:
					</th>
					<td colspan="3">
						<input type="hidden" id="liveLocationAreaId" name="liveLocation" value="${(liveLocation)!}" treePath="${(area.treePath)!}"/>
					</td>
					<th>
						${message("地址")}:
					</th>
					<td colspan="3">
						<input type="text" name="address" class="text" maxlength="200" value="${address}"/>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						${message("消费价格（区间）￥")}:
					</th>
					<td>
						开始
					</td>
					<td>
						<input type="text" id="amountFrom" name="amountFrom" class="text" maxlength="200" value="${amountFrom}"/>
					</td>
					<td>
						结束
					</td>
					<td>
						<input type="text" id="amountTo" name="amountTo" class="text" maxlength="200" value="${amountTo}"/>
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: right;">
						<input type="submit" class="button" id="chooseButton" value="${message("筛选")}"/>
					</td>
					<td colspan="4" style="text-align: left;">
						<input type="reset" class="button" id="reset" value="重置">
					</td>
				</tr>
			</table>
			</center>
		</fieldset>
		<table id="listTable" class="list">
			<input type="hidden" id="couponId" name="couponId" value="${couponId}"/>
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="username">${message("Member.username")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">${message("Member.name")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="mobile">${message("Member.mobile")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">${message("admin.common.createDate")}</a>
				</th>
			</tr>
			[#list content as member]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${member.id}" />
					</td>
					<td>
						${member.username}
					</td>
					<td>
						${member.name}
					</td>
					<td>
						${member.mobile}
					</td>
					<td>
						<span title="${member.createDate?string("yyyy-MM-dd HH:mm:ss")}">${member.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.current totalPages = page.total]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
		<table class="input">
			<tr>
				<th>
					发送数量：
				</th>
				<td>
					<input type="text" name="number" id="number" class="text" maxlength="200" value=""/>
				</td>
			</tr>
			<tr>
				<th>
					通知方式：
				</th>
				<td>
					<input type="hidden" id="notifyWays" name="notifyWays" value=""/>
					<input type="checkbox" name="message"  id="message" maxlength="200" value="0" /><label for="message">短信方式</label>
				</td>
			</tr>
			<tr style="display:none;" id="tr_message">
				<th>	
					短信内容：
				</th>
				<td>
					<input type="text" id="message_content" name="msgContent"  class="text" placeholder="请输入不超过250字的短信内容" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<div class="buttonWrap">
						<div class="menuWrap">
							<a href="javascript:;" id="sendSelect" class="iconButton" style="padding:0px 16px 0px 16px;">
								${message("发送优惠券")}<span class="arrow">&nbsp;</span>
							</a>
							<div class="popupMenu" style="width:150px">
								<ul id="exportOption">
									<li>
										<a href="javascript:;" id="sendButton" class="disabled" >
											${message("发送给当前选择会员")}
										</a>
									</li>
									<li>
										<a href="javascript:;" id="searchSendButton">
											${message("发送当前搜索结果集会员")}
										</a>
									</li>
								</ul>
							</div>
							<a href="javascript:;" class="button" onclick="location.href='list.jhtml'" style="margin-left:10px;">
								${message("admin.common.back")}
							</a>
							<div class="loading" style="margin-left: 180px;margin-top: 8px;">
								<img src="${base}/resources/admin/images/loading_icon.gif" alt="loading" id="loading" style="display:none;"/>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					&nbsp;
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
