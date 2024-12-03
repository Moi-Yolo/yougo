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
   <script>alert('${msg}');
   window.location.href="<%=path %>/sortList";
   
   </script> 
 </c:if>
 <script language="javascript">

		    function sortcheck()
		    {    
		    	if(document.formsort.sortname.value=="")
				 {
				 	alert("请输入小类名称");
					return false;
				 }
				 
		        document.formsort.submit();
		    }
        </script>
</head>
<body>
<div class="content-wrapper">
  <div class="content-header ">
    <div class="content-header-left mb-2">
      <h3 class="content-header-title mb-0">小类管理</h3>
    </div>
  </div>
  <div class="card">
    <div class="card-content">
      <div class="card-body">
        <div class="searchbox">
          <form class="form-inline" method="post" action="<%=path %>/sortAdd" name="formsort">	
            <div class="form-group">
       大类名称： <select class="goods_input" name="cateid" style="width:200px;height:35px"  >
                 <c:forEach  items="${categoryList}"  var="v" varStatus="sta">
					<option value="${v.cateid}">${v.catename}</option>
				</c:forEach>
		</select>    
             小类名称： <input type="text" class="form-control" name="sortname">
            </div>

			  <div class="form-group">
              <button type="button" onClick="sortcheck()" class="btn btn-primary">添加</button>
            </div>
            
          </form>
        </div>
        <div class="tablebox1">
          <table class="table">
            <thead>
              <tr>
                <th>序号</th>
                 <th>大类名称</th>
                <th>小类名称</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach  items="${sortList}"  var="sort" varStatus="sta">
							<tr>
							  <td>${sta.index+1}</td>
							  <td>${sort.catename}</td>
							  <td>${sort.sortname}</td>

							  <td><a onclick='return confirm("您确定删除么？");' class="btn btn-danger btn-td" href="<%=path %>/sortDelete?id=${sort.sortid}">删除</a></td>
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
