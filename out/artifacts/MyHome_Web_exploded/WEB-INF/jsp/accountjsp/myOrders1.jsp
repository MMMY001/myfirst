<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itcast" uri="Mycommons" %>
<%
    Object user_name = request.getSession().getAttribute("user_name");
    session.setAttribute("page_id", 002);
    Object page_id = request.getSession().getAttribute("page_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <!-- DataTables CSS -->
    <link href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
          rel="stylesheet" type="text/css"/>
    <%--<!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/css/metisMenu.min.css" rel="stylesheet"
          type="text/css"/>--%>

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
                    <a class="" href="${ pageContext.request.contextPath }/accoutindex.action" style="text-decoration: none">个人中心首页</a>
                </li>
                <li class="layui-nav-item layui-this"><a href="${ pageContext.request.contextPath }/myOrders.action" style="text-decoration: none">我的订单</a>
                </li>
                <li class="layui-nav-item"><a href="${ pageContext.request.contextPath }/myGames.action" style="text-decoration: none">我的游戏</a></li>
                <li class="layui-nav-item "><a href="${ pageContext.request.contextPath }/myRecharge.action" style="text-decoration: none">充值中心</a>
                </li>
                <li class="layui-nav-item"><a href="${ pageContext.request.contextPath }/mySafety.action" style="text-decoration: none">安全中心</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <blockquote class="layui-elem-quote layui-bg-white">
            <div id="nowTime"></div>
        </blockquote>

  <%--      <table id="orders" lay-filter="test" style="width: 100%;"></table>--%>

          <div style="margin-top: 30px;margin-left: 50px;">
              <form class="form-inline"
                    action="${pageContext.request.contextPath }/viewOrder.action"
                    method="get">
                  <button type="submit" class="layui-btn layui-btn-warm"
                          id="viewOrder">查看订单
                  </button>
              </form>
          </div>
          <div class="row" style="margin-top: 20px;">
              <div class="col-lg-12">
                  <div class="panel panel-default">
                      <!-- /.panel-heading -->
                      <table class="layui-table">
                          <thead>
                          <tr>
                              <th>订单ID</th>
                              <th>流水号</th>
                              <th>购买时间</th>
                              <th>游戏名称</th>
                              <th>购买价格</th>
                              <th>付款状态</th>
                              <!-- <th>操作</th> -->
                          </tr>
                          </thead>
                          <tbody>
                          <c:forEach items="${page.rows}" var="row">
                              <tr>
                                  <td>${row.order_id}</td>
                                  <td>${row.order_no}</td>
                                  <td>${row.order_time}</td>
                                  <td>${row.game_name}</td>
                                  <td>${row.game_price}</td>
                                  <td>${row.order_payment}</td>
                                      <%-- <td style="text-align: center;"><a href="#"
                                          class="btn btn-primary btn-xs" data-toggle="modal"
                                          data-target="#gamesEditDialog"
                                          onclick="editGames(${row.game_id})">付款</a> <a href="#"
                                          class="btn btn-danger btn-xs"
                                          onclick="deletegaeme(${row.game_id})">删除</a></td> --%>
                              </tr>
                          </c:forEach>
                          </tbody>
                      </table>
                  </div>
                  <div class="col-md-12 text-right">
                      <itcast:page
                              url="${pageContext.request.contextPath }/viewOrder.action"/>
                  </div>
              </div>
          </div>
    </div>


    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 天悦在线游戏商城 ----订单中心
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/nowtime.js"></script>

<script>
    //JavaScript代码区域
    layui.use(['element', 'table'], function () {
        var element = layui.element
            , table = layui.table;

        /*table.render({
            elem: '#orders' // 指定原始表格元素选择器（推荐id选择器）
            , height: 315 // 容器高度
            ,url: '${pageContext.request.contextPath }/viewOrder.action' // 数据接口
            ,page: true // 开启分页
            , cols: [[ // 设置表头
                {field: 'order_id', title: '订单ID', width: '15%'}
                , {field: 'order_no', title: '流水号', width:'17%'}
                , {field: 'order_time', title: '购买时间', width: '17%'}
                , {field: 'game_name', title: '游戏名称', width: '17%'}
                , {field: 'game_price', title: '购买价格', width: '17%'}
                , {field: 'order_payment', title: '付款状态', width: '17%'}
            ]]

        });*/
    });
</script>
</body>
</html>