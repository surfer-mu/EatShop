<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>加入购物车成功</title>

	<style>
		 .success-top {
			    position: relative;
			    padding-left: 35px;
			    margin: 20px 0;
			}
			
		.success-top h1 {
			    font-size: 50px;
			    
			    font-weight: 400;
			}
			
			.ftx{
				    color: #71b247;
				}
				
		.goods-list .p-name {
		    height: 36px;
		    width: 160px;
		    float: left;
		    line-height: 18px;
		    overflow: hidden;
		    margin-bottom: 4px;
		}
		
		.back {
			    padding: 0 30px;
			    margin-right: 10px;
			    background: #fff;
			    color: #e4393c;
			    border: 1px solid #fff;
			}
			
		.cart {
			    position: relative;
			    width: 136px;
			    padding-left: 30px;
			    background: #e4393c;
			    border: 1px solid #e4393c;
			    color: #fff;
			}
		.button{
			text-align: right;
		}
		.button a{
			text-decoration: none;
			text-align: center;
			 font-size: 20px;
			
		}
		.back{
			width:160px;
			height:60px;
			background-color: #FFFFFF;
			color: #E4393C;
			text-align: center;
		}
		.back:hover{
			border: 1px solid #E4393C;
		}
		.cart{
			width:160px;
			height:100px;
			background-color: #E4393C;
			color:#FFFFFF;
			text-align: center;
		}
		.cart:hover{
			
			background-color: #C91623;
		}
	</style>
</head>
<body>

<jsp:include page="../top.jsp"></jsp:include>
	<div style="width:70%;background-color: #F5F5F5;height:100px;margin: 0 auto;">
		<div style="width:100%;margin: 0 auto;">
			<div class="success-top"  >
			
		<h1 class="ftx">${eat.eatname }已成功加入购物车！</h1>
		
		
		
		<div class="button">
			<a class="back" href="${pageContext.request.contextPath }/detailEat.do?id=${eat.id }" >查看商品详情</a>
			<a class="cart" href="${pageContext.request.contextPath }/admin/cart.jsp" >
			去购物车结算</a>
		</div>
		</div>
		</div>
	</div>
	 <jsp:include page="../bottom.jsp"></jsp:include> 
</body>
</html>