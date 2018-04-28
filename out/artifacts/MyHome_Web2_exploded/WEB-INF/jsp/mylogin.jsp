<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        .loginBox {
            width: 500px;
            height: 300px;
            margin: auto;
            margin-top: 200px;
            padding-top: 10px;
            border: 2px solid #9F9F9F;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<!-- 导航条 -->
<div>
    <ul class="layui-nav layui-bg-cyan" lay-filter="">
        <div><span class="layui-badge layui-bg-blue">天悦游戏商城</span></div>
        <div style="margin-left: 300px;text-align: right;">
            <li class="layui-nav-item"><a href="${ pageContext.request.contextPath }/Jumpindex.action">商城首页</a></li>
            <li class="layui-nav-item "><a href="##">个人中心</a></li>
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
<!-- 导航条 -->

<!-- 登录框包裹 -->
<div class="loginBox">
    <!-- 登录框标题 -->
    <span><h3 style="text-align: center;">会员登录<i class="layui-icon" style="color: #66009D;">&#xe735;</i></h3></span>
    <!-- 登录框标题 -->

    <!-- 登录框表单 -->
    <form id="loginForm" novalidate="novalidate"
          class="layui-form" method="post" onsubmit="return false;" action="##">
        <%--action="${ pageContext.request.contextPath }/user_login.action"--%>
        <!-- 登录框用户名 -->
        <div class="layui-form-item" style="margin-top: 30px;">
            <label class="layui-form-label">用户名:</label>
            <div class="layui-input-inline">
                <input type="text" id="user_name" name="user_name" required lay-verify="required" placeholder="请输入用户名"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux" id="tip_1"></div>
        </div>
        <!-- 登录框用户名 -->

        <!-- 登录框密码 -->
        <div class="layui-form-item">
            <label class="layui-form-label">密&nbsp;&nbsp;码:</label>
            <div class="layui-input-inline">
                <input type="password" id="user_password" name="user_password" required lay-verify="required"
                       placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux" id="tip_2"></div>
        </div>
        <!-- 登录框密码 -->

        <!-- 登录框验证码 -->
        <div class="layui-form-item">
            <label class="layui-form-label">验证码:</label>
            <div class="layui-input-inline">
                <input type="text" id="user_input_verifyCode"
                       name="user_input_verifyCode" required lay-verify="required" placeholder="请输入验证码"
                       autocomplete="off" class="layui-input">
            </div>
            <span class="code_img"> <img
                    src="${pageContext.request.contextPath }/getVerifyCode.action"
                    width="110px" height="40px" id="verifyCodeImage">
                        </span>
            <span> <a id="changeVerifImageRegister" style="cursor: pointer;"
                      onclick="javascript:changeImage();">换一张</a>
                        </span>
        </div>
        <!-- 登录框验证码 -->

        <!-- 操作按钮 -->
        <div style="margin-left: 110px;margin-top: 20px;">
            <button type="submit" class="layui-btn layui-btn-warm " id="login_btn" onclick="checkUser()">登录</button>
            <a class="layui-btn  layui-btn-warm" style="margin-left: 60px"
               href="${ pageContext.request.contextPath }/user_registPage.action">注册</a>
        </div>
        <!-- 操作按钮 -->
    </form>
    <!-- 登录框表单 -->
</div>
<!-- 登录框包裹 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;

        //…
    });
</script>
<script type="text/javascript">

    function genTimestamp() {
        var time = new Date();
        return time.getTime();
    }

    function changeImage() {
        $('#verifyCodeImage').attr('src',
            '${pageContext.request.contextPath }/getVerifyCode.action?timestamp=' + genTimestamp());
    }

    function checkUser() {
        var user_name = document.getElementById("user_name").value;
        var user_password = document.getElementById("user_password").value;
        var input_verifyCode = document.getElementById("user_input_verifyCode").value;

        $.ajax({
            cache: true // 保留缓存数据
            , async: true
            , type: "POST" // 方法类型
            // , dataType: "json"  // 返回值类型
            , url: "${ pageContext.request.contextPath }/user_login.action"  // url
            , data: {
                user_name: user_name,
                user_password: user_password,
                user_input_verifyCode: input_verifyCode,
            }
            , success: function (data) {
                if (data == "1") {
                    alert("登陆成功!");
                    window.location.href = "${ pageContext.request.contextPath }/Jumpindex.action";
                } else if (data == "2") {
                    window.location.href = "${ pageContext.request.contextPath }/usermanage.action";
                } else if (data == "3") {
                    alert("账号或密码错误!")
                    window.location.reload();
                } else {
                    alert("验证码错误!")
                    window.location.reload();
                }

            },
            error: function () {
                alert("未知错误")
                window.location.reload();
            }
        });
    }


</script>
</body>
</html>