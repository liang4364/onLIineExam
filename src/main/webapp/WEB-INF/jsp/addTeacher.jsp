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
    <title>教师注册</title>
    <link href="static/css/register.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/md5.js"></script>
    <script type="text/javascript">
        $(function () {
            $("body").keydown(function (event) {
                if (event.keyCode == 13) {
                    $("#register").click();
                }
            });
            //获取正则表达式对象
            $('#register').click(function () {
                var userNumRegExp=/^1\d{9}$/;
                var userNumOk=userNumRegExp.test($('#userNum').val());
                if(userNumOk){
                    $('#testUserNum').html("<span class='glyphicon glyphicon-ok'></span>");
                }else{
                    $('#testUserNum').html("<span class='glyphicon glyphicon-remove'></span>");
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
                var json = {
                    "username":$("#username").val(),
                    "userNum": $("#userNum").val(),
                    "password": MD5($("#password").val()),
                    "userEmail": $('#userEmail').val(),
                    "userPhone": $('#userPhone').val(),
                    "userRoleId" : 1,
                    "userLock":1
                };
                if(userNumOk && passwordOk && emailOk && phonedOk){
                    $.ajax({
                        data: JSON.stringify(json),
                        dataType: "json",
                        contentType: "application/json",
                        url: "auth/register",
                        success: function (res) {
                            if(res.code == "ok"){
                                window.close();
                                window.location.href = "teacherManage"
                            }else if(res.code="exist_user_info"){
                                $("#error").html("<div class=\"alert alert-danger alert-dismissable\">\n" +
                                    "\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\"\n" +
                                    "\t\t\taria-hidden=\"true\">\n" +
                                    "\t\t&times;\n" +
                                    "\t</button>\n" +
                                    "\t用户名信息已存在，请重新输入！\n" +
                                    "</div>");
                            }
                        },
                        type: "post"
                    })
                }else {
                    $("#error").html("<div class=\"alert alert-danger alert-dismissable\">\n" +
                        "\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\"\n" +
                        "\t\t\taria-hidden=\"true\">\n" +
                        "\t\t&times;\n" +
                        "\t</button>\n" +
                        "\t用户名信息输入错误！\n" +
                        "</div>");
                }
            });
            $('#userNum').focus(function () {
                $('#testUserNum').html('');
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
<div class="login_box div">
    <div class="login">
        <div class="login_logo"><img src="static/images/login_logo.png"/></div>
        <div class="login_name">
            <p>用户信息注册</p>
        </div>
        <form action="auth/login" method="post" name="form">
            <div class="input-group input-group-lg">
                <span class="input-group-addon">用户名</span>
                <input type="text" id="username" class="form-control" placeholder="请输入用户名...">
            </div>
            <br>
            <div class="input-group input-group-lg">
                <div id="testUserNum"></div><span class="input-group-addon">工号</span>
                <input type="text" id="userNum" class="form-control" placeholder="请输入工号...">
            </div>
            <br>
            <div class="input-group input-group-lg">
                <div id="testUserEmail"></div><span class="input-group-addon">邮箱</span>
                <input type="text" id="userEmail" class="form-control" placeholder="请输入邮箱...">
            </div>
            <br>
            <div class="input-group input-group-lg">
                <div id="testUserPhone"></div><span class="input-group-addon">手机</span>
                <input type="text" id="userPhone" class="form-control" placeholder="请输入手机号...">
            </div>
            <br>
            <div class="input-group input-group-lg">
                <div id="testPassword"></div><span class="input-group-addon">密码</span>
                <input type="password" id="password" class="form-control" placeholder="请输入密码（包含数字和字母）...">
            </div>
            <br>
            <button type="reset"  class="btn btn-primary btn-lg btn-block">清空</button>
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

