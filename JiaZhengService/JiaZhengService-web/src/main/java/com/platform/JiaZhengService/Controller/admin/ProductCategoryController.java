package com.platform.JiaZhengService.Controller.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.platform.JiaZhengService.common.pojo.JiaZhengServiceConstants;
import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTProductCategory;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TProductCategory;
import com.platform.JiaZhengService.service.api.ProductCategoryService;

/**
 * Controller - 商品分类
 */
@Controller("adminProductCategoryController")
@RequestMapping("/admin/product_category")
public class ProductCategoryController extends AbstractController {

	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap model) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTProductCategory.GRADE, 0); // 顶级分类
		c.setOrderByClause(TTProductCategory.ORDERS + JiaZhengServiceConstants.SORT_ASC);
		List<TProductCategory> productCategoryTree = productCategoryService.findList(c);
		if (productCategoryTree != null && productCategoryTree.size() > 0) {
			for (TProductCategory pc : productCategoryTree) {
				List<TProductCategory> childProductCategories = productCategoryService.findRoots(pc.getId(), null);
				pc.setChildCategories(childProductCategories);
			}
		}
		model.addAttribute("productCategoryTree", productCategoryTree);
		return "/admin/product_category/list";
	}

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		Criteria c = new Criteria();
		c.setOrderByClause(TTProductCategory.ORDERS + JiaZhengServiceConstants.SORT_ASC);
		model.addAttribute("productCategoryTree", productCategoryService.findList(c));
		return "/admin/product_category/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(TProductCategory productCategory, Long parentId, Long[] brandIds,
			RedirectAttributes redirectAttributes) {
		if (!isValid(productCategory)) {
			return ERROR_VIEW;
		}
		TProductCategory pc = productCategoryService.find(parentId);
		if (pc != null) {
			productCategory.setGrade(pc.getGrade() + 1);
			productCategory.setTreePath(pc.getTreePath() + pc.getId() + JiaZhengServiceConstants.TREE_PATH_SEPARATOR);
		} else {
			productCategory.setGrade(0);
			productCategory.setTreePath(JiaZhengServiceConstants.TREE_PATH_SEPARATOR);
		}
		productCategory.setParent(parentId);
		productCategoryService.save(productCategory);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		TProductCategory productCategory = productCategoryService.find(id);
		model.addAttribute("productCategoryTree", productCategoryService.findRoots(null, null));
		model.addAttribute("productCategory", productCategory);
		model.addAttribute("parent", productCategoryService.find(productCategory.getParent()));
		model.addAttribute("childrens", productCategoryService.findRoots(id, null));
		return "/admin/product_category/edit";
	}

	/**
	 * 更新(不支持修改分类级别)
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(TProductCategory productCategory, Long parentId, Long[] brandIds,
			RedirectAttributes redirectAttributes) {
		if (!isValid(productCategory)) {
			return ERROR_VIEW;
		}
		productCategoryService.update(productCategory);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long id) {
		TProductCategory productCategory = productCategoryService.find(id);
		if (productCategory == null) {
			return ERROR_MESSAGE;
		}
		List<TProductCategory> children = productCategoryService.findRoots(id, null);
		if (children != null && !children.isEmpty()) {
			return Message.error("admin.productCategory.deleteExistChildrenNotAllowed");
		}
		List<TProduct> products = productCategoryService.findProducts(id);
		if (products != null && !products.isEmpty()) {
			return Message.error("admin.productCategory.deleteExistProductNotAllowed");
		}
		productCategoryService.delete(id);
		return SUCCESS_MESSAGE;
	}

	@RequestMapping(value = "/changeOrders", method = RequestMethod.POST)
	public @ResponseBody Message changeOrders(Long currentId, Long changeId, String btnType) {
		// 公共操作
		TProductCategory currentProductCategory = productCategoryService.find(currentId);
		TProductCategory changeProductCategory = productCategoryService.find(changeId);
		Integer currentPCOrders = currentProductCategory.getOrders();
		Integer changePCOrders = changeProductCategory.getOrders();
		currentProductCategory.setOrders(changePCOrders);
		changeProductCategory.setOrders(currentPCOrders);
		productCategoryService.update(currentProductCategory);
		productCategoryService.update(changeProductCategory);
		return SUCCESS_MESSAGE;
	}

	/**
	 * 置顶
	 * 
	 * @param currentId
	 * @return
	 */
	@RequestMapping(value = "/topOrders", method = RequestMethod.POST)
	public @ResponseBody Message topOrders(Long id) {
		// 将排序设置为0
		TProductCategory productCategory = productCategoryService.find(id);
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTProductCategory.GRADE, productCategory.getGrade());
		List<TProductCategory> productCategorys = productCategoryService.findList(c);
		if (productCategorys != null && productCategorys.size() > 0) {
			for (TProductCategory pc : productCategorys) {
				pc.setOrders(pc.getOrders() + 1);
				productCategoryService.update(pc);
			}
			productCategory.setOrders(0);
			productCategoryService.update(productCategory);
		}
		return SUCCESS_MESSAGE;
	}

}
