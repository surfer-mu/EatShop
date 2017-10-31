<%@ page language="java" contentType="text/html; charset=UTF-8 " isELIgnored="false" 
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    
<title>商品列表</title>
<style type="text/css">
	.all{
		width:70%;
		height:750px;
		
		margin: 0 auto;
		text-align: center;
		
	}
	.eatli{
		width:21%;
		height:300px;
		
		border: 1px solid  #dddddd;
		float:left;
	
		margin:10px 20px 10px 15px;
		text-align: center;
		
	}
	.eatli:hover{
		
		border: 1px solid  red;
	}
	.eat{
		text-align: center;
		text-decoration: none;
	}
	.eat div{

		font-family: "Microsoft Yahei"; 
		
		text-align: left;
		margin-left:12px;
		line-height:30px;
		 font-weight:bold !important;
	}
	.eatimg{
		height:70%;
		width:100%;
		text-align: center;
	}
	.page1,.page2{
		height:15px;
		
		font-size: 18px;
	}
	li{
		list-style-type:none;
		
		float:left;
	}
	li a{
		text-decoration:none; 
	}
	ul{
		text-align: center;
	}
</style>

	<script type="text/javascript">
		function pagecheck(current,count){
		
			if(current>count)
			{
				current=count;
				alert("已是最后一页！");
			}
			else if(current<1)
			{
				current=1;
				alert("已经是第一页咯");
			}
			else{
			
			
				location.href="${pageContext.request.contextPath}/pageallEat.do?currentpage="+current;
			}
		}
		
		function check(current,count){
				
				if(current>count)
				{
					current=count;
					
				}
				if(current<1)
				{
					current=1;
					
				}
					location.href="${pageContext.request.contextPath}/pageallEat.do?currentpage="+current;
				
			}
		
	
		
		
	</script>
</head>
<body>
	 <jsp:include page="eathead.jsp"></jsp:include>  
	<div class="all" ><!--整个list页面  -->
		<!-- <img alt="#" src="/eat/bookimg/fenlei.png" style="width:100%;height:350px"> -->
		
		<div style="width:98%;height:700px;margin: 0 auto;padding-top: 20px" > <!--图书总列表  -->
		<table   style="width:100%;" >
			<tr >
				<c:forEach items="${eatpage.eatlist }" var="e" >
				<td class="eatli" >	<!-- 单个图书外框 -->
					<a class="eat" href="${pageContext.request.contextPath }/detailEat.do?id=${e.id}">		<!-- 图书内点击 -->
						<img class="eatimg" src="${e.imgpath }"   alt="食品"/>
						<div style="color: red;font-size: 16px;">￥ ${e.price }</div>
						<div style="font-size: 14px;">${e.eatname }</div>
						
					</a>
					<img src="/eat/bookimg/eatbottom.png" style="width:95%;height:20px">
				</td>
			</c:forEach>
			</tr>
		</table>
		<br>
			<div>
				<ul style="margin-left: 30%">
					<li class="page1"><a onclick="pagecheck(${eatpage.current-1},${eatpage.count })">&lt;&lt;上一页</a></li>
					<li>第
					<input type="text" style="width:30px;height:15px;text-align: center;border: 1px solid #dddddd;" onblur="check(this.value,${eatpage.count })" value="${eatpage.current }"/>
					页/共 ${eatpage.count } 页</li>
					<li>
						
					</li>
					<li class="page2"><a  onclick="pagecheck(${eatpage.current+1},${eatpage.count })">下一页>></a></li>
				</ul>			
				
				
				
				
				
			</div>
		</div>
	</div>
	
	 <jsp:include page="bottom.jsp"></jsp:include> 
</body>
</html>