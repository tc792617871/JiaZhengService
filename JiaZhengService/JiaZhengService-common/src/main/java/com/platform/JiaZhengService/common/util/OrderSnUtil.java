package com.platform.JiaZhengService.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class OrderSnUtil {

	public static String getSnByUUId() {
		int hashCodeV = UUID.randomUUID().toString().hashCode();
		if (hashCodeV < 0) {// 有可能是负数
			hashCodeV = -hashCodeV;
		}
		String str = new SimpleDateFormat("yyyyMMddHH").format(new Date());
		// 0 代表前面补充0
		// 4 代表长度为4
		// d 代表参数为正数型
		return str + String.format("%010d", hashCodeV);
	}

	public static void main(String[] args) throws InterruptedException {
		for (int i = 0; i < 10000; i++) {
			System.out.println(getSnByUUId());
		}
	}

}
