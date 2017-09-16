<!DOCTYPE html> 
<html>
<head>
<title>邮件订阅</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no,width=320,target-densitydpi=142">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/mobile/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/mobile/js/mobile.js"></script>
<script type="text/javascript">
$().ready(function() {
        
        /**邮件订阅模块 checkBox 样式加载*/
		var $subscribeeCheckBoxGroup = $("#subscribeCheckBoxGroup");
		var $checkBoxes = $subscribeeCheckBoxGroup.find("input[type='checkbox']");
		$checkBoxes.each(function(){
			var $this = $(this);
			$this.click(function(){
				if ($this.attr("value") == "1"){
	                $this.attr("value", "0");
	                $this.attr("checked",false);
	                var id = $this.attr("id");
	                $("label[name='" + id + "']").attr("class","unconfirm"); 
	            }else{
	                $this.attr("value", "1"); 
	                $this.attr("checked",true);
	                var id = $this.attr("id");
	                $("label[name='" + id + "']").attr("class","confirm");
	            }
			});
		});
		
		var $subscribeAcceptCheckBoxGroup = $("#subscribeAcceptCheckBoxGroup");
		var $checkBox = $subscribeAcceptCheckBoxGroup.find("input[type='checkbox']");
		$checkBox.click(function(){
				if ($(this).attr("value") == "1"){
                $(this).attr("value", "0");
                $(this).attr("checked",false);
                var id = $(this).attr("id");
                $("label[name='" + id + "']").attr("class","unconfirm"); 
	            }else{
	                $(this).attr("value", "1"); 
	                $(this).attr("checked",true);
	                var id = $(this).attr("id");
	                $("label[name='" + id + "']").attr("class","confirm");
	            }
		});
		
		m$.header.titleContent.setTitle("邮件订阅");
    })
    
	//邮件订阅提交
	function submitSubscribeEmail(){
				var $subscribeForm = $("#subscribeForm");
				var $acceptClause = $("#acceptClause");
			    var $newarrived = $("#newarrived");
		        var $discount = $("#discount");
		        var $member= $("#member");
		        var $fashion = $("#fashion");
		        var $email = $("#email");
		        var $subscribeCheckBoxGroup = document.getElementById('subscribeCheckBoxGroup');
		        var emailRegular = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
		        
		        var checkboxs = $subscribeCheckBoxGroup.getElementsByTagName('input');
		        var isChecked = false;
		        for (i = 0, j = checkboxs.length; i < j; i++) {
		            if(checkboxs[i].checked){
		               isChecked = true;
		               break;
		            }
		        }
		        if(!isChecked){
			         m$.ui.dialog.dialogShow({
			         'title': '提示',
			         'content': '必须选择一项您感兴趣的内容！'
				       },
				       [{
				         'text': '确定'
				       }]);
				     return false;
		        }
		        if(!$email.val()){
			        m$.ui.dialog.dialogShow({
			         'title': '提示',
			         'content': '邮箱地址不能为空！'
				       },
				       [{
				         'text': '确定'
				       }]);
				     return false;
			    }
		        if(!emailRegular.test($email.val())){
			        m$.ui.dialog.dialogShow({
			         'title': '提示',
			         'content': '邮箱地址的格式不对！'
				       },
				       [{
				         'text': '确定'
				       }]);
				     return false;
			    }
			    if (!$acceptClause.attr("checked")) {
				    m$.ui.dialog.dialogShow({
			         'title': '提示',
			         'content': '请您勾选确认接受隐私条款以便订阅邮件'
				       },
				       [{
				         'text': '确定'
				       }]);
				     return false;
			    }
				$.ajax({
					url: "${base}/mobile/member/submitSubscribeEmail.jhtml",
					type: "POST",
					dataType: "json",
					data: {
							email: $('#email').val(),
							contentList: $newarrived.attr("value") + "," + $discount.attr("value") + "," + $member.attr("value") + "," + $fashion.attr("value")
						},
					cache: false,
					success: function(message) {
						if(message.type == "success"){
							m$.ui.dialog.dialogShow({
				         	'title': '提示',
				         	'content': '邮件订阅成功'
					      	 },
					      	 [{
					         'text': '确定',
					         'func': function(){
					              //window.location.href = moshop.base + "/mobile/member/subscribeEmail.jhtml";
					          }
					      	 }]);
						}else{
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
	
</script>
</head>

<body class="body_margin">
	<div class="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->		
			<div class="moMobileContent">
			    <div class="subscribeEmaildiv" style="font-size:12px;">
					<span class="subscribeEmailspan">订阅我们的邮件，您将第一时间收到我们官网的新品通知、活动优惠、会员特权等信息。</span>
						<span class="subscribeEmailspan" style="margin-top: 30px;">您感兴趣的内容</span>
						<!-- start 感兴趣的内容CheckBox Group -->
						<div class="confirmCheckBox" id="subscribeCheckBoxGroup"  style="overflow: hidden;">
						    <div class="checkBoxGroupPanel">
						        <input type="checkbox" class="confirmCheckBox" id="newarrived" value="0"/>
						        <label class="unconfirm" name="newarrived" for="newarrived">新品上市</label>
						    </div>
							<div class="checkBoxGroupPanel">
						        <input type="checkbox" class="confirmCheckBox" id="discount" value="0"/>
						        <label class="unconfirm" name="discount" for="discount">打折促销</label>
							</div>
							<div class="checkBoxGroupPanel">
						        <input type="checkbox" class="confirmCheckBox" id="member" value="0"/>
						        <label class="unconfirm" name="member" for="member">会员特权活动</label>
							</div>
							<div class="checkBoxGroupPanel">
						        <input type="checkbox" class="confirmCheckBox" id="fashion" value="0"/>
						        <label class="unconfirm" name="fashion" for="fashion">时尚搭配</label>
							</div>
						</div> 
						<!-- end 感兴趣的内容CheckBox Group -->
						
						<span class="subscribeEmailspan" style="padding-top: 20px;">电子邮箱地址*  </span>
						<input type="text" name="email" id="email" class="box_input" placeholder="电子邮箱" style="margin-left: 0px;margin-top: 10px;margin-bottom: 30px;">
						<div class="confirmCheckBox" id="subscribeAcceptCheckBoxGroup">
						    <div class="checkBoxGroupPanel" style="margin: 0px auto;">
						        <input type="checkbox" class="confirmCheckBox" id="acceptClause" value="我接受隐私条款"/>
						        <label class="unconfirm" name="acceptClause" for="acceptClause">我接受隐私条款</label>
						        <span style="margin-left: 30px;font-size: 11px;">*必填项</span>
						    </div>
						</div>
						<button style="margin-top: 10px;" type="button" onclick="submitSubscribeEmail();">订阅</button>
				</div>
			</div>	
					
	     [#include "/mobile/include/footer.ftl" /]
	</div>
</body>
</html>