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
		    	if(document.formpurchaser.purpassword.value!=document.formpurchaser.purpassword1.value)
				 {
				 	alert("注册时两次密码必须输入一致");
					return false;
				 }
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
		    	if(!isValidPhoneNumber(document.formpurchaser.purtel.value)==true)
		    	{
		    		alert("请输入正确的的联系电话");
					return false;
		    	}
		    	if(document.formpurchaser.puraddress.value=="")
				 {
				 	alert("请输入 收货地址");
					return false;
				 }
		    	if(document.formpurchaser.puremail.value=="")
				 {
				 	alert("请输入 电子邮箱");
					return false;
				 }
		    	if(!validateEmail(document.formpurchaser.puremail.value)==true)
		    	{
		    		alert("请输入正确的的电子邮箱");
					return false;
		    	}
		        document.formpurchaser.submit();
		    }
		    function isValidPhoneNumber(phoneNumber) 
		    {
		        return /^1\d{10}$/.test(phoneNumber);
		    }
		    function validateEmail(email)
		    {
		        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
		        return emailRegex.test(email);
		    }

        </script>
        
            <c:if test="${not empty msg}"> 
   <script>alert('${msg}')</script> 
        </c:if>
</head>
<body style="background:#fff;">
<div id="denglu">
<div class="left_dl"><div class="logo1"><img src="<%=path %>/image/logo.jpg"  style="width:230px;height:55px;"></div>
<span>用户注册</span>
</div>
<a href="<%=path%>/commodityindex">返回首页</a>
</div>
<div id="zhuce">
<div class="tittle_zc">用户注册!</div>
<div class="conent">
<div class="left_con">
<table width="536" height="435" border="0" style="margin-top:20px;">
 <form action="<%=path %>/purchaserReg" name="formpurchaser" method="get">
  <tr>
    <td width="90" height="54"><div align="right">用户账号：</div></td>
    <td width="436"><input type="text" name="purnumber" class="text_chang"/></td>
  </tr>
  <tr>
    <td height="54"><div align="right">登陆密码：</div></td>
    <td><input type="password" name="purpassword" class="text_chang"/></td>
  </tr>
   <tr>
    <td height="54"><div align="right">确认密码：</div></td>
    <td><input type="password" name="purpassword1" class="text_chang"/></td>
  </tr>
<tr>
    <td height="54"><div align="right">用户姓名：</div></td>
    <td><input type="text" name="purname" class="text_chang"/></td>
  </tr>
  <tr>
    <td height="54"><div align="right">手机号码：</div></td>
    <td><input type="text" name="purtel" class="text_chang"/></td>
  </tr>
  <tr>
    <td height="54"><div align="right">收货地址：</div></td>
    <td><input type="text" name="puraddress" class="text_chang"/></td>
  </tr>
    <tr>
    <td height="54"><div align="right">电子邮箱：</div></td>
    <td><input type="text" name="puremail" class="text_chang"/></td>
  </tr>
  <tr>
    <td height="65"><div align="right"></div></td>
    <td><input type="button" onclick="purchasercheck()" class="zhuce_button" value=""/></td>
  </tr>
  <tr>
    <td height="30"><div align="right"></div></td>
    <td>已注册<a href="<%=path %>/purchaser/purchaserlogin.jsp">在这里登陆</a></td>
  </tr>
  </form>
</table>

</div>
</div>
</div>
</body>
</html>