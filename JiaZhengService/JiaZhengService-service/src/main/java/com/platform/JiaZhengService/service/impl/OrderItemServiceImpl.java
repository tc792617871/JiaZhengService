package com.platform.JiaZhengService.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTOrderItem;
import com.platform.JiaZhengService.dao.entity.TOrderItem;
import com.platform.JiaZhengService.dao.entity.TProduct;
import com.platform.JiaZhengService.dao.entity.TSpecification;
import com.platform.JiaZhengService.dao.mapper.TOrderItemMapper;
import com.platform.JiaZhengService.dao.mapper.TProductMapper;
import com.platform.JiaZhengService.dao.mapper.TSpecificationMapper;
import com.platform.JiaZhengService.service.api.OrderItemService;

@Service("orderItemServiceImpl")
public class OrderItemServiceImpl extends BaseServiceImpl implements OrderItemService {

	@Resource
	private TOrderItemMapper orderItemMapper;

	@Resource
	private TProductMapper productMapper;

	@Resource
	private TSpecificationMapper specificationMapper;

	@Override
	public List<TOrderItem> findOrderItemsByOrderId(Long id) {
		if (id != null) {
			Criteria oic = new Criteria();
			oic.createConditon().andEqualTo(TTOrderItem.ORDERS, id);
			List<TOrderItem> orderItems = orderItemMapper.selectByExample(oic);
			if (orderItems != null && orderItems.size() > 0) {
				for (TOrderItem orderItem : orderItems) {
					TProduct product = productMapper.selectByPrimaryKey(orderItem.getProduct());
					TSpecification specification = specificationMapper.selectByPrimaryKey(orderItem.getSpecification());
					orderItem.settProduct(product);
					orderItem.settSpecification(specification);
				}
			}
			return orderItems;
		}
		return null;
	}

}
