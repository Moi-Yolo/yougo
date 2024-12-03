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
<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/bootstrap-extended.css">


 <title>优购商城</title>

  </head> 
  <body>
   <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar"
data-open="click" data-menu="vertical-menu" data-col="2-columns">
<!-- fixed-top-->
<nav class="header-navbar navbar-expand-md navbar navbar-with-menu fixed-top navbar-semi-dark navbar-shadow">
  <div class="navbar-wrapper">
    <div class="navbar-header">
      <ul class="nav navbar-nav flex-row">
        <li class="nav-item mobile-menu d-md-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu font-large-1"></i></a></li>
        <li class="nav-item"> <a class="navbar-brand" href="index.html">
          <h2 class="brand-text">&nbsp;&nbsp;优购商城--后台管理</h2>
          </a> </li>
        <li class="nav-item d-md-none"> <a class="nav-link open-navbar-container" data-toggle="collapse" data-target="#navbar-mobile"><i class="fa fa-ellipsis-v"></i></a> </li>
      </ul>
    </div>
    <div class="navbar-container content">
      <div class="collapse navbar-collapse" id="navbar-mobile">
        <ul class="nav navbar-nav mr-auto float-left">
          <li class="nav-item d-none d-md-block"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu"></i></a></li>
        </ul>
        <ul class="nav navbar-nav float-right">
    
          <li class="dropdown dropdown-notification nav-item"> <a class="nav-link nav-link-label" href="#"><i class="fa fa-user-o"></i>管理员： admin </a> </li>
            <li class="dropdown dropdown-notification nav-item"> <a class="nav-link nav-link-label" href="<%=path %>/logout" onclick='return confirm("您确定退出吗？");' ><i class="fa fa-user-times"></i>  安全退出</a> </li>

        </ul>
      </div>
    </div>
  </div>
</nav>
<div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
  <div class="main-menu-content">
    <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
      <li class=" nav-item only open"><a href="<%=path %>/Controllersmain" target="iframe1"><i class="fa fa-dashboard"></i><span class="menu-title">首页</span></a></li>
      

      <li class=" nav-item"><a href="#" target="iframe1"><i class="fa fa-folder-open"></i><span class="menu-title">分类管理</span></a> 
		<ul class="menu-content">
                 <li><a class="menu-item" href="<%=path %>/categoryList" target="iframe1">大类管理</a></li>
                 <li><a class="menu-item" href="<%=path %>/sortList" target="iframe1">小类管理</a></li>
                 

                </ul>
		</li>
		<li class=" nav-item"><a href="#" ><i class="fa fa-tasks"></i><span class="menu-title">商品管理</span></a>
        <ul class="menu-content">
                   <li><a class="menu-item" href="<%=path %>/commodityload" target="iframe1">商品添加</a></li>
          <li><a class="menu-item" href="<%=path %>/commodityList" target="iframe1">商品管理</a></li>
        </ul>
      </li>
      <li class=" nav-item"><a href="#" target="iframe1"><i class="fa fa-book"></i><span class="menu-title">订单管理 </span></a>
		  <ul class="menu-content">
		<li><a class="menu-item" href="<%=path %>/orderManage" target="iframe1">订单管理</a></li>

		</ul>
		</li>
      <li class=" nav-item"><a href="#" target="iframe1"><i class="fa fa-pie-chart"></i><span class="menu-title">数据统计</span></a> 
		<ul class="menu-content">
          <li><a class="menu-item" href="<%=path %>/orderList" target="iframe1">销售数据查询</a></li>
          <li><a class="menu-item" href="<%=path %>/commodityxiaoshou" target="iframe1">销售报表统计</a></li>
        </ul>
		</li>
		  <li class=" nav-item"><a href="#" target="iframe1"><i class="fa fa-users"></i><span class="menu-title">客户管理</span></a>
		<ul class="menu-content">
		<li><a class="menu-item" href="<%=path %>/purchaserList" target="iframe1">客户管理</a></li>
		</ul>
		</li>
      <li class=" nav-item"><a href="#" target="iframe1"><i class="fa fa-users"></i><span class="menu-title">修改密码</span></a>
		<ul class="menu-content">
		<li><a class="menu-item" href="<%=path %>/admin/passupdate.jsp" target="iframe1">修改密码</a></li>
		</ul>
		</li>


		
    </ul>
  </div>
</div>
<div class="app-content content">
  <iframe src="<%=path %>/Controllersmain" frameborder="0" class="iframe1" name="iframe1"></iframe>
</div>
<footer class="footer footer-static footer-light navbar-border">
  <p class="clearfix blue-grey lighten-2 text-sm-center mb-0 px-2"> <span class="float-md-left d-block d-md-inline-block">Copyright &copy; 2024 <a class="text-bold-800 grey darken-2" href="#">网上蛋糕店 </a></span> </p>
</footer>
<script src="<%=path %>/admin/js/vendors.min.js" type="text/javascript"></script> 
<script src="<%=path %>/admin/js/app-menu.js" type="text/javascript"></script> 
<script src="<%=path %>/admin/js/app.js" type="text/javascript"></script> 
<script src="<%=path %>/admin/js/echarts.min.js" type="text/javascript"></script> 
<script>
$(document).ready(function()
		{
	$(".nav-item ").click(function()
			{
		$(".nav-item ").removeClass("active")
		$(this).addClass("active")
		
	})
})
  </script>
  </body>

</html>
