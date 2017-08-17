// JavaScript Document
//RecipesToAdd
//编辑
function f_test() {
	var divContainer = document.getElementById('divContainer');
	var addadiv = document.getElementById('addadiv');
	if (divContainer.style.display == ""
			|| divContainer.style.display == "block") {
		divContainer.style.display = "none";
	} else {
		divContainer.style.display = "block";
	}
	if (addadiv.style.display == "" || addadiv.style.display == "block") {
		addadiv.style.display = "none";
	} else {
		addadiv.style.display = "none";
	}
}


function submitDateForm(){
	var contentTd = $(".contentTd");
	contentTd.each(function(){
	    $(this).html("");
	});
	var ifTdHasRecipe;
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	$.ajax({
		type: "GET",
		url: "detail.ct",
		data: {
		    startDate:startDate,
		    endDate:endDate
		},
		dataType: "json",
		success:function(recipes){
		    //start遍历recipes 
            if(recipes!=null){
				for (var i=0;i<recipes.length;i++){
					var recipe = recipes[i];
					var weekId = recipe.recipesWeek.id;
					var sectionId = recipe.recipesSection.id;
					var tdId = weekId+"-"+sectionId;
					var details = recipe.recipesDetails;
					if(details!=null){
						if(details.length>0){
							var insertHtml='<a href="'+preschoolEdu.base+'/console/recipesDetail/list.ct?recipeId='+recipe.id+'">';
							for (var j=0;j<details.length;j++){
								var detail = details[j];
								insertHtml = insertHtml + detail.dishName;
								insertHtml = insertHtml + '<br>';
							}
							insertHtml+='</a>';
							$("#"+tdId+"").html(insertHtml);
						}
						else{
							var insertHtml='<a class="btn btn-outline btn-info" href="'+preschoolEdu.base+'/console/recipesDetail/list.ct?recipeId='+recipe.id+'">';
					    	insertHtml+='＋';
							insertHtml+='</a>';
							$("#"+tdId+"").html(insertHtml);
						}
					}
					else{
						var insertHtml='<a class="btn btn-outline btn-info" href="'+preschoolEdu.base+'/console/recipesDetail/list.ct?recipeId='+recipe.id+'">';
				    	insertHtml+='＋';
						insertHtml+='</a>';
						$("#"+tdId+"").html(insertHtml);
					}
				}
            };
            //end遍历recipes 
			//判断是否有值
            var contentTd = $(".contentTd");
			contentTd.each(function(){
				if($(this).html()==""){
					var weekSectionId = $(this).attr('id');
					
					var insertHtml='<a class="btn btn-outline btn-default" href="'+preschoolEdu.base+'/console/recipesDetail/listTwo.ct?weekSectionId='+weekSectionId+'&startDate='+startDate+'">';
			    	insertHtml+='＋';
					insertHtml+='</a>';
					$(this).html(insertHtml);
				}
			});
        }//suucess
	});//ajax
}

// 初始化日期
window.onload = function() {
	var year = new Date().getFullYear();
	var month = new Date().getMonth() + 1;
	var day = new Date().getDate();
	// 初始化年份
	var yearHTML = "<select onchange='getTimeBucket()' id='thisYear'>"
	for ( var i = -10; i <= 10; i++) { // 往前推10年&往后推10年
		if (i == 0) {
			yearHTML += "<option value='" + (year + i)
					+ "' selected='selected'>" + (year + i) + "</option>";
		} else {
			yearHTML += "<option value='" + (year + i) + "'>" + (year + i)
					+ "</option>";
		}
	}
	yearHTML += "</select>";
	document.getElementById("showYear").innerHTML = yearHTML;
	// 初始化月份
	var monthHTML = "<select onchange='changeDay();getTimeBucket();' id='thisMonth'>"
	for ( var i = 01; i <= 12; i++) { // 每年12个月
		if (i == month) {
			monthHTML += "<option value='" + i + "' selected='selected'>" + i
					+ "</option>";
		} else {
			monthHTML += "<option value='" + i + "'>" + i + "</option>";
		}
	}
	monthHTML += "</select>";
	document.getElementById("showMonth").innerHTML = monthHTML;
	// 初始化星期
	changeDay();
	// 初始化日期段
	getTimeBucket();

}

// 年月星期联动
function changeDay() {
	var year = document.getElementById("thisYear").value;
	var month = document.getElementById("thisMonth").options[document
			.getElementById("thisMonth").selectedIndex].value;
	var dayHTML = "<select onchange='getTimeBucket();' id='thisWeek'>";
	var d = new Date();
	var today = d.getDate();
	// what day is first day
	d.setFullYear(year, month - 1, 1);
	var w1 = d.getDay();
	if (w1 == 0)
		w1 = 7;
	// total day of month
	d.setFullYear(year, month, 0);
	var dd = d.getDate();
	// first Monday
	if (w1 != 1)
		d1 = 7 - w1 + 2;
	else
		d1 = 1;
	week_count = Math.ceil((dd - d1 + 1) / 7);
	this_week = Math.ceil((today - d1 + 1) / 7);

	for ( var i = 1; i <= week_count; i++) {
		if (i == this_week) {
			dayHTML += "<option value='" + (i - 1) + "' selected='selected'>"
					+ i + "</option>";
		} else {
			dayHTML += "<option value='" + (i - 1) + "'>" + i + "</option>";
		}
	}
	dayHTML += "</select>";
	document.getElementById("showWeek").innerHTML = dayHTML;
}

// 计算当前时间段
function getTimeBucket() {
	var year = document.getElementById("thisYear").value;
	var month = document.getElementById("thisMonth").options[document
			.getElementById("thisMonth").selectedIndex].value;
	var week = document.getElementById("thisWeek").value;
	var d = new Date();
	// what day is first day
	d.setFullYear(year, month - 1, 1);
	var w1 = d.getDay();
	if (w1 == 0)
		w1 = 7;
	// total day of month
	d.setFullYear(year, month, 0);
	var dd = d.getDate();
	// first Monday
	if (w1 != 1)
		d1 = 7 - w1 + 2;
	else
		d1 = 1;
	var monday = d1 + week * 7;
	var firday = monday + 4;
	var from = year + "-" + month + "-" + monday;
	var to;
	if (firday <= dd) {
		to = year + "-" + month + "-" + firday;
	} else {
		d.setFullYear(year, month - 1, firday);
		to = (d.getMonth() + 1) + "-" + d.getDate();
	}
	document.getElementById("weekDate").style.display = "block";
	document.getElementById("startDate").value = from;
	document.getElementById("endDate").value = to;
	submitDateForm();
}
// recipe

// 时间选择器
function HS_DateAdd(interval, number, date) {
	number = parseInt(number);
	if (typeof (date) == "string") {
		var date = new Date(date.split("-")[0], date.split("-")[1], date
				.split("-")[2])
	}
	if (typeof (date) == "object") {
		var date = date
	}
	switch (interval) {
	case "y":
		return new Date(date.getFullYear() + number, date.getMonth(), date
				.getDate());
		break;
	case "m":
		return new Date(date.getFullYear(), date.getMonth() + number,
				checkDate(date.getFullYear(), date.getMonth() + number, date
						.getDate()));
		break;
	case "d":
		return new Date(date.getFullYear(), date.getMonth(), date.getDate()
				+ number);
		break;
	case "w":
		return new Date(date.getFullYear(), date.getMonth(), 7 * number
				+ date.getDate());
		break;
	}
}

function checkDate(year, month, date) {
	var enddate = [ "31", "28", "31", "30", "31", "30", "31", "31", "30", "31",
			"30", "31" ];
	var returnDate = "";
	if (year % 4 == 0) {
		enddate[1] = "29"
	}
	if (date > enddate[month]) {
		returnDate = enddate[month]
	} else {
		returnDate = date
	}
	return returnDate;
}
function WeekDay(date) {
	var theDate;
	if (typeof (date) == "string") {
		theDate = new Date(date.split("-")[0], date.split("-")[1], date
				.split("-")[2]);
	}
	if (typeof (date) == "object") {
		theDate = date
	}
	return theDate.getDay();
}
function HS_calender() {
	var lis = "";
	var style = "";
	/* 可以把下面的css剪切出去独立一个css文件zzjs.net */
	style += "<style type='text/css'>";
	style += ".calender { width:170px; height:auto; font-size:12px; margin-right:14px; background:url(calenderbg.gif) no-repeat right center #fff; border:1px solid #397EAE; padding:1px}";
	style += ".calender ul {list-style-type:none; margin:0; padding:0;}";
	style += ".calender .day { background-color:#EDF5FF; height:20px;}";
	style += ".calender .day li,.calender .date li{ float:left; width:14%; height:20px; line-height:20px; text-align:center}";
	style += ".calender li a { text-decoration:none; font-family:Tahoma; font-size:11px; color:#333}";
	style += ".calender li a:hover { color:#f30; text-decoration:underline}";
	style += ".calender li a.hasArticle {font-weight:bold; color:#f60 !important}";
	style += ".lastMonthDate, .nextMonthDate {color:#bbb;font-size:11px}";
	style += ".selectThisYear a, .selectThisMonth a{text-decoration:none; margin:0 2px; color:#000; font-weight:bold}";
	style += ".calender .LastMonth, .calender .NextMonth{ text-decoration:none; color:#000; font-size:18px; font-weight:bold; line-height:16px;}";
	style += ".calender .LastMonth { float:left;}";
	style += ".calender .NextMonth { float:right;}";
	style += ".calenderBody {clear:both}";
	style += ".calenderTitle {text-align:center;height:20px; line-height:20px; clear:both}";
	style += ".today { background-color:#ffffaa;border:1px solid #f60; padding:2px}";
	style += ".today a { color:#f30; }";
	style += ".calenderBottom {clear:both; border-top:1px solid #ddd; padding: 3px 0; text-align:left}";
	style += ".calenderBottom a {text-decoration:none; margin:2px !important; font-weight:bold; color:#000}";
	style += ".calenderBottom a.closeCalender{float:right}";
	style += ".closeCalenderBox {float:right; border:1px solid #000; background:#fff; font-size:9px; width:11px; height:11px; line-height:11px; text-align:center;overflow:hidden; font-weight:normal !important}";
	style += "</style>";
	var now;
	if (typeof (arguments[0]) == "string") {
		selectDate = arguments[0].split("-");
		var year = selectDate[0];
		var month = parseInt(selectDate[1]) - 1 + "";
		var date = selectDate[2];
		now = new Date(year, month, date);
	} else if (typeof (arguments[0]) == "object") {
		now = arguments[0];
	}
	var lastMonthEndDate = HS_DateAdd("d", "-1",
			now.getFullYear() + "-" + now.getMonth() + "-01").getDate();
	var lastMonthDate = WeekDay(now.getFullYear() + "-" + now.getMonth()
			+ "-01");
	var thisMonthLastDate = HS_DateAdd("d", "-1", now.getFullYear() + "-"
			+ (parseInt(now.getMonth()) + 1).toString() + "-01");
	var thisMonthEndDate = thisMonthLastDate.getDate();
	var thisMonthEndDay = thisMonthLastDate.getDay();
	var todayObj = new Date();
	today = todayObj.getFullYear() + "-" + todayObj.getMonth() + "-"
			+ todayObj.getDate();
	for (i = 0; i < lastMonthDate; i++) { // Last Month's Date
		lis = "<li class='lastMonthDate'>" + lastMonthEndDate + "</li>" + lis;
		lastMonthEndDate--;
	}
	for (i = 1; i <= thisMonthEndDate; i++) { // Current Month's Date
		if (today == now.getFullYear() + "-" + now.getMonth() + "-" + i) {
			var todayString = now.getFullYear() + "-"
					+ (parseInt(now.getMonth()) + 1).toString() + "-" + i;
			lis += "<li><a href=javascript:void(0) class='today' onclick='_selectThisDay(this)' title='"
					+ now.getFullYear()
					+ "-"
					+ (parseInt(now.getMonth()) + 1)
					+ "-" + i + "'>" + i + "</a></li>";
		} else {
			lis += "<li><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"
					+ now.getFullYear()
					+ "-"
					+ (parseInt(now.getMonth()) + 1)
					+ "-" + i + "'>" + i + "</a></li>";
		}
	}
	var j = 1;
	for (i = thisMonthEndDay; i < 6; i++) { // Next Month's Date
		lis += "<li class='nextMonthDate'>" + j + "</li>";
		j++;
	}
	lis += style;
	var CalenderTitle = "<a href='javascript:void(0)' class='NextMonth' onclick=HS_calender(HS_DateAdd('m',1,'"
			+ now.getFullYear()
			+ "-"
			+ now.getMonth()
			+ "-"
			+ now.getDate()
			+ "'),this) title='Next Month'>»</a>";
	CalenderTitle += "<a href='javascript:void(0)' class='LastMonth' onclick=HS_calender(HS_DateAdd('m',-1,'"
			+ now.getFullYear()
			+ "-"
			+ now.getMonth()
			+ "-"
			+ now.getDate()
			+ "'),this) title='Previous Month'>«</a>";
	CalenderTitle += "<span class='selectThisYear'><a href='javascript:void(0)' onclick='CalenderselectYear(this)' title='Click here to select other year' >"
			+ now.getFullYear()
			+ "</a></span>年<span class='selectThisMonth'><a href='javascript:void(0)' onclick='CalenderselectMonth(this)' title='Click here to select other month'>"
			+ (parseInt(now.getMonth()) + 1).toString() + "</a></span>月";
	if (arguments.length > 1) {
		arguments[1].parentNode.parentNode.getElementsByTagName("ul")[1].innerHTML = lis;
		arguments[1].parentNode.innerHTML = CalenderTitle;
	} else {
		var CalenderBox = style
				+ "<div class='calender'><div class='calenderTitle'>"
				+ CalenderTitle
				+ "</div><div class='calenderBody'><ul class='day'><li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li></ul><ul class='date' id='thisMonthDate'>"
				+ lis
				+ "</ul></div><div class='calenderBottom'><a href='javascript:void(0)' class='closeCalender' onclick='closeCalender(this)'>×</a><span><span><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"
				+ todayString + "'>Today</a></span></span></div></div>";
		return CalenderBox;
	}
}
function _selectThisDay(d) {
	var boxObj = d.parentNode.parentNode.parentNode.parentNode.parentNode;
	boxObj.targetObj.value = d.title;
	boxObj.parentNode.removeChild(boxObj);
}
function closeCalender(d) {
	var boxObj = d.parentNode.parentNode.parentNode;
	boxObj.parentNode.removeChild(boxObj);
}
function CalenderselectYear(obj) {
	var opt = "";
	var thisYear = obj.innerHTML;
	for (i = 1970; i <= 2020; i++) {
		if (i == thisYear) {
			opt += "<option value=" + i + " selected>" + i + "</option>";
		} else {
			opt += "<option value=" + i + ">" + i + "</option>";
		}
	}
	opt = "<select onblur='selectThisYear(this)' onchange='selectThisYear(this)' style='font-size:11px'>"
			+ opt + "</select>";
	obj.parentNode.innerHTML = opt;
}
function selectThisYear(obj) {
	HS_calender(obj.value
			+ "-"
			+ obj.parentNode.parentNode.getElementsByTagName("span")[1]
					.getElementsByTagName("a")[0].innerHTML + "-1",
			obj.parentNode);
}
function CalenderselectMonth(obj) {
	var opt = "";
	var thisMonth = obj.innerHTML;
	for (i = 1; i <= 12; i++) {
		if (i == thisMonth) {
			opt += "<option value=" + i + " selected>" + i + "</option>";
		} else {
			opt += "<option value=" + i + ">" + i + "</option>";
		}
	}
	opt = "<select onblur='selectThisMonth(this)' onchange='selectThisMonth(this)' style='font-size:11px'>"
			+ opt + "</select>";
	obj.parentNode.innerHTML = opt;
}
function selectThisMonth(obj) {
	HS_calender(obj.parentNode.parentNode.getElementsByTagName("span")[0]
			.getElementsByTagName("a")[0].innerHTML
			+ "-" + obj.value + "-1", obj.parentNode);
}
function HS_setDate(inputObj) {
	var calenderObj = document.createElement("span");
	calenderObj.innerHTML = HS_calender(new Date());
	calenderObj.style.position = "absolute";
	calenderObj.targetObj = inputObj;
	inputObj.parentNode.insertBefore(calenderObj, inputObj.nextSibling);
}

// 时间显示
var getMonthWeek = function(a, b, c) {
	/*
	 * a = d = 当前日期 b = 6 - w = 当前周的还有几天过完（不算今天） a + b 的和在除以7 就是当天是当前月份的第几周
	 */
	var date = new Date(a, parseInt(b) - 1, c), w = date.getDay(), d = date
			.getDate();
	return Math.ceil((d + 6 - w) / 7);
};

var getYearWeek = function(a, b, c) {
	/*
	 * date1是当前日期 date2是当年第一天 d是当前日期是今年第多少天 用d + 当前年的第一天的周差距的和在除以7就是本年第几周
	 */
	var date1 = new Date(a, parseInt(b) - 1, c), date2 = new Date(a, 0, 1), d = Math
			.round((date1.valueOf() - date2.valueOf()) / 86400000);
	return Math.ceil((d + ((date2.getDay() + 1) - 1)) / 7);
};

// var oldDate = new Date(2011,4,23,0,0,0);
// var nowDate = new Date();

// var str = "今天是"+nowDate.getFullYear()+"年"+(nowDate.getMonth() +
// 1)+"月"+nowDate.getDate()+"日 第"+getMonthWeek(2007, 03, 19)+"周";
// document.getElementById("cycle").value = str;//周期显示

// RecipesToAdd



