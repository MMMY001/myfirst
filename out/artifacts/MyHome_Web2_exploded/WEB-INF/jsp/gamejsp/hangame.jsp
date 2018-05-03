<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/4/25
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object user_name = request.getSession().getAttribute("user_name");

%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <title>天悦游戏商城</title>
</head>
<body>
<!-- 导航条 -->
<div>
    <ul class="layui-nav layui-bg-cyan" lay-filter="">
        <div><span class="layui-badge layui-bg-blue">天悦游戏商城</span></div>
        <div style="margin-left: 300px;text-align: right;">

            <!-- style="display: none;" -->
            <c:if test="${ not empty user_name }">
                <li class="layui-nav-item">
                    <a href=""><i class="layui-icon" style="font-size: 20px; color: #ffff00;">&#xe658;</i>  <%=user_name%></a>
                    <dl class="layui-nav-child">
                        <dd><a href="${ pageContext.request.contextPath }/accoutindex.action">个人中心</a></dd>
                        <dd><a href="##">安全管理</a></dd>
                        <dd><a href="${ pageContext.request.contextPath }/exit_logon.action">退出登录</a></dd>
                    </dl>
                </li>
            </c:if>

            <c:if test="${  empty user_name }">
                <li class="layui-nav-item">
                    <a href="${ pageContext.request.contextPath }/login.action">登录</a>
                </li>
            </c:if>
            <li class="layui-nav-item"><a href="${ pageContext.request.contextPath }/Jumpindex.action">商城首页</a></li>
            <li class="layui-nav-item "><a href="${ pageContext.request.contextPath }/Jumpabout.action">关于我们</a></li>
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
<!-- 导航条 end-->
<!-- 下半部分包裹 -->
<div style="padding-top:10px;margin: auto;width:940px;height: 400px; ">

    <!-- 游戏下载头部 -->
    <div>
        <fieldset class="layui-elem-field" style="height: 300px;">
            <legend><h1 style="color: #FFB800;">幻想神域</h1></legend>
            <div class="layui-field-box" style="position: relative;">
                <div style="float: left">
                    <img src="${pageContext.request.contextPath }/image/hangame1-1.jpg" style="display: block;width: 150px; height: 200px;"/>
                </div>
                <div style="float: left;margin-left: 30px;">
                    <h4>制作发行：敬请期待</h4>
                    <br>
                    <h4>游戏类型:敬请期待</h4>
                    <br>
                    <h4>游戏大小:敬请期待</h4>
                    <div style="padding-top: 35px;">
                            <button class="layui-btn layui-btn-danger" onclick="buy_the_game();">敬请期待</button>
                    </div>
                </div>
            </div>
        </fieldset>
    </div>
    <!-- 游戏下载头部 end -->

    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">游戏介绍</li>
            <li>配置要求</li>
            <li>安装说明</li>
            <li>常见问题</li>
        </ul>

        <div class="layui-tab-content" style="height: auto;">  <!-- 选项卡内容部分高度设置 这里设置位auto-->

            <!--游戏介绍 -->
            <div class="layui-tab-item layui-show">
                <p>敬请期待</p>
            </div>
            <!--游戏介绍 end-->

            <!-- 配置要求 -->
            <div class="layui-tab-item">
                <p>敬请期待</p>
            </div>
            <!-- 配置要求 end-->

            <!-- 安装说明-->
            <div class="layui-tab-item">
                <p>敬请期待</p>
            </div>
            <!-- 安装说明 end -->

            <!--常见问题-->
            <div class="layui-tab-item">
                <p>敬请期待</p>
                <hr class="layui-bg-blue">
            </div>
            <!--常见问题 end -->

        </div>
    </div>


</div>
<!-- 下半部分包裹 end-->
<script type="text/javascript" src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
    layui.use(['element', 'layer'], function () {
        var element = layui.element
        layer = layui.layer;
    });

    function buy_the_game() {
        layer.msg('敬请期待', {
            icon: 6
            , time: 2000
        });
    }
</script>
</body>
</html>
