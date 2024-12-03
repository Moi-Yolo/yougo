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
		    	if(document.formpurchaser.purname.value=="")
				 {
				 	alert("请输入用户姓名");
					return false;
				 }
		    	if(document.formpurchaser.purtel.value=="")
				 {
				 	alert("请输入联系电话");
					return false;
				 }
		    	if(document.formpurchaser.puraddress.value=="")
				 {
				 	alert("请输入 收货地址");
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
<div class="titlehy"><a href="<%=path %>/purchaser/purchaserupdate.jsp">个人信息</a>
<a class="hover-bj"  href="<%=path %>/myorderList">查询订单</a></div>
<div id="dingcxu"><div class="tittle">订单评价</div>
<div style="height:300px;">
<form action="<%=path %>/assessAdd" name="formorders" method="get">
<table width="877" border="0" style="margin-left:60px;margin-top:20px;">
  <tr>
    <td width="30" height="30">
   评价等级：</td> <td width="200" height="30">
 <select  name="assessflag" style="height:20px;width:200px" >
	<option value="好评">好评</option>
	<option value="中评">中评</option>
	<option value="差评">差评</option>
	</select> </td>
  </tr>
    <tr>
    <td width="30" height="30">
  评价内容：  </td>
   <td width="200" height="30">
  <textarea name="assrecontent" cols="100" rows="20" style="width:300px;height:100px;"></textarea>>
  <input type="hidden" name="orid" value="<%=request.getParameter("orid")%>"/>
    </td>
  </tr>
      <tr>
      <td width="30" height="30"></td>
    <td width="200" height="30">
	<input type="submit" style="width:70px;height:32px" value="提交"/>
    </td>
  </tr>
</table>

</form>
</div>
</div>
</div>
</html>