/**
 * Created by mu on 2017/4/12.
 */
$(function(){
    $(".side-li>li:even").mouseover(function(){
        $(".imgBox").css("display","none")
        $(".detail2").css("display","none")
        $(".detail").css("display","block")
    }).mouseout(function(){
        $(".imgBox").css("display","block")
        $(".detail").css("display","none")
        $(".detail2").css("display","none")
    });
    $(".side-li>li:odd").mouseover(function(){
        $(".imgBox").css("display","none")
        $(".detail2").css("display","block")
        $(".detail").css("display","none")
    }).mouseout(function(){
        $(".imgBox").css("display","block")
        $(".detail").css("display","none")
        $(".detail2").css("display","none")
    });
    $(".li-1").mouseover(function(){
       $("box-1").css("display","block")
        $("box-2").css("display","none")
        $("box-3").css("display","none")
        $("box-4").css("display","none")
        $("box-5").css("display","none")
    })
    $('.li-nav').hover(function(){
        var _id, num;

        _id = $(this).attr('id');
        num = _id.substring(3, _id.length);
       $('.li-nav').removeClass('li-border');
        $('.hiddenBox').hide();
        $('#box-'+num).show();
        $('#box-'+num).css("text-align","left");
    }, function(){
        $(this).addClass('li-nav-hover');
    });
    /*$("#arrow4").mouseenter(function(){
        $("#nav-box3").show();
    }).mouseleave(function(){
        $("#nav-box3").hide();
    });
    $("#arrow6").mouseover(function(){
        $("#nav-box5").show();
    }).mouseout(function(){
        $("#nav-box5").hide();
    })*/





});
