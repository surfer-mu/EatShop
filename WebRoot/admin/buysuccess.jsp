<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
  
	

  </head>
  
  <body>
   
<jsp:include page="../top.jsp"></jsp:include>
   
	<center style="margin-top: 30px">
  		<table>
  		 <tr><th>订单编号</th><td colspan="4" style="font-size: 30px;color:red;text-align: center">${order.orderId }</td></tr>	
  		<tr><th>商品名称</th><th>商品图片</th><th>商品数量</th><th>商品单价</th><th>商品总价</th></tr>
  		
   
    	<c:forEach items="${order.list }" var="l">
    	  		<tr>
    	  			<th>${l.eat.eatname }</th>
    	  			<th><img src="${l.eat.imgpath }" width="50px" height="50px"></th>
    	  			<th>${l.num }</th>
    	  			<th>${l.eat.price }元</th>
    	  			<th>${l.eat.price*l.num } 元</th>
    	  		</tr>
    	  		</c:forEach>
    	
     <tr><td colspan="4" style="text-align: right;">总计：</td><th><font color="red" size="10px">${order.total }元</font></th></tr>
     </table>       
     </center>

	<jsp:include page="../bottom.jsp"></jsp:include> 
  </body>
</html>
