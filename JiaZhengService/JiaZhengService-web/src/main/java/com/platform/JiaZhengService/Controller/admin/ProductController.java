package com.platform.JiaZhengService.Controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.pojo.TableAliasConstants;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.Criteria.Condition;
import com.platform.JiaZhengService.dao.Pageable;
import com.platform.JiaZhengService.dao.constants.TTProduct;
import com.platform.JiaZhengService.dao.constants.TTProductTag;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TProductWithBLOBs;
import com.platform.JiaZhengService.dao.entity.TTag.Type;
import com.platform.JiaZhengService.service.api.AdminService;
import com.platform.JiaZhengService.service.api.FileService;
import com.platform.JiaZhengService.service.api.ProductCategoryService;
import com.platform.JiaZhengService.service.api.ProductService;
import com.platform.JiaZhengService.service.api.SpecificationService;
import com.platform.JiaZhengService.service.api.StaticService;
import com.platform.JiaZhengService.service.api.TagService;

/**
 * Controller - 商品
 */
@Controller("adminProductController")
@RequestMapping("/admin/product")
public class ProductController extends AbstractController {

	@Resource(name = "productServiceImpl")
	private ProductService productService;

	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;

	@Resource(name = "tagServiceImpl")
	private TagService tagService;

	@Resource(name = "specificationServiceImpl")
	private SpecificationService specificationService;

	@Resource(name = "fileServiceImpl")
	private FileService fileService;

	@Resource(name = "staticServiceImpl")
	private StaticService staticService;

	@Resource(name = "adminServiceImpl")
	private AdminService adminService;

	/**
	 * 检查编号是否唯一
	 */
	@RequestMapping(value = "/check_sn", method = RequestMethod.GET)
	public @ResponseBody boolean checkSn(String previousSn, String sn) {
		if (StringUtils.isEmpty(sn)) {
			return false;
		}
		if (productService.snUnique(previousSn, sn)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Long productCategoryId, Long tagId, Boolean isMarketable, Boolean isSquare, Pageable pageable,
			ModelMap model) {
		Criteria c = createPaginationCriteria(pageable);
		Condition con = c.createConditon();
		if (StringUtils.isNotEmpty(pageable.getSearchProperty()) && StringUtils.isNotEmpty(pageable.getSearchValue())) {
			con.andLike(TableAliasConstants.ALIAS_T_PRODUCT + pageable.getSearchProperty(), pageable.getSearchValue());
		}
		if (StringUtils.isNotEmpty(pageable.getOrderProperty()) && pageable.getOrderDirection() != null) {
			c.setOrderByClause(TableAliasConstants.ALIAS_T_PRODUCT + pageable.getOrderProperty() + " "
					+ pageable.getOrderDirection());
		}
		if (productCategoryId != null) {
			con.andEqualTo(TableAliasConstants.ALIAS_T_PRODUCT + TTProduct.PRODUCT_CATEGORY, productCategoryId);
		}
		if (tagId != null) {
			List<Object> tagIds = new ArrayList<>();
			tagIds.add(tagId);
			con.andIn(TableAliasConstants.ALIAS_T_PRODUCT_TAG + TTProductTag.TAGS, tagIds);
		}
		if (isMarketable != null) {
			con.andEqualTo(TableAliasConstants.ALIAS_T_PRODUCT + TTProduct.IS_MARKETABLE, isMarketable);
		}
		if (isSquare != null) {
			con.andEqualTo(TableAliasConstants.ALIAS_T_PRODUCT + TTProduct.IS_SQUARE, isSquare);
		}
		model.addAttribute("pageable", pageable);
		model.addAttribute("page", c.getPage());
		model.addAttribute("content", productService.queryProductList(c));
		model.addAttribute("productCategoryTree", productCategoryService.findList(new Criteria()));
		model.addAttribute("tags", tagService.findList(Type.product));
		model.addAttribute("productCategoryId", productCategoryId);
		model.addAttribute("tagId", tagId);
		model.addAttribute("isMarketable", isMarketable);
		model.addAttribute("isSquare", isSquare);

		return "/admin/product/list";
	}

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		model.addAttribute("productCategoryTree", productCategoryService.findList(new Criteria()));
		model.addAttribute("tags", tagService.findList(Type.product));
		return "/admin/product/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(TProductWithBLOBs product, Long productCategoryId, Long[] tagIds, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		product.setProductCategory(productCategoryId);
		product.setTagIds(tagIds);
		productService.save(product);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("product", productService.find(id));
		model.addAttribute("productCategoryTree", productCategoryService.findList(new Criteria()));
		model.addAttribute("tags", tagService.findList(Type.product));
		return "/admin/product/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(TProductWithBLOBs product, Long productCategoryId, Long[] tagIds, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		product.setProductCategory(productCategoryId);
		product.setTagIds(tagIds);
		productService.update(product);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 同意商品上架/下架
	 * 
	 * @param ids
	 *            选中的商品id
	 * @param flag
	 *            标志是上架还是下架 0代表下架操作 1代表上架操作
	 * @return
	 */
	@RequestMapping(value = "/agreeIsMarketable", method = RequestMethod.POST)
	public @ResponseBody Message agreeMarketless(Long[] ids, Integer flag) {
		List<TProduct> products = productService.findList(ids);
		if (products != null && products.size() > 0) {
			boolean f = (flag == 1) ? true : false;
			for (TProduct product : products) {
				TProductWithBLOBs p = new TProductWithBLOBs();
				p.setIsMarketable(f);
				p.setId(product.getId());
				productService.updateByProductSelective(p);
			}
		}
		return SUCCESS_MESSAGE;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long[] ids) {
		productService.delete(ids);
		return SUCCESS_MESSAGE;
	}

}
