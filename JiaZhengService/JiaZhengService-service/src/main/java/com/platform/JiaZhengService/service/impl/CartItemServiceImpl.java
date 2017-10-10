package com.platform.JiaZhengService.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.platform.JiaZhengService.dao.entity.TCartItem;
import com.platform.JiaZhengService.dao.mapper.TCartItemMapper;
import com.platform.JiaZhengService.service.api.CartItemService;

@Service("cartItemServiceImpl")
public class CartItemServiceImpl extends BaseServiceImpl implements CartItemService {

	@Resource
	private TCartItemMapper cartItemMapper;

	@Override
	public TCartItem find(Long id) {
		return cartItemMapper.selectByPrimaryKey(id);
	}

	@Override
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				cartItemMapper.deleteByPrimaryKey(id);
			}
		}
	}

	@Override
	public void updateCartItem(TCartItem cartItem) {
		cartItem.setModifyDate(new Date());
		cartItemMapper.updateByPrimaryKeySelective(cartItem);
	}

	@Override
	public void saveCartItem(TCartItem cartItem) {
		cartItem.setModifyDate(new Date());
		cartItem.setCreateDate(new Date());
		cartItemMapper.insertSelective(cartItem);
	}

	@Override
	public void delete(Long id) {
		if (id != null) {
			cartItemMapper.deleteByPrimaryKey(id);
		}
	}

}
