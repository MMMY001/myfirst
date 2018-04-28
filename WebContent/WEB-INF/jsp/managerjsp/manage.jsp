<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itcast" uri="Mycommons" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>后台管理</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"
          type="text/css"/>

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet"
          type="text/css"/>

    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet"
          type="text/css"/>

    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sadmin-2.css" rel="stylesheet"
          type="text/css"/>

    <!-- Custom Fonts -->
    <%-- <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
        type="text/css" type="text/css" /> --%>
    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
          type="text/css" type="text/css"/>
</head>

<body>

<div id="wrapper">
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand">后台管理系统</a>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <span>欢迎管理员登录</span>
            <li class="dropdown"><a
                    href="${pageContext.request.contextPath }/exit_logon.action"><i
                    class="fa fa-sign-out fa-fw"></i> 退出登录</a></li>
        </ul>

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li><a href="#" class="active" id="umanage">用户管理</a></li>
                    <li><a href="#" id="gmanage">商品管理</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="page-wrapper">
        <!-- 	<iframe src="customer/usermanage.jsp" frameborder="none" scrolling="auto" style="width: 100%; height: 100%;"></iframe> -->
        <!--  usernamage -->
        <div id="userManage" hidden="true">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">用户管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <form class="form-inline"
                          action="${pageContext.request.contextPath }/manage/list.action"
                          method="get">
                        <div class="form-group">
                            <label for="user_name">用户名</label> <input type="text"
                                                                      class="form-control" id="user_name"
                                                                      value="${user_name }"
                                                                      name="user_name">
                        </div>
                        <button type="submit" class="btn btn-primary">查询</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">用户信息列表</div>
                        <!-- /.panel-heading -->
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>用户ID</th>
                                <th>用户名称</th>
                                <th>真实姓名</th>
                                <th>联系电话</th>
                                <th>联系邮箱</th>
                                <th>用户性别</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.rows}" var="row">
                                <tr>
                                    <td>${row.user_id}</td>
                                    <td>${row.user_name}</td>
                                    <td>${row.real_name}</td>
                                    <td>${row.user_tel}</td>
                                    <td>${row.user_email}</td>
                                    <td>${row.user_sex}</td>
                                    <td style="text-align: center;"><a href="#"
                                                                       class="btn btn-danger btn-xs"
                                                                       onclick="deleteCustomer(${row.user_id})">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="col-md-12 text-right">
                            <itcast:page
                                    url="${pageContext.request.contextPath }/manage/list.action"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- goodsmanage -->
        <div id="goodsManage" hidden="true">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">商品管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <form class="form-inline"
                          action="${pageContext.request.contextPath }/manage/gamemanage.action"
                          method="get">
                        <%-- <div class="form-group">
                            <label for="game_name">游戏名</label> <input type="text"
                                class="form-control" id="game_name" value="${game_name }"
                                name="game_name">
                        </div> --%>
                        <button type="submit" class="btn btn-primary" style="float: left"
                                id="gmanage">查看游戏
                        </button>
                    </form>
                    <button type="submit" class="btn btn-primary" data-toggle="modal"
                            data-target="#addGameLog" style="float: right">添加游戏
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">用户信息列表</div>
                        <!-- /.panel-heading -->
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>游戏ID</th>
                                <th>游戏名称</th>
                                <th>游戏价格</th>
                                <th>游戏介绍</th>
                                <th>销售数量</th>
                                <th>游戏类别</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page1.rows}" var="row">
                                <tr>
                                    <td>${row.game_id}</td>
                                    <td>${row.game_name}</td>
                                    <td>${row.game_price}</td>
                                    <td>${row.game_present}</td>
                                    <td>${row.g_saleCount}</td>
                                    <td>${row.sorName}</td>
                                    <td style="text-align: center;"><a href="#"
                                                                       class="btn btn-primary btn-xs"
                                                                       data-toggle="modal"
                                                                       data-target="#gamesEditDialog"
                                                                       onclick="editGames(${row.game_id})">修改</a> <a
                                            href="#"
                                            class="btn btn-danger btn-xs"
                                            onclick="deletegaeme(${row.game_id})">删除</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="col-md-12 text-right">
                            <itcast:page
                                    url="${pageContext.request.contextPath }/manage/gamemanage.action"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</div>

<!-- 修改游戏 -->
<div class="modal fade" id="gamesEditDialog" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改游戏信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_game_form">
                    <input type="hidden" id="edit_game_id" name="game_id"/>
                    <div class="form-group">
                        <label for="edit_game_name" class="col-sm-2 control-label">游戏名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_game_name"
                                   placeholder="游戏名称" name="game_name">
                        </div>
                    </div>
                    <%-- <div class="form-group">
                        <label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_custLevel" name="cust_level">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div> --%>
                    <div class="form-group">
                        <label for="edit_game_price" class="col-sm-2 control-label">游戏价格</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_game_price"
                                   placeholder="游戏价格" name="game_price">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_game_present" class="col-sm-2 control-label">游戏介绍</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_game_present"
                                   placeholder="游戏介绍" name="game_present">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_sorName" class="col-sm-2 control-label">游戏类别</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_sorName"
                                   placeholder="销售数量" name="sorName">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary"
                        onclick="updateGame()">保存修改
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 添加游戏  -->
<div class="modal fade" id="addGameLog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加游戏</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_game_form">
                    <div class="form-group">
                        <label for="add_game_name" class="col-sm-2 control-label">游戏名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_game_name"
                                   placeholder="游戏名称" name="game_name">
                        </div>
                    </div>
                    <%-- <div class="form-group">
                        <label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">游戏类别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_custLevel" name="cust_level">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div> --%>
                    <div class="form-group">
                        <label for="add_game_price" class="col-sm-2 control-label">游戏价格</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_game_price"
                                   placeholder="游戏价格" name="game_price">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_game_present" class="col-sm-2 control-label">游戏介绍</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_game_present"
                                   placeholder="游戏介绍" name="game_present">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_sorName" class="col-sm-2 control-label">游戏类型</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_sorName"
                                   placeholder="游戏类型" name="sorName">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addGame()">添加</button>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="<%=basePath%>js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/admin-2.js"></script>
<script type="text/javascript">
    // 查询要修改的条件
    function editGames(id) {
        $.ajax({
            type: "get",
            url: "<%=basePath%>game/edit.action",
            data: {"id": id},
            success: function (data) {
                $("#edit_game_id").val(data.game_id);
                $("#edit_game_name").val(data.game_name);
                $("#edit_game_price").val(data.game_price);
                $("#edit_game_present").val(data.game_present);
                $("#edit_sorName").val(data.sorName);

            }
        });
    }

    <%-- 	// 要添加的信息
        function editGames(id) {
            $.ajax({
                type:"get",
                url:"<%=basePath%>game/edit.action",
                data:{"id":id},
                success:function(data) {
                    $("#edit_game_name").val(data.game_name);
                    $("#edit_game_price").val(data.game_price);
                    $("#edit_game_present").val(data.game_present);
                    $("#edit_g_saleCount").val(data.g_saleCount);

                }
            });
        } --%>

    // 添加游戏
    function addGame() {
        $.post("<%=basePath%>game/add.action", $("#add_game_form").serialize(), function (data) {
            alert("添加游戏成功！");
            window.location.reload();
        });
    }

    // 修改游戏
    function updateGame() {
        $.post("<%=basePath%>game/update.action", $("#edit_game_form").serialize(), function (data) {
            alert("游戏信息更新成功！");
            window.location.reload();
        });
    }


    // 删除游戏
    function deletegaeme(id) {
        if (confirm('确实要删除该游戏吗?')) {
            $.post("<%=basePath%>game/delete.action", {"id": id}, function (data) {
                alert("游戏删除更新成功！");
                window.location.reload();
            });
        }
    }

    // 删除用户
    function deleteCustomer(id) {
        if (confirm('确实要删除该用户吗?')) {
            $.post("<%=basePath%>customer/delete.action", {"id": id}, function (data) {
                alert("用户删除更新成功！");
                window.location.reload();
            });
        }
    }


    // 用户管理和商品管理面板跟新
    $(document).ready(function () {

        $("#umanage").click(function () {
            /* alert("there is usermanage"); */
            $("#userManage").show();
            $("#goodsManage").hide();
        });
        $("#gmanage").click(function () {
            $("#userManage").hide();
            $("#goodsManage").show();
        });
    });
</script>
</body>

</html>
