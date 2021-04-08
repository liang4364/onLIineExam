<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/4/8
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>注册信息</title>
    <link href="static/css/register.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/md5.js"></script>
    <script type="text/javascript">
        $(function () {
            //获取正则表达式对象
            $('#register').click(function () {
                var usernameRegExp=/^1\d{9}$/;
                var userOk=usernameRegExp.test($('#username').val());
                if(userOk){
                    $('#testUsername').html("<span class='glyphicon glyphicon-ok'></span>");
                }else{
                    $('#testUsername').html("<span class='glyphicon glyphicon-remove'></span>");
                }

                var passwordRegExp=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{5,16}$/;
                var passwordOk=passwordRegExp.test($('#password').val());
                if(passwordOk){
                    $('#testPassword').html("<span class='glyphicon glyphicon-ok'></span>");
                }else{
                    $('#testPassword').html("<span class='glyphicon glyphicon-remove'></span>");
                }

                var emailRegExp=/[0-9a-zA-Z_.-]+[@][0-9a-zA-Z_.-]+([.][a-zA-Z]+){1,2}/;
                var emailOk=emailRegExp.test($('#userEmail').val());
                if(emailOk){
                    $('#testUserEmail').html("<span class='glyphicon glyphicon-ok'></span>");
                }else{
                    $('#testUserEmail').html("<span class='glyphicon glyphicon-remove'></span>");
                }

                var phoneRegExp=/^1\d{10}$/;
                var phonedOk=phoneRegExp.test($('#userPhone').val());
                if(phonedOk){
                    $('#testUserPhone').html("<span class='glyphicon glyphicon-ok'></span>");
                }else{
                    $('#testUserPhone').html("<span class='glyphicon glyphicon-remove'></span>");
                }
                var userRole = null;
                var role = document.getElementsByName("userRoleId");
                for (var i = 0; i < role.length; i++) { //遍历Radio
                    if (role[i].checked) {
                        userRole = role[i].value;
                    }
                }
                var json = {
                    "username": $("#username").val(),
                    "password": MD5($("#password").val()),
                    "userEmail": $('#userEmail').val(),
                    "userPhone": $('#userPhone').val(),
                    "userRoleId" : userRole
                };
                if(userOk && passwordOk && emailOk && phonedOk){
                    $.ajax({
                        data: JSON.stringify(json),
                        dataType: "json",
                        contentType: "application/json",
                        url: "auth/register",
                        success: function (res) {
                            if(res.code == "ok"){
                                window.location.href = "index";
                            }else {
                                $("#error").html("<div class=\"alert alert-danger alert-dismissable\">\n" +
                                    "\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\"\n" +
                                    "\t\t\taria-hidden=\"true\">\n" +
                                    "\t\t&times;\n" +
                                    "\t</button>\n" +
                                    "\t用户名信息输入错误！\n" +
                                    "</div>")
                            }
                        },
                        type: "post"
                    })
                }

            });
            $('#username').focus(function () {
                $('#testUsername').html('');
            })
            $('#password').focus(function () {
                $('#testPassword').html('');
            })
            $('#userEmail').focus(function () {
                $('#testUserEmail').html('');
            })
            $('#userPhone').focus(function () {
                $('#testUserPhone').html('');
            })
        })
    </script>
</head>
<body>
<body>
<div class="login_box">
    <div class="login_l_img"><img src="static/images/login-img.png"/></div>
    <div class="login">
        <div class="login_logo"><img src="static/images/login_logo.png"/></div>
        <div class="login_name">
            <p>用户信息注册</p>
        </div>
        <form action="auth/login" method="post" name="form">
            <div class="input-group input-group-lg">
                <div id="testUsername"></div><span class="input-group-addon">学号</span>
                <input type="text" id="username" class="form-control" placeholder="请输入学号...">
            </div>
            <br>
            <div class="input-group input-group-lg">
                <div id="testPassword"></div><span class="input-group-addon">密码</span>
                <input type="password" id="password" class="form-control" placeholder="请输入密码（包含数字和字母）...">
            </div>
            <br>
            <div class="input-group input-group-lg">
                <div id="testUserEmail"></div><span class="input-group-addon">邮箱</span>
                <input type="text" id="userEmail" class="form-control" placeholder="请输入邮箱...">
            </div>
            <br>
            &nbsp;&nbsp;<span style="font-size: 18px">角色</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="userRoleId" value="2" ><span style="font-size: 18px">学生</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="userRoleId" value="1"><span style="font-size: 18px">教师</span>
            <br>
            <br>
            <div class="input-group input-group-lg">
                <div id="testUserPhone"></div><span class="input-group-addon">手机</span>
                <input type="text" id="userPhone" class="form-control" placeholder="请输入手机号...">
            </div>
            <br>
            <button type="button" id="register" class="btn btn-primary btn-lg btn-block">注册</button>
            <div id="error"></div>
        </form>
    </div>
</div>
<div style="text-align:center;">
</div>
</body>
</body>
</html>
