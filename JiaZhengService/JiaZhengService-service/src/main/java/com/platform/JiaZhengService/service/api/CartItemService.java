package com.platform.JiaZhengService.service.api;

import com.platform.JiaZhengService.dao.entity.TCartItem;

public interface CartItemService extends BaseService {

	TCartItem find(Long id);

	void delete(Long[] ids);

	void updateCartItem(TCartItem cartItem);

	void saveCartItem(TCartItem cartItem);

	void delete(Long id);

	TCartItem findByParams(Long cartId, Long productId, Long specificationId);

}
