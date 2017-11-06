package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTCartItem;
import com.platform.JiaZhengService.dao.entity.TCartItem;
import com.platform.JiaZhengService.dao.mapper.TCartItemMapper;
import com.platform.JiaZhengService.dao.mapper.TProductMapper;
import com.platform.JiaZhengService.dao.mapper.TSpecificationMapper;
import com.platform.JiaZhengService.service.api.CartItemService;

@Service("cartItemServiceImpl")
public class CartItemServiceImpl extends BaseServiceImpl implements CartItemService {

	@Resource
	private TCartItemMapper cartItemMapper;

	@Resource
	private TProductMapper productMapper;

	@Resource
	private TSpecificationMapper specificationMapper;

	@Override
	public TCartItem find(Long id) {
		if (id != null) {
			TCartItem cartItem = cartItemMapper.selectByPrimaryKey(id);
			if (cartItem != null && cartItem.getSpecification() != null && cartItem.getProduct() != null) {
				cartItem.setTproduct(productMapper.selectByPrimaryKey(cartItem.getProduct()));
				cartItem.settSpecification(specificationMapper.selectByPrimaryKey(cartItem.getSpecification()));
			}
			return cartItem;
		}
		return null;
	}

	@Override
	@Transactional
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				cartItemMapper.deleteByPrimaryKey(id);
			}
		}
	}

	@Override
	@Transactional
	public void updateCartItem(TCartItem cartItem) {
		cartItem.setModifyDate(new Date());
		cartItemMapper.updateByPrimaryKeySelective(cartItem);
	}

	@Override
	@Transactional
	public void saveCartItem(TCartItem cartItem) {
		cartItem.setModifyDate(new Date());
		cartItem.setCreateDate(new Date());
		cartItemMapper.insertSelective(cartItem);
	}

	@Override
	@Transactional
	public void delete(Long id) {
		if (id != null) {
			cartItemMapper.deleteByPrimaryKey(id);
		}
	}

	@Override
	public TCartItem findByParams(Long cartId, Long productId, Long specificationId) {
		if (productId != null && specificationId != null && cartId != null) {
			Criteria criteria = new Criteria();
			criteria.createConditon().andEqualTo(TTCartItem.SPECIFICATION, specificationId)
					.andEqualTo(TTCartItem.CART, cartId).andEqualTo(TTCartItem.PRODUCT, productId);
			List<TCartItem> cartItems = cartItemMapper.selectByExample(criteria);
			if (cartItems != null && cartItems.size() > 0) {
				TCartItem cartItem = cartItems.get(0);
				if (cartItem != null && cartItem.getSpecification() != null && cartItem.getProduct() != null) {
					cartItem.setTproduct(productMapper.selectByPrimaryKey(cartItem.getProduct()));
					cartItem.settSpecification(specificationMapper.selectByPrimaryKey(cartItem.getSpecification()));
				}
				return cartItem;
			}
		}
		return null;
	}

}
