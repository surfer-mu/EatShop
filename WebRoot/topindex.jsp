<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/my.css"/>
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery_1.9.js"></script>
<script type="text/javascript">
	function search(){
		var text=document.getElementById("search").value;
		if(text=="")
		return ;
		var name=encodeURI(encodeURI(text));
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/findEatByLikeName.do?name="+name,
			success:function(msg){
				var ss=eval(msg);
				var childdiv="";
				for(var i=0;i<ss.length;i++){
				
					childdiv+="<div style='line-height:25px;border:1px solid #999999' onmouseover='mouseover(this)' onmouseout='mouseout(this)' onclick='clickdiv(this)'>"+ss[i]+"</div>";
				}
				$("#div").html(childdiv).css("display","block");
			}
		});
	}
	function searchbut(){
		var text=$("#search").val();
		var name=encodeURI(encodeURI(text));
		location.href="${pageContext.request.contextPath}/findPageEatByLikeName.do?name="+name;
	}
	function mouseout(div){
		$(div).css("backgroundColor","white");
	}
	function mouseover(div){
		$(div).css("backgroundColor","#999999");
		
	}
	function clickdiv(div){
		$("#search").val(div.innerHTML);
		$("#div").css("display","none");
	}
</script>
<body>

<div class="top-wrapper">
    <div class="top-info">
        <div class="top-left">
       		  <c:if test="${user!=null }">
       		 	<div id="arrow1" class="user-name">
                <a href="myinfo.jsp">欢迎您！ ${user.username }</a>
                &nbsp;
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

                <a  href="${pageContext.request.contextPath }/pageallEat.do">手机lezz零食</a>
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

                <a href="pageallEat.do"><img src="img/446.png" /><span  >收藏夹</span></a>
                <span class="down-icon"></span>
            </div>
            <div data-toggle="arrowdown" class="user-name">
                <a class="a-float-left" href="pageallEat.do">联系客户</a>
            </div>


            <div data-toggle="arrowdown" id="arrow7" class="user-name">
                <img src="img/418.png" style="margin-top:-10px">
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

<div style="float:clear;"></div>
<div class="top-main" >
<center style="margin-right:250px">
        <table>
            <tr width="100%" style="text-align: left ; ">
                <td  width="34%"  style="text-align: right"><img  src="img/logo.gif"  /></td>
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
        </center>
        <div class="logo"  ></div>

    </div>
	
</body>
</html>