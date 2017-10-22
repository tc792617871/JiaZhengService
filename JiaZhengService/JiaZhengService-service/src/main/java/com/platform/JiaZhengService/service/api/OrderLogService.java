package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.entity.TOrderLog;

public interface OrderLogService extends BaseService {

	List<TOrderLog> findOrderLogsByOrderId(Long id);

}
