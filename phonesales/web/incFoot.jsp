<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
<div id="footer">
<div class="menu">
<p><a href="">优购商城</a>    <span>|</span>  <a href="<%=path%>/admin/login.jsp"> 管理员登录</a> </p>
</div></div>
</div>	
  </body>
</html>
