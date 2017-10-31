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
    <title>商品详情</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/my.css"/>
    <link rel="stylesheet" href="css/detailmy.css"/>
    <script src="js/jquery_1.9.js"></script>
    <script type="text/javascript">
    	function addcart(id){
    		var count=document.getElementById("shu").value;
    		
    		location.href="${pageContext.request.contextPath }/cart/addcartEat.do?id="+id+"&&num="+count;
    	}
    	
    	function changecount(change,pnum){
    		var count=document.getElementById("shu").value;
    		count=Number(count)+Number(change);
    		
    		if(count<1){
            		count=1;
            		alert("多少买点吧");
           	}
            	
            if(count>pnum){
            		count=pnum;
            		alert("不能超过最大库存");
           }
        	document.getElementById("shu").value=count;
    	}
        $(function(){
            $(".inp").blur(function(){
	         	var count=Number($(".inp").val());
	         	
	            var pnum=Number($("#pnum").html());
	           
	          
	            	if(count<1){
	            		$(".inp").val(1);
	            	}
	            	else if(count>pnum){
	            	
	            		$(".inp").val(pnum);
	            		alert("不能超过最大库存");
	            		
	            	}
	            	else {
	            		$(".inp").val(count);
	            	}
	            	
	            	
	            });
        }) 
    </script>
    
    <style type="text/css">
    	.headtop div{
    	border-bottom: 1px solid #999999
    	}
    	
    	.count li{
    		list-style-type:none;
		
		float:left;
    	}
    	
    	
	/* 
	ul{
		text-align: center;
	}
    	 */
    </style>
</head>
<body>


<jsp:include page="top.jsp"></jsp:include>



</div>
    <div ><img src="dimg/details.png" width="100%"></div>
    <div class="all" >
            <div class="headtop" >
                <div class="headtop-s" ><a href="${pageContext.request.contextPath }/pageallEat.do">全部商品</a></div>
                <div class="headtop-s"><a href="index.html">首页</a></div>
                <div><a href="${pageContext.request.contextPath }/pageallEat.do">松鼠窝</a></div>
                <div><a href="${pageContext.request.contextPath }/pageallEat.do">淘抢购</a></div>
                <div><a href="${pageContext.request.contextPath }/pageallEat.do">肉类专区</a></div>
                <div><a href="${pageContext.request.contextPath }/pageallEat.do">糕点专区</a></div>
                <div><a href="${pageContext.request.contextPath }/pageallEat.do">坚果专区</a></div>
                <div><a href="${pageContext.request.contextPath }/pageallEat.do">蜜饯专区</a></div>
                <div><a href="${pageContext.request.contextPath }/pageallEat.do">进口专区</a></div>
                <div><a href="${pageContext.request.contextPath }/pageallEat.do">新疆正品</a></div>
                <div><a href="${pageContext.request.contextPath }/pageallEat.do">其他</a></div>
                <div><a href="${pageContext.request.contextPath }/pageallEat.do">周边</a></div>
                
            </div>
        <div style="clear:both"></div>
           <div class="product" >
               <table>
                   <tr >
                       <td >
                           <div style=" width:38%;">
                               <img class="first" style="width: 418px;height: 418px"src="${eat.imgpath }">
                             
                           </div>
                          
                       </td>
                      
                       <td>
                           
                           <div class="product-font" style=" width:90%;margin-top: 20px">
                               <h1 style="margin-top: -20px;margin-bottom: 15px" >
                                   ${eat.eatname }
                               </h1>
                               <div class="newp">

                                   ${eat.description }
                               </div>
                               <h4 class="promise" style="margin-top: 15px;margin-bottom: 15px">
                                	   承诺无损送货，未履约赔付100元
                               </h4>

                               <div class="money" >
                                   <dt class="tb-ch" >原价：</dt>
                                   <dd><span class="tm-price"><s>${eat.price*1.2 }</s></span></dd>
                                   <dt class="tb-ch">限时促销：</dt>
                                   <span class="tbqian">¥${eat.price }</span>
                                  

                               </div>
                               <div class="willbuy" style="margin-top: 15px;margin-bottom: 15px">
                                   <span class="tb1">预定件数</span>
                                   <span class="tb2">18件</span>
                               </div>
                               <div class="custermer">

                                   <div class="tm"><span class="feel">累计评价</span><span class="tm-r">${(eat.price*eat.pnum-eat.price*eat.pnum%100)/100 }</span></div>

                                   <div class="tm"><span class="feel">送天猫积分</span><span class="tm-g">${(eat.price-eat.price%10)/10 }</span></div>
                               </div>
                               <div class="count" style="margin-top: 20px;">
                               
                               	<ul class="count">
                               		<li><p class="cnt" style="margin-top: 10px">数量</p></li>
                               		<li><img class="updateimg1"  onclick="changecount(-1,${eat.pnum })" src="dimg/ins.png"></li>
                               		<li><input id="shu" class="inp" style="width:36px;height:30px;border: 1px solid  #DDDDDD; text-align: center" value="1"></li>
                               		<li><img class="updateimg2"  onclick="changecount(1,${eat.pnum })" src="dimg/add.png" ></li>
                               		
                               		<li><p class="cnt"  style="margin-top: 10px">库存<span id="pnum" class="tm-r"> ${eat.pnum } </span>件</p></li>
                               	</ul>
                                   
                                <%--  --%>
                               </div>
                               <a id="buy" onclick="addcart('${eat.id }')"  title="点击此按钮，到下一步确认购买信息。" >
                                   <img src="dimg/buycart.png" alt="加入购物车" >
                               </a>

                               </span>
                           </div>
                       </td>
                   </tr>
               </table>
               <div style="clear: both"></div>
              <!-- <div style="clear:both"></div>-->

            <img src="dimg/bottom.png" width="100%">

    </div>
</body>
</html>