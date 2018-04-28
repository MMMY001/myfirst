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
            <legend><h1 style="color: #FFB800;">彩虹6号:围攻</h1></legend>
            <div class="layui-field-box" style="position: relative;">
                <div style="float: left">
                    <img src="${pageContext.request.contextPath}/image/siege-1.jpg"
                         style="display: block;width: 150px; height: 200px;"/>
                </div>
                <div style="float: left;margin-left: 30px;">
                    <h4>制作发行:Ubisoft</h4>
                    <br>
                    <h4>游戏类型:第一人称射击游戏FPS</h4>
                    <br>
                    <h4>游戏大小:18.2G</h4>
                    <div style="padding-top: 35px;">
                        <form method="post" action="${ pageContext.request.contextPath }/game/buygame.action">
                            <input id="game_id" name="game_id" value="20" hidden>
                            <input id="game_name" name="game_name" value="彩虹6号:围攻" hidden>
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
                <p>&nbsp;&nbsp;&nbsp;&nbsp;《彩虹六号：围攻》是全新战术射击游戏《彩虹六号》系列的最新作品。
                    该作为原来的《彩虹六号：爱国者》改名而成，由育碧蒙特利尔工作室负责，使用自有的Realblast引擎，
                    引入非脚本化的环境可破坏特效，为游戏带来变化多端的进攻路线及防守策略。</p>
                <br>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;《彩虹六号：围攻》与经典警匪多人合作游戏《SWAT》如出一辙，玩家扮演警察或匪徒进行一场人性的考验，
                    情节异常紧张，每个举动都影响人质是否能安全被救出，看来育碧已经把“爱国者”的设定完全抛弃了，如果你喜欢SWAT，那么这款游戏就是你的最爱。</p>
                <br>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;游戏全程都有语音交流，非常注重团队合作以及指挥，不像COD那样的横冲直撞。游戏的画面不算是顶级，但是破坏效果很出彩。</p>
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
                        <td>Intel Core i5-2500K @ 3.3 GHz or AMD FX-8120 @ 2.6 GHz</td>
                    </tr>
                    <tr>
                        <td>显卡</td>
                        <td>Nvidia GeForce GTX 670或AMD Radeon HD7970 / R9 280x，或更高（2G显存）</td>
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
                        <td>Windows Vista SP2 / Windows 7 SP1 / Windows 8 / Windows 8.1 / Windows 10，64位</td>
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
                        <td>Intel Core i3 560 @ 3.3 GHz或AMD Phenom II X4 945 @ 2.6 GHz</td>
                    </tr>
                    <tr>
                        <td>显卡</td>
                        <td>Nvidia GeForce GTX 460 or AMD Radeon HD5770 (1GB显存)</td>
                    </tr>
                    <tr>
                        <td>内存</td>
                        <td>6 GB</td>
                    </tr>
                    <tr>
                        <td>硬盘</td>
                        <td>暂未公布</td>
                    </tr>
                    <tr>
                        <td>系统</td>
                        <td>Windows 7 SP1 / Windows 8 / Windows 8.1 / Windows 10，64位</td>
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