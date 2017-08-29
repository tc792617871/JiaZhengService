package com.platform.JiaZhengService.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.constants.TTPluginConfig;
import com.platform.JiaZhengService.dao.constants.TTPluginConfigAttribute;
import com.platform.JiaZhengService.dao.entity.TPluginConfig;
import com.platform.JiaZhengService.dao.entity.TPluginConfigAttribute;
import com.platform.JiaZhengService.dao.mapper.TPluginConfigAttributeMapper;
import com.platform.JiaZhengService.dao.mapper.TPluginConfigMapper;
import com.platform.JiaZhengService.service.api.PluginConfigService;

/**
 * Service - 插件配置
 * 
 */
@Service("pluginConfigServiceImpl")
public class PluginConfigServiceImpl extends BaseServiceImpl implements PluginConfigService {

	@Resource
	private TPluginConfigMapper pluginConfigMapper;

	@Resource
	private TPluginConfigAttributeMapper pluginConfigAttributeMapper;

	@Transactional(readOnly = true)
	public boolean pluginIdExists(String pluginId) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTPluginConfig.PLUGIN_ID, pluginId);
		List<TPluginConfig> pluginConfigs = pluginConfigMapper.selectByExample(c);
		if (pluginConfigs != null && pluginConfigs.size() > 0) {
			return true;
		}
		return false;
	}

	@Transactional(readOnly = true)
	public TPluginConfig findByPluginId(String pluginId) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTPluginConfig.PLUGIN_ID, pluginId);
		List<TPluginConfig> pluginConfigs = pluginConfigMapper.selectByExample(c);
		if (pluginConfigs != null && pluginConfigs.size() > 0) {
			TPluginConfig config = pluginConfigs.get(0);
			Criteria criteria = new Criteria();
			criteria.createConditon().andEqualTo(TTPluginConfigAttribute.PLUGIN_CONFIG, config.getId());
			List<TPluginConfigAttribute> attributes = pluginConfigAttributeMapper.selectByExample(criteria);
			if (attributes != null && attributes.size() > 0) {
				Map<String, String> attris = new HashMap<String, String>();
				for (TPluginConfigAttribute attribute : attributes) {
					attris.put(attribute.getName(), attribute.getAttributes());
				}
				config.setAttributes(attris);
			}
			return config;
		}
		return null;
	}

	@Override
	@Transactional
	public boolean save(TPluginConfig pluginConfig) {
		pluginConfigMapper.insertSelective(pluginConfig);
		Map<String, String> attris = pluginConfig.getAttributes();
		if (attris != null) {
			for (String key : attris.keySet()) {
				TPluginConfigAttribute attribute = new TPluginConfigAttribute();
				attribute.setAttributes(attris.get(key));
				attribute.setName(key);
				attribute.setPluginConfig(pluginConfig.getId());
				pluginConfigAttributeMapper.insertSelective(attribute);
			}
		}
		return true;
	}

	@Override
	@Transactional
	public boolean update(TPluginConfig pluginConfig) {
		pluginConfigMapper.updateByPrimaryKeySelective(pluginConfig);
		Map<String, String> attris = pluginConfig.getAttributes();
		if (attris != null) {
			Criteria c = new Criteria();
			c.createConditon().andEqualTo(TTPluginConfigAttribute.PLUGIN_CONFIG, pluginConfig.getId());
			pluginConfigAttributeMapper.deleteByExample(c);
			for (String key : attris.keySet()) {
				TPluginConfigAttribute attribute = new TPluginConfigAttribute();
				attribute.setAttributes(attris.get(key));
				attribute.setName(key);
				attribute.setPluginConfig(pluginConfig.getId());
				pluginConfigAttributeMapper.insertSelective(attribute);
			}
		}
		return true;
	}

	@Override
	@Transactional
	public boolean delete(TPluginConfig pluginConfig) {
		Criteria c = new Criteria();
		c.createConditon().andEqualTo(TTPluginConfigAttribute.PLUGIN_CONFIG, pluginConfig.getId());
		pluginConfigAttributeMapper.deleteByExample(c);
		pluginConfigMapper.deleteByPrimaryKey(pluginConfig.getId());
		return true;
	}

}