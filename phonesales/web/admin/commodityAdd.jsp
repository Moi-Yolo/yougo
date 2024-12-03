<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String htmlData = request.getParameter("commcontent") != null ? request.getParameter("commcontent") : "";
%>
<!DOCTYPE HTML>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
    <title></title>
<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/bootstrap-extended.css">
<link rel="stylesheet" href="<%=path %>/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=path %>/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=path %>/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="<%=path %>/kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
<script charset="utf-8" src="<%=path %>/kindeditor/plugins/code/prettify.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script language="javascript">
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="commcontent"]', {
				cssPath : '<%=path %>/kindeditor/plugins/code/prettify.css',
				uploadJson : '<%=path %>/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '<%=path %>/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterBlur: function(){this.sync();}
		
			});
			prettyPrint();
		});
		
	</script>
        <c:if test="${not empty msg}"> 
   <script>alert('${msg}');
   window.location.href="<%=path %>/admin/commodityAdd.jsp";
   
   </script> 
 </c:if>
 <script type="text/javascript">

 function up1()
 {
      var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
      pop.setContent("contentUrl","<%=path %>/upload/upload1.jsp");
      pop.setContent("title","文件上传");
      pop.build();
      pop.show();
 }
 function up2()
 {
      var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
      pop.setContent("contentUrl","<%=path %>/upload/upload2.jsp");
      pop.setContent("title","文件上传");
      pop.build();
      pop.show();
 }
 function up3()
 {
      var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
      pop.setContent("contentUrl","<%=path %>/upload/upload3.jsp");
      pop.setContent("title","文件上传");
      pop.build();
      pop.show();
 }
 function up4()
 {
      var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
      pop.setContent("contentUrl","<%=path %>/upload/upload4.jsp");
      pop.setContent("title","文件上传");
      pop.build();
      pop.show();
 }
		    function commoditycheck()
		    {    
		    	if(document.formcommodity.commnumber.value=="")
				 {
				 	alert("请输入手机编号");
					return false;
				 }
		    	if(document.formcommodity.commname.value=="")
				 {
				 	alert("请输入手机名称");
					return false;
				 }
		    	if(document.formcommodity.commobject.value=="")
				 {
				 	alert("请输入颜色");
					return false;
				 }
		    	if(document.formcommodity.commpicture1.value=="")
				 {
				 	alert("请至少上传一张图片");
					return false;
				 }

		        document.formcommodity.submit();
		    }
        </script>
  <script type="text/javascript">      
function modelAdd()
{
	var modname = document.getElementById("modname");
	var modprice = document.getElementById("modprice");
	var commid = document.getElementById("commid");
	$.ajax({
		url : "<%=path%>/modelinfo/modelAdd?commid="+commid.value+"&modname="+modname.value+"&modprice="+modprice.value+"",
		type:"post",
		success :  ajaxSendCallBackcity
	});
}
function ajaxSendCallBackcity(data) 
{
	var commid = document.getElementById("commid");
	$.ajax({
		url : "<%=path%>/modelinfo/modelManage?commid="+commid.value,
		type:"post",
		success :  ajaxSendCallBackcity1
	});
	document.getElementById("modname").value="";
	document.getElementById("modprice").value="";
}    
function ajaxSendCallBackcity1(data)
{
	var dom = ''; 
	for ( var i = 0; i < data.length; i++) 
	{
		dom += '<tr style="background:#fff;color:#000;border: 1px solid #cbcbcb">'; 
		dom += '<td>'+ data[i].modname +'</td>'; 
		dom += '<td>'+ data[i].modprice +'</td>';  
	    dom += '<td><a id='+ data[i].modid +' onClick="moddelete('+ data[i].modid +')"  href="javascript:;">删除</a></td>';    
		dom += '</tr>'; 
	}
	$('[data-json="area3"]').html(dom); 
}

function moddelete(modid)
{
	alert("ddddd");
	$.ajax({
		url : "<%=path%>/modelinfo/modelDelete?modid="+modid,
		type:"post",
		success :  ajaxSendCallBackcity
	});
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
            <style type="text/css">
 
body {
    margin: 10px;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
 
td,th {
    padding: 0;
}
 
.pure-table {
    border-collapse: collapse;
    border-spacing: 0;
    empty-cells: show;
    border: 1px solid #cbcbcb;
}
 
.pure-table caption {
    color: #000;
    font: italic 85%/1 arial,sans-serif;
    padding: 1em 0;
    text-align: center;
}
 
.pure-table td,.pure-table th {
    border-left: 1px solid #cbcbcb;
    border-width: 0 0 0 1px;
    font-size: inherit;
    margin: 0;
    overflow: visible;
    padding: .5em 1em;
}
 
.pure-table thead {
    background-color: #e0e0e0;
    color: #000;
    text-align: left;
    vertical-align: bottom;
}
 
.pure-table td {
    background-color: transparent;
}
</style> 
</head>
<body>

<div class="content-wrapper">
	<div class="content-header ">
    <div class="content-header-left mb-2 clearfix">
      <h3 class="content-header-title mb-0 pull-left">商品添加</h3>

    </div>
  </div>
	
  <div class="card">
    <div class="card-content">
      <div class="card-body">
        	  <form method="post" action="<%=path %>/commodityAdd" name="formcommodity">	
        <div class="form1 form3" >
<ul class="row">
<li class="col-sm-10 col-xs-12"><span>手机编号：</span>
<input type="text" name="commnumber" class="form-control">
</li>
<li class="col-sm-10 col-xs-12"><span>手机名称：</span>
 <input type="text" name="commname" class="form-control">
</li>

<li class="col-sm-10 col-xs-12"><span>手机分类：</span>
<select class="goods_input" name="cateid"  id="cateid" onchange="categorychang()" style="width:200px;height:35px"  >
        <c:forEach  items="${categoryList}"  var="v" varStatus="sta">
									 <option value="${v.cateid}">${v.catename}</option>
								 </c:forEach></select>
		<select class="goods_input" name="sortid" id="sortid" style="width:200px;height:35px"  >
		 <c:forEach  items="${sortList}"  var="v" varStatus="sta">
									 <option value="${v.sortid}">${v.sortname}</option>
								 </c:forEach>
      </select>						 
</li>
<li class="col-sm-10 col-xs-12"><span>颜色：</span>
 <input type="text" name="commobject" class="form-control">
</li>
<li class="col-sm-10 col-xs-12"><span>规格型号：</span>
 <input type="text" id="modname" name="modname" style="width:160px;height:30px">
  价格：<input type="text" id="modprice" name="modprice" style="width:160px;height:30px" >
  <input type="button" value="新增"  onclick="modelAdd()" style="width:60px" />
  
</li>
<li class="col-sm-10 col-xs-12">
<table class="pure-table">
  <tr>
    <td width="150">规格型号</td>
    <td width="80">价格</td>
    <td width="80">操作</td>
  </tr>
  <tbody data-json="area3"></tbody> 
</table>
  
</li>
<li class="col-sm-10 col-xs-12"><span>图片1：</span>
  <input type="text" id="commpicture1" name="commpicture1" style="width:160px;height:30px"  >
                <input type="button" value="上传"  onclick="up1()" style="width:60px" />
</li>
<li class="col-sm-10 col-xs-12"><span>图片2：</span>
  <input type="text" id="commpicture2" name="commpicture2" style="width:160px;height:30px"  >
                <input type="button" value="上传"  onclick="up2()" style="width:60px" />
</li>
<li class="col-sm-10 col-xs-12"><span>图片3：</span>
  <input type="text" id="commpicture3" name="commpicture3" style="width:160px;height:30px"  >
                <input type="button" value="上传"  onclick="up3()" style="width:60px" />
</li>
<li class="col-sm-10 col-xs-12"><span>图片4：</span>
  <input type="text" id="commpicture4" name="commpicture4" style="width:160px;height:30px"  >
                <input type="button" value="上传"  onclick="up4()" style="width:60px" />
</li>

<li class="col-sm-10 col-xs-12"> <span>详情介绍：</span>
			          
              
          
            </li><div style="margin-top:30px;margin-left:180px">
            <input type="hidden" id="commid" name="commid" value="${commid}" />
              <textarea name="commcontent" cols="100" rows="20" style="width:800px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
        </div>
<li class="col-sm-10 col-xs-12"><input type="button" onClick="commoditycheck()" class="btn btn-primary" value="确认保存"></li>
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
  
 <%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>
</html>
