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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
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
                    <a href=""><i class="layui-icon"
                                  style="font-size: 20px; color: #ffff00;">&#xe658;</i> <%=user_name%>
                    </a>
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
            <legend><h1 style="color: #FFB800;">侠盗猎车5</h1></legend>
            <div class="layui-field-box" style="position: relative;">
                <div style="float: left">
                    <img src="${pageContext.request.contextPath}/image/gta-1.jpg"
                         style="display: block;width: 150px; height: 200px;"/>
                </div>
                <div style="float: left;margin-left: 30px;">
                    <h4>制作发行:Rockstar Games</h4>
                    <br>
                    <h4>游戏类型:动作游戏ACT</h4>
                    <br>
                    <h4>游戏大小:58.8G</h4>
                    <div style="padding-top: 35px;">
                        <form method="post" action="${ pageContext.request.contextPath }/game/buygame.action">
                            <input id="game_id" name="game_id" value="30" hidden>
                            <input id="game_name" name="game_name" value="侠盗猎车5" hidden>
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
                <p>&nbsp;&nbsp;&nbsp;&nbsp;《侠盗猎车5》（英文简称：GTA5）是《侠盗猎车手》系列中的第五部，是一款动作冒险类视频开放式游戏，由Rockstar North制作，
                    Rockstar Games发行。《GTA5》预计将在2013年9月17日登陆Xbox360和PS3平台，目前已经可以在亚马逊上进行预购。游戏采用新版雷霆引擎（RAGE引擎），
                    游戏故事发生以美国洛杉矶及其周边地区为原型的城市Los Santos，是现实地区中的洛杉矶和南加州。
                    制作单位拍摄了超过25万张相关照片，并且研究了人口调查和汽车销售数据，以建立游戏中的世界。</p>
                <br>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;最重要的是这次作品是有史以来最具活力的和最多元化的开放式世界，Grand Theft Auto V
                    融合了以新的方式讲故事和游戏性作为玩家可以反复进入三个角色的生活，玩交织在一起的所有内容的故事</p>

            </div>
            <!--游戏介绍 end-->

            <!-- 配置要求 -->
            <div class="layui-tab-item">
                <!-- 推荐配置 -->
                <table class="layui-table " lay-skin="line">
                    <colgroup>
                        <col width="50">
                        <col width="200">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>推荐配置</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>cpu</td>
                        <td>Intel Core i5 3470 @ 3.2GHZ (4 CPUs) / AMD X8 FX-8350 @ 4GHZ (8 CPUs)</td>
                    </tr>
                    <tr>
                        <td>显卡</td>
                        <td>NVIDIA GTX 660 2GB / AMD HD7870 2GB</td>
                    </tr>
                    <tr>
                        <td>内存</td>
                        <td>8G</td>
                    </tr>
                    <tr>
                        <td>硬盘</td>
                        <td>65G</td>
                    </tr>
                    <tr>
                        <td>系统</td>
                        <td>Windows 7/8/8/10(64位)</td>
                    </tr>
                    </tbody>
                </table>
                <!-- 推荐配置 end-->

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
                        <td>Intel Core 2 Quad CPU Q6600 @ 2.40GHz (4 CPUs) / AMD Phenom 9850 Quad-Core Processor (4
                            CPUs) @ 2.5GHz
                        </td>
                    </tr>
                    <tr>
                        <td>显卡</td>
                        <td>NVIDIA 9800 GT 1GB / AMD HD 4870 1GB (DX 10, 10.1, 11)</td>
                    </tr>
                    <tr>
                        <td>内存</td>
                        <td>4G</td>
                    </tr>
                    <tr>
                        <td>硬盘</td>
                        <td>65G</td>
                    </tr>
                    <tr>
                        <td>系统</td>
                        <td>Windows Vista/7/8/8.1/10(64位)</td>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>