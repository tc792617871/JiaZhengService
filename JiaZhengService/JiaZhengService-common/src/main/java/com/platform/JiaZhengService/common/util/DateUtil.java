package com.platform.JiaZhengService.common.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Utils - 时间工具类
 * 
 */
public class DateUtil {

	private static SimpleDateFormat year_format = new SimpleDateFormat("yyyy");

	private static SimpleDateFormat month_format = new SimpleDateFormat("yyyyMM");

	private static SimpleDateFormat default_format = new SimpleDateFormat("yyyy-MM-dd");

	private static SimpleDateFormat time_format = new SimpleDateFormat("yyyyMMddHHmmss");

	/**
	 * 返回下一年_格式yyyy
	 * 
	 * @return int
	 */
	public static int getNextYear() {
		return new GregorianCalendar().get(Calendar.YEAR) + 1;
	}

	/**
	 * 返回当前的年
	 * 
	 * @return int
	 */
	public static int getCurrYear() {
		return new GregorianCalendar().get(Calendar.YEAR);
	}

	/**
	 * 获取某年第一天日期_格式yyyy-MM-dd
	 * 
	 * @param year
	 *            年份
	 * @return String
	 */
	public static String getCurrYearFirstDay(int year) {
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(Calendar.YEAR, year);
		Date currYearFirst = calendar.getTime();
		return default_format.format(currYearFirst);
	}

	/**
	 * 根据一个日期，返回是星期几的数字_星期天:1,星期一:2....星期六:7
	 * 
	 * @param dateString
	 *            String
	 * @return int
	 */
	public static int getWeek(String dateString) {
		Date date = string2Date(dateString);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.get(Calendar.DAY_OF_WEEK);
	}

	public static String getWeekContent(String dateString) {
		int week = getWeek(dateString);
		String content = "";
		switch (week) {
		case 1: // 星期天
			content = "星期天";
			break;
		case 2: // 星期1
			content = "星期一";
			break;
		case 3: // 星期2
			content = "星期二";
			break;
		case 4: // 星期3
			content = "星期三";
			break;
		case 5: // 星期4
			content = "星期四";
			break;
		case 6: // 星期5
			content = "星期五";
			break;
		case 7: // 星期6
			content = "星期六";
			break;
		}
		return content;
	}

	public static String getDateByAddDays(String inDate, int days, int _iType) {
		Date dateStr = string2Date(inDate);
		Date tempDate = getDateByAddDays(dateStr, days);
		return date2String(tempDate, _iType);
	}

	public static String date2String(Date date, int _iType) {
		String strTemp = time_format.format(date);
		SimpleDateFormat formatter = null;
		switch (_iType) {
		case 0: // yyyymmdd
			strTemp = strTemp.substring(0, 8);
			break;
		case 4:// yyyy
			strTemp = strTemp.substring(0, 4);
			break;
		case 6: // yymmdd
			strTemp = strTemp.substring(2, 8);
			break;
		case 8: // yyyymmdd
			strTemp = strTemp.substring(0, 8);
			break;
		case 10: // yyyy-mm-dd
			formatter = new SimpleDateFormat("yyyy-MM-dd");
			strTemp = formatter.format(date);
			break;
		case 12: // yyyy/mm/dd
			formatter = new SimpleDateFormat("yyyy/MM/dd");
			strTemp = formatter.format(date);
			break;
		case -6: // HHmmss
			strTemp = strTemp.substring(8);
			break;
		case -8: // HH:mm:ss
			formatter = new SimpleDateFormat("HH:mm:ss");
			strTemp = formatter.format(date);
			break;
		default:
			formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			strTemp = formatter.format(date);
			break;
		}
		return strTemp;
	}

	/**
	 * 获得指定日期前后的日期，返回日期型值
	 * 
	 * @param inDate
	 *            指定的日期
	 * @param days
	 *            加减天数
	 * @return Date
	 */
	public static Date getDateByAddDays(Date inDate, int days) {
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.setTime(inDate);
		calendar.add(Calendar.DATE, days);
		return calendar.getTime();
	}

	/**
	 * 获得指定日期前后的日期，返回日期型值
	 * 
	 * @param inDate
	 *            指定的日期
	 * @param days
	 *            加减天数
	 * @return Date
	 */
	public static Date getDateByAddMonth(Date inDate, int month) {
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.setTime(inDate);
		calendar.add(Calendar.MONTH, month);
		return calendar.getTime();
	}

	/**
	 * 得到当前时间,格式为yyyyMMddhhmmss
	 * 
	 * @return String
	 */
	public static String generateTime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		return format.format(new Date());
	}

	/**
	 * 得到当前时间,格式为yyyyMMddhhmmssSSS
	 * 
	 * @return String
	 */
	public static String generateTimeHM() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return format.format(new Date());
	}

	/**
	 * 根据格式生成当前日期时间
	 * 
	 * @param formatStr
	 * @return
	 */
	public static String generateDateTime(String formatStr) {
		SimpleDateFormat format = new SimpleDateFormat(formatStr);
		return format.format(new Date());
	}

	/**
	 * 根据yyyy-MM-dd得到月份
	 * 
	 * @param dateString
	 *            String
	 * @return int
	 */
	public static int getMonthFromYear(String dateString) {
		Date date = string2Date(dateString);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.MONTH) + 1;
	}

	/**
	 * 得到指定年的所有天数
	 * 
	 * @param year
	 *            String
	 * @return day int
	 */
	public static int getDayFromYear(String year) {
		Date date;
		int day = 0;
		try {
			date = year_format.parse(year);
			Calendar calendar = new GregorianCalendar();
			calendar.setTime(date);
			day = calendar.getActualMaximum(Calendar.DAY_OF_YEAR);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return day;
	}

	/**
	 * 将日期字符串转换成日期型，日期格式为"yyyy-MM-dd"
	 * 
	 * @param dateString
	 *            指定的日期字符串，格式为yyyyMMdd 或者yyyy-MM-dd
	 * @return Date
	 */
	public final static Date string2Date(String dateString) {
		if (dateString == null || dateString.trim().length() == 0) {
			return new Date(0);
		}
		try {
			String strFormat = "";
			switch (dateString.length()) {
			case 4:
				strFormat = "yyyy";
				break;
			case 6: // yymmdd
				strFormat = "yyMMdd";
				break;
			case 8: // yyyymmdd
				strFormat = "yyyyMMdd";
				break;
			case 10: // yyyy-mm-dd
				strFormat = "yyyy-MM-dd";
				break;
			case 14:
				strFormat = "yyyyMMddHHmmss";
				break;
			default:
				strFormat = "yyyy-MM-dd HH:mm:ss";
			}
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(strFormat);
			// 这里没有做非法日期的判断，比如：＂2007-05-33＂
			java.util.Date timeDate = simpleDateFormat.parse(dateString);
			return timeDate;
		} catch (Exception e) {
			return new Date(0);
		}
	}

	/**
	 * 获取时间
	 * 
	 * @return
	 */
	public static String getCurrentDate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		return df.format(new Date());
	}

	/**
	 * 获取当前时间按时间
	 * 
	 * @return
	 */
	public static Date getDate() {
		return new Date();
	}

	/**
	 * 得到两个时间的差值，单位是小时
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	public static double getHourBetweenDates(Date beginDate, Date endDate) {

		long l1 = endDate.getTime();
		long l2 = beginDate.getTime();

		double cc = l1 - l2;
		return cc / (60 * 60 * 1000);
	}

	/**
	 * 得到两个时间的差值，单位是分钟
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	public static double getMinuteBetweenDates(Date beginDate, Date endDate) {

		double cc = endDate.getTime() - beginDate.getTime();
		return cc / (60 * 1000);
	}

	/**
	 * 得到两个时间的差值，单位天
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	public static int getDateBetweenDates(Date beginDate, Date endDate) {
		String bd = date2String(beginDate, 10);
		String ed = date2String(endDate, 10);
		Date bdd = string2Date(bd);
		Date edd = string2Date(ed);
		double cc = edd.getTime() - bdd.getTime();
		return ((int) cc / (24 * 60 * 60 * 1000));
	}

	public static void main(String[] args) {
		System.out.println(date2String(new Date(), -1));
	}

	public static String obtainMonth(String dateStr, int m) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String str = "";
		try {
			Date d1 = df.parse(dateStr);
			Calendar g = Calendar.getInstance();
			g.setTime(d1);
			g.add(Calendar.MONTH, m);
			Date d2 = g.getTime();
			str = df.format(d2);
			str = str.replace("-", "");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return str;
	}

	// 获得20130906 这样格式的
	public static String obtainCurrteDate() {
		Calendar cal = Calendar.getInstance();
		int m = cal.get(Calendar.MONTH);
		int d = cal.get(Calendar.DATE);
		String ms = "";
		if (m + 1 < 10) {
			ms = "0" + (m + 1);

		} else {
			ms = String.valueOf(m + 1);
		}

		String ds = "";

		if (d < 10) {
			ds = "0" + d;

		} else {
			ds = String.valueOf(d);
		}

		return String.valueOf(cal.get(Calendar.YEAR)) + ms + ds;
	}

	/**
	 * 获取一个人的年龄
	 * 
	 * @param birthDay
	 *            生日
	 * @return
	 * @throws Exception
	 * @see [类、类#方法、类#成员]
	 */
	public static Integer getAge(Date birthDay) {
		if (birthDay == null) {
			return 0;
		}
		Calendar cal = Calendar.getInstance();
		if (cal.before(birthDay)) {
			return 0;
		}
		int yearNow = cal.get(Calendar.YEAR);
		int monthNow = cal.get(Calendar.MONTH) + 1;// 注意此处，如果不加1的话计算结果是错误的
		int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH);
		cal.setTime(birthDay);
		int yearBirth = cal.get(Calendar.YEAR);
		int monthBirth = cal.get(Calendar.MONTH) + 1;
		int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);
		int age = yearNow - yearBirth;
		if (monthNow <= monthBirth) {
			if (monthNow == monthBirth) {
				if (dayOfMonthNow < dayOfMonthBirth) {
					age--;
				}
			} else if (monthNow < monthBirth) {
				age--;
			}
		} else {
			// monthNow<monthBirth
			// donothing
		}

		return age;
	}

	/**
	 * 返回系统当前时间(精确到毫秒),作为一个唯一的订单编号
	 * 
	 * @return 以yyyyMMddHHmmss为格式的当前系统时间
	 */
	public static String getOrderNum() {
		Date date = new Date();
		return time_format.format(date);
	}

	/**
	 * 返回系统当前时间(精确到毫秒),作为一个唯一的订单编号
	 * 
	 * @return 以yyyyMMddHHmmss为格式的当前系统时间
	 */
	public static String getCouponNum() {
		Date date = new Date();
		return month_format.format(date);
	}

}
