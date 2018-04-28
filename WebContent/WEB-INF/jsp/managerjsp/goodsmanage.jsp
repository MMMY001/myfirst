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
                    <li><a href="${pageContext.request.contextPath }/usermanage.action" id="umanage">用户管理</a></li>
                    <li><a href="#" class="active" id="gmanage">商品管理</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="page-wrapper">
        <!-- goodsmanage -->
        <div id="goodsManage">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">商品管理</h1>
                </div>

            </div>

            <div class="panel panel-default">
                <div class="panel-body">
                    <form class="form-inline"
                          action="${pageContext.request.contextPath }/goodsmanage/gamemanage.action"
                          method="get">

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
                        <div class="panel-heading">游戏信息列表</div>

                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>游戏ID</th>
                                <th>游戏名称</th>
                                <th>游戏价格</th>
                                <th>游戏介绍</th>
                                <th>销售数量</th>
                                <th>游戏类别</th>
                                <th>游戏链接</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.rows}" var="row">
                                <tr>
                                    <td>${row.game_id}</td>
                                    <td>${row.game_name}</td>
                                    <td>${row.game_price}</td>
                                    <td>${row.game_present}</td>
                                    <td>${row.g_saleCount}</td>
                                    <td>${row.sorName}</td>
                                    <td>${row.game_url}</td>
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
                                    url="${pageContext.request.contextPath }/goodsmanage/gamemanage.action"/>
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
                            <select class="form-control" id="edit_sorName" name="sorName">
                                <option value="">--请选择--</option>
                                <option value="角色扮演PRG">角色扮演PRG</option>
                                <option value="体育竞技SPG">体育竞技SPG</option>
                                <option value="策略战棋SLG">策略战棋SLG</option>
                                <option value="模拟经营SIM">模拟经营SIM</option>
                                <option value="第一人称射击游戏FPS">第一人称射击游戏FPS</option>
                                <option value="动作游戏ACT">动作游戏ACT</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_game_url" class="col-sm-2 control-label">游戏链接</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_game_url"
                                   placeholder="游戏链接" name="game_url">
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
     aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">添加游戏</h4>
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
                            <select class="form-control" id="add_sorName" name="sorName">
                                <option value="">--请选择--</option>
                                <option value="角色扮演PRG">角色扮演PRG</option>
                                <option value="体育竞技SPG">体育竞技SPG</option>
                                <option value="策略战棋SLG">策略战棋SLG</option>
                                <option value="模拟经营SIM">模拟经营SIM</option>
                                <option value="第一人称射击游戏FPS">第一人称射击游戏FPS</option>
                                <option value="动作游戏ACT">动作游戏ACT</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_game_url" class="col-sm-2 control-label">游戏链接</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_game_url"
                                   placeholder="游戏链接" name="game_url">
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
            url: " <%=basePath%>game/edit.action ",
            data: {"id": id},
            success: function (data) {
                $("#edit_game_id").val(data.game_id);
                $("#edit_game_name").val(data.game_name);
                $("#edit_game_price").val(data.game_price);
                $("#edit_game_present").val(data.game_present);
                $("#edit_sorName").val(data.sorName);
                $("#edit_game_url").val(data.game_url);
            }
        });
    }


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


</script>
</body>

</html>
