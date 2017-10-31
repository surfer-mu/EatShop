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
 <script src="../js/jquery_1.9.js"></script>
 <script type="text/javascript">
 
 		function allcheck(){
 			var allcb=document.getElementById("allcb").checked;
 			var ids=document.getElementsByName("ids");
			for ( var i = 0; i< ids.length; i++) {
				ids[i].checked=allcb;
			}
			
 		}
    	function addcart(id){
    		
    		var count=document.getElementById("shu").value;
    
    		location.href="${pageContext.request.contextPath }/cart/updatecartEat.do?id="+id+"&number="+count;
    	}
       function updatecart(id,pnum,value){
       		if(value<1)
       		{
       			if(confirm("是否删除？"))
       			{
       				value=0;
       			}
       			else{
       				value=1;
       			}
       			
       		}
       		if(value>pnum)
       		{
       			alert("不能超过最大库存!");
       			value=pnum;
       		}
       		location.href="${pageContext.request.contextPath }/cart/updatecartEat.do?id="+id+"&number="+value;
       }
       
       function buycart(){
       	var buy=document.forms[0];
       	buy.submit();
       }
    </script>

<style type="text/css">
	.all{
		width:70%;
		margin: auto;
		/* text-align: center; */
		
	}
	.updateimg1,.updateimg2{
		
		border:0;
		outline:none;
		box-shadow: none;
	}
	.back{
			width:120px;
			height:45px;
			background-color: #FFFFFF;
			
			text-align: center;
			
			text-decoration: none;
			color: red;
			font-family:700px;
			border: 1px solid red;
		}
	
</style>
<title>购物车</title>
</head>
<body>
	<jsp:include page="../topindex.jsp"></jsp:include> 
	
	<div class="all" style="width:70% ;font-size: 17px;border: 1px solid #F0F0F0; background-color: #BED4B0" >
	<form action="${pageContext.request.contextPath }/order/buyCart.do" method="get">
		<table style="border: 1px solid #999999;width:95%;text-align: center;margin: 30px">
			<tr style=" border-bottom :1px solid #999999;height:40px">
				<td width="10%">全选/全不选<input type="checkbox" id="allcb" name="allcb" onclick="allcheck()" checked="checked"></td>
				<td width="12%">参考图</td>
				<td width="12%">商品名称</td>
				<td width="12%">单价</td>
				<td width="12%">数量</td>
				<td width="12%">库存</td>
				<td width="12%">小计</td>
				<td width="12%">取消</td>
			</tr>
			<c:set var="sum" value="0"></c:set>
			<c:forEach items="${cart }" var="entry" varStatus="vs">
			
				<tr style="height:35px">
				<td width="10%">${vs.count }<input type="checkbox" name="ids" value="${entry.key.id }" checked="checked"></td>
				<td width="12%"><img class="eatimg" src="${entry.key.imgpath }"  style="width:50px;height:40px" alt="食品"/></td>
				<td width="12%">${entry.key.eatname }</td>
				<td width="12%">${entry.key.price }</td>
				<td width="12%">
					<input class="updateimg1"  onclick="updatecart('${entry.key.id}','${entry.key.pnum }','${entry.value-1 }')" type="button"  style="width:20px;height:20px"  value="-">
					
					${entry.value }
					<input  class="updateimg2" onclick="updatecart('${entry.key.id}','${entry.key.pnum }','${entry.value+1 }')" type="button" style="width:20px;height:20px" value="+">
				</td>
				<td width="12%" id="pnum">${entry.key.pnum }</td>
				<td width="12%">${entry.value * entry.key.price }</td>
				<td width="12%"><a href="${pageContext.request.contextPath }/cart/delcartEat.do?id=${entry.key.id }" style="text-decoration: none;color: red">X</a></td>
			</tr>
			
			<c:set var="sum" value="${sum+entry.value * entry.key.price }"></c:set>
			</c:forEach>
			
			
		</table>
		<table style="width:95%;text-align: right;margin-bottom: 20px">
			<tr style="padding-right: 10px;line-height: 50px">
				
				<th>
				总计：
				<font color="red" size="10px" style="text-align: right; ">${sum }&nbsp;元</font>
				</th>
				
			</tr>
			<tr >
				<td colspan="5" style="width:100%;text-align: right; ">
					<span><a href="${pageContext.request.contextPath }/pageallEat.do" class="back">继续购物</a></span>
					<span><a href="${pageContext.request.contextPath }/cart/removecartEat.do" style="text-decoration: none;color: #000000;background-color:#F0F0F0;border: 1px solid #9E9E9E;">清空购物车</a></span>
					<span><button type="button"  onclick="buycart()" style="color: green">去结算</button></span>
				</td>
				
				
			</tr>
		</table>
		</form>
		
	
	</div>
	
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>