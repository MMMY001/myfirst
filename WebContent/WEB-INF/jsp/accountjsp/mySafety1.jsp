<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

    Object user_name = request.getSession().getAttribute("user_name");
    Object user_cash = request.getSession().getAttribute("user_cash");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">个人中心</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    欢迎用户<%=user_name%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/exit_logon.action">注销登录</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/Jumpindex.action">返回首页</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->

            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item ">
                    <a class="" href="${ pageContext.request.contextPath }/accoutindex.action">个人中心首页</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${ pageContext.request.contextPath }/myOrders.action">我的订单</a>
                </li>
                <li class="layui-nav-item"><a href="${ pageContext.request.contextPath }/myGames.action">我的游戏</a></li>
                <li class="layui-nav-item "><a href="${ pageContext.request.contextPath }/myRecharge.action">充值中心</a>
                </li>
                <li class="layui-nav-item layui-this"><a href="${ pageContext.request.contextPath }/mySafety.action">安全中心</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <blockquote class="layui-elem-quote layui-bg-white">
            <div id="nowTime"></div>
        </blockquote>
        <div style="padding-left:20px;">
            <a href="${ pageContext.request.contextPath }/mycash.action">
                <button type="button" class="layui-btn">余额查询</button>
            </a>
            <span style="font-size: 15px;font-weight: bold;background-color: #00FFCC;">账户余额:<%=user_cash%></span>
        </div>
        <div style="margin: 20px;">
            <button class="layui-btn  layui-btn-danger"
                    onclick="layer_show('修改密码','${ pageContext.request.contextPath }/ChangePwd.action','500','300');">
                修改密码
            </button>
        </div>
        <!-- 修改密码框 end-->

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            © 天悦在线游戏商城 ----账户信息
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/nowtime.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cgPwd.js"></script>

<script>
    //JavaScript代码区域
    layui.use(['element', 'form', 'layer'], function () {
        var element = layui.element
            , form = layui.form
            , layer = layui.layer;

    });
</script>
</body>
</html>