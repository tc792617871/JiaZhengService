package com.platform.JiaZhengService.Controller.mobile.member;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.platform.JiaZhengService.Controller.mobile.AbstractController;
import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.dao.entity.TCart;
import com.platform.JiaZhengService.dao.entity.TCartItem;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TSpecification;
import com.platform.JiaZhengService.service.api.CartItemService;
import com.platform.JiaZhengService.service.api.CartService;
import com.platform.JiaZhengService.service.api.MemberService;
import com.platform.JiaZhengService.service.api.ProductService;
import com.platform.JiaZhengService.service.api.SpecificationService;

@Controller("mobileCartController")
@RequestMapping("/mobile/member/cart")
public class CartController extends AbstractController {

	@Resource(name = "cartServiceImpl")
	private CartService cartService;

	@Resource(name = "cartItemServiceImpl")
	private CartItemService cartItemService;

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@Resource(name = "productServiceImpl")
	private ProductService productService;

	@Resource(name = "specificationServiceImpl")
	private SpecificationService specificationService;

	/**
	 * 购物篮列表
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		TMember member = memberService.getCurrent();
		TCart cart = cartService.findByMember(member.getId());
		List<TCartItem> cartItems = new ArrayList<>();
		if (cart != null) {
			cartItems = cartService.findCartItemsByCartId(cart.getId());
		}
		model.addAttribute("cart", cart);
		model.addAttribute("cartItems", cartItems);
		return "/mobile/member/cart/index";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long id) {
		TMember member = memberService.getCurrent();
		TCart cart = cartService.findByMember(member.getId());
		if (cart == null) {
			return Message.error("shop.cart.notEmpty");
		}
		TCartItem cartItem = cartItemService.find(id);
		if (cartItem == null) {
			return Message.error("shop.cart.cartItemNotExsit");
		}
		cartItemService.delete(id);
		return SUCCESS_MESSAGE;
	}

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public @ResponseBody Message add(Long productId, Long specificationId, Double quantity, HttpServletRequest request,
			HttpServletResponse response) {
		TProduct product = productService.find(productId);
		TSpecification specification = specificationService.find(specificationId);
		if (product == null || specification == null) {
			return Message.warn("shop.cart.productNotExsit");
		}
		if (!product.getIsMarketable()) {
			return Message.warn("shop.cart.productNotMarketable");
		}
		TMember member = memberService.getCurrent();
		TCart cart = cartService.findByMember(member.getId());
		if (cart == null) {
			cart = new TCart();
			cart.setCartKey(UUID.randomUUID().toString() + DigestUtils.md5Hex(RandomStringUtils.randomAlphabetic(30)));
			cart.setMember(member.getId());
			cartService.saveCart(cart);
		}
		List<TCartItem> cartItems = cartService.findCartItemsByCartId(cart.getId());
		if (cartItems != null && cartItems.size() > 0) {
			cart.setCartItems(cartItems);
		}

		if (TCart.MAX_PRODUCT_COUNT != null && cart.getCartItems().size() >= TCart.MAX_PRODUCT_COUNT) {
			return Message.warn("shop.cart.addCountNotAllowed", TCart.MAX_PRODUCT_COUNT);
		}

		if (cart.contains(specification)) {
			TCartItem cartItem = cart.getCartItem(specification);
			if (TCartItem.MAX_QUANTITY != null && cartItem.getQuantity() + quantity > TCartItem.MAX_QUANTITY) {
				return Message.warn("shop.cart.maxCartItemQuantity", TCartItem.MAX_QUANTITY);
			}
			cartItem.setQuantity(cartItem.getQuantity() + quantity);
			cartItemService.updateCartItem(cartItem);
		} else {
			if (TCartItem.MAX_QUANTITY != null && quantity > TCartItem.MAX_QUANTITY) {
				return Message.warn("shop.cart.maxCartItemQuantity", TCartItem.MAX_QUANTITY);
			}
			TCartItem cartItem = new TCartItem();
			cartItem.setQuantity(quantity);
			cartItem.setProduct(productId);
			cartItem.setSpecification(specificationId);
			cartItem.setCart(cart.getId());
			cartItemService.saveCartItem(cartItem);
			cart.getCartItems().add(cartItem);
		}
		return Message.success("shop.cart.addSuccess", cart.getQuantity());
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public @ResponseBody Message edit(Long id, Double quantity) {
		TCartItem cartItem = cartItemService.find(id);
		if (cartItem == null) {
			return Message.error("shop.cart.cartItemNotExsit");
		}
		cartItem.setQuantity(quantity);
		cartItemService.updateCartItem(cartItem);
		return SUCCESS_MESSAGE;
	}

}
