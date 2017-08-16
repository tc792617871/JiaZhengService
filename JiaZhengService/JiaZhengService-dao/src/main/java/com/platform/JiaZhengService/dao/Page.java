/**
 * @Title: Page.java
 * @Package com.ailk.core.dao.components
 * @Description: 分页组件的页面信息
 * @author linyl linyuliang.85@gmail.com
 * @version V1.0
 */
package com.platform.JiaZhengService.dao;

import com.platform.JiaZhengService.common.pojo.StringAndEqualsPojo;

/**
 * @ClassName: Page
 * @Description: 分页组件的页面信息
 */
public class Page extends StringAndEqualsPojo {

	/**
	 * @Fields serialVersionUID : 默认序列版本号
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields begin : 分页查询开始记录位置
	 */
	private long begin;

	/**
	 * @Fields end : 分页查看下结束位置
	 */
	private long end;
	/**
	 * @Fields length : 每页显示记录数
	 */
	private long length;

	/**
	 * @Fields count : 查询结果总记录数
	 */
	private long count;

	/**
	 * @Fields current : 当前页码
	 */
	private long current;

	/**
	 * @Fields total : 总共页数
	 */
	private long total;

	private boolean needCount = true;

	public boolean isNeedCount() {
		return needCount;
	}

	public void setNeedCount(boolean needCount) {
		this.needCount = needCount;
	}

	/**
	 * 不知道总记录数的构造函数
	 * 
	 * @param begin
	 *            分页查询开始记录位置
	 * @param length
	 *            每页显示记录数
	 */
	public Page(final long begin, final long length) {
		this.begin = begin;
		this.length = length;
		end = this.begin + this.length;
		if (this.length != 0) {
			current = (long) Math.floor((this.begin * 1.0d) / this.length) + 1;
		} else {
			current = 1;
		}
	}

	/**
	 * 知道总记录数的构造函数
	 * 
	 * @param begin
	 *            分页查询开始记录位置
	 * @param length
	 *            每页显示记录数
	 * @param count
	 *            总记录数
	 */
	public Page(final long begin, final long length, final long count) {
		this(begin, length);
		this.count = count;
	}

	/**
	 * @return the begin
	 */
	public long getBegin() {
		return begin;
	}

	/**
	 * @return the end
	 */
	public long getEnd() {
		return end;
	}

	/**
	 * @param end
	 *            the end to set
	 */
	public void setEnd(final long end) {
		this.end = end;
	}

	/**
	 * @param begin
	 *            the begin to set
	 */
	public void setBegin(final long begin) {
		this.begin = begin;
		if (length > 0) {
			current = (int) Math.floor((this.begin * 1.0d) / length) + 1;
		} else {
			current = 1;
		}
	}

	/**
	 * @return the length
	 */
	public long getLength() {
		return length;
	}

	/**
	 * @param length
	 *            the length to set
	 */
	public void setLength(final long length) {
		this.length = length;
		if (begin != 0) {
			if (this.length > 0) {
				current = (int) Math.floor((begin * 1.0d) / this.length) + 1;
			} else {
				current = 1;
			}
		}
	}

	/**
	 * @return the count
	 */
	public long getCount() {
		return count;
	}

	/**
	 * @param count
	 *            the count to set
	 */
	public void setCount(final long count) {
		this.count = count;
		if (this.length > 0) {
			total = (long) Math.floor((this.count * 1.0d) / length);
			if (this.count % length != 0) {
				total = total + 1;
			}
		} else {
			total = 1;
		}
	}

	/**
	 * @return the current
	 */
	public long getCurrent() {
		return current;
	}

	/**
	 * @param current
	 *            the current to set
	 */
	public void setCurrent(final long current) {
		this.current = current;
	}

	/**
	 * @return the total
	 */
	public long getTotal() {
		if (total == 0) {
			return 1;
		}
		return total;
	}

	/**
	 * @param total
	 *            the total to set
	 */
	public void setTotal(final long total) {
		this.total = total;
	}
}
