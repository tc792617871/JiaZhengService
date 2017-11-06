package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTCart;
import com.platform.JiaZhengService.dao.constants.TTCartItem;
import com.platform.JiaZhengService.dao.entity.TCart;
import com.platform.JiaZhengService.dao.entity.TCartItem;
import com.platform.JiaZhengService.dao.mapper.TCartItemMapper;
import com.platform.JiaZhengService.dao.mapper.TCartMapper;
import com.platform.JiaZhengService.dao.mapper.TProductMapper;
import com.platform.JiaZhengService.dao.mapper.TSpecificationMapper;
import com.platform.JiaZhengService.service.api.CartService;

@Service("cartServiceImpl")
public class CartServiceImpl extends BaseServiceImpl implements CartService {

	@Resource
	private TCartMapper cartMapper;

	@Resource
	private TCartItemMapper cartItemMapper;

	@Resource
	private TProductMapper productMapper;

	@Resource
	private TSpecificationMapper specificationMapper;

	@Override
	public TCart findByMember(Long id) {
		if (id != null) {
			Criteria criteria = new Criteria();
			criteria.createConditon().andEqualTo(TTCart.MEMBER, id);
			List<TCart> carts = cartMapper.selectByExample(criteria);
			if (carts != null && carts.size() > 0) {
				return carts.get(0);
			}
		}
		return null;
	}

	@Override
	public List<TCartItem> findCartItemsByCartId(Long id) {
		if (id != null) {
			Criteria criteria = new Criteria();
			criteria.createConditon().andEqualTo(TTCartItem.CART, id);
			List<TCartItem> cartItems = cartItemMapper.selectByExample(criteria);
			if (cartItems != null && cartItems.size() > 0) {
				for (TCartItem cartItem : cartItems) {
					cartItem.setTproduct(productMapper.selectByPrimaryKey(cartItem.getProduct()));
					cartItem.settSpecification(specificationMapper.selectByPrimaryKey(cartItem.getSpecification()));
				}
			}
			return cartItems;
		}
		return null;
	}

	@Override
	@Transactional
	public void saveCart(TCart cart) {
		cart.setCreateDate(new Date());
		cart.setModifyDate(new Date());
		cartMapper.insertSelective(cart);
	}

	@Override
	@Transactional
	public void mergeCart(TCart cart) {
		List<TCartItem> cartItems = cart.getCartItems();
		if (cartItems != null && cartItems.size() > 0) {
			for (TCartItem cartItem : cartItems) {
				TCartItem sourceCartItem = cartItemMapper.selectByPrimaryKey(cartItem.getId());
				if (sourceCartItem.getQuantity().compareTo(cartItem.getQuantity()) > 0) { // 购物车部分提交
					sourceCartItem.setQuantity(sourceCartItem.getQuantity() - cartItem.getQuantity());
					cartItemMapper.updateByPrimaryKeySelective(sourceCartItem);
				} else { // 购物车部分提交 全部提交
					cartItemMapper.deleteByPrimaryKey(cartItem.getId());
				}
			}
		}
	}

}
