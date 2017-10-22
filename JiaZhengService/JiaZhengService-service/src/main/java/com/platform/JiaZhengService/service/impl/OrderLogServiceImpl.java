package com.platform.JiaZhengService.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTOrderLog;
import com.platform.JiaZhengService.dao.entity.TOrderLog;
import com.platform.JiaZhengService.dao.mapper.TOrderLogMapper;
import com.platform.JiaZhengService.service.api.OrderLogService;

@Service("orderLogServiceImpl")
public class OrderLogServiceImpl extends BaseServiceImpl implements OrderLogService {

	@Resource
	private TOrderLogMapper orderLogMapper;

	@Override
	public List<TOrderLog> findOrderLogsByOrderId(Long id) {
		if (id != null) {
			Criteria criteria = new Criteria();
			criteria.createConditon().andEqualTo(TTOrderLog.ORDERS, id);
			List<TOrderLog> logs = orderLogMapper.selectByExample(criteria);
			return logs;
		}
		return null;
	}

}
