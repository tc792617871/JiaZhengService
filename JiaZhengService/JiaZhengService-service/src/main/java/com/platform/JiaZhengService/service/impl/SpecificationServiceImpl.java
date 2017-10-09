package com.platform.JiaZhengService.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.platform.JiaZhengService.dao.entity.TSpecification;
import com.platform.JiaZhengService.dao.mapper.TSpecificationMapper;
import com.platform.JiaZhengService.service.api.SpecificationService;

@Service("specificationServiceImpl")
public class SpecificationServiceImpl extends BaseServiceImpl implements SpecificationService {

	@Resource
	private TSpecificationMapper specificationMapper;

	@Override
	public TSpecification find(Long specificationId) {
		if (specificationId != null) {
			return specificationMapper.selectByPrimaryKey(specificationId);
		}
		return null;
	}

}