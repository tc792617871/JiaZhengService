package com.platform.JiaZhengService.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTReceiver;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TReceiver;
import com.platform.JiaZhengService.dao.mapper.TMemberMapper;
import com.platform.JiaZhengService.dao.mapper.TReceiverMapper;
import com.platform.JiaZhengService.service.api.ReceiverService;

@Service("receiverServiceImpl")
public class ReceiverServiceImpl extends BaseServiceImpl implements ReceiverService {

	@Resource
	private TReceiverMapper receiverMapper;

	@Resource
	private TMemberMapper memberMapper;

	@Override
	public List<TReceiver> findReceiversByMemberID(Long id) {
		if (id != null) {
			Criteria criteria = new Criteria();
			criteria.createConditon().andEqualTo(TTReceiver.MEMBER, id);
			return receiverMapper.selectByExample(criteria);
		}
		return null;
	}

	@Override
	public TReceiver findDefault(Long memberId) {
		if (memberId != null) {
			Criteria criteria = new Criteria();
			criteria.createConditon().andEqualTo(TTReceiver.MEMBER, memberId).andEqualTo(TTReceiver.IS_DEFAULT, true);
			List<TReceiver> receivers = receiverMapper.selectByExample(criteria);
			if (receivers != null && receivers.size() > 0) {
				return receivers.get(0);
			}
		}
		return null;
	}

	@Override
	@Transactional
	public void saveReceiver(TReceiver receiver) {
		Date date = new Date();
		receiver.setCreateDate(date);
		receiver.setModifyDate(date);
		// 设置为默认
		if (receiver.getIsDefault() != null) {
			if (receiver.getIsDefault()) {
				TReceiver receiverDefault = findDefault(receiver.getMember());
				// 如果存在默认地址，则去掉以前的默认地址，设置当前地址为默认地址
				if (receiverDefault != null) {
					receiverDefault.setIsDefault(false);
					receiverDefault.setModifyDate(new Date());
					receiverMapper.updateByPrimaryKey(receiverDefault);
				}
			}
		} else {
			receiver.setIsDefault(false);
		}
		receiverMapper.insertSelective(receiver);
		if (receiver.getIsDefault() != null) {
			if (receiver.getIsDefault()) {
				TMember member = new TMember();
				member.setId(receiver.getMember());
				member.setArea(receiver.getId());
				member.setAddress(receiver.getAreaName() + receiver.getAddress());
				memberMapper.updateByPrimaryKeySelective(member);
			}
		}
	}

	@Override
	public TReceiver find(Long id) {
		if (id != null) {
			return receiverMapper.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	@Transactional
	public void deleteReceiver(Long id) {
		if (id != null) {
			receiverMapper.deleteByPrimaryKey(id);
		}
	}

	@Override
	@Transactional
	public void updateReceiver(TReceiver receiver) {
		receiver.setModifyDate(new Date());
		// 设置为默认
		if (receiver.getIsDefault() != null) {
			if (receiver.getIsDefault()) {
				TReceiver receiverDefault = findDefault(receiver.getMember());
				// 如果存在默认地址，则去掉以前的默认地址，设置当前地址为默认地址
				if (receiverDefault != null) {
					receiverDefault.setIsDefault(false);
					receiverDefault.setModifyDate(new Date());
					receiverMapper.updateByPrimaryKey(receiverDefault);
				}
			}
		} else {
			receiver.setIsDefault(false);
		}
		receiverMapper.updateByPrimaryKeySelective(receiver);
		if (receiver.getIsDefault() != null) {
			if (receiver.getIsDefault()) {
				TMember member = new TMember();
				member.setId(receiver.getMember());
				member.setArea(receiver.getId());
				member.setAddress(receiver.getAreaName() + receiver.getAddress());
				memberMapper.updateByPrimaryKeySelective(member);
			}
		}
	}

}
