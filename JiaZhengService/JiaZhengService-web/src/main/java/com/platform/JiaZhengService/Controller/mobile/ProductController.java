package com.platform.JiaZhengService.Controller.mobile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.platform.JiaZhengService.common.pojo.JiaZhengServiceConstants;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTProductCategory;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TProductCategory;
import com.platform.JiaZhengService.dao.entity.TProductWithBLOBs;
import com.platform.JiaZhengService.dao.entity.TSpecification;
import com.platform.JiaZhengService.service.api.ProductCategoryService;
import com.platform.JiaZhengService.service.api.ProductService;

/**
 * 商品详情
 * 
 */
@Controller("mobilesProductController")
@RequestMapping("/mobile/product")
public class ProductController extends AbstractController {

	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;

	@Resource(name = "productServiceImpl")
	private ProductService productService;

	/**
	 * 商品品类
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/productCategory", method = RequestMethod.GET)
	public String productCategory(Long productCategoryId, HttpServletRequest request, ModelMap model) {
		model.addAttribute("productCategoryId", productCategoryId);
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTProductCategory.GRADE, 0).andIsNull(TTProductCategory.PARENT);
		c.setOrderByClause(TTProductCategory.ORDERS + JiaZhengServiceConstants.SORT_ASC);
		List<TProductCategory> productCategories = productCategoryService.findList(c);
		if (productCategories != null && productCategories.size() > 0) {
			for (TProductCategory productCategory : productCategories) {
				List<TProductCategory> childProductCategories = productCategoryService
						.findRoots(productCategory.getId(), null);
				for (TProductCategory pc : childProductCategories) {
					List<TProduct> products = productService.queryProductListByProductCategroyID(pc.getId(), true,
							false);
					pc.setProducts(products);
				}
				productCategory.setChildCategories(childProductCategories);
			}
		}
		model.addAttribute("productCategories", productCategories);
		return "/mobile/product/productCategory";
	}

	/**
	 * 单品内容
	 */
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(Long productId, HttpServletRequest request, ModelMap model) {
		TProductWithBLOBs product = productService.find(productId);
		List<TSpecification> specifications = product.getSpecifications();
		model.addAttribute("defaultSpecification", specifications.get(0));
		model.addAttribute("specifications", specifications);
		model.addAttribute("product", product);
		Map<String, Object> specificationsMap = new HashMap<>();
		if (specifications != null && specifications.size() > 0) {
			for (TSpecification specification : specifications) {
				specificationsMap.put(String.valueOf(specification.getId()), specification);
			}
		}
		model.addAttribute("specificationsMap", specificationsMap);
		return "/mobile/product/content";
	}
}
