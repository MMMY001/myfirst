<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/4/25
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>联系我们</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>
<style>
    .btu_div {
        width: 200px;
        height: 50px;
        border-style: solid;
        border-width: 4px;
        border-color: orange;
        float: left;
        text-align: center;
        line-height: 50px;
        margin-left: 30px;
        cursor: pointer;
    }
</style>
<body>
<div style="position:fixed; left:0px; top:0px; width:100%; height:100%;z-index: -1;">
    <img src="${pageContext.request.contextPath}/image/sysimg/helpBG.jpg" style="height: 100%;width: 100%;"/>
</div>

<!-- 导航条 -->
<div>
    <ul class="layui-nav layui-bg-cyan" lay-filter="">
        <div><span class="layui-badge layui-bg-blue">天悦游戏商城</span></div>
        <div style="margin-left: 300px;text-align: right;">
            <li class="layui-nav-item"><a href="${ pageContext.request.contextPath }/Jumpindex.action">商城首页</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">帮助中心</a>
                <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd><a href="${ pageContext.request.contextPath }/Jumpsolve.action">常见问题</a></dd>
                    <dd><a href="${ pageContext.request.contextPath }/Jumpcontact.action">联系我们</a></dd>
                </dl>
            </li>
        </div>
    </ul>
</div>
<!-- 导航条 -->

<!-- 内容区域 -->
<div style="margin: auto; margin-top: 50px;width: 500px;">
    <div style="margin-top: 130px;">
        <div class="btu_div" style="float:left;">
            <span style="color: orange;font-weight: bold;font-size: 20px;">官方微信客服</span>
            <div style="margin-top: 5px;width: auto;height: auto;display: none;">
                <img src="${pageContext.request.contextPath}/image/sysimg/weChat.jpg"style="width: 200px;height: 240px;">
            </div>
        </div>
        <div class="btu_div " style="float:right;">
            <span style="color: orange;font-weight: bold;font-size: 20px">官方QQ客服</span>
            <div style="margin-top: 5px;width: auto;height: auto;display: none;">
                <img src="${pageContext.request.contextPath}/image/sysimg/QQ.jpg"style="width: 200px;height: 240px;">
            </div>
        </div>
    </div>
</div>
<!-- 内容区域 -->

<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    });

</script>
<script>
    window.onload = function(){
        // 设定父级div的class一样
        $(".btu_div").hover(function(){
            //  选中子级div
            $(this).children('div').css('display','block')
        },function(){
            //  选中子级div
            $(this).children('div').css('display','none')
        })
    };
</script>
</body>
</html>
