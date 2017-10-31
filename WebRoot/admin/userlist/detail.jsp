<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function update(id){
		location.href="${pageContext.request.contextPath}/user/findUserById.do?id="+id;
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
	
		<div style="background-color: #DACEFE;width:100%;line-height: 20px;">用户详细信息</div>
		<div>
			
				<table style="width:50%;padding-top: 20px;text-align: left;">
					<tr style="text-align: left;">
						<td>
							用户编号：${thisuser.id }
						</td>
						<td>
							用户姓名：${thisuser.relname }
						</td>
					</tr>
					<tr style="text-align: left;">
						<td>
							用户账号：${thisuser.username }
						</td>
						<td>
							性别：&nbsp;&nbsp;${thisuser.sex }
						</td>
					</tr>
					<tr style="text-align: left;">
						
						<td>
							邮箱：&nbsp;&nbsp;${thisuser.email }
						</td>
					</tr>
					<tr style="text-align: left;">
						<td>
							电话：&nbsp;&nbsp;${thisuser.tell }
						</td>
						<td>
							权限类别：${thisuser.category }
						</td>
					</tr>
					<tr style="text-align: left;">
						<td rowspan="2">
							用户地址：${thisuser.address }
						</td>
					</tr>
				</table>
				<div style="padding-top: 20px;text-align: center;">
					<input type="button" onclick="update('${thisuser.id }')" value="修改" >
					<input type="button" onclick="javaScript:history.back();" value="返回" >
				</div>
		</div>
		<div style="background-color: #DACEFE;width:100%;height:20px ;line-height: 20px;"></div>
	</div>
	<h2>历史登陆信息</h2>
		<div id="two" >
			<table >
				<tr >
					<th style="width:3%">序号</th>
					<th style="width:3%">登陆时间</th>
					<th style="width:3%">登录ip</th>
				</tr>
			<c:forEach items="${list }" var="l" varStatus="sum"  > 
			<!-- 上面这个是循环，把查询到的信息集合循环输出到网页 -->
				<c:if test="${sum.count==1&&user.id==l.id}">
					<tr>
						<td  colspan="3"><h4>当前登录信息：</h4></td>
					</tr>
					<tr>
						<td>当前登录：</td>
						<td style="width:3%">${user.time }</td>
						<td style="width:3%">${user.ip }</td>
					</tr>
					<tr>
						<td  colspan="3"><h4>历史登录信息：</h4></td>
					</tr>
				</c:if>
					<tr>
					<td style="width:3%">${sum.count }</td>
					<td style="width:3%">${l.time }</td>
					<td style="width:3%">${l.ip }</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</center>
</body>
</html>