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
<script language="javascript">
   function ordercheck()
    {    
        document.formorders.submit();
    }
</script>
<c:if test="${not empty msg}"> 
<script>alert('${msg}');
  window.location.href="<%=path %>/orderManage";
</script> 
</c:if>
</head>

<body>
<div class="content-wrapper">
  <div class="content-header ">
    <div class="content-header-left mb-2">
      <h3 class="content-header-title mb-0">订单管理</h3>
    </div>
  </div>
  <div class="card">
    <div class="card-content">
      <div class="card-body">
        <div class="searchbox">
          <form method="post" class="form-inline" action="<%=path %>/orderQuery" name="formorders">	
            <div class="form-group">
            订单编号： <input type="text" class="form-control" name="ornumber">
            </div>
			  <div class="form-group">
              <button type="button" onClick="ordercheck()" class="btn btn-primary">查询</button>
            </div>
            
          </form>
        </div>
        <div class="tablebox1">
          <table class="table">
            <thead>
              <tr>
               <th>序号</th>
          <th>订单编号</th>
          <th>下单时间</th>
          <th>手机</th>
          <th>价格</th>
          <th>下单数量</th>
          <th>总计</th>
          <th>下单人姓名</th>
          <th>联系电话</th>
          <th>收货地址</th>
          <th>订单状态</th>
          <th>操作</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach  items="${orderList}"  var="orders" varStatus="sta">
        <tr>
      <td>${sta.index+1}</td>
	  <td>${orders.ornumber}</td>
	  <td>${orders.ortime}</td>
      <td>${orders.commname}--${orders.modname}</td>
	  <td>${orders.commprice}</td>
	  <td>${orders.commquantity}</td>
	  <td>${orders.commprice*orders.commquantity}</td>
	  <td>${orders.purname}</td>
	  <td>${orders.purtel}</td>
	  <td>${orders.puraddress}</td>
	  <td>${orders.orstate}</td>
	  
<td> <c:if test="${orders.orstate=='未发货'}">
    <a href="<%=path %>/updateorstate?orid=${orders.orid}"  class="btn btn-primary btn-td" onclick='return confirm("您确定要确认发货么？");' title="发货">发货</a>
    </c:if>

</td>
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
