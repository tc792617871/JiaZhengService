package com.platform.JiaZhengService.common.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegUtils {

	/**
	 * 验证手机号
	 * 
	 * @param mobiles
	 * @return
	 */
	public static boolean isMobileNO(String mobiles) {
		Pattern pattern = Pattern.compile("^1(3|4|5|7|8)\\d{9}$");
		Matcher matcher = pattern.matcher(mobiles);
		return matcher.matches();
	}

}
