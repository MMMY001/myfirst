<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/4/25
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>常见问题</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>
<body>
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
<!-- 导航条 end-->

<!-- 内容区域 -->
<div class="layui-collapse" lay-accordion style="width:1000px; height: auto;margin: auto;margin-top: 50px;">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">购买流程</h2>
        <div class="layui-colla-content " style="padding-left: 100px;">
            <ul class="layui-timeline">
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">第一步</h3>
                        <p>
                            注册会员账号后进入个人中心进行充值
                        </p>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">第二步</h3>
                        <p>
                            进入某个游戏页面进行购买
                        </p>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">第三步</h3>
                        <p>
                            购买成功后可在个人中心查看
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">下载流程</h2>
        <div class="layui-colla-content " style="padding-left: 100px;">
            <ul class="layui-timeline">
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">第一步</h3>
                        <p>
                            在个人中心查看我的游戏
                        </p>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">第二步</h3>
                        <p>
                            点击下载按钮进行下载
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">其他问题</h2>
        <div class="layui-colla-content " style="padding-left: 100px;">
            暂时没有其他问题
        </div>
    </div>
</div>
<!-- 内容区域 end-->

<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('element',function(){
        var element = layui.element;
    });
</script>
</body>
</html>
