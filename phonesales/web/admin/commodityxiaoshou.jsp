<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/bootstrap-extended.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
        <c:if test="${not empty msg}"> 
   <script>alert('${msg}');</script> 
 </c:if>
</head>
<body>
<div class="content-wrapper">
  <div class="content-header ">
    <div class="content-header-left mb-2">
      <h3 class="content-header-title mb-0">销售数据统计</h3>
    </div>
  </div>
  <div class="card">
    <div class="card-content">
      <div class="card-body">
   
        <div class="tablebox1">
          <table class="table">
            <thead>
              <tr>
                <th>序号</th>
				
							  <th>手机名称</th>
							  <th>销售数量</th>
							
              </tr>
            </thead>
            <tbody>
            
            <c:forEach  items="${commodityList}"  var="commodity" varStatus="sta">
							<tr>
							  <td>${sta.index+1}</td>
				
							  <td>${commodity.commname}</td>
							    <td>${commodity.shuliang}</td>
							      </tr>
</c:forEach>
            </tbody>
          </table>
 
			<div class="page clearfix">

						<div class="pull-right">
							${pageHtml}
							</div>
							
						</div>
			
		  </div>
      </div>
    </div>
  </div>
</div>
<script src="<%=path %>/admin/js/vendors.min.js" type="text/javascript"></script> 
<script src="<%=path %>/admin/js/app-menu.js" type="text/javascript"></script> 
<script src="<%=path %>/admin/js/app.js" type="text/javascript"></script> 
<script src="<%=path %>/admin/js/echarts.min.js" type="text/javascript"></script> 
<script>
$(document).ready(function(){
  $(".ewm").click(function(){
    $(this).toggleClass("active")
  });
});
</script>
</body>
</html>
