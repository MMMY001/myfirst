<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>关于我们</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <style>
        html, body {
            margin: 0;
            padding: 0;
        }

        .box {
            width: 800px;
            height: 700px;
            margin: auto;
            margin-top: 100px;
        }
    </style>
</head>
<body>
<div style="position:fixed; left:0px; top:0px; width:100%; height:100%;z-index: -1;">
    <img src="${pageContext.request.contextPath}/image/aboutImg/aboutbg.jpg" width="100%" height="100%"/>
</div>

<!-- 导航条 -->
<div>
    <ul class="layui-nav layui-bg-cyan" lay-filter="">
        <div><span class="layui-badge layui-bg-blue">天悦游戏商城</span></div>
        <div style="margin-left: 300px;text-align: right;">
            <li class="layui-nav-item"><a href="${ pageContext.request.contextPath }/Jumpindex.action">商城首页</a></li>
        </div>
    </ul>
</div>
<!-- 导航条 -->

<div class="layui-tab layui-tab-brief box" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">作者档案<i class="layui-icon" style="color: #FF5722">&#xe662;</i></li>
        <li>关于网站<i class="layui-icon" style="color: #00F7DE">&#xe62e;</i></li>
        <li>打赏作者<i class="layui-icon" style="color: #1E9FFF;">&#xe65e;</i></li>
    </ul>

    <div class="layui-tab-content">

        <div class="layui-tab-item layui-show">
           <div style="margin: auto;margin-top: 10px;width: 350px;">
               <span class="layui-badge">英俊潇洒</span>
               <span class="layui-badge layui-bg-orange">风流倜傥</span>
               <span class="layui-badge layui-bg-cyan">人见人爱</span>
               <span class="layui-badge layui-bg-blue">花见花开</span>
               <span class="layui-badge layui-bg-gray">车见车载</span>
           </div>

            <div class="layui-carousel" id="myself" style="margin: auto;margin-top: 20px;">
                <div carousel-item>
                    <div>
                        <img src="${pageContext.request.contextPath}/image/aboutImg/0.jpg" style="width: 100%;height: 100%;">
                    </div>
                    <div>
                        <img src="${pageContext.request.contextPath}/image/aboutImg/1.jpg" style="width: 100%;height: 100%;">
                    </div>
                    <div>
                        <img src="${pageContext.request.contextPath}/image/aboutImg/4.jpg" style="width: 100%;height: 100%;">
                    </div>
                    <div>
                        <img src="${pageContext.request.contextPath}/image/aboutImg/2.jpg" style="width: 100%;height: 100%;">
                    </div>
                </div>
            </div>

        </div>

        <div class="layui-tab-item">
            天悦游戏商城，是一个在线商城，这是一个带给大家快乐与微笑的地方
        </div>

        <div class="layui-tab-item" style="padding-left: 200px;">
            <img src="${pageContext.request.contextPath}/image/aboutImg/myapy.jpg" width="300px" height="300px"/>
        </div>

    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use(['layer', 'element', 'carousel'], function () {
        var layer = layui.layer
            , element = layui.element
            , carousel = layui.carousel;
        layer.msg('欢迎光临!');

        // 轮播图片
        carousel.render({
            elem: '#myself'
            , width: '80%' // 设置宽度
            , height: '300'
            , arrow: 'hover'
            , anim: 'default'
            , indicator: 'none'
        });
    });
</script>
</body>
</html>