<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/my.css"/>
<title>Insert title here</title>
</head>
<body>
<div style="width:70%;margin: auto">
    <div class="footer" >
        <br> <br><br> <br>
            <center><h1 class="end">
                		欢迎伙伴前来购物，下次再来哦。客官来玩呀！
            </h1></center>
            <span class="end"><img src="img/730.png">&nbsp;</span>
            <br> <br>
            <div class="some-info">
                <img src="img/some.png" />
            </div>
        </div>

    </div>
</div>
</body>
</html>