<!DOCTYPE html> 
<html>
<head>
<title>编辑个人资料</title>
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
<script type="text/javascript" src="${base}/resources/mobile/datePicker/WdatePicker.js"></script>
<script type="text/javascript">

	setInterval(function() {
	    m$.ui.fixed.fixedTop($('#header'));
	},
	500);
	
	setInterval(function() {
	     m$.ui.fixed.fixedBody($('#bdmg'));
	},
	500);
	setInterval(function() {
	    m$.ui.fixed.fixedWatch($('#footer'));
	},
	500);

 $().ready(function(){ 
  
   //获取用户详情
	var $name = $("#name");
	var $birth = $("#birth");
	var $gender_male_lable = $("#gender_male_lable");
	var $gender_female_lable = $("#gender_female_lable");
	var $languagePreferenceId = $("#languagePreferenceId");
	var $height = $("#height");
    var $weight = $("#weight");
    var $bust = $("#bust");
    var $waist = $("#waist");
    var $hip = $("#hip");
    var $occupationId = $("#occupationId");
    var $liveLocationAreaId = $("#liveLocationAreaId");
	$.ajax({
		url: "${base}/mobile/member/getUserInfo.jhtml",
        type: "GET",
		dataType: "json",
		cache: false,
	    success:function(data){
	    	var member = data.member;
	    	var languagePreferences = data.languagePreferences;
	        $name.val(member.name);
	        $height.val(member.height);
			$weight.val(member.weight);
			$bust.val(member.bust);
			$waist.val(member.waist);
			$hip.val(member.hip);
	        if(member.gender == "male"){
	            $gender_male_lable.removeClass("unchecked");
	            $gender_male_lable.addClass("checked");
	        }else if(member.gender == "female"){
	            $gender_female_lable.removeClass("unchecked");
	            $gender_female_lable.addClass("checked");
	        }
	        $languagePreferenceId.empty();
	        for(i=0,len=languagePreferences.length; i<len; i++){
	           var languageId   = languagePreferences[i]['id'];
	           var languageName = languagePreferences[i]['languageName'];
	           var isSelect = languagePreferences[i]['languageCode'] == member['languageCode']? 'selected':'';
	           var option = "<option value='"+languageId+"' "+isSelect+">"+languageName+"</option>";
	           $(option).appendTo($languagePreferenceId)
	        }
	        if(member.birth){
	            $birth.val(timeStamp2String(member.birth));
	        }else{
	            $birth.val(null);
	        }
	    }
	});
  
  //职业选择
	$occupationId.lSelect({
		 url: moshop.base+"/mobile/member/occupation.jhtml"
	});
	
	//地区选择
	$liveLocationAreaId.lSelect({
		 url: moshop.base+"/common/area.jhtml"
	});
  
    $gender_male_lable.click(function(){
        $gender_female_lable.removeClass("checked");
        $gender_female_lable.addClass("unchecked");
        if($(this).hasClass("unchecked")){
            $(this).removeClass("unchecked");
            $(this).addClass("checked");
        }
    });
    
   $gender_female_lable.click(function(){
        $gender_male_lable.removeClass("checked");
        $gender_male_lable.addClass("unchecked");
        if($(this).hasClass("unchecked")){
            $(this).removeClass("unchecked");
            $(this).addClass("checked");
        }
    });
  
	m$.header.titleContent.setTitle("编辑个人资料");
 });
 
 //更新资料
  function modifyBtnClick(){
    var $personalModifyForm = $("#personalModifyForm");
    var $name4Modify = $("#name");
    var $gender_male_lable = $("#gender_male_lable");
    var $gender_female_lable = $("#gender_female_lable");
    var $birth4Modify = $("#birth");
    var $token = $("#token");
    var $languagePreferenceId = $("#languagePreferenceId");
    var $liveLocationAreaId = $("#liveLocationAreaId");
    var $liveCountry = $("#liveCountry");
    var $height = $("#height");
    var $weight = $("#weight");
    var $bust = $("#bust");
    var $waist = $("#waist");
    var $hip = $("#hip");
    var $occupationId = $("#occupationId");
    var regular = /^(\d*\.)?\d+$/;
    var $address = $("#address");
    
    var gender;
    if(!$name4Modify.val()){
        m$.ui.dialog.dialogShow({
         'title': '提示',
         'content': '用户名不能为空'
       },
       [{
         'text': '确定'
       }]);
	    return false;
    }
    if($gender_male_lable.hasClass("checked")){
        gender = 0;
    }else if($gender_female_lable.hasClass("checked")){
        gender = 1;
    }else{
       m$.ui.dialog.dialogShow({
         'title': '提示',
         'content': '性别不能为空'
       },
       [{
         'text': '确定'
       }]);
	    return false;
    }
    if(!regular.test($height.val())){
       m$.ui.dialog.dialogShow({
         'title': '提示',
         'content': '身高填写错误'
       },
       [{
         'text': '确定'
       }]);
	    return false;
    }
    if(!regular.test($weight.val())){
       m$.ui.dialog.dialogShow({
         'title': '提示',
         'content': '体重填写错误'
       },
       [{
         'text': '确定'
       }]);
	    return false;
    }
    if(!regular.test($bust.val())){
        m$.ui.dialog.dialogShow({
         'title': '提示',
         'content': '胸围填写错误'
       },
       [{
         'text': '确定'
       }]);
	    return false;
    }
    if(!regular.test($waist.val())){
        m$.ui.dialog.dialogShow({
         'title': '提示',
         'content': '腰围填写错误'
       },
       [{
         'text': '确定'
       }]);
	    return false;
    }
    if(!regular.test($hip.val())){
        m$.ui.dialog.dialogShow({
         'title': '提示',
         'content': '臀围填写错误'
       },
       [{
         'text': '确定'
       }]);
	    return false;
    }
    var token = getCookie("token");
    $token.val(token);
    $.ajax({
            url: moshop.base+"/common/public_key.jhtml",
			type: "GET",
			dataType: "json",
			cache: false,
			success: function(data){
			    $.ajax({
			        url: $personalModifyForm.attr("action"),
					type: "POST",
					dataType: "json",
					cache: false,
					data: {
						name:$name4Modify.val(),
						gender:gender,
						birth:$birth4Modify.val(),
						liveLocation:$liveLocationAreaId.val(),
						country:$liveCountry.val(),
						languagePreferenceId:$languagePreferenceId.val(),
						height:$height.val(),
						weight:$weight.val(),
						bust:$bust.val(),
						waist:$waist.val(),
						hip:$hip.val(),
						occupation:$occupationId.val(),
						address:$address.val()
					},
					success: function(message) {
						if (message.type == "success") {
						    var options = [];
						    options['path'] = '/';
						    addCookie("name",$name4Modify.val(),options)
						    var value = $name4Modify.val();
							m$.ui.dialog.dialogShow({
						         'title': '提示',
						         'content': '个人信息修改成功'
						       },
						       [{
						         'text': '确定'
						       }]);
						       setTimeout(function() {
					            window.location.href = moshop.base + "/mobile/member/personalInfo.jhtml";
				            }, 2000);
						} 
					}
			    });
			}
        });
}

</script>
</head>
<body class="body_margin" id='bdmg'>
	<div class="fullscreen" id="fullscreen">
		<!-- header -->
		[#include "/mobile/include/header.ftl" /]
		<!-- /header -->	
		<div class="moMobileContent">	
			<form id="personalModifyForm" action="${base}/mobile/member/updatePersonalInfo.jhtml" method="post" novalidate="novalidate">
			     <ul class="editPersonalInfo">
			         <li>
			            <table>
			                <tr>
			                    <td style=" width: 50px;">
			                        姓名*
			                    </td>
			                    <td>
			                       <input id="name" type="text" name="name" class="box_input" placeholder="&nbsp;&nbsp;姓名"/>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
			            <table>
			                <tr>
			                    <td style=" width: 50px;">
			                        性别*
			                    </td>
			                    <td>
			                        <input name="gender" type="radio" class="personalInfo_radio" id="gender_radio">
									<label id="gender_male_lable" class="unchecked" name="gender_radio" for="gender_radio">男</label>
									<input name="gender" type="radio" class="personalInfo_radio" id="gender_radio">
									<label id="gender_female_lable" class="unchecked" name="gender_radio" for="gender_radio">女</label>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
	                     <table>
			                <tr>
			                    <td style=" width: 50px;">
			                        生日*
			                    </td>
			                    <td>
									<input id="birth" type="text" name="birth" class="box_input" placeholder="&nbsp;&nbsp;生日" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd'});" readOnly/>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
	                     <table>
			                <tr>
			                    <td style=" width: 50px;">
			                        身高&nbsp;
			                    </td>
			                    <td>
									 <input id="height" type="text" name="height" class="box_input" maxlength="3"  placeholder="&nbsp;&nbsp;身高"/>
	                                <em>(cm)</em>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
	                     <table>
			                <tr>
			                    <td style=" width: 50px;">
			                        体重&nbsp;
			                    </td>
			                    <td>
									<input id="weight" type="text" name="weight" class="box_input" maxlength="4" placeholder="&nbsp;&nbsp;体重"/>
	                            	 <em>(kg)</em>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
	                     <table>
			                <tr>
			                    <td style=" width: 50px;">
			                        胸围&nbsp;
			                    </td>
			                    <td>
									<input id="bust" type="text" name="bust" class="box_input" maxlength="4" placeholder="&nbsp;&nbsp;胸围"/>
	                            	<em>(cm)</em>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
	                    <table>
			                <tr>
			                    <td style=" width: 50px;">
			                        腰围&nbsp;
			                    </td>
			                    <td>
									 <input id="waist" type="text" name="waist" class="box_input" maxlength="4" placeholder="&nbsp;&nbsp;腰围"/>
	                   		         <em>(cm)</em>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
	                    <table>
			                <tr>
			                    <td style=" width: 50px;">
			                       臀围&nbsp;
			                    </td>
			                    <td>
									 <input id="hip" type="text" name="waist" class="box_input" maxlength="4" placeholder="&nbsp;&nbsp;臀围"/>
	                   		         <em>(cm)</em>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
						 <table>
			                <tr>
			                    <td style=" width: 50px;">
			                       职业&nbsp;
			                    </td>
			                    <td>
								    <span class="editPersonalInfoFieldSet">
										<input type="hidden" id="occupationId" name="occupation" value="${(member.occupation.id)!}" treePath="${(member.occupation.treePath)!}"/>
									</span>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li style="display:none">
						<table>
			                <tr>
			                    <td style=" width: 50px;">
			                       国家&nbsp;
			                    </td>
			                    <td>
								      <script>
				                                $.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js',function(){
													 $("#liveCountrySpan").html(remote_ip_info.country);
													 $("#liveCountry").val(remote_ip_info.country);
												});
			                        </script>
			                        <span id="liveCountrySpan"></span>
									<input type="hidden" name="country" id="liveCountry" />
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
						<table>
			                <tr>
			                    <td style="width: 50px;">
			                      <nobr>区域&nbsp;</nobr>
			                    </td>
			                    <td>
								     <span class="editPersonalInfoFieldSet">
										<input type="hidden" id="liveLocationAreaId" name="liveLocation" value="${(member.area.id)!}" treePath="${(member.area.treePath)!}"/>
									</span>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
						<table>
			                <tr>
			                    <td style="width: 50px;">
			                      <nobr>地址&nbsp;</nobr>
			                    </td>
			                    <td>
								    <input id="address" type="text" name="address" class="box_input" maxlength="400" placeholder="&nbsp;&nbsp;地址" value="${(member.address)!}" />
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
						<table>
			                <tr>
			                    <td style="width: 50px;">
			                     语言&nbsp;
			                    </td>
			                    <td>
								   <select name="languagePreferenceId" id="languagePreferenceId" class="defaultSelect">
						          </select>
			                    </td>
			                </tr>
			            </table>
			         </li>
			         <li>
			           <em>*必填栏</em>
			         </li>
			         <li style="text-align: center;">
			           <button type="button" onclick="modifyBtnClick();">更新</button>
			         </li>
			     </ul>
				
     	   </form>
 	   </div>
		<!-- footer -->
	   [#include "/mobile/include/footer.ftl" /]
      <!-- /footer -->
	</div>
</body>
</html>