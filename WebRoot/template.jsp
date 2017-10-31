<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="jquery-1.8.3.js"></script>
	<script type="text/javascript">
	<%--
	//普通的ajax请求
	function ajaxSubmit(){	
		//浏览器判断，做兼容	
  		var xmlHttp;
		 try
    {
   // Firefox, Opera 8.0+, Safari
    xmlHttp=new XMLHttpRequest();
    }
 catch (e)
    {

  // Internet Explorer
   try
      {
      xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
      }
   catch (e)
      {

      try
         {
         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
         }
      catch (e)
         {
         alert("您的浏览器不支持AJAX！");
         return false;
         }
      }
    }		 		
  //正在实现ajax					
    var username=document.getElementById("username").value;
    var url="UserAction?action=ajax&username="+username;
	xmlHttp.open("post",url,true);
    xmlHttp.send(null);
  	//状态正常并且请求响应也已完成 ,回调函数 
    xmlHttp.onreadystatechange=function(){
      if(xmlHttp.readyState==4&&xmlHttp.status==200){
     	//获得的是响应内容（文本）
      var content=xmlHttp.responseText;
      //alert(content)
      var span=document.getElementById("state");
      	if(content=="yes"){
      		span.innerHTML="<font color='red'>用户名已存在</font>";
      		document.getElementById("submit").disabled = true;
      	}else{
      		span.innerHTML="<font color='green'>√</font>";
      		document.getElementById("submit").disabled = false;
      	}	
      }
	}  		
	}	
	--%>
	//jQueryAjax请求
	function ajaxSubmit(){
		var username=$("#username").val();	
		$.ajax({
   			type: "POST",
   			url: "UserAction?action=ajax&username="+username,
   			//请求正常，响应也正常时回调的函数
   			success: function(msg){
     			//alert(msg );
     			if(msg=="yes"){
      				$("#state").html("<font color='red'>用户名已存在</font>");
      				document.getElementById("submit").disabled = true;
      			}else{
      				$("#state").html("<font color='green'>√</font>");
      				document.getElementById("submit").disabled = false;
      			}	
   			}
		});
	}
	
	</script>
  </head> 
  <body>
  <center>
    <fieldset style="width: 420px">
    <legend style="margin-left: 150px;"> 注册信息</legend>
    <form action="UserAction?action=regist" method="post">
		用户昵称：<input id="username" name="username" onblur="ajaxSubmit()"><span id="state"></span><br>
		真实姓名：<input  name="relname"><br>
		用户密码：<input type="password" name="password" ><br>
		用户性别：男<input type="radio" checked name="sex" value="男">女<input type="radio" name="sex" value="女"></br>
		联系电话：<input name="tel"><br/>
		收货地址：<input name="address"><br/>
  <input disabled="disabled" id="submit" type="submit" value="注册">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取消">
</form>
</fieldset>  
</center> 
  </body>
</html>
