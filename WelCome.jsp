<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/9/30
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<!DOCTYPE html>
<head>
    <title>instance Tables</title>
    <%@include file="newWelCome/WelComeTopBasic.jsp"%>
    <style type="text/css">

        #banner {position:relative; width:100%; height:90%; border:1px solid #666; overflow:hidden;}
        #banner_list img {border:0;}
        #banner_bg {position:absolute; bottom:0;background-color:#000;height:30px;filter: Alpha(Opacity=30);opacity:0.3;z-index:1000;
            cursor:pointer; width:478px;}
        #banner_info{position:absolute; bottom:0; left:5px;height:22px;color:#fff;z-index:1001;cursor:pointer}
        #banner_text {position:absolute;width:120px;z-index:1002; right:3px; bottom:3px;}
        #banner ul {position:absolute;list-style-type:none;filter: Alpha(Opacity=80);opacity:0.8; border:1px solid #fff;z-index:1002;
            margin:0; padding:0; bottom:3px; right:5px;}
        #banner ul li { padding:0 8px;float:left;display:block;color:#FFF;border:#e5eaff 1px solid;background:#6f4f67;cursor:pointer}
        #banner ul li.on { background:#900}
        #banner_list a{position:absolute;} /*<!-- 让四张图片都可以重叠在一起-->*/
    </style>
</head>
<script type="text/javascript">
    var t = n =0, count;
    $(document).ready(function(){
        count=$("#banner_list a").length;
        $("#banner_list a:not(:first-child)").hide();
        $("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
        $("#banner_info").click(function(){window.open($("#banner_list a:first-child").attr('href'), "_blank")});
        $("#banner li").click(function() {
            var i = $(this).text() -1;//获取Li元素内的值，即1，2，3，4
            n = i;
            if (i >= count) return;
            $("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
            $("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank")});
            $("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
            document.getElementById("banner").style.background="";
            $(this).toggleClass("on");
            $(this).siblings().removeAttr("class");
        });
        t = setInterval("showAuto()", 4000);
        $("#banner").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
    });
    function showAuto()
    {
        n = n >=(count -1) ?0 : ++n;
        $("#banner li").eq(n).trigger('click');
    }
</script>
<body class="hold-transition skin-blue sidebar-mini" >
<div class="wrapper">
    <%@include file="newWelCome/WelComeTop.jsp"%>
    <!-- Left side column. contains the logo and sidebar -->
    <%@include file="newWelCome/WelComeLeft.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div id="banner">
            <div id="banner_bg"></div><!--标题背景-->
            <div id="banner_info"></div><!--标题-->
            <ul>
                <li class="on">1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
            </ul>
            <div id="banner_list">
                <a target="_blank"><img src="${pageContext.request.contextPath}/statics/print/20968175_1368628102697.jpg" title="XXXXXXX" alt="XXXXXXX"/></a>
                <a target="_blank"><img src="${pageContext.request.contextPath}/statics/print/game_gamewall_492721_9.jpg" title="XXXXXXXX" alt="XXXXXXX"/></a>
                <a target="_blank"><img src="${pageContext.request.contextPath}/statics/print/2013052110243286384.jpg" title="XXXXXX" alt="XXXXXXX"/></a>
                <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/statics/print/2011-01-28_93177.jpg" title="XXXXXX" alt="XXXXXXX"/></a>
            </div>
        </div>
        <%--<img src="${pageContext.request.contextPath}/statics/print/12.jpg" class="img-thumbnail" alt="User Image">--%>
    </div>
    <!-- /.content-wrapper -->
    <%@include file="newWelCome/WelComeBase.jsp"%>

    <!-- Control Sidebar -->
    <%@include file="newWelCome/WelComeRight.jsp"%>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


<%@include file="newWelCome/WelComeBasic.jsp"%>
<!-- page script -->
</body>
</html>

