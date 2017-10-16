package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.entity.TCart;
import com.platform.JiaZhengService.dao.entity.TCartItem;

public interface CartService extends BaseService {

	/**
	 * 根据会员ID 查询购物车
	 * 
	 * @param id
	 * @return
	 */
	TCart findByMember(Long id);

	/**
	 * 查询购物项
	 * 
	 * @param id
	 * @return
	 */
	List<TCartItem> findCartItemsByCartId(Long id);

	/**
	 * 保存购物车
	 * 
	 * @param cart
	 */
	void saveCart(TCart cart);

	/**
	 * 合并购物车
	 * 
	 * @param cart
	 */
	void mergeCart(TCart cart);

}
