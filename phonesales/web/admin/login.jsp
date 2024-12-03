<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<title>网上蛋糕店</title>
<head>
<link rel="stylesheet" href="<%=path %>/admin/css/login.css">
<c:if test="${not empty msg}"> 
   <script>alert('${msg}')</script> 
        </c:if>
        <script language="javascript">

		    function dengluyanzheng()
		    {    
		    	if(document.controllers.username.value=="")
				 {
				 	alert("请输入账号");
					return false;
				 }
				 if(document.controllers.pwd.value=="")
				 {
				 	alert("请输入密码");
					return false;
				 }
		        document.controllers.submit();
		    }
        </script>
  </head> 
  
  <body>
  
      <div id="pane">

        <div class="pane-header">
            <h2>管理员登录</h2>
        </div>

        <div class="pane-content">

      <form name="controllers"  method="post" action="<%=path %>/Controllerslogin">
           <div class="userpwd">
               <img src="<%=path %>/admin/img/icon_people.png">
               <input placeholder="请输入登录账号" name="username">
           </div>

           <div class="userpwd">
               <img src="<%=path %>/admin/img/icon_password.png">
               <input placeholder="请输入登录密码" type="password" name="pwd">
           </div>


<input type="button"  onclick="dengluyanzheng()"  class="login-btn" value="登录"/>
</form>
            <div class="reg">
                <a href="<%=path%>/commodityindex">返回前台</a>
            </div>
        </div>

    </div>  
	</body>
</html>
