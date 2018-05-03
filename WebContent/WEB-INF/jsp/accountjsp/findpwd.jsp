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
<!-- 找回密码 -->
<div style="width: 500px;height: 600px; margin: auto;margin-top: 50px;">
    <div style="width: 100%;text-align: center;margin-top: 10px;">
        <h1>更改密码前请验证邮箱</h1>
    </div>
    <div style="width: 479px; height: 200px;margin: auto; margin-top: 30px; padding-top: 10px; border: 2px solid #9F9F9F;border-radius: 5px;">
        <form method="post" onsubmit="return false;" action="##">
            <div class="layui-form-item">
                <label class="layui-form-label">电子邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" name="user_email" id="user_email" required email lay-verify="required|email"
                           placeholder="请输入电子邮箱"
                           autocomplete="off" class="layui-input" <%--onblur="checkEmail();"--%>>
                </div>
            </div>

            <div>
                <label class="layui-form-label">验证码</label>
                <div class="layui-input-inline">
                    <input type="text" name="userInputCode" id="userInputCode"
                           placeholder="请输入邮箱验证码"
                           autocomplete="off" class="layui-input" <%--onblur="checkInputCode();"--%>>
                </div>
                <button class=" layui-btn layui-btn-xs" onclick="sendMail()">获取邮箱验证码</button>
            </div>
            <div  style="margin-left: 110px;margin-top: 30px;">
                <button class="layui-btn" type="submit" id="Pwdbtn" onclick="CheckCode()">验证邮箱</button>
            </div>
        </form>
    </div>
</div>
<!-- 找回密码 end -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cgPwd.js"></script>
<script>
    layui.use('layer',function () {
        var layer = layui.layer;
    });
    // 发送邮箱验证码
    function sendMail() {
        var uMail = document.getElementById("user_email").value;
        $.ajax({
            async: true // 设置成true，这标志着在请求开始后，其他代码依然能够执行。
            , url: "${pageContext.request.contextPath}/sendEMail"
            , type: "get"
            , datatype: "json"
            , data: {user_email: uMail}
            , success: function (data) {
                if (data == "OK") {
                    layer.msg("发送成功!");
                }

            }, error: function () {
                layer.msg("未知错误!");
            }
        });

    }

    function CheckCode() {
        var userInputCode = document.getElementById("userInputCode").value;
        $.ajax({
            sync: true // 设置成true，这标志着在请求开始后，其他代码依然能够执行。
            , url: "${pageContext.request.contextPath}/CheckMail"
            , type: "get"
            , datatype: "json"
            , date: {InputCode: userInputCode}
            , success: function (data) {
                if (data == "OK") {
                    layer_show('更新密码', '${ pageContext.request.contextPath }/ChangePwd.action', '500', '300');
                }
            }, error: function () {
                layer.msg('验证码错误哦', {icon: 5});
            }
        });
    }

</script>
</body>
</html>