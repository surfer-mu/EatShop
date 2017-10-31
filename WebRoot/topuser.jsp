<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
		
		
	
		.top-wrapper{
		    width: 100%;
		    height:40px;
		    background-color: #F5F5F5;
		}
		.top-left{
		    float:left;
		    margin-left: 200px;
		}
		.top-right{
		    float: right;
		    margin-right: 200px;
		}
	
		.user-name{
		    float: left;
		    height: 36px;
		    padding: 0 3px;
		    text-align: center;
		    margin: 0 5px 0 5px ;
		      border-right: 1px solid #f5f5f5;
  			  border-left: 1px solid #f5f5f5;
		    line-height: 35px;
		}
		.user-name:hover{
		    border-right: 1px solid #eee;
		    border-left: 1px solid #eee;
		    background: #fff;
		}
		
		a{
			text-decoration: none;
			color: #999999;
			font-size: 10px
		}
		a.hover{
			
			color: #FF4400;
			
		}
		.get-box{
			display: none
		}
	</style>
</head>
<body>
<div class="top-wrapper">
    <div class="top-info" >
        <div class="top-left" >
       		  <c:if test="${user!=null }">
       		 	<div id="arrow1" class="user-name" style="margin-bottom :10px">
                <a href="myinfo.jsp">欢迎您！ ${user.username }</a>
                &nbsp;
               
                <span class="down-icon"></span>
        	    </div>
        	    <div id="arrow1" class="user-name">
               
                <a href="${pageContext.request.contextPath }/user/quitUser.do">退出</a>
                <span class="down-icon"></span>
        	    </div>
       		 </c:if>
            <c:if test="${user==null }">
            	<div id="arrow1" class="user-name">
                <a href="/eat/user/login.do">登录</a>
                <span class="down-icon"></span>
            </div>
            <div  id="arrow2" class="user-name">

                <a href="register.jsp">注册</a>
                <span class="down-icon"></span>
            </div>
            </c:if>
            <div  id="arrow3" class="user-name">

                <a  href="${pageContext.request.contextPath }/pageallEat.do">手机lezz零食</a>
            </div>
        </div>

        <div class="top-right">
            <div data-toggle="arrowdown" id="arrow4" class="user-name">
                 <a href="${pageContext.request.contextPath }/pageallEat.do">我的lezz零食</a>
                <span class="down-icon"></span>
            </div>
            <div data-toggle="arrowdown" id="arrow5" class="user-name">

                <a href="${pageContext.request.contextPath }/admin/cart.jsp"><img src="/eat/img/cart.png">购物车</a>
                <span class="down-icon"></span>
            </div>
            <div data-toggle="arrowdown" id="arrow6" class="user-name">

                <a href="pageallEat.do"><img src="/eat/img/446.png" /><span  >收藏夹</span></a>
                <span class="down-icon"></span>
            </div>
            <div data-toggle="arrowdown" class="user-name">
                <a class="a-float-left" href="pageallEat.do">联系客户</a>
            </div>


            <div data-toggle="arrowdown" id="arrow7" class="user-name">
                <img src="/eat/img/418.png" style="margin-top:-10px">
                <a href="pageallEat.do">网站导航</a>
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
</body>
</html>