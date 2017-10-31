<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function adduser() {
		window.location.href = "${pageContext.request.contextPath}/admin/eatlist/add.jsp";
	}
	
	
	function deluser(id){
		if(confirm("是否确定删除?")){
			location.href="${pageContext.request.contextPath }/delUser.do?id="+id;
		}
	}
	

	function checkAll(){
		var flag = document.getElementById("ckAll").checked;
		var ids = document.getElementsByName("ids");
		for(var i =0; i<ids.length;i++){
			ids[i].checked = flag;
		} 
	}
	
	
	function delAllusers(){
		var form2 = document.forms[1];
		form2.submit();
		
	}
	function eatAdd(){
		location.href="${pageContext.request.contextPath }/admin/eatlist/add.jsp";
	}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/topuser.jsp"></jsp:include>
<center><h1 style="margin-bottom: 30px">商品后台管理系统</h1></center>
<center><h4 style="margin-bottom: 30px"><a href="/eat/admin/admin.jsp" style="font-size: 15px;color:red">点击返回首页</a></h4></center>
<!-- <div style="text-align: center">
	<div width="80%" style="background-color: #AFD1F3">模糊查询条件</div>
	<form >
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0" style="text-align: right;padding-right: 400px">
			<tr>
				<td>人员编号：<input type="text" name="id"/></td>
				<td>权限类别：<select name="category" id="category">
										<option value="" selected="selected">--选择人员权限等级--</option>
										<option value="consumer">consumer</option>
										<option value="admin">admin</option>
										<option value="highadmin">highadmin</option>
							</select>
			</tr>
			<tr>
				<td>人员账户:<input type="text" name="username"/></td>
				<td>性别:<input type="text" name="sex"/></td>
			</tr>
			<tr>
				<td>姓名:<input type="text" name="relname"/></td>
				<td>电话:<input type="text" name="tell"/></td>
			</tr>
		</table>
	</form>
	<div style="text-align: right;margin-right: 50px">
	<button  >查询</button>
	<button >重置</button>
	</div>
</div> -->
<div style="text-align: center;margin-top: 20px">
	<div width="80%" style="background-color: #AFD1F3;margin-bottom: 3px">用户列表</div>
	<c:if test="${user.category=='highadmin' }">
	<div style="text-align: right;margin-right: 50px">
	
	<!-- <button style="text-align: right">批量删除</button> -->
	<button style="text-align: right"  onclick="eatAdd()">添加</button>
	
	</div>
	</c:if>
	<div>
		
		<form action="${pageContext.request.contextPath }/servlet/delAllusersServlet" method="post">
		
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="5%"><input type="checkbox" id="ckAll" onclick="checkAll()"/>全选/全不选</td>
								<td align="center" width="18%">货物编号</td>
								<td align="center" width="10%">货物名称</td>
						<!-- 		<td align="center" width="9%">人员密码</td> -->
								<td align="center" width="9%">单价</td>
								<td width="8%" align="center">库存</td>
								<td width="8%" align="center">类别</td>
								<td align="center" width="10%">图片url</td>
								<td align="center" width="10%">详细信息</td>
								<td width="8%" align="center">编辑</td>
								<c:if test="${user.category=='highadmin' }">
								<td width="8%" align="center">删除</td>
								</c:if>
							</tr>

				<c:forEach items="${users }" var="b">							
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="  HEIGHT: 22px" align="center"
										width="5%"><input type="checkbox" name="ids" value="${b.id }"/></td>
									<td style="  HEIGHT: 22px" align="center"
										width="18%">${b.id }</td>
									<td style="  HEIGHT: 22px" align="center"
										width="10%">${b.eatname }</td>
									
									<td style="  HEIGHT: 22px" align="center"
										width="8%">${b.price }</td>
									<td style="  HEIGHT: 22px" align="center"
										width="8%">${b.pnum }</td>
									<td style=" HEIGHT: 22px" align="center">${b.category }</td>
									<td style="  HEIGHT: 22px" align="center"
										width="8%">${b.imgpath }</td>
										<td style="  HEIGHT: 22px" align="center"
										width="8%">${b.description }</td>
									<td align="center" style="HEIGHT: 22px" width="7%"><a
										href="${pageContext.request.contextPath}/findUserById.do?id=${b.id }" style="color: blue;text-decoration: none">
											edit</a>
									</td>
									<c:if test="${user.category=='highadmin' }">
									<td align="center" style="HEIGHT: 22px" width="7%"><a
										href="javascript:deluser('${b.id }')" style="color: red;font-family:700px;text-decoration: none">
											X
									</a>
									</td>
									</c:if>
								</tr>
					</c:forEach>	
						</table>
				</form>
	</div>
</div>
</body>
</html>