<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>登录</title>
    <link href=" css/loginconfig.css" rel="stylesheet" type="text/css">
    <script src="js/jquery_1.9.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#auto").click(function(){
				$("[type='checkbox']").attr("checked",true);
					 
			})
		
		})
	</script>
    <style type="text/css">
        .end{
            font-size: 6px;
        }
        
        
    </style>
</head>
<body>
    <div width="100%" style="margin-bottom: 20px">
        <img src=" img/logo.png" style="float: left;margin-left: 100px;">
        <div class="f"><img src=" img/8.png">"登录界面"改进意见</div>
    </div>
    <div style="clear:both"></div>
    <div id="login">
        <img id="image" src=" img/1.png" >
		
        <div id="info" style="height:370px">

            <div class="login-box">
                <div class="login-title">
                    密码登录
                </div>
               <form action="user/dologin.do" method="post">
                   <div class="field username-field">
						
                       <input type="text"  name="username" class="login-text" value="${username }" >
                       <input type="password" name="password" class="login-pass"  value="${password }">
                     	<div style="color: red;font-family: 700px">${mes}</div>
                     	 自动登录<input type="checkbox" id="auto" name="auto" />
                     	  记住我<input type="checkbox" id="rem" onclick="checkauto()" ${check } name="rem"/>
                       <input type="submit" class="subbutton">


                   </div>
                   <div class="other">
                       <span ><a href="#" ><img src=" img/weibo.png">微博登录</a></span>
                       <span> <a href="#" ><img src=" img/pay.png">支付宝登录</a></span>
                   </div>
                   <div class="bottom">
                       <span ><a href="#" >忘记密码</a></span>
                       <span> <a href="register.jsp" >免费注册</a></span>
                   </div>
               </form>
            </div>

        </div>
    </div>
    <jsp:include page="bottom.jsp"></jsp:include> 
</body>
</html>