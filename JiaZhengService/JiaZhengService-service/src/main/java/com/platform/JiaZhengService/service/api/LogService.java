package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TLogWithBLOBs;

public interface LogService extends BaseService {

	void delete(Long[] ids);

	void saveLog(TLogWithBLOBs log);

	TLogWithBLOBs find(Long id);

	void clear();

	List<TLogWithBLOBs> findLogs(Criteria c);

}
