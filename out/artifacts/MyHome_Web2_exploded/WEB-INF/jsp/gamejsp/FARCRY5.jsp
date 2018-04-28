<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/4/18
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
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
            <legend><h1 style="color: #FFB800;">孤岛惊魂5</h1></legend>
            <div class="layui-field-box" style="position: relative;">
                <div style="float: left">
                    <img src="${pageContext.request.contextPath }/image/FARCRY5-1.jpg"
                         style="display: block;width: 150px; height: 200px;"/>
                </div>
                <div style="float: left;margin-left: 30px;">
                    <h4>制作发行：Ubisoft</h4>
                    <br>
                    <h4>游戏类型:第一人称射击FPS</h4>
                    <br>
                    <h4>游戏大小:39.3G</h4>
                    <div style="padding-top: 35px;">
                        <form method="post" action="${ pageContext.request.contextPath }/game/buygame.action">
                            <input id="game_id" name="game_id" value="19" hidden>
                            <input id="game_name" name="game_name" value="孤岛惊魂5" hidden>
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
                <p>&nbsp;&nbsp;&nbsp;&nbsp;广得奖项的《Far Cry》系列最新作品，现在来到了美国。<br>
                    &nbsp;&nbsp;&nbsp;&nbsp; 欢迎来到蒙大拿州希望郡，一个充满自由与勇士的土地，同时也是名为“伊甸之门”著名毁灭日邪教的所在地。
                    挺身对抗邪教领袖约瑟夫．席德、他的兄弟与使者，藉此燃起反抗的烽火并解放受陷的人民。
                    <br>
                    <br>
                <span style="font-size: 15px;font-weight: bold;">对抗致命的邪教</span>
                <br>
                藉由单人或双人合作来解放希望郡。招募任凭雇佣的军火爪牙来协助对抗邪教。
                <br>
                <br>
                <span style="font-size: 15px;font-weight: bold;">刻划出自己的道路</span>
                <br>
                建构自己的角色并在系列史上客制化幅度最大的《Far Cry》游戏中选择自己的冒险方式！
                <br>
                <br>
                <span style="font-size: 15px;font-weight: bold;">横冲直撞的玩物</span>
                <br>
                控制标志性的肌肉车、全地形车、飞机以及更多载具来在史诗般的战斗中与邪教交战。
                </p>
            </div>
            <!--游戏介绍 end-->

            <!-- 配置要求 -->
            <div class="layui-tab-item">


                <!-- 推荐配置-->
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
                        <td>Intel Core i7-4770 @ 3.4 GHz或AMD Ryzen 5 1600 @ 3.2 GHz或更高</td>
                    </tr>
                    <tr>
                        <td>显卡</td>
                        <td>NVIDIA GeForce GTX 970或AMD R9 290X (4GB显存，支持Shader Model 5.0或更佳)</td>
                    </tr>
                    <tr>
                        <td>内存</td>
                        <td>8 GB</td>
                    </tr>
                    <tr>
                        <td>硬盘</td>
                        <td>暂未公布</td>
                    </tr>
                    <tr>
                        <td>系统</td>
                        <td>Windows 7 SP1, Windows 8.1, Windows 10 (仅64位版)</td>
                    </tr>
                    </tbody>
                </table>
                <!-- 推荐配置 end -->

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
                        <td>Intel Core i5-2400 @ 3.1 GHz or AMD FX-6300 @ 3.5 GHz或更高</td>
                    </tr>
                    <tr>
                        <td>显卡</td>
                        <td>NVIDIA GeForce GTX 670或AMD R9 270 (2GB显存，支持Shader Model 5.0或更佳)</td>
                    </tr>
                    <tr>
                        <td>内存</td>
                        <td>8 GB</td>
                    </tr>
                    <tr>
                        <td>硬盘</td>
                        <td>暂未公布</td>
                    </tr>
                    <tr>
                        <td>系统</td>
                        <td>Windows 7 SP1, Windows 8.1, Windows 10 (仅64位版)</td>
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

<script type="text/javascript" src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>
