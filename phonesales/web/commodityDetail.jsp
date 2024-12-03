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
<script type="text/javascript" src="<%=path %>/js/jquery-1.4.4.min.js"></script>
<SCRIPT src="<%=path %>/js/base.js" type=text/javascript></SCRIPT>
<SCRIPT src="<%=path %>/js/lib.js" type=text/javascript></SCRIPT>
<SCRIPT src="<%=path %>/js/163css.js" type=text/javascript></SCRIPT>
<link href="<%=path %>/css/css.css" type="text/css" rel="stylesheet">
<style>
.des_choice{
	line-height:40px; overflow:hidden; color:#888888; font-family:"宋体";
}
.des_choice ul li{
	height:28px; line-height:28px; overflow:hidden; font-size:14px; text-align:center; font-family:"Microsoft YaHei"; float:left; display:inline; margin-right:10px; margin-top:4px; margin-bottom:2px; padding:0 15px; border:1px solid #cccccc; cursor:pointer; position:relative;
}
.des_choice ul li:hover{
	height:26px; line-height:26px; padding:0 14px; overflow:hidden; border:2px solid #ff4e00;
}
.des_choice ul li .ch_img{
	width:18px; height:18px; overflow:hidden; background:url(../image/ch.png) no-repeat center top; position:absolute; right:0; bottom:0; display:none;
}
.des_choice ul li.checked{
	height:26px; line-height:26px; padding:0 14px; overflow:hidden; border:2px solid #ff4e00;
}
.des_choice ul li.checked .ch_img{
	display:block;
}
</style>
<script type="text/javascript">
function jia()
     {      
        var Number=0;
        Number=parseInt(document.buy.commquantity.value)+1;
       document.buy.commquantity.value = Number;
     }
     function jian()
     {      
        var Number=0;
        Number=parseInt(document.buy.commquantity.value)-1;
        if(Number==0)
        {
          return;
        }
        else{
       document.buy.commquantity.value = Number;
       }
     }
     function cartcheck()
     {   
  	   <c:if test="${sessionScope.purchaser==null}">
              alert("请先登录");
              return false;
          </c:if>
          document.buy.submit();
     }
     </script>
        <c:if test="${not empty msg}"> 
   <script>alert('${msg}')
    	window.location.href="<%=path%>/cartList";
   </script> 
        </c:if>
      <script type="text/javascript">   
 ;
function ajaxSendCallBackcity(data) 
{
	document.getElementById("modprice").innerText=data.modprice;
}    

function modxuanze(modid)
{
	for(var i=1;i<500;i++)
	{
		var m=i;
		try {
			m= document.getElementById(i) ;
			m.setAttribute("class","");
		} catch (error) {
		    // 处理异常
		    continue;
		}
			

		
	}
	document.getElementById("modid").value=modid;
	 var obj = document.getElementById(modid) ;
		obj.setAttribute("class","checked");
	$.ajax({
		url : "<%=path%>/modelinfo/modxuanze?modid="+modid,
		type:"post",
		success :  ajaxSendCallBackcity
	});
}
</script>
 
</head>
<body>
  <jsp:include flush="true" page="/incTop.jsp"></jsp:include> 
    <div id="weizhi"><div class="conent"><span>当前位置：</span><a>首页</a> <span>></span> <a>商品详情</a></div></div>

<div id="main4">
<div id=preview>
	<div class=jqzoom id=spec-n1 onClick="window.open('http://down.liehuo.net/')"><IMG height=450
	src="<%=path %>/${commodity.commpicture1}" jqimg="<%=path %>/${commodity.commpicture1}" width=400>
	</div>
	<div id=spec-n5>
	
		<div id=spec-list>
			<ul class=list-h>
			
				<li><img src="<%=path %>/${commodity.commpicture1}"> </li>
             	 <c:if test="${commodity.commpicture2!=''}">
                <li><img src="<%=path %>/${commodity.commpicture2}"> </li>
                </c:if>
                   	 <c:if test="${commodity.commpicture3!=''}">
                <li><img src="<%=path %>/${commodity.commpicture3}"> </li>
                </c:if>
            	 <c:if test="${commodity.commpicture4!=''}">
                <li><img src="<%=path %>/${commodity.commpicture4}"> </li>
                </c:if>
			</ul>
		</div>

		<SCRIPT type=text/javascript>
	$(function(){			
	   $(".jqzoom").jqueryzoom({
			xzoom:400,
			yzoom:400,
			offset:10,
			position:"right",
			preload:1,
			lens:1
		});
		$("#spec-list").jdMarquee({
			deriction:"left",
			width:400,
			height:56,
			step:2,
			speed:4,
			delay:10,
			control:true,
			_front:"#spec-right",
			_back:"#spec-left"
		});
		$("#spec-list img").bind("mouseover",function(){
			var src=$(this).attr("src");
			$("#spec-n1 img").eq(0).attr({
				src:src.replace("\/n5\/","\/n1\/"),
				jqimg:src.replace("\/n5\/","\/n0\/")
			});
			$(this).css({
				"border":"2px solid #d62c2c",
				"padding":"1px"
			});
		}).bind("mouseout",function(){
			$(this).css({
				"border":"1px solid #ccc",
				"padding":"2px"
			});
		});				
	})
	</SCRIPT>
</div>
</div>
<div class="right_xx"><div class="conents"><h3>${commodity.commname}</h3></div>
<div class="conents">
<p>手机价格：<a href="" ><font id="modprice" color="red">￥${commodity.modprice}</font></a></p></br>
<p>颜色：${commodity.commobject}</p>

</div>
 <div class="des_choice">
            	<span class="fl">规格型号选择：</span>
                <ul>
                  <c:forEach  items="${modelList}"  var="model" varStatus="sta">
                    <c:if test="${sta.index+1==1}">
                     <li class="checked" id="${model.modid}">
                    </c:if>
                         <c:if test="${sta.index+1>1}">
                     <li id="${model.modid}">
                    </c:if>
                     <a  onClick="modxuanze(${model.modid})"  href="javascript:;">${model.modname}</a></li>
                   </c:forEach>
                
                </ul>
</div>
	
	   	<form action="<%=path %>/cardadd" method="post" name="buy">
	   	 <input type="hidden" name="commid" value="${commodity.commid}" />
	   	 	 <input type="hidden" id="modid" name="modid" value="${modelxuhao}" />
<div class="caigou"><a class="jian" href="javascript:void(0);"  onclick="jian()"></a><input type="text" id="commquantity" name="commquantity" class="text" value="1"/><a class="jia" href="javascript:void(0);" onclick="jia()"></a></div>
<div class="war_an"><a href="javascript:void(0);" onclick="cartcheck()">加入购物车</a></div>
</form>
</div>
</div>


<!---详情--->
<div id="main_xiangq">
<div class="tittle">
 <ul style="list-style: none; margin: 0px; padding: 0px; border-collapse: collapse;">
                    <li id="lv_1" style="margin-left:0px;" class="selected2" onmouseover="change('1')">产品详情</li>
                    <li id="lv_2" class="normal2"    onmouseover="change('2')">评价记录</li>
			
                </ul>
               </div>
			 <div  id="dif1" style ="display :block" class ="divContent2">
             
${commodity.commcontent}


             </div>
             
			 <div  id="dif2" style ="display :none" class ="divContent2">
			 <table width="1000" border="0" style=" border-collapse:collapse;">
  <tr class="huise">
    <td height="43">评价等级 </td>
    <td> 评价内容 </td>
    <td> 评价时间</td>
    <td> 评价人 </td>

  </tr>
  <c:forEach  items="${orderList}"  var="orders" varStatus="sta">
  <tr>
    <td height="42">${orders.assessflag}</td>
    <td>${orders.assrecontent}</td>
    <td>${orders.assestime}</td>
    <td>${orders.purname}</td>
  </tr>
  </c:forEach>
			</table>
			 
			 
			 </div>
		
             <div style="clear:both;"></div>
</div>
<script language="javascript" type="text/javascript">
        function change(index)
        {
            for (var i=1;i<=2;i++)
            {//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
                document.getElementById ("lv_"+i).className ="normal2";
                document.getElementById ("lv_"+index).className ="selected2";
                document.getElementById ("dif"+i).style.display  ="none";
            }
            //document.getElementById ("div1").innerText= "www.zzjs.net"+index;
            document.getElementById ("dif"+index).style.display  ="block";
       }
    </script>

 <jsp:include flush="true" page="/incFoot.jsp"></jsp:include>
</body>
</html>