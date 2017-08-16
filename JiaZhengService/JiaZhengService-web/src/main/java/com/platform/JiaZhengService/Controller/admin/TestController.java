package com.platform.JiaZhengService.Controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.entity.TUser;
import com.platform.JiaZhengService.service.api.ITestService;

@Controller("testController")
@RequestMapping("/admin/test")
public class TestController extends AbstractController {

	@Autowired
	private ITestService testService;

	/**
	 * 跳转到测试获取用户列表页面
	 */
	@RequestMapping(value = "/toTestUserList", method = RequestMethod.GET)
	public String toTestUserList(ModelMap model) {
		return "/admin/test/userList";
	}

	/**
	 * 测试获取用户列表
	 */
	@RequestMapping(value = "/getTestUserList", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getTestUserList(@RequestParam String aoData) {
		Criteria criteria = createPaginationCriteria(aoData);
		List<TUser> users = testService.getUsers(criteria);
		JSONObject json = writeJson(criteria.getPage().getCount(), users);
		return json;
	}

}
