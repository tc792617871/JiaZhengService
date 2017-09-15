package com.platform.JiaZhengService.Controller.admin;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Properties;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.platform.JiaZhengService.common.pojo.CommonAttributes;
import com.platform.JiaZhengService.common.pojo.FileInfo.FileType;
import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.pojo.Setting.AccountLockType;
import com.platform.JiaZhengService.common.pojo.Setting.CaptchaType;
import com.platform.JiaZhengService.common.pojo.Setting.ConsultationAuthority;
import com.platform.JiaZhengService.common.pojo.Setting.ReviewAuthority;
import com.platform.JiaZhengService.common.pojo.Setting.RoundType;
import com.platform.JiaZhengService.common.pojo.Setting.StockAllocationTime;
import com.platform.JiaZhengService.common.pojo.Setting.WatermarkPosition;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.service.api.CacheService;
import com.platform.JiaZhengService.service.api.FileService;
import com.platform.JiaZhengService.service.api.StaticService;

@Controller("settingController")
@RequestMapping("/admin/setting")
public class SettingController extends AbstractController {

	@Resource(name = "fileServiceImpl")
	private FileService fileService;

	@Resource(name = "cacheServiceImpl")
	private CacheService cacheService;

	@Resource(name = "staticServiceImpl")
	private StaticService staticService;

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(ModelMap model) {
		model.addAttribute("watermarkPositions", WatermarkPosition.values());
		model.addAttribute("roundTypes", RoundType.values());
		model.addAttribute("captchaTypes", CaptchaType.values());
		model.addAttribute("accountLockTypes", AccountLockType.values());
		model.addAttribute("stockAllocationTimes", StockAllocationTime.values());
		model.addAttribute("reviewAuthorities", ReviewAuthority.values());
		model.addAttribute("consultationAuthorities", ConsultationAuthority.values());
		return "/admin/setting/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Setting setting, MultipartFile watermarkImageFile, RedirectAttributes redirectAttributes) {
		if (!isValid(setting)) {
			return ERROR_VIEW;
		}
		if (setting.getUsernameMinLength() > setting.getUsernameMaxLength()
				|| setting.getPasswordMinLength() > setting.getPasswordMinLength()) {
			return ERROR_VIEW;
		}
		Setting srcSetting = SettingUtils.get();
		if (StringUtils.isEmpty(setting.getSmtpPassword())) {
			setting.setSmtpPassword(srcSetting.getSmtpPassword());
		}
		if (watermarkImageFile != null && !watermarkImageFile.isEmpty()) {
			if (!fileService.isValid(FileType.image, watermarkImageFile)) {
				addFlashMessage(redirectAttributes, Message.error("admin.upload.invalid"));
				return "redirect:edit.jhtml";
			}
			String watermarkImage = fileService.uploadLocal(FileType.image, watermarkImageFile);
			setting.setWatermarkImage(watermarkImage);
		} else {
			setting.setWatermarkImage(srcSetting.getWatermarkImage());
		}
		setting.setIsCnzzEnabled(srcSetting.getIsCnzzEnabled());
		setting.setCnzzSiteId(srcSetting.getCnzzSiteId());
		setting.setCnzzPassword(srcSetting.getCnzzPassword());
		SettingUtils.set(setting);
		cacheService.clear();
		staticService.buildOther();

		OutputStream outputStream = null;
		try {
			org.springframework.core.io.Resource resource = new ClassPathResource(
					CommonAttributes.JIAZHENGSERVICE_PROPERTIES_PATH);
			Properties properties = PropertiesLoaderUtils.loadProperties(resource);
			String templateUpdateDelay = properties.getProperty("template.update_delay");
			String messageCacheSeconds = properties.getProperty("message.cache_seconds");
			if (setting.getIsDevelopmentEnabled()) {
				if (!templateUpdateDelay.equals("0") || !messageCacheSeconds.equals("0")) {
					outputStream = new FileOutputStream(resource.getFile());
					properties.setProperty("template.update_delay", "0");
					properties.setProperty("message.cache_seconds", "0");
					properties.store(outputStream, "xxx PROPERTIES");
				}
			} else {
				if (templateUpdateDelay.equals("0") || messageCacheSeconds.equals("0")) {
					outputStream = new FileOutputStream(resource.getFile());
					properties.setProperty("template.update_delay", "3600");
					properties.setProperty("message.cache_seconds", "3600");
					properties.store(outputStream, "xxx PROPERTIES");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(outputStream);
		}
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:edit.jhtml";
	}

}
