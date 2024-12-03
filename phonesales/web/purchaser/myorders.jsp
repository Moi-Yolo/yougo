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
<link href="<%=path %>/purchaser/css/huiyuan.css" type="text/css" rel="stylesheet">
<script language="javascript">

		    function purchasercheck()
		    {    
		    	if(document.formpurchaser.purname.value=="")
				 {
				 	alert("请输入用户姓名");
					return false;
				 }
		    	if(document.formpurchaser.purtel.value=="")
				 {
				 	alert("请输入联系电话");
					return false;
				 }
		    	if(document.formpurchaser.puraddress.value=="")
				 {
				 	alert("请输入 收货地址");
					return false;
				 }
		        document.formpurchaser.submit();
		    }
        </script>
        
            <c:if test="${not empty msg}"> 
   <script>alert('${msg}');
   window.location.href="<%=path %>/myorderList";
   </script> 
        </c:if>
</head>
<body style="background:#fff;">
<div id="denglu">
<div class="left_dl"><div class="logo1"><img src="<%=path %>/image/logo.jpg"  style="width:230px;height:55px;"></div>
<span>个人中心</span>
</div>
<a href="<%=path%>/commodityindex">返回首页</a>
</div>
<div id="main_hyzx">
<div class="titlehy">
<a class="hover-bj"  href="<%=path %>/myorderList">我的订单</a>
<a  href="<%=path %>/purchaser/purchaserupdate.jsp">个人信息</a>

</div>
<div id="dingcxu"><div class="tittle">我的订单</div>
<div style="height:50px;">
<form action="<%=path %>/myorderQuery" name="formorders" method="get">
<table width="877" border="0" style="margin-left:60px;margin-top:20px;">
  <tr>
    <td width="340" height="30">
    订单编号：
    <input type="text" name="ornumber" style="width:164px;height:25px"/>
  订单状态：
     <select  name="orstate" style="width:200px;height:32px"  >
		<option value="所有">所有</option>
		<option value="未发货">未发货</option>
		<option value="已发货">已发货</option>
		<option value="已确认收货">已确认收货</option>
		<option value="已评价">已评价</option>
	</select>  
	<input type="submit" style="width:70px;height:32px" value="查询"/>
    </td>
  </tr>
</table>

</form>
</div>
<div class="jiage_b">
<table width="877" border="0">
  <tr>
    <td width="340" height="30">手机</td>
    <td width="128">单价（元）</td>
    <td width="123">数量</td>  
    <td width="103">金额</td>
    <td width="110">订单状态</td>
  </tr>
</table>
</div>
<c:forEach  items="${orderList}"  var="orders" varStatus="sta">
<div class="dcx_ding">
<table width="875" border="0" style="border-collapse:collapse;">
  <tr style="background:#f5f5f5;">
    <th colspan="4" height="43" style="text-align:left; font-size:12px; font-weight:normal;"><span style=" font-family:Arial, Helvetica, sans-serif; margin-right:20px; color:#555252;">&nbsp;&nbsp;&nbsp;订单号：${orders.ornumber}</span>
<span style=" margin-right:20px; color:#555252;">收货人：${orders.purname}，联系电话：${orders.purtel}，收货地址：${orders.puraddress}</span>

</th>
  </tr>
  <tr>
    <td width="498" height="107">
    <ul>
    <li class="td-img"><img src="<%=path %>/${orders.commpicture}" width="50" height="60"></li>
    <li class="td-neir"><p>${orders.commname}--${orders.modname}</p></li>
    <li class="td-price"><span class="jiacu">${orders.commprice}</span></li>
    </ul>
    
    </td>
    <td width="85"><div align="center" class="jiacu">${orders.commquantity}</div></td>
    <td width="134"><div align="center" class="jiacuhong">${orders.commquantity*orders.commprice}</div></td>
    <td width="140"><div align="center">
    ${orders.orstate}
    <c:if test="${orders.orstate=='已发货'}">
    <a href="<%=path %>/querenshouhuo?orid=${orders.orid}" onclick='return confirm("您确定要确认收货么？");' title="确认收货"><font color="red">确认收货</font></a>
    </c:if>
     <c:if test="${orders.orstate=='已确认收货'}">
    <a href="<%=path %>/purchaser/assesAdd.jsp?orid=${orders.orid}" title="评价"><font color="red">评价</font></a>
    </c:if>
    </div></td>
 

  </tr>
</table>
</div>
</c:forEach>
<div class="delete">

${pageHtml}

</div>
<div style="clear:both; height:20px;"></div>
</div>
</div>
</html>