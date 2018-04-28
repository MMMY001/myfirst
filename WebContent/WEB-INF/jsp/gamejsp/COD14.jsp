<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object user_name = request.getSession().getAttribute("user_name");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/layui/css/layui.css" media="all">
    <title>天悦游戏商城</title>
</head>
<style>
    body {
        margin: 0;
        padding: 0;
    }
</style>
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
            <legend><h1 style="color: #FFB800;">使命召唤14</h1></legend>
            <div class="layui-field-box" style="position: relative;">
                <div style="float: left">
                    <img src="${ pageContext.request.contextPath }/image/COD14-1.jpg" style="display: block;width: 150px; height: 200px;"/>
                </div>
                <div style="float: left;margin-left: 30px;">
                    <h4>制作发行:Activision</h4>
                    <br>
                    <h4>游戏类型:第一人称射击游戏FPS</h4>
                    <br>
                    <h4>游戏大小:63G</h4>
                    <div style="padding-top: 35px;">
                        <form method="post" action="${ pageContext.request.contextPath }/game/buygame.action">
                            <input id="game_id" name="game_id" value="21" hidden>
                            <input id="game_name" name="game_name" value="使命召唤14" hidden>
                            <button class="layui-btn layui-btn-danger" onclick="buy_the_game();">立即购买</button>
                        </form>
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
                <p>&nbsp;&nbsp;&nbsp;&nbsp;在《使命召唤14：二战》当中，玩家需要去找医疗兵救治，弹药也是同样的道理。根据开发者的说法，如果你弹药用完，你只能指望队友能扔给你一些了。</p>
                <br>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;　多人模式方面，玩家会到达一些战役模式中没去过的地方，并且有机会扮演德军了。游戏有一个名为“战争模式”的游戏机制，玩家可以体验众多二战战役，
                    根据用户所选择的阵营不同（即“盟军”和“轴心国”），游戏玩法与游戏目标均不相同。</p>

            </div>
            <!--游戏介绍 end-->

            <!-- 配置要求 -->
            <div class="layui-tab-item">

                <!-- 最低配置-->
                <table class="layui-table " lay-skin="line">
                    <colgroup>
                        <col width="50">
                        <col width="200">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>最低配置</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>cpu</td>
                        <td>Intel Core i3 3225 3.3 GHz/AMD Ryzen 5 1400</td>
                    </tr>
                    <tr>
                        <td>显卡</td>
                        <td>NVIDIA GeForce GTX 660 2GB / GTX 1050 or ATI Radeon HD 7850 2GB</td>
                    </tr>
                    <tr>
                        <td>内存</td>
                        <td>8 GB RAM</td>
                    </tr>
                    <tr>
                        <td>硬盘</td>
                        <td>90 GB 可用空间</td>
                    </tr>
                    <tr>
                        <td>系统</td>
                        <td>Windows 7 64-bit</td>
                    </tr>
                    </tbody>
                </table>
                <!-- 最低配置 end -->
            </div>
            <!-- 配置要求 end-->

            <!-- 安装说明-->
            <div class="layui-tab-item">
                <ul class="layui-timeline">
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title">购买游戏</h3>
                            <p>
                                购买游戏后才能进行下载<i class="layui-icon"></i>
                            </p>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title">下载游戏</h3>
                            <p>下载游戏到指定的目录，硬盘上要留有足够的空间</p>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title">解压缩游戏文件</h3>
                            <p>
                                解压下载的安装包
                            </p>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title">
                                <h3 class="layui-timeline-title">开始游玩</h3>
                                <p>点击游戏开始图标就可以开始畅玩</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- 安装说明 end -->

            <!--常见问题-->
            <div class="layui-tab-item">
                <p>暂无</p>
                <hr class="layui-bg-blue">
            </div>
            <!--常见问题 end -->

        </div>
    </div>


</div>
<!-- 下半部分包裹 end-->

<script type="text/javascript" src="${ pageContext.request.contextPath }/layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>