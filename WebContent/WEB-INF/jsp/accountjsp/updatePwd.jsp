<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body>
<!-- 修改密码 --> <%--action="${pageContext.request.contextPath}/changePwd.action"--%>
<form method="post" onsubmit="return false;" action="##">
    <div class="layui-form-item" style="padding-top: 30px;">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="user_name" id="user_name" required lay-verify="required"
                   placeholder="请输入..."
                   autocomplete="off" class="layui-input" onblur="checkPwd();">
        </div>
        <div class="layui-form-mid layui-word-aux" id="tip_0"></div>
    </div>
    <div class="layui-form-item" style="padding-top: 30px;">
        <label class="layui-form-label">密码框</label>
        <div class="layui-input-inline">
            <input type="password" name="user_password" id="user_password" required lay-verify="required"
                   placeholder="请输入..."
                   autocomplete="off" class="layui-input" onblur="checkPwd();">
        </div>
        <div class="layui-form-mid layui-word-aux" id="tip_1"></div>
    </div>
    <div class="layui-form-item" style="padding-top: 30px;">
        <label class="layui-form-label">确认密码框</label>
        <div class="layui-input-inline">
            <input type="password" name="repassword" id="repassword" required lay-verify="required" placeholder="请输入..."
                   autocomplete="off" class="layui-input" onblur="checkRepwd();">
        </div>
        <div class="layui-form-mid layui-word-aux" id="tip_2"></div>
    </div>
    <div class="layui-form-mid layui-word-aux" style="margin-left: 110px;">
        <button class="layui-btn" type="submit" id="Pwdbtn" onclick="ChPwd()">确认修改</button>
        <button class="layui-btn" type="reset">重置</button>
    </div>
</form>
<!-- 修改密码 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>


    // 验证用户名输入
    function checkPwd() {
        var name = document.getElementById("user_name").value;
        var tip_0 = document.getElementById("tip_0");

        if (name == null || name == '') {
            tip_0.innerText = "用户名不能为空!";
            $("#Pwdbtn").attr("disabled", true); // 代表按钮不可用
        } else{
            $("#Pwdbtn").attr("disabled", false); // 代表按钮可用
        }
    }

    // 验证密码输入
    function checkPwd() {
        var password = document.getElementById("user_password").value;
        var tip_1 = document.getElementById("tip_1");
        var pattern = /^\w{6,12}$/;
        if (password == null || password == '') {
            tip_1.innerText = "密码不能为空!";
            $("#Pwdbtn").attr("disabled", true); // 代表按钮不可用
        } else if (pattern.test(password)) {
            tip_1.innerText = "密码可以使用!";
            $("#Pwdbtn").attr("disabled", false); // 代表按钮可用
        } else {
            tip_1.innerText = "密码长度位6到12位!";
            $("#Pwdbtn").attr("disabled", true);
        }
    }

    // 验证确认密码
    function checkRepwd() {
        var password = document.getElementById("user_password").value;
        var repassword = document.getElementById("repassword").value;
        var tip_2 = document.getElementById("tip_2");
        if (repassword == null || repassword == '') {
            tip_2.innerText = "确认密码不能为空!";
            $("#Pwdbtn").attr("disabled", true);
        } else if (password != repassword) {
            tip_2.innerText = "两次密码输入不一致!";
            $("#Pwdbtn").attr("disabled", true);
        } else {
            tip_2.innerText = "输入正确!";
            $("#Pwdbtn").attr("disabled", false);
        }
    }

    function ChPwd() {
        var user_name = document.getElementById("user_name").value;
        var user_password = document.getElementById("user_password").value;
        $.ajax({
            cache: true // 保留缓存数据
            , async: true // 设置成true，这标志着在请求开始后，其他代码依然能够执行。如果把这个选项设置成false，这意味着所有的请求都不再是异步的了，这也会导致浏览器被锁死
            , type: "POST" // 方法类型
            // , dataType: "json"  // 返回值类型
            , url: "${pageContext.request.contextPath}/UpdatePwd.action"  // url
            , data: {user_name:user_name,user_password: user_password}
            , success: function (data) {
                if (data == "OK") {
                    alert("修改成功!");
                    // 关闭当前窗口
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                    // 父页面跳转到登陆界面
                    parent.location.href = "${pageContext.request.contextPath}/login.action";
                }
            },
            error: function () {
                alert('未知错误!');
            }
        });
    }
</script>
</body>
</html>