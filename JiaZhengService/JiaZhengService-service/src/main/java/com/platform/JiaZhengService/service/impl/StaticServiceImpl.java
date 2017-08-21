package com.platform.JiaZhengService.service.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.platform.JiaZhengService.common.pojo.Template;
import com.platform.JiaZhengService.service.api.StaticService;
import com.platform.JiaZhengService.service.api.TemplateService;

/**
 * Service - 静态化
 * 
 */
@Service("staticServiceImpl")
public class StaticServiceImpl implements StaticService, ServletContextAware {

	/** Sitemap最大地址数 */
	private static final Integer SITEMAP_MAX_SIZE = 40000;

	/** servletContext */
	private ServletContext servletContext;

	private static Locale locale = new Locale("zh_CN");

	@Resource(name = "freeMarkerConfigurer")
	private FreeMarkerConfigurer freeMarkerConfigurer;

	@Resource(name = "templateServiceImpl")
	private TemplateService templateService;

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@Transactional(readOnly = true)
	public int build(String templatePath, String staticPath, Map<String, Object> model) {
		Assert.hasText(templatePath);
		Assert.hasText(staticPath);

		FileOutputStream fileOutputStream = null;
		OutputStreamWriter outputStreamWriter = null;
		Writer writer = null;
		try {
			/**
			 * Configuration fC = freeMarkerConfigurer.getConfiguration();
			 * fC.setLocale(locale); fC.setSharedVariable("locale", locale);
			 * freemarker.template.Template template =
			 * fC.getTemplate(templatePath); if
			 * ("en_us".equals(locale.getLanguage())) { staticPath = "/en" +
			 * staticPath; } File staticFile = new
			 * File(servletContext.getRealPath(staticPath)); File
			 * staticDirectory = staticFile.getParentFile(); if
			 * (!staticDirectory.exists()) { staticDirectory.mkdirs(); }
			 * fileOutputStream = new FileOutputStream(staticFile);
			 * outputStreamWriter = new OutputStreamWriter(fileOutputStream,
			 * "UTF-8"); writer = new BufferedWriter(outputStreamWriter);
			 * template.process(model, writer); writer.flush(); return 1;
			 **/
			freemarker.template.Template template = freeMarkerConfigurer.getConfiguration().getTemplate(templatePath);
			File staticFile = new File(servletContext.getRealPath(staticPath));
			File staticDirectory = staticFile.getParentFile();
			if (!staticDirectory.exists()) {
				staticDirectory.mkdirs();
			}
			fileOutputStream = new FileOutputStream(staticFile);
			outputStreamWriter = new OutputStreamWriter(fileOutputStream, "UTF-8");
			writer = new BufferedWriter(outputStreamWriter);
			template.process(model, writer);
			writer.flush();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(writer);
			IOUtils.closeQuietly(outputStreamWriter);
			IOUtils.closeQuietly(fileOutputStream);
		}
		return 0;
	}

	@Transactional(readOnly = true)
	public int build(String templatePath, String staticPath) {
		return build(templatePath, staticPath, null);
	}

	// @Transactional(readOnly = true)
	// public int build(Product product) {
	// Assert.notNull(product);
	//
	// delete(product);
	// Template template = templateService.get("productContent");
	// int buildCount = 0;
	// // if (product.getIsMarketable()) {
	// Map<String, Object> model = new HashMap<String, Object>();
	// model.put("product", product);
	// buildCount += build(template.getTemplatePath(), product.getPath(),
	// model);
	// // }
	// return buildCount;
	// }

	// @Transactional(readOnly = true)
	// public int buildGoods(Product product) {
	// Assert.notNull(product);
	// Goods goods = product.getGoods();
	// int buildCount = 0;
	// if (goods.getProducts() != null) {
	// for (Product pd : goods.getProducts()) {
	// delete(pd);
	// Template template = templateService.get("productContent");
	// // if (pd.getIsMarketable()) {
	// Map<String, Object> model = new HashMap<String, Object>();
	// model.put("product", pd);
	// buildCount += build(template.getTemplatePath(), pd.getPath(), model);
	// // }
	// }
	// }
	// return buildCount;
	// }

	@Transactional(readOnly = true)
	public int buildIndex() {
		Template template = templateService.get("index");
		return build(template.getTemplatePath(), template.getStaticPath());
	}

	@Transactional(readOnly = true)
	public int buildEditionIndex() {
		Template template = templateService.get("edition");
		return build(template.getTemplatePath(), template.getStaticPath());
	}

	@Transactional(readOnly = true)
	public int buildEditionProfile() {
		Template template = templateService.get("editionProfile");
		return build(template.getTemplatePath(), template.getStaticPath());
	}

	@Transactional(readOnly = true)
	public int buildOther() {
		int buildCount = 0;
		Template adminCommonJsTemplate = templateService.get("adminCommonJs");
		buildCount += build(adminCommonJsTemplate.getTemplatePath(), adminCommonJsTemplate.getStaticPath());
		return buildCount;
	}

	@Transactional(readOnly = true)
	public int buildAll() {
		int buildCount = 0;
		// for (int i = 0; i < productDao.count(); i += 20) {
		// List<Product> products = productDao.findList(i, 20, null, null);
		// for (Product product : products) {
		// buildCount += build(product);
		// }
		// productDao.clear();
		// }
		// buildIndex();
		buildOther();
		return buildCount;
	}

	@Transactional(readOnly = true)
	public int delete(String staticPath) {
		Assert.hasText(staticPath);

		File staticFile = new File(servletContext.getRealPath(staticPath));
		if (staticFile.exists()) {
			staticFile.delete();
			return 1;
		}
		return 0;
	}

	// @Transactional(readOnly = true)
	// public int delete(Product product) {
	// Assert.notNull(product);
	// if ("en_us".equals(locale.getLanguage())) {
	// return delete("/en" + product.getPath());
	// } else {
	// return delete(product.getPath());
	// }
	// }

	@Transactional(readOnly = true)
	public int deleteIndex() {
		Template template = templateService.get("index");
		return delete(template.getStaticPath());
	}

	@Transactional(readOnly = true)
	public int deleteOther() {
		int deleteCount = 0;
		Template shopCommonJsTemplate = templateService.get("shopCommonJs");
		Template adminCommonJsTemplate = templateService.get("adminCommonJs");
		deleteCount += delete(shopCommonJsTemplate.getStaticPath());
		deleteCount += delete(adminCommonJsTemplate.getStaticPath());
		return deleteCount;
	}

	@Override
	public void setLocale(String lang) {
		locale = new Locale(lang);
	}

	@Override
	public int buildSitemap() {
		return 0;
	}
}
