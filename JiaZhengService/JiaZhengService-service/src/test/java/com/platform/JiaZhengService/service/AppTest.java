package com.platform.JiaZhengService.service;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.platform.JiaZhengService.service.api.TestService;

/**
 * Unit test for simple App.
 */
public class AppTest {

	private static TestService service;

	public static void main(String[] args) {
		ApplicationContext ctx = new FileSystemXmlApplicationContext(
				new String[] { "classpath*:applicationContext.xml" });
		service = (TestService) ctx.getBean(TestService.class);
		service.insertUser();
	}
}
