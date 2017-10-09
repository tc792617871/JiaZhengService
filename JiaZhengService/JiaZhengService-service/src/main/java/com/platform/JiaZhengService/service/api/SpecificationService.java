package com.platform.JiaZhengService.service.api;

import com.platform.JiaZhengService.dao.entity.TSpecification;

/**
 * Service - 规格
 */
public interface SpecificationService extends BaseService {

	TSpecification find(Long specificationId);

}