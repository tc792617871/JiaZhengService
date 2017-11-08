package com.platform.JiaZhengService.Controller.mobile;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.platform.JiaZhengService.common.pojo.JiaZhengServiceConstants;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTProductCategory;
import com.platform.JiaZhengService.dao.constants.TTTag;
import com.platform.JiaZhengService.dao.entity.TProductCategory;
import com.platform.JiaZhengService.dao.entity.TTag;
import com.platform.JiaZhengService.service.api.ProductCategoryService;
import com.platform.JiaZhengService.service.api.TagService;

/**
 * Controller - mobile 首页
 */
@Controller("mobileHomeController")
@RequestMapping("/mobile")
public class MobileHomeController extends AbstractController {

	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;

	@Resource(name = "tagServiceImpl")
	private TagService tagService;

	/**
	 * mobile首页
	 */
	@RequestMapping(value = "/mobileIndex", method = RequestMethod.GET)
	public String mobileIndex(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		Criteria criteria = new Criteria();
		criteria.setOrderByClause(TTProductCategory.ORDERS + JiaZhengServiceConstants.SORT_ASC);
		List<TProductCategory> productCategories = productCategoryService.findList(criteria);
		model.addAttribute("productCategories", productCategories);

		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTTag.IS_ENABLED, true);
		c.setOrderByClause(TTTag.ORDERS + JiaZhengServiceConstants.SORT_ASC);
		List<TTag> tags = tagService.queryTagList(c);
		if (tags != null && tags.size() > 0) {
			for (TTag tag : tags) {
				tag.setProducts(tagService.findProductsByTagID(tag.getId(), true, false, 4));
			}
		}
		model.addAttribute("tags", tags);

		return "/mobile/index";
	}
}
