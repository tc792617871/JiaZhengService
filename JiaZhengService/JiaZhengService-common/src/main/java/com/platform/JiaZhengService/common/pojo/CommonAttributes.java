package com.platform.JiaZhengService.common.pojo;

/**
 * 公共参数
 * 
 * @author Sencloud Team
 * @version 3.0
 */
public final class CommonAttributes {

	/** 日期格式配比 */
	public static final String[] DATE_PATTERNS = new String[] { "yyyy", "yyyy-MM", "yyyyMM", "yyyy/MM", "yyyy-MM-dd",
			"yyyyMMdd", "yyyy/MM/dd", "yyyy-MM-dd HH:mm:ss", "yyyyMMddHHmmss", "yyyy/MM/dd HH:mm:ss" };

	/** jiaZhengService.xml文件路径 */
	public static final String JIAZHENGSERVICE_XML_PATH = "/jiaZhengService.xml";

	/** preschoolEdu.properties文件路径 */
	public static final String JIAZHENGSERVICE_PROPERTIES_PATH = "/JiaZheng.properties";

	/** 颜色规格 */
	public static final String COLOR = "color";

	/** size规格 */
	public static final String SIZE = "size";

	/** 鞋子size规格 */
	public static final String SHOES_SIZE = "shoes_size";

	/** 裤子size规格 */
	public static final String PANTS_SIZE = "pants_size";

	/** preschoolEdu.properties文件路径 */
	public static final String JIAZHENGSERVICE_ERP_PROPERTIES_PATH = "/global.sc.properties";

	/**
	 * 不可实例化
	 */
	private CommonAttributes() {
	}

}
