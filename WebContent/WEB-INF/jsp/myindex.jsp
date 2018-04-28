<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
//  http://localhost:8080/MyHome/
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

/* String user_name = (String) request.getAttribute("user_name");
获取登录的用户名
String name=(String)( request.getSession().getAttribute("user_name"));*/
    Object user_name = request.getSession().getAttribute("user_name");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>css/myul.css" media="all"/>
    <title>天悦游戏商城</title>
    <style>
        body {
            margin: 0;
            padding: 0;
        }

    </style>
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
                        <dd><a href="<%=basePath%>accoutindex.action">个人中心</a></dd>
                        <dd><a href="<%=basePath%>exit_logon.action">退出登录</a></dd>
                    </dl>
                </li>
            </c:if>

            <c:if test="${  empty user_name }">
                <li class="layui-nav-item">
                    <a href="<%=basePath%>login.action">登录</a>
                </li>
            </c:if>
            <li class="layui-nav-item"><a href="<%=basePath%>Jumpindex.action">商城首页</a></li>
            <li class="layui-nav-item "><a href="<%=basePath%>Jumpabout.action">关于我们</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">帮助中心</a>
                <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd><a href="<%=basePath%>Jumpsolve.action">常见问题</a></dd>
                    <dd><a href="<%=basePath%>Jumpcontact.action">联系我们</a></dd>
                </dl>
            </li>
        </div>
    </ul>
</div>
<!-- 导航条 -->

<!-- 下半部分包裹 -->
<div style="padding-top:30px;margin: auto;width:940px;height: 400px; ">

    <!-- 游戏分类导航条-->
    <div style="width: 100%; height: auto;text-align: center;">
    <span class="layui-breadcrumb " lay-separator="|">
    <a href=""><span class="layui-badge">角色扮演PRG</span></a>
    <a href=""><span class="layui-badge layui-bg-orange">体育竞技SPG</span></a>
    <a href=""><span class="layui-badge layui-bg-blue">策略战棋SLG</span></a>
    <a href=""><span class="layui-badge layui-bg-cyan">模拟经营SIM</span></a>
    <a href=""><span class="layui-badge layui-bg-green">第一人称射击游戏FPS</span></a>
    <a href=""><span class="layui-badge layui-bg-black">动作游戏ACT</span></a>
    </span>
    </div>
    <!-- 游戏分类导航条-->


    <!-- 轮播图-->
    <div class="layui-carousel" id="test1" style="margin-top: 10px;">
        <div carousel-item>
            <div>
                <div style="float: left;">
                    <img src="<%=basePath%>image/ghost.jpg" style="width:640px;height: 400px;"/>
                </div>
                <div style="width: 300px;height: 400px;background-color:#D9D9D9;float: left;">
                    <div><%--<a onclick="javascript:sendAjax(name)" name="ghost" style="cursor: pointer;">--%>
                        <a href="<%=basePath%>gamejsp/jpghost.action" target="_blank">
                            <h1 style="text-align: center;">幽灵行动</h1>
                        </a></div>
                    <div style="margin-top: 50px;margin-left:30px; ">
                        <span style="font-size: 20px;font-family: 微软雅黑;color: #40AFFE;">现已推出</span></div>
                    <div style="margin-top: 50px;margin-left:30px; "><span class="layui-badge layui-bg-gray">热销商品</span>
                    </div>
                    <div style="margin-top: 20px;margin-left:30px; ">
                        <span class="layui-badge">50 ￥</span>
                    </div>
                </div>
            </div>

            <div>
                <div style="float: left;"><img src="<%=basePath%>image/COD141.jpg"
                                               style="width:640px;height: 400px;"/></div>
                <div style="width: 300px;height: 400px;background-color:#D9D9D9;float: left;">
                    <div><a href="<%=basePath%>gamejsp/jpCOD14.action" target="_blank"><h1
                            style="text-align: center;">使命召唤14</h1></a></div>
                    <div style="margin-top: 50px;margin-left:30px; ">
                        <span style="font-size: 20px;font-family: 微软雅黑;color: #40AFFE;">现已推出</span></div>
                    <div style="margin-top: 50px;margin-left:30px; "><span class="layui-badge layui-bg-gray">热销商品</span>
                    </div>
                    <div style="margin-top: 20px;margin-left:30px; ">
                        <span class="layui-badge">100 ￥</span>
                    </div>
                </div>
            </div>

            <div>
                <div style="float: left;"><img src="<%=basePath%>image/gta5.jpg"
                                               style="width:640px;height: 400px;"/></div>
                <div style="width: 300px;height: 400px;background-color:#D9D9D9;float: left;">
                    <div><a href="<%=basePath%>gamejsp/jpGTA5.action" target="_blank"><h1
                            style="text-align: center;">侠盗猎车5</h1></a></div>
                    <div style="margin-top: 50px;margin-left:30px; ">
                        <span style="font-size: 20px;font-family: 微软雅黑;color: #40AFFE;">现已推出</span></div>
                    <div style="margin-top: 50px;margin-left:30px; "><span class="layui-badge layui-bg-gray">热销商品</span>
                    </div>
                    <div style="margin-top: 20px;margin-left:30px; ">
                        <span class="layui-badge">88 ￥</span>
                    </div>
                </div>
            </div>

            <div>
                <div style="float: left;"><img src="<%=basePath%>image/hoi4.jpg"
                                               style="width:640px;height: 400px;"/></div>
                <div style="width: 300px;height: 400px;background-color:#D9D9D9;float: left;">
                    <div><a href="<%=basePath%>gamejsp/jpHOI4.action" target="_blank"><h1
                            style="text-align: center;">钢铁雄心4</h1></a></div>
                    <div style="margin-top: 50px;margin-left:30px; ">
                        <span style="font-size: 20px;font-family: 微软雅黑;color: #40AFFE;">现已推出</span></div>
                    <div style="margin-top: 50px;margin-left:30px; "><span class="layui-badge layui-bg-gray">热销商品</span>
                    </div>
                    <div style="margin-top: 20px;margin-left:30px; ">
                        <span class="layui-badge">288 ￥</span>
                    </div>
                </div>
            </div>
            <div>
                <div style="float: left;"><img src="<%=basePath%>image/siege.jpg"
                                               style="width:640px;height: 400px;"/></div>
                <div style="width: 300px;height: 400px;background-color:#D9D9D9;float: left;">
                    <div><a href="<%=basePath%>gamejsp/jpsiege.action" target="_blank"><h1
                            style="text-align: center;">彩虹六号:围攻</h1></a></div>
                    <div style="margin-top: 50px;margin-left:30px; ">
                        <span style="font-size: 20px;font-family: 微软雅黑;color: #40AFFE;">现已推出</span></div>
                    <div style="margin-top: 50px;margin-left:30px; "><span class="layui-badge layui-bg-gray">热销商品</span>
                    </div>
                    <div style="margin-top: 20px;margin-left:30px; ">
                        <span class="layui-badge">95 ￥</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 轮播图-->

    <!-- 选项卡-->
    <div class="layui-tab">
        <ul class="layui-tab-title ">
            <li>近期新作</li>
            <li>热门单机</li>
            <li>即将上市</li>
            <li>页游手游</li>
        </ul>

        <div class="layui-tab-content">
            <!-- 近期新作-->
            <div class="layui-tab-item layui-show">
                <ul class="ul_list">
                    <li class="ul_list_li"><a
                            href="<%=basePath%>gamejsp/jpAWO.action"
                            target="_blank"> <img src="<%=basePath%>image/AWO-1.jpg"
                                                  style="display: block;width: 150px; height: 200px;"/>
                        <span class="ul_list_span">逃出生天</span>
                    </a></li>

                    <li class="ul_list_li"><a
                            href="<%=basePath%>gamejsp/jpFARCRY5.action"
                            target="_blank"> <img src="<%=basePath%>image/FARCRY5-1.jpg"
                                                  style="display: block;width: 150px; height: 200px;"/>
                        <span class="ul_list_span">孤岛惊魂5</span>
                    </a></li>

                    <li class="ul_list_li"><a
                            href="<%=basePath%>gamejsp/jpMSE.action"
                            target="_blank"> <img src="<%=basePath%>image/MSE-1.jpg"
                                                  style="display: block;width: 150px; height: 200px;"/>
                        <span class="ul_list_span">合金装备:幸存</span>
                    </a></li>
                </ul>
            </div>
            <!-- 近期新作-->

            <!-- 热门单机-->
            <div class="layui-tab-item">
                <ul class="ul_list">
                    <li class="ul_list_li"><a
                            href="<%=basePath%>gamejsp/jpmonster.action"
                            target="_blank"> <img src="<%=basePath%>image/monster-1.jpg"
                                                  style="display: block;width: 150px; height: 200px;"/>
                        <span class="ul_list_span">怪物猎人世界</span>
                    </a></li>

                    <li class="ul_list_li"><a
                            href="<%=basePath%>gamejsp/jpdfz.action"
                            target="_blank"> <img src="<%=basePath%>image/DFZ-1.jpg"
                                                  style="display: block;width: 150px; height: 200px;"/>
                        <span class="ul_list_span">龙珠格斗Z</span>
                    </a></li>

                    <li class="ul_list_li"><a
                            href="<%=basePath%>gamejsp/jpnioh.action"
                            target="_blank"> <img src="<%=basePath%>image/NIOH1-1.jpg"
                                                  style="display: block;width: 150px; height: 200px;"/>
                        <span class="ul_list_span">仁王</span>
                    </a></li>
                </ul>
            </div>
            <!-- 热门单机-->

            <!--即将上市-->
            <div class="layui-tab-item">
                <ul class="ul_list">
                    <li class="ul_list_li"><a
                            href="<%=basePath%>gamejsp/jpysVIII.action"
                            target="_blank"> <img src="<%=basePath%>image/YsVIII-1.jpg"
                                                  style="display: block;width: 150px; height: 200px;"/>
                        <span class="ul_list_span">伊苏8</span>
                    </a></li>

                    <li class="ul_list_li"><a
                            href="<%=basePath%>gamejsp/jptwtk.action"
                            target="_blank"> <img src="<%=basePath%>image/TWTK.jpg"
                                                  style="display: block;width: 150px; height: 200px;"/>
                        <span class="ul_list_span">全面战争:三国</span>
                    </a></li>

                    <li class="ul_list_li"><a
                            href="<%=basePath%>gamejsp/jpfs5.action"
                            target="_blank"> <img src="<%=basePath%>image/FS5-1.jpg"
                                                  style="display: block;width: 150px; height: 200px;"/>
                        <span class="ul_list_span">幻想三国志5</span>
                    </a></li>
                </ul>
            </div>
            <!--即将上市-->

            <!-- 页游手游-->
            <div class="layui-tab-item">
                <ul class="ul_list">
                    <li class="ul_list_li"><a
                            href="<%=basePath%>gamejsp/jphangame.action"
                            target="_blank"> <img src="<%=basePath%>image/hangame1-1.jpg"
                                                  style="display: block;width: 150px; height: 200px;"/>
                        <span class="ul_list_span">幻想神域</span>
                    </a></li>
                </ul>
            </div>
            <!-- 页游手游-->
        </div>
    </div>
    <!-- 选项卡-->

</div>
<!-- 下半部分包裹 -->

<script type="text/javascript" src="<%=basePath%>layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
    layui.use(['carousel', 'element'], function () {
        var carousel = layui.carousel
            , element = layui.element;

        //轮播图
        carousel.render({
            elem: '#test1'
            , width: '100%' // 设置容器宽度
            , height: '100%' // 设置容器的高度
            , arrow: 'hover' // 鼠标悬停显示箭头
            // , anim: 'fade' // 切换动画方式
        });
    });

    <%--function sendAjax(gname) {--%>
    <%--$.ajax({--%>
    <%--type: "post",--%>
    <%--data: {'g_name': gname},--%>
    <%--datatype: 'json',--%>
    <%--url: "<%=basePath%>gamejsp/jpgame.action",--%>
    <%--success: function (data) {--%>
    <%--window.location.href="<%=basePath%>myindex.jsp";--%>
    <%--}--%>
    <%--});--%>
    <%--}--%>
</script>
</body>
</html>

