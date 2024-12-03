<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path %>/purchaser/css/huiyuan.css" type="text/css" rel="stylesheet">
<script language="javascript">
function purchasercheck()
{    
	if(document.formpurchaser.purnumber.value=="")
	 {
	 	alert("请输入用户名");
		return false;
	 }
	if(document.formpurchaser.purpassword.value=="")
	 {
	 	alert("请输入登录密码");
		return false;
	 }
    document.formpurchaser.submit();
}
        </script>
        
            <c:if test="${not empty msg}"> 
   <script>alert('${msg}')</script> 
        </c:if>
</head>
<body style="background:#fff;">
<div id="denglu">
<div class="left_dl"><div class="logo1"><img src="<%=path %>/image/logo.jpg" style="width:230px;height:55px;"></div>
<span>用户登陆</span>
</div>
<a href="<%=path%>/commodityindex">返回首页</a>
</div>
<div id="main_dls"><div class="conent_dl">
<div class="dl_right"><div class="con_dengl">
<div class="tittle_dl"><span>已注册会员</span><a href="<%=path %>/purchaser/purchaserReg.jsp">免费注册</a></div>
<div class="con_dlzh">
<table width="310" height="198" border="0" style="margin:0 auto;">
<form action="<%=path %>/purchaserLogin" name="formpurchaser" method="get" class="reg">
  <tr>
    <td width="66" height="43"><div align="right"><span>账户名：</span></div></td>
    <td width="223"><input type="text" name="purnumber" class="zhanghu_text"/></td>
  </tr>
  <tr>
    <td height="55"><div align="right"><span>密&nbsp;&nbsp;码：</span></div></td>
    <td><input type="password" name="purpassword" class="mima_text"/></td>
  </tr>

  <tr>
    <td height="60">&nbsp;</td>
      <td><input type="button"  onclick="purchasercheck()"  class="denglu_an" value="登陆"/></td>
  </tr>
  </form>
</table>

</div>
</div></div>
</div>
</div>
</body>
</html>