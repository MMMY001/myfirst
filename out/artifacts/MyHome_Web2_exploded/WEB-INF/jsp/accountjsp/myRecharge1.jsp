<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    /* String user_name = (String) request.getAttribute("user_name");
      获取登录的用户名
    String name=(String)( request.getSession().getAttribute("user_name"));*/
    Object user_name = request.getSession().getAttribute("user_name");
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
                <li class="layui-nav-item layui-this"><a href="${ pageContext.request.contextPath }/myRecharge.action">充值中心</a>
                </li>
                <li class="layui-nav-item"><a href="${ pageContext.request.contextPath }/mySafety.action">安全中心</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <blockquote class="layui-elem-quote layui-bg-white">
            <div id="nowTime"></div>
        </blockquote>
        <span style="margin-left: 50px; font-size: 35px; font-weight: bold;">充值中心</span>
        <form id="edit_cash_form" action="${pageContext.request.contextPath}/Recharge.action">
            <div class="layui-form-item" style="margin-left: 30px;margin-top: 50px;">
                <label class="layui-form-label">充值金额:</label>
                <div class="layui-input-inline">
                    <input type="text" id="user_cash" name="user_cash" required lay-verify="required" placeholder="￥"
                           autocomplete="off" class="layui-input" style="width: 100px;">
                </div>
            </div>
            <div  style="margin-left: 140px;margin-top: 30px;">
                <button type="submit" class="layui-btn layui-btn-normal">立即充值</button>
            </div>
        </form>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 天悦在线游戏商城 ----充值中心
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/nowtime.js"></script>

<script>
    //JavaScript代码区域
    layui.use(['element', 'form'], function () {
        var element = layui.element
            , form = layui.form;

    });
</script>
</body>
</html>