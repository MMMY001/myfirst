<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="Mycommons"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>后台管理</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet"
	type="text/css" />

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet"
	type="text/css" />

<!-- Custom CSS -->
<link href="<%=basePath%>css/sadmin-2.css" rel="stylesheet"
	type="text/css" />

<!-- Custom Fonts -->
<%-- <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css" type="text/css" /> --%>
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css" type="text/css" />
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
					<li><a href="${pageContext.request.contextPath }/goodsmanage.action" id="gmanage">商品管理</a></li>
				</ul>
			</div>
		</div>
		</nav>

		<div id="page-wrapper">
			<!-- 	<iframe src="customer/usermanage.jsp" frameborder="none" scrolling="auto" style="width: 100%; height: 100%;"></iframe> -->
			<!--  usernamage -->
			<div id="userManage">
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
							action="${pageContext.request.contextPath }/usermanage/list.action"
							method="get">
							<div class="form-group">
								<label for="user_name">用户名</label> <input type="text"
									class="form-control" id="user_name" value="${user_name }"
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
												onclick="deleteCustomer(${row.user_id})">删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-12 text-right">
								<itcast:page
									url="${pageContext.request.contextPath }/usermanage/list.action" />
							</div>
						</div>
					</div>
				</div>
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

	// 删除用户
		function deleteCustomer(id) {
			if(confirm('确实要删除该用户吗?')) {
				$.post("<%=basePath%>customer/delete.action",{"id":id},function(data){
					alert("用户删除更新成功！");
					window.location.reload();
				});
			}
		}
		

	</script>
</body>

</html>
