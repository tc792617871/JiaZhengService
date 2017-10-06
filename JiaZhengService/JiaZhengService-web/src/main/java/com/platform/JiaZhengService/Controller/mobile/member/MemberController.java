package com.platform.JiaZhengService.Controller.mobile.member;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.platform.JiaZhengService.Controller.mobile.AbstractController;
import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.pojo.Setting;
import com.platform.JiaZhengService.common.util.RegUtils;
import com.platform.JiaZhengService.common.util.SettingUtils;
import com.platform.JiaZhengService.dao.entity.TArea;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.dao.entity.TReceiver;
import com.platform.JiaZhengService.service.api.AreaService;
import com.platform.JiaZhengService.service.api.MemberService;
import com.platform.JiaZhengService.service.api.ReceiverService;

@Controller("mobileMemberController")
@RequestMapping("/mobile/member")
public class MemberController extends AbstractController {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@Resource(name = "receiverServiceImpl")
	private ReceiverService receiverService;

	@Resource(name = "areaServiceImpl")
	private AreaService areaService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String loginIndex(ModelMap model) {
		TMember member = memberService.getCurrent();
		model.addAttribute("member", member);
		return "/mobile/member/index";
	}

	@RequestMapping(value = "/myOrder", method = RequestMethod.GET)
	public String myOrder(ModelMap model) {
		return "/mobile/member/myOrder";
	}

	/**
	 * 订单详情页面
	 */
	@RequestMapping(value = "/orderDetails", method = RequestMethod.GET)
	public String listOrderDetails(Long id, ModelMap model) {
		return "/mobile/member/orderDetails";
	}

	/**
	 * 我的优惠券
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/myCoupons", method = RequestMethod.GET)
	public String myCoupons(ModelMap model) {
		return "/mobile/member/myCoupons";
	}

	/**
	 * 领券中心
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/couponCenter", method = RequestMethod.GET)
	public String couponCenter(ModelMap model) {
		return "/mobile/member/couponCenter";
	}

	/**
	 * 寄送地址页面
	 */
	@RequestMapping(value = "/sendAddress", method = RequestMethod.GET)
	public String listSendAddress(ModelMap model) {
		TMember member = memberService.getCurrent();
		List<TReceiver> receivers = receiverService.findReceiversByMemberID(member.getId());
		model.addAttribute("member", member);
		model.addAttribute("receivers", receivers);
		return "/mobile/member/sendAddress";
	}

	/**
	 * 删除寄送地址
	 */
	@RequestMapping(value = "/deletesendAddress", method = RequestMethod.POST)
	public @ResponseBody Message deleteSendAddress(ModelMap model, Long id) {
		TMember member = memberService.getCurrent();
		if (member == null) {
			return Message.error("请先登陆!");
		}
		TReceiver receiver = receiverService.find(id);
		if (receiver == null) {
			return Message.error("删除收货地址失败");
		}
		receiverService.deleteReceiver(id);
		return SUCCESS_MESSAGE;
	}

	/**
	 * 新增寄送地址页面
	 */
	@RequestMapping(value = "/addNewAddress", method = RequestMethod.GET)
	public String addNewAddress(ModelMap model) {
		return "/mobile/member/addNewAddress";
	}

	/**
	 * 提交新增收货地址
	 */
	@RequestMapping(value = "/submitNewAddress", method = RequestMethod.POST)
	public @ResponseBody Message submitNewAddress(TReceiver receiver, Long modify_orderAreaId, ModelMap model) {
		TMember member = memberService.getCurrent();
		TArea area = areaService.find(modify_orderAreaId);
		receiver.setArea(modify_orderAreaId);
		receiver.setAreaName(area.getFullName());
		if (!isValid(receiver)) {
			return Message.error("新增收货地址失败");
		}
		if (!RegUtils.isMobileNO(receiver.getPhone())) {
			return Message.error("手机号格式错误");
		}
		receiver.setMember(member.getId());
		receiver.setIsDefault(receiver.getIsDefault());
		receiverService.saveReceiver(receiver);
		return SUCCESS_MESSAGE;
	}

	/**
	 * 编辑寄送地址
	 */
	@RequestMapping(value = "/editAddress", method = RequestMethod.GET)
	public String editAddress(Long id, ModelMap model) {
		TReceiver receiver = receiverService.find(id);
		TArea area = areaService.find(receiver.getArea());
		model.addAttribute("area", area);
		model.addAttribute("receiver", receiver);
		return "/mobile/member/editAddress";
	}

	/**
	 * 更新寄送地址
	 */
	@RequestMapping(value = "/updateAddress", method = RequestMethod.POST)
	public @ResponseBody Message updateAddress(TReceiver receiver, Long modify_orderAreaId, ModelMap model) {
		if (!isValid(receiver)) {
			return Message.error("修改收货地址失败");
		}
		if (!RegUtils.isMobileNO(receiver.getPhone())) {
			return Message.error("手机号格式错误");
		}
		TArea area = areaService.find(modify_orderAreaId);
		receiver.setAreaName(area.getFullName());
		receiver.setArea(modify_orderAreaId);
		receiverService.updateReceiver(receiver);
		return SUCCESS_MESSAGE;
	}

	/**
	 * 个人信息页面
	 */
	@RequestMapping(value = "/personalInfo", method = RequestMethod.GET)
	public String personalInfo(ModelMap model) {
		TMember member = memberService.getCurrent();
		TReceiver receiver = receiverService.findDefault(member.getId());
		model.addAttribute("member", member);
		model.addAttribute("receiver", receiver);
		return "/mobile/member/personalInfo";
	}

	/**
	 * 修改密码页面
	 */
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String changePassword(ModelMap model) {
		return "/mobile/member/changePassword";
	}

	/**
	 * 提交修改密码
	 */
	@RequestMapping(value = "/submitPassword", method = RequestMethod.GET)
	public @ResponseBody Message submitPassword(String oldPassword, String newPassword, ModelMap model) {
		TMember member = memberService.getCurrent();
		if (member == null) {
			return Message.error("请先登陆");
		}
		if ((oldPassword == null || oldPassword.length() <= 0) || (newPassword == null || newPassword.length() <= 0)) {
			return Message.error("shop.service.accountCenter.passwordNull");
		}
		Setting setting = SettingUtils.get();
		if (newPassword.length() < setting.getPasswordMinLength()
				|| newPassword.length() > setting.getPasswordMaxLength()) {
			return Message.error("shop.common.passwordLeninvalid");
		}
		if (DigestUtils.md5Hex(oldPassword).equals(member.getPassword())) {
			member.setPassword(DigestUtils.md5Hex(newPassword));
			memberService.updateMember(member);
			return SUCCESS_MESSAGE;
		} else {
			return Message.error("shop.service.accountCenter.oldPasswordWrong");
		}
	}

	/**
	 * 使用帮助
	 */
	@RequestMapping(value = "/useHelp", method = RequestMethod.GET)
	public String useHelp(Long id, ModelMap model) {
		return "/mobile/member/useHelp";
	}

	/**
	 * 关于我们
	 */
	@RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
	public String aboutUs(Long id, ModelMap model) {
		return "/mobile/member/aboutUs";
	}

}
