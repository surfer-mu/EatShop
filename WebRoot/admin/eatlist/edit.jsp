<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/eat/js/jquery_1.9.js"></script>
<script type="text/javascript">

	$(function(){
	
			selectop();
			function selectop(){				
				var category= $("#haha").val();
				$("option[value="+category+"]").prop("selected",true);
		/* $("[value="+category+"]").prop("selected",true); */
	}
		
	})
	

	function notnull(){
		var pwd=document.getElementById("password").innerHTML;
		if(pwd==null){
			alert(pwd);
			back();
		}
	}
</script>
<style type="text/css">
	form{
	width:100%;
	}
	tr{
		text-align: left;
		
	}
</style>
<title>Insert title here</title>

</head>
<body>
<jsp:include page="/topuser.jsp"></jsp:include>
	<center>
	<div style="width:100%;">
	
		<div style="background-color: #DACEFE;width:100%;line-height: 20px;">商品详情</div>
		<div>
			<form action="${pageContext.request.contextPath }/updateUser.do" method="post">
				<table style="width:100%;padding-top: 20px;text-align: center;">
					<tr style="text-align: center;">
						
						<input type="hidden" name="id" value="${detailuser.id }" on>
						
						<td>
							商品名：<input type="text" name="eatname" value="${detailuser.eatname }">
						</td>
					</tr>
					<tr style="text-align: center;">
						<td>
							单价：<input type="text" name="price" value="${detailuser.price }">
						</td>
						<td>
							库存：&nbsp;&nbsp;<input type="text" name="pnum" value="${detailuser.pnum }">
						</td>
					</tr>
					<tr style="text-align: center;">
						<td>
							图片地址：<input type="text" name="imgpath" id="text" value="${detailuser.imgpath }" >
									<span id="pass1"></span>
						</td>
							<td class="ta_01" bgColor="#ffffff">添加类别：<select name="category"
					id="category">
						<option value="" selected="selected">--选择商品类加--</option>
						<option value="nut" >松鼠窝</option>
						<option value="fat">肉类专区</option>
						<option value="cake">糕点专区</option>
						<option value="nut">坚果专区</option>
						<option value="veg">蜜饯专区</option>
						<option value="fat">进口专区</option>
						<option value="nut">新疆正品</option>
						<option value="fat">lezz抢购</option>
						<option value="nut">周边</option>
						
				</select>
				</td>
					</tr>
					
					<tr style="text-align: center;">
						<td>
							描述：&nbsp;&nbsp;<input type="text" name="description" value="${detailuser.description }">
						</td>
						
					</tr>
					
				</table>
				<div style="padding-top: 20px;text-align: center;">
					<input type="submit" value="确认" >
					<input type="reset" value="重置">
					<button onclick="javaScript:history.back();">返回</button>
				</div>
			</form>
		</div>
	</div>
	</center>
</body>
</html>