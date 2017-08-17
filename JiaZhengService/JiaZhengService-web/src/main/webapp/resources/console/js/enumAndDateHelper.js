/*
 * Copyright 2012-2014 sammyun.com.cn. All rights reserved.
 * Support: http://www.sammyun.com.cn
 * License: http://www.sammyun.com.cn/license
 * 
 * JavaScript - List
 * Version: 3.0
 */

/**
 *使用说明：
 *给需要转化的值的外层dom的属性title为enum_xxx  xxx代表enum
 * */ 

$().ready( function() {
	/** 考勤状态 */
	var status =
    {
    	/** 正常 */
        normal:message("console.attendance.status.normal"),
        /** 迟到 */
        late:message("console.attendance.status.late"),
        /** 早退 */
        early:message("console.attendance.status.early"),
        /** 请假 */
        leave:message("console.attendance.status.leave"),
        /** 病假 */
        sick:message("病假"),
        /** 事假 */
        compassionate:message("事假")
    };
    /**星期*/
    var weekday ={
  	    0:message("console.attendance.sunday"),
  	    1:message("console.attendance.monday"),
  	    2:message("console.attendance.tuesday"),
  	    3:message("console.attendance.wednesday"),
  	    4:message("console.attendance.thursday"),
  	    5:message("console.attendance.friday"),
  	    6:message("console.attendance.saturday")
  	}
    /**时间段*/
    var timeType = {
        morning:message("console.attendance.morning"),
        noon:message("console.attendance.noon"),
        afternoon:message("console.attendance.afternoon"),
        night:message("console.attendance.night")
    }
    /**设备*/
    var device = {
		IC:message("console.attendance.IC"),//IC卡
		QR:message("console.attendance.QR"),//二维码
		BAR:message("console.attendance.BAR")//条形码
    }
    
    var dateTD = $("td[title=dateTurn2Week]");
    dateTD.each(function(){
        var dateString = $(this).text();
        var dayNumber = new Date(dateString).getDay();
        var dayWeek  = weekday[dayNumber];
        $(this).text(dateString+dayWeek);
    });
    var statusTD = $("td[title=statusTurn]");
    statusTD.each(function(){
        var statusCode = $(this).text();
        var statusString  = status[statusCode];
        $(this).text(statusString);
    });
        
        
	
});

