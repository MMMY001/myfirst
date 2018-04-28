<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <style>
        html, body {
            margin: 0;
            padding: 0;
        }

        .formBox {
            width: 700px;
            height: auto;
            margin: auto;
            margin-top: 100px;
        }
    </style>

</head>
<body>
<div style="position:fixed; left:0px; top:0px; width:100%; height:100%;z-index: -1;">
    <img src="${pageContext.request.contextPath}/image/sysimg/registBg.jpg" style="height: 100%;width: 100%;"/>
</div>

<!-- 导航条 -->
<div>
    <ul class="layui-nav layui-bg-cyan" lay-filter="">
        <div><span class="layui-badge layui-bg-blue">天悦游戏商城</span></div>
        <div style="margin-left: 300px;text-align: right;">
            <li class="layui-nav-item"><a href="${ pageContext.request.contextPath }/Jumpindex.action">商城首页</a></li>
            <li class="layui-nav-item "><a href="#">个人中心</a></li>
            <li class="layui-nav-item "><a href="#">关于我们</a></li>
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


<div class="formBox">
    <fieldset class="layui-elem-field">
        <legend><h1 style="color: #FFB800;">会员注册</h1></legend>
        <div class="layui-field-box">
            <form class="layui-form" method="post" onsubmit="return false" id="form1"
                  action="##" novalidate="novalidate">
                <%--action="${ pageContext.request.contextPath }/user_regist.action"--%>

                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="user_name" id="user_name" required
                               lay-verify="required"
                               placeholder="请输入用户名"
                               autocomplete="off" class="layui-input" onblur="checkUname();">
                    </div>
                    <div class="layui-form-mid layui-word-aux" id="name_tip" style="font-color:red;"></div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码框</label>
                    <div class="layui-input-inline">
                        <input type="password" name="user_password" id="user_password" required lay-verify="required"
                               placeholder="请输入密码"
                               autocomplete="off" class="layui-input" onblur="checkPwd();">
                    </div>
                    <div class="layui-form-mid layui-word-aux" id="password_tip"></div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="confirm_password" id="confirm_password" required
                               lay-verify="required" placeholder="请确认密码"
                               autocomplete="off" class="layui-input" onblur="checkRepwd();">
                    </div>
                    <div class="layui-form-mid layui-word-aux" id="Repwd_tip"></div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电话号码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="user_tel" id="user_tel" required phone lay-verify="required|phone"
                               placeholder="请输入电话号码"
                               autocomplete="off" class="layui-input" onblur="checkTel();">
                    </div>
                    <div class="layui-form-mid layui-word-aux" id="tel_tip"></div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电子邮箱</label>
                    <div class="layui-input-inline">
                        <input type="text" name="user_email" id="user_email" required email lay-verify="required|email"
                               placeholder="请输入电子邮箱"
                               autocomplete="off" class="layui-input" onblur="checkEmail();">
                    </div>
                    <div class="layui-form-mid layui-word-aux" id="email_tip"></div>
                </div>

                <div>
                    <label class="layui-form-label">验证码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="userInputCode" id="userInputCode" required email lay-verify="required"
                               placeholder="请输入邮箱验证码"
                               autocomplete="off" class="layui-input" <%--onblur="checkInputCode();"--%>>
                    </div>
                    <button class=" layui-btn layui-btn-xs"  onclick="sendMail()">发送验证码</button>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="user_sex" value="男" title="男" checked>
                        <input type="radio" name="user_sex" value="女" title="女">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn layui-btn-warm " id="rstBtn" onclick="checkMsg()">注册
                        </button>
                        <%--lay-submit lay-filter="formMsg"--%>
                    </div>
                </div>
            </form>
        </div>
    </fieldset>

</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>

<script>
    layui.use(['form', 'element','layer'], function () {
        var form = layui.form
            , element = layui.element
            ,layer = layui.layer;


        /* //监听提交
         form.on('submit(formMsg)', function (data) {
             layer.msg(JSON.stringify(data.field));
             return false;
         });*/
    });

    // 验证用户名输入
    function checkUname() {
        var name = document.getElementById("user_name").value;
        var name_tip = document.getElementById("name_tip");
        var pattern = /^[a-zA-Z0-9_-]{4,10}$/;
        if (name == null || name == '') {
            name_tip.innerText = "用户名不能为空!"
            $("#rstBtn").attr("disabled", true); // 代表按钮不可用
        } else if (pattern.test(name)) {
            name_tip.innerText = "用户名可以使用!"
            $("#rstBtn").attr("disabled", false); // 代表按钮可用
        } else {
            name_tip.innerText = "用户名长度位4到10位,可用字母,数字，_，-!"
            $("#rstBtn").attr("disabled", true); // 代表按钮不可用
        }
    }

    // 验证密码输入
    function checkPwd() {
        var password = document.getElementById("user_password").value;
        var password_tip = document.getElementById("password_tip");
        var pattern = /^\w{6,12}$/;
        if (password == null || password == '') {
            password_tip.innerText = "密码不能为空!";
            $("#rstBtn").attr("disabled", true); // 代表按钮不可用
        } else if (pattern.test(password)) {
            password_tip.innerText = "密码可以使用!"
            $("#rstBtn").attr("disabled", false); // 代表按钮可用;
        } else {
            password_tip.innerText = "密码长度位6到12位!";
            $("#rstBtn").attr("disabled", true); // 代表按钮不可用
        }
    }

    // 验证确认密码
    function checkRepwd() {
        var password = document.getElementById("user_password").value;
        var repassword = document.getElementById("confirm_password").value;
        var Repwd_tip = document.getElementById("Repwd_tip");
        if (repassword == null || repassword == '') {
            Repwd_tip.innerText = "确认密码不能为空!";
            $("#rstBtn").attr("disabled", true); // 代表按钮不可用
        } else if (password != repassword) {
            Repwd_tip.innerText = "两次密码输入不一致!";
            $("#rstBtn").attr("disabled", true); // 代表按钮不可用
        } else {
            Repwd_tip.innerText = "输入正确!"
            $("#rstBtn").attr("disabled", false); // 代表按钮可用
        }
    }

    // 验证电话号码
    function checkTel() {
        var tel = document.getElementById("user_tel").value;
        var tel_tip = document.getElementById("tel_tip");
        var pattern = /^((13[0-9])|(14[5|7])|(15([0-9]))|(18[0,5-9])|(19[0-9]))\d{8}$/;
        ;
        if (tel == null || tel == '') {
            tel_tip.innerText = "电话号码不能为空!";
            $("#rstBtn").attr("disabled", true); // 代表按钮不可用
        } else if (pattern.test(tel)) {
            tel_tip.innerText = "电话号码可用!";
            $("#rstBtn").attr("disabled", false); // 代表按钮可用
        } else {
            tel_tip.innerText = "电话号码格式错误!";
            $("#rstBtn").attr("disabled", true); // 代表按钮不可用
        }
    }

    // 验证电子邮箱
    function checkEmail() {
        var email = document.getElementById("user_email").value;
        var email_tip = document.getElementById("email_tip");
        var pattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (email == null || email == '') {
            email_tip.innerText = "邮箱不能为空!";
            $("#rstBtn").attr("disabled", true); // 代表按钮不可用
        } else if (pattern.test(email)) {
            email_tip.innerText = "邮箱输入正确!";
            $("#rstBtn").attr("disabled", false);
        } else {
            email_tip.innerText = "邮箱格式错误!";
            $("#rstBtn").attr("disabled", true); // 代表按钮不可用
        }
    }

    // 发送邮箱验证码
    function sendMail() {
        var uMail = document.getElementById("user_email").value;
        $.ajax({
            async: true // 设置成true，这标志着在请求开始后，其他代码依然能够执行。
            , url: "${pageContext.request.contextPath}/sendEMail"
            , type: "get"
            , datatype: "json"
            , data: {user_email: uMail}
            ,success:function () {
                layer.msg("发送成功!");
            },error:function () {
                layer.msg("未知错误!");
            }
        });

    }


    // 注册
    function checkMsg() {
        $.ajax({
            cache: true // 保留缓存数据
            , async: true // 设置成true，这标志着在请求开始后，其他代码依然能够执行。
            , url: "${ pageContext.request.contextPath }/user_regist.action"
            , type: "POST"
            , data: $('#form1').serialize()
            , success: function (data) {
                if (data == "0") {
                    alert("请输入注册信息")
                } else if (data == "1") {
                    alert("用户名已存在!")
                } else {
                    alert("注册成功!");
                    window.location.href = "${ pageContext.request.contextPath }/login.action";
                }

            }, error: function () {
                alert("未知错误!")
            }
        });

    }


</script>
</body>
</html>