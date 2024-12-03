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
		    function tijiao()
		    {    
		    	  document.formaddress.submit();
		    }
        </script>
</head>
<body style="background:#fff;">
<div id="denglu">
<div class="left_dl"><div class="logo1"><img src="<%=path %>/image/logo.jpg"  style="width:230px;height:55px;"></div>
</div>
<a href="<%=path%>/commodityindex">返回首页</a>
</div>
<div id="main_jhd">
<div class="buzhou"><div class="wenzib_sd">我的购物车</div><div class="wenzib_sd">确认订单信息</div><div class="wenzib_sd">下单成功</div>
<div style="clear:both"></div>
<ul>
<li class="hover">1</li><li class="hover">2</li><li class="yuan">3</li>
</ul>
</div>
</div>
<div id="warptys">
<div style="width:1010px; margin:0 auto; background:#fff;">
<div class="table_titt">*收货信息</div>
<div class="address"><table width="899" border="0">
<form action="<%=path %>/ordertijiao" method="post" name="formaddress">
  <tr>
    <td><div align="right" height="40">收货人：</div></td>
    <td><input type="text" name="purname" value="${sessionScope.purchaser.purname}" class="text_chang" style="width:150px;"></td>
  </tr>
  <tr>
    <td height="40"><div align="right">联系电话：</div></td>
    <td><input type="text" name="purtel" value="${sessionScope.purchaser.purtel}"  class="text_chang" style="width:150px;"></td>
  </tr>
  <tr>
    <td height="40"><div align="right">收货地址：</div></td>
    <td><input type="text" name="puraddress" value="${sessionScope.purchaser.puraddress}" class="text_chang" style="width:286px;"></td>
  </tr>


</table>
</div>
<div class="table_titt">* 确认订单</div>

<div class="price_biao"><table width="991" height="40" border="0">
  <tr>
    <td width=320>手机</td>
    <td width="138">单价</td>
    <td width="119">数量</td>
    <td width="186">金额</td>
  </tr>
</table>
</div>
<div class="conent_lis">
<c:forEach  items="${cartList}"  var="v" varStatus="sta">
<div class="conent_sf">
<ul>
<li class="boxs_tw"><img src="<%=path%>/${v.commpicture}" width="50" height="60"></li>
<li class="boxs_sy"><a class="lanse">${v.commname}</a>--${v.modname}</a></li>
<li class="boxs_price">￥${v.modprice}</li>
<li class="boxs_prices"> ${v.commquantity}
</li>
<li class="boxs_cji">￥${v.jiage}</li>
</ul>
</div>
</c:forEach>

<table width="980" border="0" style="margin-top:20px; margin-bottom:20px;">
  <tr>
    <td width="76" height="64"><div align="right">备注：</div></td>
    <td width="680"><textarea name="ornotes" style="width:250px; height:80px;"></textarea></td>
    <td width="210">总金额：<span style="font-size:14px; font-family:Arial, Helvetica, sans-serif; font-weight:bold; color:#444;">￥${zongjia}</span>元 </td>
  </tr>
</table>
</form>
</div>
<div class="qrding"><div class="qrding_sf">
<p><span style=" font-weight:bold;">应付总额：</span><span class="jiacuhsd">￥${zongjia}</span>&nbsp;元</p>
<div class="qrxd"><a class="dingdan_sd" href="#" onclick="tijiao()">确认下单</a><a class="lanse" href="<%=path%>/cartList" style="float:right; margin-right:20px; margin-top:10px;">返回购物车</a></div>
</div></div>
<div style=" clear:both"></div>
</div>
</div>




</body>
</html>