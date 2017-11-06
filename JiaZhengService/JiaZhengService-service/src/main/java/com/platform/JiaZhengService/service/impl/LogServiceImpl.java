package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TLogWithBLOBs;
import com.platform.JiaZhengService.dao.mapper.TLogMapper;
import com.platform.JiaZhengService.service.api.LogService;

@Service("logServiceImpl")
public class LogServiceImpl extends BaseServiceImpl implements LogService {

	@Resource
	private TLogMapper logMapper;

	@Override
	@Transactional
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				logMapper.deleteByPrimaryKey(id);
			}
		}

	}

	@Override
	@Transactional
	public void saveLog(TLogWithBLOBs log) {
		Date dt = new Date();
		log.setCreateDate(dt);
		log.setModifyDate(dt);
		logMapper.insertSelective(log);
	}

	@Override
	public TLogWithBLOBs find(Long id) {
		if (id != null) {
			return logMapper.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	@Transactional
	public void clear() {
		logMapper.deleteByExample(new Criteria());
	}

	@Override
	public List<TLogWithBLOBs> findLogs(Criteria c) {
		return logMapper.selectByExampleWithBLOBs(c);
	}

}
