package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.entity.TOrderItem;

public interface OrderItemService extends BaseService {

	List<TOrderItem> findOrderItemsByOrderId(Long id);

}
