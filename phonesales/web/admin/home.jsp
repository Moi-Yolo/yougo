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
    <script src="<%=path %>/admin/js/jquery.js"></script>
<link href="<%=path %>/admin/css/font-awesome.css" rel="stylesheet">
<link href="<%=path %>/admin/css/bootstrap.css" rel="stylesheet">
<link href="<%=path %>/admin/css/style-responsive.css" rel="stylesheet">
<link href="<%=path %>/admin/css/default-theme.css" rel="stylesheet">
<link href="<%=path %>/admin/css/style.css" rel="stylesheet">
<link href="<%=path %>/admin/css/bootstrap-reset.css" rel="stylesheet">
 <title></title>
  <c:if test="${not empty msg}"> 
   <script>alert('${msg}')</script> 
        </c:if>
  </head> 
<body style="background:#f3f3f3"><div class="page-head clearfix">
      <ol class="breadcrumb pull-left">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
      </ol>
<div class="pull-right breadcrumbtn">		
		</div>
    </div>
    <div class="wrapper">
    <div class="row row2 state-overview">
            
                    <li>
                        <section class="panel ">
                            <div class="symbol purple-color">
                                <i class="fa fa-file-text"></i>
                            </div>
                            <div class="value gray">
                                <h1 class="purple-color timer" data-from="0" data-to="123" data-speed="1000">${ordercount}</h1>
                                <p>未发货订单数量</p>
                            </div>
                        </section>
                    </li></div>
                    
     
</body>
  <script src="<%=path %>/admin/js/bootstrap.js"></script> 
<script src="<%=path %>/admin/js/echarts.min.js"></script> 
<script src="<%=path %>/admin/js/scripts.js"></script> 
<script src="<%=path %>/admin/laydate/laydate.js"></script> 


</html>
