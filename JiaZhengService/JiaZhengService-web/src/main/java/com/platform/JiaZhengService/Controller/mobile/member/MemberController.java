package com.platform.JiaZhengService.Controller.mobile.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.platform.JiaZhengService.Controller.mobile.AbstractController;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.service.api.MemberService;

@Controller("mobileMemberController")
@RequestMapping("/mobile/member")
public class MemberController extends AbstractController {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String loginIndex(ModelMap model) {
		TMember member = memberService.getCurrent();
		model.addAttribute("member", member);
		return "/mobile/member/index";
	}

}
