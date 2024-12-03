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
<script type="text/javascript" src="<%=path %>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/slider.js"></script> 
<link href="<%=path %>/css/css.css" type="text/css" rel="stylesheet">
</head>
<body>
  <jsp:include flush="true" page="/incTop.jsp"></jsp:include> 
    <div id="weizhi"><div class="conent"><span>当前位置：</span><a>首页</a> <span>></span> <a>商品列表</a></div></div>
<div id="fenlei">
<div class="nerrong_con"><div class="nerrong_left">分类：</div><div class="nerrong_right">
<c:forEach  items="${sortList}"  var="sort" varStatus="sta">
<a href="<%=path%>/commoditysort?id=${sort.sortid}&cateid=${cateid}">${sort.sortname}</a>
</c:forEach>
</div>
<div style="clear:both;"></div>
</div></div>
<!--产品页面-->
<div id="main3">
<c:forEach  items="${commodityList}"  var="commodity" varStatus="sta">
<div class="conent_warp">
<div class="conent_nei">
<div class="tupian">
<a href="<%=path%>/commoditycontent?id=${commodity.commid}">
<img src="<%=path %>/${commodity.commpicture1}"></a></div>
<div class="conent_wenzi">
<p>${commodity.commname} </p>
<p>型号：${commodity.modname} </p>
<p><span>￥${commodity.modprice}</span></p>
</div>
</div>
</div>
</c:forEach>

<script type="text/javascript">
$(document).ready(function(){
$(".conent_warp").mouseover(function(){
$(this).children(".conent_nei").css("border","1px solid #d62c2c")	
	
	});
	$(".conent_warp").mouseout(function(){
$(this).children(".conent_nei").css("border","1px solid #e2e2e2")	
	
	});
	
	});

</script>
</div>
<div style="clear:both"></div>
<div id="fenye_war">${pageHtml}
</div>
<div style="clear:both"></div>
 <jsp:include flush="true" page="/incFoot.jsp"></jsp:include>
</body>
</html>