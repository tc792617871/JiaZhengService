package com.platform.JiaZhengService.service.api;

import java.util.List;

import com.platform.JiaZhengService.dao.entity.TReceiver;

public interface ReceiverService extends BaseService {

	/**
	 * 根据会员ID查找收货信息
	 * 
	 * @param id
	 * @return
	 */
	List<TReceiver> findReceiversByMemberID(Long id);

	/**
	 * 获取会员id默认的收货地址信息
	 * 
	 * @param id
	 * @return
	 */
	TReceiver findDefault(Long memberId);

	/**
	 * 存储收货信息
	 * 
	 * @param receiver
	 */
	void saveReceiver(TReceiver receiver);

	/**
	 * 根据id查询收货信息
	 * 
	 * @param id
	 * @return
	 */
	TReceiver find(Long id);

	/**
	 * 删除收货信息同时删除与会员的绑定关系
	 * 
	 * @param id
	 */
	void deleteReceiver(Long id);

	/**
	 * 更新收货信息
	 * 
	 * @param receiver
	 */
	void updateReceiver(TReceiver receiver);

}
