<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	input{
		border: 1px solid #999; 
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../topindex.jsp"></jsp:include> 
		<center style="font-size: 18px">
		<table style="border: 1px solid #999999;width:50%;margin: 30px">
			<tr style=" border-bottom :1px solid #999999;height:40px">
			
				<td width="12%">参考图</td>
				<td width="12%">商品名称</td>
				<td width="12%">单价</td>
				<td width="12%">数量</td>
				<td width="12%">库存</td>
				<td width="12%">小计</td>
			</tr>
			<c:set var="sum" value="0"></c:set>
			<c:forEach items="${buycart }" var="entry" varStatus="vs">
			
				<tr style="height:35px">
				<td width="12%"><img class="eatimg" src="${entry.key.imgpath }"  style="width:50px;height:40px" alt="食品"/></td>
				<td width="12%">${entry.key.eatname }</td>
				<td width="12%">${entry.key.price }</td>
				<td width="12%">
					${entry.value }
				</td>
				<td width="12%" id="pnum">${entry.key.pnum }</td>
				<td width="12%">${entry.value * entry.key.price }</td>
			</tr>
			
			<c:set var="sum" value="${sum+entry.value * entry.key.price }"></c:set>
			</c:forEach>
			
			
		</table>
		<div style="margin-bottom: 20px">
				总计：
				<font color="red" size="10px" style="text-align: right; ">${sum }&nbsp;元</font>
		</div>
		<fieldset style="width:50%;" >
  	  <legend style="text-align: center"> 收货信息</legend>
		<form action="${pageContext.request.contextPath }/order/doCommit.do" method="post">
			姓名：<input type="text" name="relname" value="${user.relname}"/><br>
			电话：<input type="text" name="tell" value="${user.tell}"/><br>
			地址：<input type="text" name="address" value="${user.address}"/><br>
			<input type="submit" value="确认">
			<input type="reset" value="重置">
		</form>
		</fieldset>  
		</center>
		<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>