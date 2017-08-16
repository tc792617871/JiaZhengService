package com.platform.JiaZhengService.dao;

/**
 * DataSourceHolder上下文
 * 
 */
public class PageHolder {

	private static final ThreadLocal<Page> pageHolder = new ThreadLocal<Page>();

	public static void setPage(Page page) {
		if (!page.equals(pageHolder.get())) {
			pageHolder.set(page);
		}
	}

	public static Page getPage() {
		return pageHolder.get();
	}

	public static void clearContext() {
		pageHolder.remove();
	}
}
