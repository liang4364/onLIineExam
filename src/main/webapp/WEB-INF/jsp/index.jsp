<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/3/19
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>在线考试系统</title>
    <link href="static/css/login.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <script type="text/javascript" src="static/js/md5.js"></script>
    <script type="text/javascript">
        $(function () {
            $("body").keydown(function (event) {
                if (event.keyCode == 13) {
                    $("#login").click();
                }
            });
            $("#password").focus(function () {
                $("#error").html("");
            });
            $("#login").click(function () {
                var md5password = MD5($("#password").val());
                var json = {
                    "username": $("#username").val(),
                    "password": md5password
                };
                $.ajax({
                    data: JSON.stringify(json),
                    dataType: "json",
                    contentType: "application/json",
                    url: "auth/login",
                    success: function (res) {
                        if (res.code == "Invalid_username_pwd") {
                            $("#error").html("<div class=\"alert alert-danger alert-dismissable\">\n" +
                                "\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\"\n" +
                                "\t\t\taria-hidden=\"true\">\n" +
                                "\t\t&times;\n" +
                                "\t</button>\n" +
                                "\t用户名或密码输入错误！\n" +
                                "</div>")
                        } else {
                            let dataRes = res.data;
                            $.cookie('Authorization', ''+dataRes.token+'', {expires: 10, path: '/'});
                            if(dataRes.roleId == 2){
                                window.location.href = "list?username="+$("#username").val();
                            }else if(dataRes.roleId == 1){
                                window.location.href = "teacherList?username="+$("#username").val();
                            }
                            else if(dataRes.roleId == 0){
                                window.location.href = "adminList?username="+$("#username").val();
                            }

                        }
                    },
                    type: "post"
                })
            });
            $('#register').click(function () {
                window.location.href = "stuRegister";
            })
        })
    </script>
</head>
<body>
<div class="login_box">
    <div class="login_l_img"><img src="static/images/login-img.png"/></div>
    <div class="login">
        <div class="login_logo"><img src="static/images/login_logo.png"/></div>
        <div class="login_name">
            <p>计算机考试平台</p>
        </div>
        <form action="auth/login" method="post" name="form">
            <div class="input-group input-group-lg">
                <span class="input-group-addon">学号</span>
                <input type="text" id="username" class="form-control" placeholder="请输入学号...">
            </div>
            <br>
            <div class="input-group input-group-lg">
                <span class="input-group-addon">密码</span>
                <input type="password" id="password" class="form-control" placeholder="请输入密码...">
            </div>
            <br>
            <p>
                <button type="button" id="login" class="btn btn-primary btn-lg btn-block">登录</button>
                <button type="button" id="register" class="btn btn-primary btn-lg btn-block">注册</button>
            </p>
            <div id="error"></div>
        </form>
    </div>
</div>
<div style="text-align:center;">
</div>
</body>
</html>

