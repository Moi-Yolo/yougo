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
	if(document.formpurchaser.purpassword.value=="")
	 {
	 	alert("请输入原密码");
		return false;
	 }
	 if(document.formpurchaser.purpassword1.value=="")
	 {
	 	alert("请输入新密码");
		return false;
	 }
	 if(document.formpurchaser.purpassword2.value=="")
	 {
	 	alert("请输入确认密码");
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
<div class="left_dl"><div class="logo1"><img src="<%=path %>/image/logo.jpg"  style="width:230px;height:55px;"></div>
<span>个人中心</span>
</div>
<a href="<%=path%>/commodityindex">返回首页</a>
</div>
<div id="main_hyzx">
<div class="titlehy">
<a href="<%=path %>/myorderList">我的订单</a>
<a class="hover-bj" href="<%=path %>/purchaser/purchaserupdate.jsp">个人信息</a>
</div>
<div class="left_hy"><div class="tittle_zh">个人信息</div>
<div class="service-menu">
<input class="menu-code-index" type="hidden" value="c849" />
<strong class="menu-p"><i class="menu-i"></i><a href="">个人信息</a></strong>
<div class="hover_bj"></div>
<div class="menu-c">
<ul>
<li><a data-service-index="c849" href="<%=path %>/purchaser/purchaserupdate.jsp">个人信息修改</a></li>
	<li><a data-service-index="c716" href="<%=path %>/purchaser/passupdate.jsp">修改登录密码</a></li>
</ul>
</div>
</div>
</div>
<div class="right_hy">
<div class="tittle_you">修改登录密码</div>
<div class="conen_qw">
 <div   id="div1" style ="display :block; border:0px;" class ="divContent1">
 <table width="762" border="0" style="margin-top:15px;">
 
  <form action="<%=path %>/purchaserpassedit" name="formpurchaser" method="get">
<tr>
    <td width="86" height="46"><div align="right" class="zitiwe">原密码：</div></td>
    <td width="666"><input type="password" class="text_gmm"    name="purpassword" style="width:164px;"/></td>
  </tr>
<tr>
    <td width="86" height="46"><div align="right" class="zitiwe">新密码：</div></td>
    <td width="666"><input type="password" class="text_gmm"  name="purpassword1" style="width:164px;"/></td>
  </tr>
<tr>
    <td width="86" height="46"><div align="right" class="zitiwe">确认密码：</div></td>
    <td width="666"><input type="password" class="text_gmm"  name="purpassword2" style="width:164px;"/></td>
  </tr>
  <tr>
    <td height="42"><div align="right"></div></td>
    <td>
    <input type="hidden" name="purnumber" value="${sessionScope.purchaser.purnumber}" />
    <input type="button" class="button_tjbc2" onclick="purchasercheck()" value=""/></td>
  </tr>
  </form>
</table>

				<div style="clear:both"></div>
            </div>
             
            </div>

</div>
<div style="clear:both"></div>
</div>
</html>