<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/my.css"/>
    <link rel="stylesheet" href="css/detailmy.css"/>
    <script src="js/jquery_1.9.js"></script>
    
    <style type="text/css">
    .headtop div{
    	border-bottom: 1px solid #999999
    	}
    </style>
<title>Insert title here</title>
<script type="text/javascript">
	function ajaxSubmit(){
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlhttp;
		
	}
	function change_over(div){
		div.style.backgroundColor="gray";
		
	
	}
	function change_out(div){
		div.style.backgroundColor="#FFFFFF";
	
	}
	function search(){
		 var text=document.getElementById("search").value;
		var div=document.getElementById("div");
		if(text==""){
			div.style.display="none"; 
			return ;
		}
		var xmlHttp=ajaxSubmit();
		alert(text);
		//var name=encodeURI(encodeURI(text)); 
		var name=encodeURIComponent(encodeURIComponent(text));
		alert(name);
		xmlHttp.open("post","${pageContext.request.contextPath}/findEatByLikeName.do?name="+name,true);
		xmlHttp.send(null);
		
		xmlHttp.onreadystatechange=function(){
			
			if(xmlHttp.readyState==4&&xmlHttp.status==200){
		
				var ss=eval(xmlHttp.responseText);
				
				childdiv="";
				for(var i=0;i<ss.length;i++){
					childdiv+="<div style='font-size:20px;line-height:35px;background-color:#FFFFFF' onclick='clickeat(this)' onmouseover='change_over(this)' onmouseout='change_out(this)'>"+ss[i]+"</div>"
				
				}
				div.innerHTML=childdiv;
				div.style.display="block"; 
			}
		}
		 
	}
	function clickeat(childdiv){
		var text=document.getElementById("search").value;
		document.getElementById("search").value=childdiv.innerHTML;
		
		var div=document.getElementById("div");
	div.style.display="none";
		
	}
	function searchbut(){
		var text=document.getElementById("search").value;
			var name=encodeURI(encodeURI(text)); 
		location.href="${pageContext.request.contextPath}/findPageEatByLikeName.do?name="+name;
	}
</script>
</head>

<body>

<div>
<div class="top-wrapper">
    <div class="top-info">
        <div class="top-left">
             <c:if test="${user!=null }">
       		 	<div id="arrow1" class="user-name">
                <a href="myinfo.jsp">欢迎您！ ${user.username }</a>
                &nbsp;
                <span class="down-icon"></span>
        	    </div>
        	    <div  id="arrow2" class="user-name">

                 <a href="user/quitUser.do">退出</a>
                <span class="down-icon"></span>
            </div>
        	  
       		 </c:if>
            <c:if test="${user==null }">
            	<div id="arrow1" class="user-name">
                <a href="user/login.do">登录</a>
                <span class="down-icon"></span>
            </div>
            <div  id="arrow2" class="user-name">

                <a href="register.jsp">注册</a>
                <span class="down-icon"></span>
            </div>
            </c:if>
            <div  id="arrow3" class="user-name">

                <a  href="${pageContext.request.contextPath }/pageallEat.do">lezz零食</a>
            </div>
        </div>

        <div class="top-right">
            <div data-toggle="arrowdown" id="arrow4" class="user-name">
                <a href="${pageContext.request.contextPath }/pageallEat.do">我的lezz零食</a>
                <span class="down-icon"></span>
            </div>
            <div data-toggle="arrowdown" id="arrow5" class="user-name">

                <a href="${pageContext.request.contextPath }/admin/cart.jsp"><img src="img/cart.png">购物车</a>
                <span class="down-icon"></span>
            </div>
            <div data-toggle="arrowdown" id="arrow6" class="user-name">

                <a href="#"><img src="img/446.png" /><span  >收藏夹</span></a>
                <span class="down-icon"></span>
            </div>
            <div data-toggle="arrowdown" class="user-name">
                <a class="a-float-left" href="#">联系客户</a>
            </div>


            <div data-toggle="arrowdown" id="arrow7" class="user-name">
                <img src="img/418.png" style="margin-top:-10px">
                <a href="#">网站导航</a>
                <span class ="down-icon"></span>
            </div>

            <div  id="nav-box3" class="get-box">
                <ul>
                    <li>已买到的宝贝</li>
                    <li>新欢</li>
                    <li>我的足迹</li>
                    <li>我的上新</li>
                    <li>我的优惠</li>
                </ul>
            </div>

            <div  id="nav-box5" class="get-box">
                <ul>
                    <li>收藏的宝贝</li>
                    <li>收藏的店铺</li>
                </ul>
            </div>


        </div>
    </div>

</div>

<div styel="float:clear;"></div>
<div class="top-main">
    <table>
        <tr width="100%" style="text-align: left ; ">
            <td  width="38.5%"  style="text-align: right"><img  src="img/logo.gif"  /></td>
            <td class="search-wrapper" width="80%" style="text-align: left">
                <div >

                    <div width="100%">
                        <table>
                               <tr>
                                   <td><input type="button" class="search-pre" value="宝贝"></td>
                                   <td><input class="search-in"  style='font-size:20px' id="search" onkeyup="search()" type="text" ></td>
                                   <td><input type="button" onclick="searchbut()" class="search-but" value="搜索"></td>
                                   <td><a  href="pageallEat.do"><span style="margin-left: 10px ">高级</span ><br/><sapn style="margin-left: 10px ">搜索</sapn></a></td>
                               </tr>
                               <tr>
                                   <td></td>
                                   <td><div id="div" style="width:511px;position:absolute;border:1px solid red;" ></div></td>
                                   <td></td>
                                   <td></td>
                               </tr>
                           </table>
                    </div>
                    <br/>
                  
                </div>
            </td>


        </tr>

    </table>
    <div class="logo"  ></div>





</div>
    <div ><img src="dimg/details.png" width="100%"></div>
    
            <div class="headtop" style=" width:70%;margin: auto; margin-bottom: 50px">
                <div class="headtop-s" ><a href="${pageContext.request.contextPath }/pageallEat.do">全部商品</a></div>
                <div class="headtop-s"><a href="index.jsp">首页</a></div>
                <div><a href="${pageContext.request.contextPath }/findEatByCate.do?cate=nut">松鼠窝</a></div>
                
                <div><a href="${pageContext.request.contextPath }/findEatByCate.do?cate=fat">肉类专区</a></div>
                <div><a href="${pageContext.request.contextPath }/findEatByCate.do?cate=cake">糕点专区</a></div>
                <div><a href="${pageContext.request.contextPath }/findEatByCate.do?cate=nut">坚果专区</a></div>
                <div><a href="${pageContext.request.contextPath }/findEatByCate.do?cate=veg">蜜饯专区</a></div>
                <div><a href="${pageContext.request.contextPath }/findEatByCate.docate=fat">进口专区</a></div>
                <div><a href="${pageContext.request.contextPath }/findEatByCate.do?cate=nut">新疆正品</a></div>
                <div><a href="${pageContext.request.contextPath }/findEatByCate.docate=fat">淘抢购</a></div>
                <div><a href="${pageContext.request.contextPath }/findEatByCate.do">其他</a></div>
                <div><a href="${pageContext.request.contextPath }/findEatByCate.do?cate=nut">周边</a></div>
         
            </div>
            
      </div >
      
     
</body >
</html>