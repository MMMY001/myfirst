<!-- 注册验证  -->

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
        $("#rstBtn").attr("disabled", false); // 代表按钮可用
    } else {
        email_tip.innerText = "邮箱格式错误!";
        $("#rstBtn").attr("disabled", true); // 代表按钮不可用
    }
}