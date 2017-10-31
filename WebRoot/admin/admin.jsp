<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>title</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <jsp:include page="/topuser.jsp"></jsp:include>
<center><h1 style="margin-bottom: 30px">后台管理系统</h1></center>
<center>
<div style="margin:0 auto">
<div style="font-size: 20px;color:red">请选择所要管理内容：</div>
	<div style="line-height:100px "><a href="/eat/user/userList.do" style="font-size: 30px;color:black">用户管理</a></div>
	<div style="line-height:100px "><a href="/eat/order/orderList.do" style="font-size: 30px;color:black">订单管理</a></div>
	<div style="line-height:100px "><a href="/eat/eatList.do" style="font-size: 30px;color:black">商品管理</a></div>
</div>
</center>
  </body>
</html>
