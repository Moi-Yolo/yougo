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
 
 	 <script language="javascript">

		    function commodityQuery()
		    {    

		        document.formcommodity.submit();
		    }
		    function categorychang()
		    {
		    		var cateid = document.getElementById("cateid");
		    		$.ajax({
		    			url : "<%=path%>/modelinfo/findBycategory?cateid="+cateid.value,
		    			type:"post",
		    			success :  ajaxSendCallBackcity2
		    		});
		    	}
		    function ajaxSendCallBackcity2(data) {
		    		//如果是jsonArray这样返回
		    		//alert(data[0].name);
		    		//返回json结果
		    		/*
		    				把select中的所有option移除（除了请选择）
		    		 */

		    		var citySelect = document.getElementById("sortid");
		    		// 获取其所有子元素
		    		var optionEleList = citySelect.getElementsByTagName("option");
		    		// 循环遍历每个option元素，然后在citySelect中移除
		    		while (optionEleList.length > 0) {//子元素的个数如果大于1就循环，等于1就不循环了！
		    			citySelect.removeChild(optionEleList[0]);//总是删除1下标，因为1删除了，2就变成1了！
		    		}
		    		
		    		for ( var i = 0; i < data.length; i++) {
		    			var op = document.createElement("option");//创建一个指名名称元素
		    			op.value = data[i].sortid;//设置op的实际值为当前的省份名称
		    			var textNode = document.createTextNode(data[i].sortname);//创建文本节点
		    			op.appendChild(textNode);//把文本子节点添加到op元素中，指定其显示值

		    			document.getElementById("sortid").appendChild(op);
		    		}
		    	}
		 
        </script>
</head>

<body>
<div class="content-wrapper">
  <div class="content-header ">
    <div class="content-header-left mb-2">
      <h3 class="content-header-title mb-0">商品管理</h3>
    </div>
  </div>
  <div class="card">
    <div class="card-content">
      <div class="card-body">
        <div class="searchbox">
          <form method="post" class="form-inline" action="<%=path %>/commoditychaxun" name="formcommodity">	
        
 <div class="form-group">
             分类：
             <select class="goods_input" name="cateid"  id="cateid" onchange="categorychang()" style="width:200px;height:35px"  >
        <c:forEach  items="${categoryList}"  var="v" varStatus="sta">
									 <option value="${v.cateid}">${v.catename}</option>
								 </c:forEach></select>
             <select class="form-control" name="sortid" id="sortid" style="width:200px;height:35px"  >
					
        <c:forEach  items="${sortList}"  var="v" varStatus="sta">
									 <option value="${v.sortid}">${v.sortname}</option>
								 </c:forEach></select>
            </div>
			  <div class="form-group">
              <button type="button" onClick="commodityQuery()" class="btn btn-primary">查询</button>
            </div>
            
          </form>
        </div>
        <div class="tablebox1">
          <table class="table">
            <thead>
              <tr>
                <th>序号</th>
							  <th>手机编号</th>
							  <th>手机名称</th>
							  <th>颜色</th>
							  <th>分类</th>
							  <th>图片</th>
							  <th>操作</th>
              </tr>
            </thead>
            <tbody>
            
            <c:forEach  items="${commodityList}"  var="commodity" varStatus="sta">
							<tr>
							  <td>${sta.index+1}</td>
							  <td>${commodity.commnumber}</td>
							  <td>${commodity.commname}</td>
							    <td>${commodity.commobject}</td>
							  <td>${commodity.catename}--${commodity.sortname}</td>
			
							   <td><img src="<%=path %>/${commodity.commpicture1}" style="width:80px;height:80px"> </td>

							 
								<td><a href="<%=path %>/commoditybyid?id=${commodity.commid}" class="btn btn-primary btn-td">修改</a>
									<a onclick='return confirm("您确定删除么？");' class="btn btn-danger btn-td"  href="<%=path %>/commodityDelete?id=${commodity.commid}">删除</a></td>
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
