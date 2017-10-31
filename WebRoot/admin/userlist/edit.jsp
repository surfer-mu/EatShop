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
			<form action="${pageContext.request.contextPath }/user/updateUser.do" method="post">
				<table style="width:100%;padding-top: 20px;text-align: center;">
					<tr style="text-align: center;">
					<%-- 	<td>
							用户编号：<input type="text" name="id" value="${detailuser.id }" on>
						</td>
						<td> --%>
							用户姓名：<input type="text" name="relname" value="${detailuser.relname }">
						</td>
					</tr>
					<tr style="text-align: center;">
						<td>
							用户账号：<input type="text" name="username" value="${detailuser.username }">
						</td>
						<td>
							性别：&nbsp;&nbsp;<input type="text" name="sex" value="${detailuser.sex }">
						</td>
					</tr>
					<tr style="text-align: center;">
						<td>
							用户密码：<input type="password" name="password" id="password" >
									<span id="pass1"></span>
						</td>
						<td>
							邮箱：&nbsp;&nbsp;<input type="text" name="email" value="${detailuser.email }">
						</td>
					</tr>
					<tr style="text-align: center;">
						<td>
							电话：&nbsp;&nbsp;<input type="text" name="tell" value="${detailuser.tell }">
						</td>
						<c:if test="${user.category=='highadmin' }">
						<input id="haha" type="hidden" value="${detailuser.category }">
						<td>
							权限类别：<select name="category" id="category" autocomplete="off">
											<option value="" selected="selected">--选择人员权限等级--</option>
											<option value="consumer" >consumer</option>
											<option value="admin">admin</option>
											<option value="highadmin">highadmin</option>
									</select>
						</td>
						</c:if>
					</tr>
					<tr style="text-align: center;">
						<td rowspan="2">
							用户地址：<input type="text" name="address"  value="${detailuser.address }">
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