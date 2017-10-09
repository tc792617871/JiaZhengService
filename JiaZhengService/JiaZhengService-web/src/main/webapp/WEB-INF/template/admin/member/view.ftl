<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.view")} - 家政服务管理平台</title>
<meta name="author" content="xxxx有限公司 Team" />
<meta name="copyright" content="xxx有限公司" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.member.view")}
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="${message("admin.member.base")}" />
		</li>
	</ul>
	<table class="input tabContent">
		[#if member.isLocked]
			<tr>
				<th>
					${message("Member.lockedDate")}:
				</th>
				<td>
					${member.lockedDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
				<td colspan="2">
					&nbsp;
				</td>
			</tr>
		[/#if]
		<tr>
			<th>
				${message("Member.name")}:
			</th>
			<td>
				${member.name}
			</td>
			<th>
				${message("Member.mobile")}:
			</th>
			<td>
				${member.mobile}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.username")}:
			</th>
			<td>
				${member.username}
			</td>
			<th>
				${message("admin.member.status")}:
			</th>
			<td>
				[#if !member.isEnabled]
					<span class="red">${message("admin.member.disabled")}</span>
				[#elseif member.isLocked]
					<span class="red"> ${message("admin.member.locked")} </span>
				[#else]
					<span class="green">${message("admin.member.normal")}</span>
				[/#if]
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.point")}:
			</th>
			<td>
				${member.point}
			</td>
			<th>
				${message("Member.balance")}:
			</th>
			<td>
				${currency(member.balance, true)}
				<a href="../deposit/list.jhtml?memberId=${member.id}">[${message("admin.member.viewDeposit")}]</a>
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.registerIp")}:
			</th>
			<td>
				${member.registerIp}
			</td>
			<th>
				${message("admin.common.createDate")}:
			</th>
			<td>
				${member.createDate?string("yyyy-MM-dd HH:mm:ss")}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.loginDate")}:
			</th>
			<td>
				${(member.loginDate?string("yyyy-MM-dd HH:mm:ss"))!"-"}
			</td>
			<th>
				${message("Member.loginIp")}:
			</th>
			<td>
				${(member.loginIp)!"-"}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.buyCount")}:
			</th>
			<td>
				${(member.buyCount)!"-"}
			</td>
			<th>
				${message("Member.totalConsumption")}:
			</th>
			<td>
				${currency(member.totalConsumption, true)}
			</td>
		</tr>
		<tr>
			<th>
				${message("Member.lastPurchaseDate")}:
			</th>
			<td>
				${(member.lastPurchaseDate?string("yyyy-MM-dd HH:mm:ss"))!"-"}
			</td>
			<th>
				${message("Member.lastPurchaseAmount")}:
			</th>
			<td>
				${currency(member.lastPurchaseAmount, true)}
			</td>
		</tr>
	</table>
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
			</td>
		</tr>
	</table>
</body>
</html>