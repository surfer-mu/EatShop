<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">
 --%>

</HEAD>

<body>
	<jsp:include page="/topuser.jsp"></jsp:include>
	<center>
	<div style="width:100%;">
	
		<div style="background-color: #DACEFE;width:100%;line-height: 20px;">添加商品</div>
		<div>
			<form action="${pageContext.request.contextPath }/eatAdd.do" method="post">
				<table style="width:100%;padding-top: 20px;text-align: center;">
					<tr style="text-align: center;">
						
						<input type="hidden" name="id" >
						
						<td>
							商品名：<input type="text" name="eatname" >
						</td>
					</tr>
					<tr style="text-align: center;">
						<td>
							单价：<input type="text" name="price" >
						</td>
						<td>
							库存：&nbsp;&nbsp;<input type="text" name="pnum">
						</td>
					</tr>
					<tr style="text-align: center;">
						<td>
							图片地址：<input type="text" name="imgpath" id="text" >
									<span id="pass1"></span>
						</td>
						<td>
							类别：&nbsp;&nbsp;<input type="text" name="category" >
						</td>
					</tr>
					
					<tr style="text-align: center;">
						<td>
							描述：&nbsp;&nbsp;<input type="text" name="description" >
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
</HTML>