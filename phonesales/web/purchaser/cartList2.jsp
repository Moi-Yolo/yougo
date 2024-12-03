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
<span>下单成功</span>
</div>
<a href="<%=path%>/commodityindex">返回首页</a>
</div>
<div id="main_jhd">
<div class="buzhou"><div class="wenzib_sd">我的购物车</div><div class="wenzib_sd">确认订单信息</div><div class="wenzib_sd">下单成功</div>
<div style="clear:both"></div>
<ul>
<li class="hover">1</li><li  class="hover">2</li><li class="hover">3</li>
</ul>
</div>
</div>
<div id="warptys">
<div style="width:1010px; margin:0 auto; background:#fff;">
<div class="table_titt">*下单成功</div>
<div class="address"><table width="899" border="0">
  <tr>
    <td width="200" height="40"><div align="right">
    订单编号：${ornumber}
      </div></td>
    <td width="758"></td>
  </tr>

</table>
</div>

</div>
<div style="clear:both"></div>



</body>
</html>