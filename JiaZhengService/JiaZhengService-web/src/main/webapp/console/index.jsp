<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.platform.JiaZhengService.common.util.SpringUtils"%>
<%
	String base = request.getContextPath();
	ApplicationContext applicationContext = SpringUtils.getApplicationContext();
	if (applicationContext != null) {
		response.sendRedirect("login.jsp");
	} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>提示信息 - 家政服务管理平台</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="author" content="Sencloud Team" />
<meta name="copyright" content="Sencloud" />
<link href="<%=base%>/resources/console/css/common.css" rel="stylesheet"
	type="text/css" />
<link href="<%=base%>/resources/console/css/login.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<fieldset>
		<legend>系统出现异常</legend>
	</fieldset>
</body>
</html>
<%
	}
%>