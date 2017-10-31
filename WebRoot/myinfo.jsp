
<%@page import="com.eat.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function update(id){
		location.href="${pageContext.request.contextPath}/user/findUserById.do?id="+id;
	}
</script>
</head>
<body>
<jsp:include page="topuser.jsp"></jsp:include>
	<center>
		<div style="width:100%;">
	
		<div style="background-color: #DACEFE;width:100%;line-height: 20px;">用户详细信息</div>
		<div>
			
				<table style="width:50%;padding-top: 20px;text-align: left;">
					<tr style="text-align: left;">
						<td>
							用户编号：${user.id }
						</td>
						<td>
							用户姓名：${user.relname }
						</td>
					</tr>
					<tr style="text-align: left;">
						<td>
							用户账号：${user.username }
						</td>
						<td>
							性别：&nbsp;&nbsp;${user.sex }
						</td>
					</tr>
					<tr style="text-align: left;">
						
						<td>
							邮箱：&nbsp;&nbsp;${user.email }
						</td>
					</tr>
					<tr style="text-align: left;">
						<td>
							电话：&nbsp;&nbsp;${user.tell }
						</td>
						<td>
							权限类别：${user.category }
						</td>
					</tr>
					<tr style="text-align: left;">
						<td rowspan="2">
							用户地址：${user.address }
						</td>
					</tr>
				</table>
				<div style="padding-top: 20px;text-align: center;">
					<input type="button" onclick="update('${user.id }')" value="修改" >
					<input type="button" onclick="javaScript:history.back();" value="返回" >
				</div>
		</div>
		<div style="background-color: #DACEFE;width:100%;height:20px ;line-height: 20px;"></div>
	</div>
	</center>
</body>
</html>