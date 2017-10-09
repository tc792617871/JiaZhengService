package com.platform.JiaZhengService.Controller.admin;

import java.math.BigDecimal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.util.JiaZhengServiceUtil;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.Criteria.Condition;
import com.platform.JiaZhengService.dao.Pageable;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.service.api.MemberService;

/**
 * Controller - 会员
 */
@Controller("adminMemberController")
@RequestMapping("/admin/member")
public class MemberController extends AbstractController {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	/**
	 * 检查用户名是否被禁用或已存在
	 */
	@RequestMapping(value = "/check_username", method = RequestMethod.GET)
	public @ResponseBody boolean checkUsername(String username) {
		if (StringUtils.isEmpty(username)) {
			return false;
		}
		if (memberService.usernameDisabled(username) || memberService.usernameExists(username)) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 检查mobile是否唯一
	 */
	@RequestMapping(value = "/check_mobile", method = RequestMethod.GET)
	public @ResponseBody boolean checkMobile(String previousMobile, String mobile) {
		if (StringUtils.isEmpty(mobile)) {
			return false;
		}
		if (memberService.mobileUnique(mobile)) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 查看
	 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Long id, ModelMap model) {
		model.addAttribute("member", memberService.find(id));
		return "/admin/member/view";
	}

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "/admin/member/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(TMember member, Long memberRankId, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		Setting setting = SettingUtils.get();
		member.setUsername(member.getMobile());
		if (member.getUsername().length() < setting.getUsernameMinLength()
				|| member.getUsername().length() > setting.getUsernameMaxLength()) {
			return ERROR_VIEW;
		}
		if (member.getPassword().length() < setting.getPasswordMinLength()
				|| member.getPassword().length() > setting.getPasswordMaxLength()) {
			return ERROR_VIEW;
		}
		if (memberService.usernameDisabled(member.getUsername())
				|| memberService.usernameExists(member.getUsername())) {
			return ERROR_VIEW;
		}
		member.setUsername(member.getUsername().toLowerCase());
		member.setPassword(DigestUtils.md5Hex(member.getPassword()));
		member.setIsLocked(false);
		member.setLoginFailureCount(0);
		member.setLockedDate(null);
		member.setRegisterIp(JiaZhengServiceUtil.getAddr(request));
		member.setLoginIp(null);
		member.setLoginDate(null);
		memberService.saveMember(member);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("member", memberService.find(id));
		return "/admin/member/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(TMember member, Long memberRankId, Integer modifyPoint, BigDecimal modifyBalance,
			String depositMemo, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		if (member.getIsLocked() != null && !member.getIsLocked()) {
			member.setLoginFailureCount(0);
			member.setLockedDate(null);
		}
		memberService.updateMember(member);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model, String rankName) {
		Criteria c = createPaginationCriteria(pageable);
		Condition con = c.createConditon();
		if (StringUtils.isNotEmpty(pageable.getSearchProperty()) && StringUtils.isNotEmpty(pageable.getSearchValue())) {
			con.andLike(pageable.getSearchProperty(), pageable.getSearchValue());
		}
		model.addAttribute("pageable", pageable);
		model.addAttribute("page", c.getPage());
		model.addAttribute("content", memberService.findMemberList(c));
		return "/admin/member/list";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long[] ids) {
		if (ids != null) {
			for (Long id : ids) {
				TMember member = memberService.find(id);
				if (member != null && member.getBalance().compareTo(0.0) > 0) {
					return Message.error("admin.member.deleteExistDepositNotAllowed", member.getUsername());
				}
			}
			memberService.delete(ids);
		}
		return SUCCESS_MESSAGE;
	}

}
