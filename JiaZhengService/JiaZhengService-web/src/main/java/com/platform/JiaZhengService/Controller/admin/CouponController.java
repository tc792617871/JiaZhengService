package com.platform.JiaZhengService.Controller.admin;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.platform.JiaZhengService.common.pojo.Message;
import com.platform.JiaZhengService.common.util.DateUtil;
import com.platform.JiaZhengService.common.util.FreemarkerUtils;
import com.platform.JiaZhengService.common.util.SmsCellUtil;
import com.platform.JiaZhengService.dao.Criteria;
import com.platform.JiaZhengService.dao.Criteria.Condition;
import com.platform.JiaZhengService.dao.Pageable;
import com.platform.JiaZhengService.dao.constants.TTMember;
import com.platform.JiaZhengService.dao.entity.TCoupon;
import com.platform.JiaZhengService.dao.entity.TCouponCode;
import com.platform.JiaZhengService.dao.entity.TMember;
import com.platform.JiaZhengService.service.api.AdminService;
import com.platform.JiaZhengService.service.api.AreaService;
import com.platform.JiaZhengService.service.api.CouponCodeService;
import com.platform.JiaZhengService.service.api.CouponService;
import com.platform.JiaZhengService.service.api.MemberService;

/**
 * Controller - 优惠券
 * 
 */
@Controller("adminCouponController")
@RequestMapping("/admin/coupon")
public class CouponController extends AbstractController {

	/** logger */
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);

	@Resource(name = "couponServiceImpl")
	private CouponService couponService;

	@Resource(name = "couponCodeServiceImpl")
	private CouponCodeService couponCodeService;

	@Resource(name = "adminServiceImpl")
	private AdminService adminService;

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@Resource(name = "areaServiceImpl")
	private AreaService areaService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		Criteria c = createPaginationCriteria(pageable);
		Condition con = c.createConditon();
		if (StringUtils.isNotEmpty(pageable.getSearchProperty()) && StringUtils.isNotEmpty(pageable.getSearchValue())) {
			con.andLike(pageable.getSearchProperty(), pageable.getSearchValue());
		}
		if (StringUtils.isNotEmpty(pageable.getOrderProperty()) && pageable.getOrderDirection() != null) {
			c.setOrderByClause(pageable.getOrderProperty() + " " + pageable.getOrderDirection());
		}
		model.addAttribute("pageable", pageable);
		model.addAttribute("page", c.getPage());
		model.addAttribute("content", couponService.queryCouponList(c));
		return "/admin/coupon/list";
	}

	/**
	 * 检查价格运算表达式是否正确
	 */
	@RequestMapping(value = "/check_price_expression", method = RequestMethod.GET)
	public @ResponseBody boolean checkPriceExpression(String priceExpression) {
		if (StringUtils.isEmpty(priceExpression)) {
			return false;
		}
		try {
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("quantity", 111);
			model.put("price", new BigDecimal("9.99"));
			new BigDecimal(FreemarkerUtils.process("#{(" + priceExpression + ");M50}", model));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "/admin/coupon/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(TCoupon coupon, Long[] couponIds, RedirectAttributes redirectAttributes) {
		if (!isValid(coupon)) {
			return ERROR_VIEW;
		}
		if (coupon.getBeginDate() != null && coupon.getEndDate() != null
				&& coupon.getBeginDate().after(coupon.getEndDate())) {
			return ERROR_VIEW;
		}
		if (coupon.getMinimumQuantity() != null && coupon.getMaximumQuantity() != null
				&& coupon.getMinimumQuantity() > coupon.getMaximumQuantity()) {
			return ERROR_VIEW;
		}
		if (coupon.getMinimumPrice() != null && coupon.getMaximumPrice() != null
				&& coupon.getMinimumPrice().compareTo(coupon.getMaximumPrice()) > 0) {
			return ERROR_VIEW;
		}
		if (StringUtils.isNotEmpty(coupon.getPriceExpression())) {
			try {
				Map<String, Object> model = new HashMap<String, Object>();
				model.put("quantity", 111);
				model.put("price", new BigDecimal("9.99"));
				new BigDecimal(FreemarkerUtils.process("#{(" + coupon.getPriceExpression() + ");M50}", model));
			} catch (Exception e) {
				return ERROR_VIEW;
			}
		}
		couponService.saveCoupon(coupon);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		TCoupon coupon = couponService.find(id);
		model.addAttribute("coupon", coupon);
		return "/admin/coupon/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(TCoupon coupon, Long[] couponIds, RedirectAttributes redirectAttributes) {
		if (!isValid(coupon)) {
			return ERROR_VIEW;
		}
		if (coupon.getBeginDate() != null && coupon.getEndDate() != null
				&& coupon.getBeginDate().after(coupon.getEndDate())) {
			return ERROR_VIEW;
		}
		if (coupon.getMinimumQuantity() != null && coupon.getMaximumQuantity() != null
				&& coupon.getMinimumQuantity() > coupon.getMaximumQuantity()) {
			return ERROR_VIEW;
		}
		if (coupon.getMinimumPrice() != null && coupon.getMaximumPrice() != null
				&& coupon.getMinimumPrice().compareTo(coupon.getMaximumPrice()) > 0) {
			return ERROR_VIEW;
		}
		if (StringUtils.isNotEmpty(coupon.getPriceExpression())) {
			try {
				Map<String, Object> model = new HashMap<String, Object>();
				model.put("quantity", 111);
				model.put("price", new BigDecimal("9.99"));
				new BigDecimal(FreemarkerUtils.process("#{(" + coupon.getPriceExpression() + ");M50}", model));
			} catch (Exception e) {
				return ERROR_VIEW;
			}
		}
		couponService.updateCoupon(coupon);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long[] ids) {
		couponService.delete(ids);
		return SUCCESS_MESSAGE;
	}

	/**
	 * 生成优惠码
	 */
	@RequestMapping(value = "/build", method = RequestMethod.GET)
	public String build(Long id, ModelMap model) {
		TCoupon coupon = couponService.find(id);
		model.addAttribute("coupon", coupon);
		model.addAttribute("totalCount", couponCodeService.count(id, null, null));
		model.addAttribute("usedCount", couponCodeService.count(id, null, true));
		model.addAttribute("circulation", coupon.getCirculation());
		return "/admin/coupon/build";
	}

	/**
	 * 提交生成优惠码
	 */
	@RequestMapping(value = "/submit_build", method = RequestMethod.POST)
	public String submit_build(Long id, Integer count, ModelMap model, RedirectAttributes redirectAttributes) {
		if (count == null || count <= 0) {
			count = 50;
		}
		TCoupon coupon = couponService.find(id);
		couponCodeService.build(coupon, null, count);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 站内发送优惠券会员筛选
	 */
	@RequestMapping(value = "/provideCoupon", method = RequestMethod.GET)
	public String provideCoupon(Pageable pageable, TMember member, Long couponId, Date regDate, Long liveLocation,
			Double amountFrom, Double amountTo, ModelMap model) {
		Criteria c = createPaginationCriteria(pageable);
		Condition con = c.createConditon();
		if (!StringUtils.isEmpty(member.getUsername())) {
			con.andLike(TTMember.USERNAME, member.getUsername());
		}
		if (!StringUtils.isEmpty(member.getMobile())) {
			con.andLike(TTMember.MOBILE, member.getMobile());
		}
		if (!StringUtils.isEmpty(member.getName())) {
			con.andLike(TTMember.NAME, member.getName());
		}
		if (!StringUtils.isEmpty(member.getAddress())) {
			con.andLike(TTMember.ADDRESS, member.getAddress());
		}
		if (liveLocation != null) {
			con.andEqualTo(TTMember.AREA, liveLocation);
			model.addAttribute("area", areaService.find(liveLocation));
			model.addAttribute("liveLocation", liveLocation);
		}
		if (regDate != null) {
			Calendar calendar = DateUtils.toCalendar(regDate);
			calendar.set(Calendar.HOUR_OF_DAY, calendar.getActualMinimum(Calendar.HOUR_OF_DAY));
			calendar.set(Calendar.MINUTE, calendar.getActualMinimum(Calendar.MINUTE));
			calendar.set(Calendar.SECOND, calendar.getActualMinimum(Calendar.SECOND));
			regDate = calendar.getTime();
			con.andLessThanOrEqualTo(TTMember.CREATE_DATE, regDate);
		}
		if (amountFrom != null) {
			con.andGreaterThanOrEqualTo(TTMember.AMOUNT, amountFrom);
		}
		if (amountTo != null) {
			con.andLessThanOrEqualTo(TTMember.AMOUNT, amountTo);
		}

		if (StringUtils.isNotEmpty(pageable.getOrderProperty()) && pageable.getOrderDirection() != null) {
			c.setOrderByClause(pageable.getOrderProperty() + " " + pageable.getOrderDirection());
		}
		model.addAttribute("username", member.getUsername());
		model.addAttribute("mobile", member.getMobile());
		model.addAttribute("name", member.getName());
		model.addAttribute("address", member.getAddress());
		model.addAttribute("amountFrom", amountFrom);
		model.addAttribute("amountTo", amountTo);
		model.addAttribute("couponId", couponId);
		model.addAttribute("regDate", regDate);
		model.addAttribute("pageable", pageable);
		model.addAttribute("page", c.getPage());
		model.addAttribute("content", memberService.findMemberList(c));
		return "/admin/coupon/provideCoupon";
	}

	/**
	 * @param listMembers4SendMsg
	 *            需要发送信息通知的会员
	 * @param msgContent
	 *            短信内容
	 */
	private void notifyUserByMsg(List<Long> listMembers4SendMsg, String msgContent) {
		// 短信通知
		for (Long idLong : listMembers4SendMsg) {
			TMember member = this.memberService.find(idLong);
			if (member != null) {
				try {
					Map<String, String> smsSendResult = SmsCellUtil.getInstance().sendDone(member.getMobile(),
							msgContent, DateUtil.getCurrentDate());
					if ("0".equals(smsSendResult.get("return"))) {
						logger.info("send Coupon Caring Sms Push Success");
					} else {
						logger.info("send Coupon Caring Sms Push Failed");
					}
				} catch (IOException e) {
					e.printStackTrace();
				} catch (InterruptedException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 站内选择发送优惠券
	 */
	@RequestMapping(value = "/sendCouponToMember", method = RequestMethod.GET)
	public @ResponseBody Message sendCouponToMember(Long[] ids, Long couponId, Long number, Integer[] notifyWays,
			String msgContent, ModelMap model) {
		TCoupon coupon = this.couponService.find(couponId);
		Long idsSize = (long) ids.length;
		if (coupon != null) {
			if (!coupon.getIsEnabled() || coupon.getIsEnabled() == null) {
				return Message.warn("优惠券【" + coupon.getName() + "】未启用");
			}
			if (coupon.getEndDate() != null && new Date().after(coupon.getEndDate())) {
				return Message.warn("优惠券【" + coupon.getName() + "】已过期");
			}
			if (number > coupon.getLimited()) {
				return Message.warn("数量超过每人限领数量,优惠券【" + coupon.getName() + "】每人限领量是：" + coupon.getLimited());
			}

			/* 该部分判断可发行数量是否足够 */
			Long couponCodeTotal = coupon.getCirculation();
			// 计算该优惠券下已使用的优惠码
			Long copuonCodeUsed = 0L;
			if (coupon.getCouponCodes() != null) {
				for (TCouponCode couponCode : coupon.getCouponCodes()) {
					if (couponCode.getMember() != null) {
						copuonCodeUsed++;
						continue;
					}
				}
			}
			Long countAvail = couponCodeTotal - copuonCodeUsed;
			if (countAvail <= 0) {
				return Message.warn("优惠券【" + coupon.getName() + "】已无可发行数量");
			}
			Long countNeeded = idsSize * number;
			if (countAvail < countNeeded) {
				return Message.warn("可发行数量不足，现发行量为" + couponCodeTotal + "张，已占用的优惠码为" + copuonCodeUsed + "张。");
			}

			// 经过上述的验证，现在仍然需要build的优惠码数量
			Integer count = (int) (coupon.getCouponCodes().size() - copuonCodeUsed);
			if (count < countNeeded.intValue()) {
				List<TCouponCode> couponCodes = couponCodeService.build(coupon, null, countNeeded.intValue() - count);
				couponCodes.addAll(coupon.getCouponCodes());// 合并build之前的优惠券
				coupon.setCouponCodes(couponCodes);
			}
			List<Long> list4SendMsg = new ArrayList<Long>();// 需要发送通知的会员
			Integer index = 0;// 控制发送会员的ids数组的索引值
			Integer releasedCount = 0;// 控制发行数量
			if (coupon.getCouponCodes() != null) {
				for (TCouponCode couponCode : coupon.getCouponCodes()) {
					if (couponCode.getMember() != null) {
						continue;
					}
					if (index == ids.length) {
						break;
					}
					TMember member = this.memberService.find(ids[index]);
					Integer tempIndex = index;
					for (int i = index; i < ids.length; i++) {
						if (couponCodeService.count(couponId, ids[index], null) < coupon.getLimited()) {
							if (!list4SendMsg.contains(ids[index])) {
								list4SendMsg.add(ids[index]);
							}
							break;
						} else {
							tempIndex += 1;
							if (tempIndex == ids.length) {
								return Message.warn("选中会员的优惠券发放量已达到最大量");
							}
							member = this.memberService.find(ids[tempIndex]);
						}
					}
					if (member != null) {
						if (couponCodeService.count(coupon.getId(), member.getId(), null) < coupon.getLimited()) {
							couponCode.setMember(member.getId());
							couponCodeService.updateCouponCode(couponCode);
							releasedCount++;
							if (couponCodeService.count(coupon.getId(), member.getId(), null)
									.equals(coupon.getLimited())) {
								index += 1;
							}
						}
					}
					if ((long) releasedCount >= countNeeded) {
						break;
					}
				}
			}
			if (notifyWays != null) {
				for (Integer notifyWay : notifyWays) {
					if (notifyWay == 0) {
						notifyUserByMsg(list4SendMsg, msgContent);
					}
				}
			}
		}
		return SUCCESS_MESSAGE;
	}

	/**
	 * 站内搜索发送优惠券
	 */
	@RequestMapping(value = "/sendCouponToAllMember", method = RequestMethod.GET)
	public String sendCouponToAllMember(Long couponId, Long[] memberRankIds, TMember member, Date regDate,
			Long liveLocation, BigDecimal amountFrom, BigDecimal amountTo, Long number, Integer[] notifyWays,
			String msgContent, String mailContent, ModelMap model, RedirectAttributes redirectAttributes) {
		Criteria c = new Criteria();
		Condition con = c.createConditon();
		if (!StringUtils.isEmpty(member.getUsername())) {
			con.andEqualTo(TTMember.USERNAME, member.getUsername());
		}
		if (!StringUtils.isEmpty(member.getMobile())) {
			con.andEqualTo(TTMember.MOBILE, member.getMobile());
		}
		if (!StringUtils.isEmpty(member.getName())) {
			con.andEqualTo(TTMember.NAME, member.getName());
		}
		if (!StringUtils.isEmpty(member.getAddress())) {
			con.andEqualTo(TTMember.ADDRESS, member.getAddress());
		}
		if (liveLocation != null) {
			con.andEqualTo(TTMember.AREA, liveLocation);
		}
		if (regDate != null) {
			Calendar calendar = DateUtils.toCalendar(regDate);
			calendar.set(Calendar.HOUR_OF_DAY, calendar.getActualMinimum(Calendar.HOUR_OF_DAY));
			calendar.set(Calendar.MINUTE, calendar.getActualMinimum(Calendar.MINUTE));
			calendar.set(Calendar.SECOND, calendar.getActualMinimum(Calendar.SECOND));
			regDate = calendar.getTime();
			con.andLessThanOrEqualTo(TTMember.CREATE_DATE, regDate);
		}
		model.addAttribute("username", member.getUsername());
		model.addAttribute("mobile", member.getMobile());
		model.addAttribute("name", member.getName());
		model.addAttribute("address", member.getAddress());
		model.addAttribute("amountFrom", amountFrom);
		model.addAttribute("amountTo", amountTo);
		model.addAttribute("couponId", couponId);
		model.addAttribute("regDate", regDate);
		List<TMember> members = memberService.findMemberList(c);

		if (members != null && members.size() > 0) {
			// 开始发送优惠券
			Integer memberSize = members.size();
			TCoupon coupon = this.couponService.find(couponId);
			if (coupon != null) {
				if (!coupon.getIsEnabled() || coupon.getIsEnabled() == null) {
					addFlashMessage(redirectAttributes, Message.warn("未启用"));
					return "redirect:provideCoupon.jhtml?id=" + couponId;
				}
				if (coupon.getEndDate() != null && new Date().after(coupon.getEndDate())) {
					addFlashMessage(redirectAttributes, Message.warn("已过期"));
					return "redirect:provideCoupon.jhtml?id=" + couponId;
				}
				if (number > coupon.getLimited()) {
					addFlashMessage(redirectAttributes, Message.warn("数量超过每人限领数量"));
					return "redirect:provideCoupon.jhtml?id=" + couponId;
				}

				/* 该部分判断可发行数量是否足够 */
				Long couponCodeTotal = couponCodeService.count(coupon.getId(), null, null);
				// 计算该优惠券下已使用的优惠码
				Long copuonCodeUsed = (long) 0;
				if (coupon.getCouponCodes() != null) {
					for (TCouponCode couponCode : coupon.getCouponCodes()) {
						if (couponCode.getMember() != null) {
							copuonCodeUsed++;
							continue;
						}
					}
				}
				Long countAvail = couponCodeTotal - copuonCodeUsed;
				if (countAvail <= 0) {
					addFlashMessage(redirectAttributes, Message.warn("已无可发行数量"));
					return "redirect:provideCoupon.jhtml?id=" + couponId;
				}
				Long countNeeded = memberSize * number;
				if (countAvail < countNeeded) {
					addFlashMessage(redirectAttributes,
							Message.warn("可发行数量不足，现发行量为" + couponCodeTotal + "张，已占用的优惠码为" + copuonCodeUsed + "张。"));
					return "redirect:provideCoupon.jhtml?id=" + couponId;
				}

				// 经过上述的验证，现在仍然需要build的优惠码数量
				Integer count = (int) (countNeeded - coupon.getCouponCodes().size());
				if (count > 0) {
					couponCodeService.build(coupon, null, count);
				}

				List<Long> list4SendMsg = new ArrayList<Long>();// 需要发送通知的会员
				Integer index = 0;// 控制发送会员的ids数组的索引值
				Integer releasedCount = 0;// 控制发行数量
				if (coupon.getCouponCodes() != null) {
					for (TCouponCode couponCode : coupon.getCouponCodes()) {
						if (couponCode.getMember() != null) {
							continue;
						}
						if (index == members.size()) {
							break;
						}
						TMember member4Search = members.get(index);
						Integer tempIndex = index;
						for (int i = index; i < members.size(); i++) {
							if (couponCodeService.count(coupon.getId(), member4Search.getId(), null) < coupon
									.getLimited()) {
								if (!list4SendMsg.contains(members.get(index).getId())) {
									list4SendMsg.add(members.get(index).getId());
								}
								break;
							} else {
								tempIndex += 1;
								if (tempIndex == members.size()) {
									addFlashMessage(redirectAttributes, Message.warn("选中会员的优惠券发放量已达到最大量"));
									return "redirect:provideCoupon.jhtml?id=" + couponId;

								}
								member4Search = members.get(tempIndex);
							}
						}

						if (member4Search != null) {
							if (couponCodeService.count(coupon.getId(), member4Search.getId(), null) < coupon
									.getLimited()) {
								couponCode.setMember(member4Search.getId());
								this.couponCodeService.updateCouponCode(couponCode);
								releasedCount++;
								if (couponCodeService.count(coupon.getId(), member4Search.getId(), null)
										.equals(coupon.getLimited())) {
									index += 1;
								}
							}
						}
						if ((long) releasedCount >= countNeeded) {
							break;
						}
					}
				}
				if (notifyWays != null) {
					for (Integer notifyWay : notifyWays) {
						if (notifyWay == 0) {
							notifyUserByMsg(list4SendMsg, msgContent);
						}
					}
				}
			}
		}
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:provideCoupon.jhtml?id=" + couponId;
	}

}
