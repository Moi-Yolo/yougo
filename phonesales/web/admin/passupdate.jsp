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

		    function updateyanzheng()
		    {    
		    	if(document.form14.pwd1.value=="")
				 {
				 	alert("请输入原密码");
					return false;
				 }
				 if(document.form14.pwd2.value=="")
				 {
				 	alert("请输入新密码");
					return false;
				 }
				 if(document.form14.pwd3.value=="")
				 {
				 	alert("请输入确认密码");
					return false;
				 }
		        document.form14.submit();
		    }
        </script>
        <c:if test="${not empty msg}"> 
   <script>alert('${msg}');</script> 
 </c:if>
</head>


<body>
<div class="content-wrapper">
	<div class="content-header ">
    <div class="content-header-left mb-2 clearfix">
      <h3 class="content-header-title mb-0 pull-left">修改登录密码</h3>

    </div>
  </div>
	
  <div class="card">
    <div class="card-content">
      <div class="card-body">
      <form name="form14" id="form14" method="post" action="<%=path %>/Controllersupdate">	
        <div class="form1 form3" >
<ul class="row">
<li class="col-sm-10 col-xs-12"><span>原密码：</span>
 <input type="password" name="pwd1" class="form-control">
</li>
<li class="col-sm-10 col-xs-12"><span>新密码：</span>
 <input type="password" name="pwd2" class="form-control">
</li>
<li class="col-sm-10 col-xs-12"><span>确认密码：</span>
 <input type="password" name="pwd3" class="form-control">
</li>
<li class="col-sm-10 col-xs-12"><input type="button" onClick="updateyanzheng()"  class="btn btn-primary" value="确认保存"></li>
</ul>
</div>
      </form>
      </div>
    </div>
  </div>
</div>
<script src="<%=path %>/admin/js/vendors.min.js" type="text/javascript"></script> 
<script src="<%=path %>/admin/js/app-menu.js" type="text/javascript"></script> 
<script src="<%=path %>/admin/js/app.js" type="text/javascript"></script> 
<script src="<%=path %>/admin/js/echarts.min.js" type="text/javascript"></script> 
<script>
lay('#version').html('-v'+ laydate.v);
laydate.render({
    elem: '#test1'
  ,range: true
  ,theme: '#00B5B8'
});
</script>

</body>

</html>
