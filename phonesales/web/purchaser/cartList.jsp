<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path %>/purchaser/css/huiyuan.css" type="text/css" rel="stylesheet">
<script language="javascript">

		    function jia(crid,commquantity)
		    {    
		    	
		    	window.location.href="<%=path%>/cartjia?crid="+crid+"&commquantity="+commquantity+"";
		    }
		    function jian(crid,commquantity)
		    {    
		    	if(commquantity==1)
		    	{
		    		return;
		    	}
		    	window.location.href="<%=path%>/cartjian?crid="+crid+"&commquantity="+commquantity+"";
		    }
		    
		    function xiayibu()
		    {    
		    	window.location.href="cartnextList";
		    }
        </script
        
            <c:if test="${not empty msg}"> 
   <script>alert('${msg}')</script> 
        </c:if>
</head>
<body style="background:#fff;">
<div id="denglu">
<div class="left_dl"><div class="logo1"><img src="<%=path %>/image/logo.jpg"  style="width:230px;height:55px;"></div>
<span>我的购物车</span>
</div>
<a href="<%=path%>/commodityindex">返回首页</a>
</div>
<div id="main_jhd">
<div class="buzhou"><div class="wenzib_sd">我的购物车</div><div class="wenzib_sd">确认订单信息</div><div class="wenzib_sd">下单成功</div>
<div style="clear:both"></div>
<ul>
<li class="hover">1</li><li class="yuan">2</li><li class="yuan">3</li>
</ul>
</div>
</div>
<div id="warptys">
<div class="price_biao"><table width="991" height="40" border="0">
  <tr>
    <td width=320>手机</td>
    <td width="138">单价</td>
    <td width="119">数量</td>
    <td width="186">金额</td>
    <td width="80">删除</td>
  </tr>
</table>
</div>
<div class="conent_lis">
<c:forEach  items="${cartList}"  var="v" varStatus="sta">
<div class="conent_sf">
<ul>
<li class="boxs_tw"><img src="<%=path%>/${v.commpicture}" width="50" height="60"></li>
<li class="boxs_sy"><a class="lanse">${v.commname}</a>--${v.modname}</li>
<li class="boxs_price">￥${v.modprice}</li>
<li class="boxs_cg"> 
<div class="caigou"><a href="javascript:void(0);" onclick="jian(${v.crid},${v.commquantity})" class="jian"></a><input type="text" class="text" id="number" name="number" type="text" value="${v.commquantity}" /><a class="jia"  href="javascript:void(0);" onclick="jia(${v.crid},${v.commquantity})"></a>

</div></li>
<li class="boxs_cji">￥${v.jiage}</li>
<li class="boxs_del"><p><a href="<%=path %>/cartDelete?id=${v.crid}" onClick="return confirm('您确定要删除吗?')" class="lanse">删除</a></p></li>
</ul>
</div>
</c:forEach>




<div class="bottom_dl">

<div class="qita"><a href="<%=path %>/cartnextList">确认下单</a><span style="margin-top:14px;">总价：<em>￥${zongjia}</em>元</span></div>
</div>
</div>



<div style=" clear:both"></div>
</div>
<div style="clear:both"></div>

</body>
</html>