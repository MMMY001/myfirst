<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/5/3
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object user_name = request.getSession().getAttribute("user_name");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <title>模拟经营</title>
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
                    <a href="javascript:;"><i class="layui-icon" style="font-size: 20px; color: #4cae4c;">&#xe658;</i><%=user_name%></a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=user_name%>accoutindex.action">个人中心</a></dd>
                        <dd><a href="<%=user_name%>exit_logon.action">退出登录</a></dd>
                    </dl>
                </li>
            </c:if>

            <c:if test="${  empty user_name }">
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/login.action">登录</a>
                </li>
            </c:if>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/Jumpindex.action">商城首页</a></li>
            <li class="layui-nav-item "><a href="${pageContext.request.contextPath}/Jumpabout.action">关于我们</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">帮助中心</a>
                <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd><a href="${pageContext.request.contextPath}/Jumpsolve.action">常见问题</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/Jumpcontact.action">联系我们</a></dd>
                </dl>
            </li>
        </div>
    </ul>
</div>
<!-- 导航条 end -->


<div style="width: 1200px;height: auto;margin: auto;margin-top: 30px;">
    <!-- 游戏分类导航条-->
    <div style="width: 100%; height: auto;text-align: center;">
    <span class="layui-breadcrumb " lay-separator="|">
   <a href="${pageContext.request.contextPath}/JumpPRG"><span class="layui-badge">角色扮演PRG</span></a>
    <a href="${pageContext.request.contextPath}/JumpSPG"><span class="layui-badge layui-bg-orange">体育竞技SPG</span></a>
    <a href="${pageContext.request.contextPath}/JumpSLG"><span class="layui-badge layui-bg-blue">策略战棋SLG</span></a>
    <a href="##"><span class="layui-badge layui-bg-cyan">模拟经营SIM</span></a>
    <a href="${pageContext.request.contextPath}/JumpFPS"><span class="layui-badge layui-bg-green">第一人称射击游戏FPS</span></a>
    <a href="${pageContext.request.contextPath}/JumpACT"><span class="layui-badge layui-bg-black">动作游戏ACT</span></a>
    </span>
    </div>
    <!-- 游戏分类导航条-->
    <div style="width: 100%; height: auto;text-align: center;margin-top: 20px;">
        <span style="font-size: 20px; font-weight: bold;font-family: 宋体;">模拟经营</span>
    </div>
    <!-- 模拟经营 -->

        <ul style="width: 100%;height: auto;">
            <li style="width: 100%;height:200px;margin-top: 5px;position: relative;float: left;">
                <div style="float: left;margin: 28px 10px;"><img src="${pageContext.request.contextPath}/image/TKheader.jpg"
                                                                 style="width: 324px;height: 151px;"/></div>
                <div style="float: left;margin: 28px 10px;">
                    <div>
                        <h1>全面战争:三国<i class="layui-icon" style="font-size: 20px; color: #FF5722;">&#xe756;</i></h1>
                    </div>
                    <div style="margin-top: 20px;">
                        <span> 畅玩指数</span>
                        <i class="layui-icon" style="font-size: 20px; color: #FFB800;">&#xe658;</i>
                        <i class="layui-icon" style="font-size: 20px; color: #FFB800;">&#xe658;</i>
                        <i class="layui-icon" style="font-size: 20px; color: #FFB800;">&#xe658;</i>
                        <i class="layui-icon" style="font-size: 20px; color: #FFB800;">&#xe658;</i>
                        <i class="layui-icon" style="font-size: 20px; color: #FFB800;">&#xe658;</i>
                    </div>
                    <div style="margin-top: 30px;">
                        <a href="${pageContext.request.contextPath}/gamejsp/jpHOI4.action" class="layui-btn  layui-btn-normal">进入专题</a>
                    </div>
                </div>
            </li>
        </ul>
    <!-- 模拟经营 end -->


</div>

<script type="text/javascript" src="./layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    });
</script>

</body>
</html>
