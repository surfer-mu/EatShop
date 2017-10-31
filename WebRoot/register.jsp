<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title></title>
    <link rel="stylesheet" href=" css/reset.css"/>
    <link rel="stylesheet" href=" css/my.css"/>
    <link rel="stylesheet" href=" css/regcss.css"/>
    <style>
        #subh{
            margin-top: 20px;
            margin-bottom: 20px;

        }
           .sub:hover{
               color: #ffffff;

           }
        .intext{
            font-family: Tahoma;
            width: 220px;
            height: 20px;
            line-height: 20px;
            background-color: #FFF;
            padding: 3px!important;
            border: solid 1px;
            border-color: #BBB;
        }
        .topfont{
            font-size: 14px;
            line-height: 28px;
            color: #777;
            text-align: right;
            width: 22%;
            float: left;
        }
        .top{
            width: 100%;
            float: left;
            clear: both;
            padding: 0;
        }
    </style>
    <script type="text/javascript">
    
    	function ajaxSubmit(){
    		var xmlhttp;
    		if(window.XMLHttpRequest){
    			xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			return xmlhttp;
    	}
    	
    	
    	
        function suggest() {
            document.getElementById("message").innerHTML = "<font color='red'></font>"
        }
        function checkUserName(username) {
            var span = document.getElementById("message");
            var username = document.getElementById("username").value;
            if (username == "") {
                span.innerHTML = "<font color='red'>用户名称不能为空</font>";
            }
            else if (username.trim().length < 3 || username.trim().length > 18) {
                span.innerHTML = "<font color='red'>用户名称长度只能是3-18位</font>";
            } else {
                
	    		var xmlHttp=ajaxSubmit();
	    		
	    		xmlHttp.open("post","${pageContext.request.contextPath}/user/findUserByUsername.do?username="+username,true);
	    		xmlHttp.send(null);
	    		xmlHttp.onreadystatechange=function(){
	    			if(xmlHttp.readyState==4&&xmlHttp.status==200){
	    				var repeat=document.getElementById("repeat");
	    				
	    				
	    				if(xmlHttp.responseText=="no"){
							repeat.innerHTML="<font color='red'>用户名已存在！</font>";    	
							document.getElementById("submit").disabled=true;
	    				}
	    				else{
	    					repeat.innerHTML="<font color='green'>√</font>";
	    					document.getElementById("submit").disabled=false;
	    					 return true;
	    				}
	    				
	    			}
	    			}
               
            }
        }
        function checkPassword() {
            var password1 = document.getElementById("password1").value;
            var span = document.getElementById("pass1");
            if (password1.trim().length < 3 || password1.trim().length > 16) {
                span.innerHTML = "<font color='red'>密码长度只能是3-16位</font>"
            } else {
                span.innerHTML = "<font color='green'>√</font>";
                return true;
            }
        }
        function checkPassword2() {
            var password1 = document.getElementById("password1").value;
            var password2 = document.getElementById("password2").value;
            var span = document.getElementById("pass2");
            if (password1 != password2) {
                span.innerHTML = "<font color='red'>与上次输入密码不一致</font>"
            }
            else {
                span.innerHTML = "<font color='green'>√</font>"
            }
        }
        function checkEmail() {
            var email = document.getElementById("Email").value;
            var span = document.getElementById("Email2");
            var reg = /^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;
            if (!reg.test(email)) {
                span.innerHTML = "<font color='red'>邮箱地址不正确，格式只能为；例如：ddd@163.com</font>"
            }
            else {
                span.innerHTML = "<font color='green'>√</font>";
                return true;
            }
        }
        function checkTel() {
            var Tel = document.getElementById("Tel").value;
            var span = document.getElementById("telll");
            var reg = /(86)*0*13\d{9}/;
            if (!reg.test(Tel)) {
                span.innerHTML = "<font color='red'>电话号码格式不正确</font>"
            } else {
                span.innerHTML = "<font color='green'>√</font>"
            }
        }

    </script>
</head>
<body>

<div class="top-wrapper">
    <div class="top-info">
        <div class="top-left">
            <div id="arrow1" class="user-name">
                <a href="#">我的账户</a>
                <span class="down-icon"></span>
            </div>
            <div  id="arrow2" class="user-name">

                <a href="#">消息</a>
                <span class="down-icon"></span>
            </div>
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

                <a href="#"><img src=" img/cart.png">购物车</a>
                <span class="down-icon"></span>
            </div>
            <div data-toggle="arrowdown" id="arrow6" class="user-name">

                <a href="#"><img src=" img/446.png" /><span  >收藏夹</span></a>
                <span class="down-icon"></span>
            </div>
            <div data-toggle="arrowdown" class="user-name">
                <a class="a-float-left" href="#">联系客户</a>
            </div>


            <div data-toggle="arrowdown" id="arrow7" class="user-name">
                <img src=" img/418.png" style="margin-top:-10px">
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
<div class="top-main" >
    <table>
        <tr width="100%" style="text-align: left ; ">
            <td  width="38.5%"  style="text-align: right"><img  src=" img/logo.gif"  /></td>
            <td class="search-wrapper" width="80%" style="text-align: left">
                <div >

                    <div width="100%">
                        <table>
                            <tr>
                                <td><input type="button" class="search-pre" value="宝贝"></td>
                                <td><input class="search-in" type="text" ></td>
                                <td><input type="button" class="search-but" value="搜索"></td>
                                <td><a  href="#"><span style="margin-left: 10px ">高级</span ><br/><sapn style="margin-left: 10px ">搜索</sapn></a></td>
                            </tr>
                        </table>

                    </div>
                    <br/>
                    <div class="other-search">
                        <a href="#">女士凉鞋</a>
                        <a href="#">男士T恤</a>
                        <a href="#">连衣裙</a>
                        <a href="#">时尚女包</a>
                        <a href="#">女士T恤</a>
                        <a href="#">雪纺衫</a>
                        <a href="#">中老年女装</a>
                        <a href="#">风衣</a>
                        <a href="#">童装</a>
                        <a href="#">孕妇装</a>
                        <a href="#">运动套装</a>
                        <a href="#">打底裤</a>
                        <a href="#">蚊帐</a>

                    </div>
                </div>
            </td>


        </tr>

    </table>
    <div class="logo"  ></div>

    </div>

	<div >

    <div style="width: 600px;height:700px;border: 1px solid #999999;background-color: #F9F9F9;margin: 90px 30px 0 250px;" >
        <div >
            <h3
                    style=" font-size: 18px;
            font-family: '微软雅黑';
            font-weight: 700;
            line-height: 20px;
            padding: 15px 0 25px 25px;
            color: #555;"
                    >用户注册</h3>
        </div>
        <div
             style="    background: #F9F9F9;
                padding: 0 20px;

                ">
            <form id="register_form" action="user/register.do" method="post">
                <dl class="top">
                    <dt class="topfont" style="line-height:54px;">用户名</dt>
                    <dd style="line-height:54px;">
                        <input type="text" id="username" onblur="checkUserName()" onfocus="suggest()" name="username" class="intext" title="请输入用户名，由6-18位字符组成"/> 
                        <span id="message"></span><span id="repeat"></span>
                </dl>
                <dl class="top">
                    <dt class="topfont" style="line-height:54px;">设置密码</dt>
                    <dd style="line-height:54px;">
                        <input type="password"  name="password" class="intext" id="password1" onblur="checkPassword()" title="请输入密码，由8-16位字符组成" maxlength="16"/>
                        <span id="pass1"></span></dd>
                </dl>
                <dl class="top" >
                    <dt class="topfont" style="line-height:54px;">确认密码</dt>
                    <dd style="line-height:54px;">
                        <input type="password" id="password2" name="password2" onblur="checkPassword2()"  class="intext" title="请再次输入密码" maxlength="16" />
                        <span id="pass2"></span></dd>
                </dl>
				<dl class="top">
                    <dt class="topfont" style="line-height:54px;">真实姓名</dt>
                    <dd style="line-height:54px;">
                        <input type="text" id="relname" name="relname" class="intext" /> 
                        <span id="relname"></span></dd>
                </dl>
                <dl class="top">
                    <dt class="topfont" style="line-height:54px;">性别</dt>
                    <dd style="line-height:54px;">
                        <input type="text" id="sex"  name="sex" class="intext" /> 
                        <span id="sex"></span></dd>
                </dl>
                <dl class="top">
                    <dt class="topfont" style="line-height:54px;">手机号码:</dt>
                    <dd style="line-height:54px;"><input type="text" maxlength="11" id="Tel" name="tell"  class="intext"/></dd>
                    <dd></dd>
                </dl>

                

                <dl class="top" >
                    <dt class="topfont" style="line-height:54px;">邮箱</dt>
                    <dd style="line-height:54px;">
                        <input type="text"  name="email" class="intext" />
                    </dd>
                </dl>
                <dl class="top">
                    <dt class="topfont" style="line-height:54px;">住址</dt>
                    <dd style="line-height:54px;">
                    <input type="text" maxlength="11" id="address" name="address" class="intext"/></dd>
                    <dd><span id="address"></span></dd>
                </dl>


              

                <dl class="top" id="subh" style="margin: auto;text-align: center">
                    <dt class="topfont" ></dt>
                    <dd >
                        <input type="submit" id="submit" class="sub" style="width: 150px;height: 30px;background-color: #ff4400" value="注册"/>
                        <input name="agree" type="checkbox" class="fl mt10 ml10" id="clause" value="1" checked="checked" />
                        <span for="clause" class="fl ml5">阅读并同意<a href="document-agreement.html">服务协议</a></span>
                        </dd>
                </dl>
                
                <input type="hidden" value name="ref_url">
                <input name="nchash" type="hidden" value="206f94ec" />

            <div class="clear">
            </div>

        <div class="nc-login-bottom">
        </div>
    </div>
</div>

	<img src="">
</div>
    <!--sdfsdfsdfsdfsdfsdfsdf-->



      <!--
                <tr>
                    <td height="50px">
                        <input type="reset" value="重新填写" name="reset"/>
                    </td>
                    <td>
                        <input type="submit" value="同意以下条款并注册" name="submit"/>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" style="border: 0px"><br><img src="image/read.gif"><span>阅读lezz零食网服务协议</span></td>
                </tr>
-->
<jsp:include page="bottom.jsp"></jsp:include> 
</body>
</html>