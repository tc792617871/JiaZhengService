package com.platform.JiaZhengService.Controller.mobile;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 商品详情
 * 
 */
@Controller("mobilesProductController")
@RequestMapping("/mobile/product")
public class ProductController extends AbstractController {

	/**
	 * 商品品类
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/productCategory", method = RequestMethod.GET)
	public String productCategory(HttpServletRequest request, ModelMap model) {
		return "/mobile/product/productCategory";
	}

	/**
	 * 单品内容
	 */
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(Long productId, HttpServletRequest request, ModelMap model) {
		return "/mobile/product/content";
	}

}
