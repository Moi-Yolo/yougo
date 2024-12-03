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
        <c:if test="${not empty msg}"> 
   <script>alert('${msg}');</script> 
 </c:if>
 
 	 <script language="javascript">

		    function commodityQuery()
		    {    

		        document.formcommodity.submit();
		    }
        </script>
</head>

<body>
<div class="content-wrapper">
  <div class="content-header ">
    <div class="content-header-left mb-2">
      <h3 class="content-header-title mb-0">客户管理</h3>
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
          <th>登录账号</th>
          <th>姓名</th>  
           <th>联系电话</th>
          <th>联系地址</th>        
          <th>操作</th>

              </tr>
            </thead>
            <tbody>
            
         <c:forEach  items="${purchaserList}"  var="v" varStatus="sta">
		<tr>
          <td>${sta.index+1}</td>
          <td>${v.purnumber}</td>
          <td>${v.purname}</td>
          <td>${v.purtel}</td>
          <td>${v.puraddress}</td>
          <td class="td-manage">
<a onclick='return confirm("您确定删除么？");' class="btn btn-danger btn-td"  href="<%=path %>/purchaserDelete?id=${v.purid}">删除</a>
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
