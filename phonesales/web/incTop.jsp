<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
<title>优购商城</title>
<script type="text/javascript">
     function searchcheck()
     {   
    	 document.formsearch.submit();
     }
     </script>
  </head>
  
  <body>
  <div id="header">
<div class="conent">
<div class="left">
 <c:if test="${sessionScope.purchaser==null}">
<span>您好，欢迎来到优购商城！！</span><a href="<%=path %>/purchaser/purchaserlogin.jsp">登录</a><tt>|</tt><a href="<%=path %>/purchaser/purchaserReg.jsp">免费注册</a></div>
</c:if>
 <c:if test="${sessionScope.purchaser!=null}">
 <span>欢迎：${sessionScope.purnumber}</span></div>
 </c:if>
<div class="right">
 <c:if test="${sessionScope.purchaser!=null}">
<a href="<%=path %>/purchaserlogout" onclick='return confirm("您确定退出吗？");'">安全退出</a>

<span>|</span>
<a href="<%=path %>/myorderList">个人中心</a><span>|</span>
<a href="<%=path%>/cartList" class="bj3">我的购物车</a>
</c:if>
</div>
</div>
</div>
<!--logo部分-->
<div id="wrapper">
  <div class="conent">
     <div class="logo"><img src="image/logo.jpg"  style="width:280px;height:90px"/></div>
         <div class="search">
            <div class="search_top">
             <div class="search_lef">
                <form action="<%=path%>/commodityname" name="formsearch" method="get" >
             <input type="text" name="commname" class="text_wen" />
             <input type="button"  onclick="searchcheck()" class="button" />
             </form>
             </div>
</div>
</div>
</div>
</div>
     <div id="nav">
<div class="conent_na">
<ul>
<li><a href="<%=path%>/commodityindex" style="background:#af1414;">首页</a></li>
 <c:forEach  items="${sessionScope.categoryList}"  var="category" varStatus="sta">
<li><a href="<%=path%>/commoditycategory?id=${category.cateid}">${category.catename}</a></li>
</c:forEach>


</ul>
</div>
</div>
<div style="clear:both;"></div>
  </body>
</html>
