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
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/md5.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url:"queryCollege",
                dataType:"json",
                success:function (data) {
                    $("#userCollege").empty();
                    $.each(data.data,function (index,element) {
                        $("#userCollege").append("<option value='"+element+"'>"+element+"</option>");
                    })
                }
            });
            $("#userCollege").change(function () {
                var obj = $("#userCollege>option:selected");
                var collegeName = obj.val();
                $.post("queryClass",{college:collegeName},function(resp){
                    $("#userClass").empty();
                    $.each(resp.data,function (index,element) {
                        $("#userClass").append("<option value='"+element+"'>"+element+"</option>");
                    })
                },"json");
            });
            $("body").keydown(function (event) {
                if (event.keyCode == 13) {
                    $("#register").click();
                }
            });
            //获取正则表达式对象
            $('#register').click(function () {
                var usernameRegExp=/^[a-zA-Z0-9_-]{4,16}$/;
                var userOk=usernameRegExp.test($('#username').val());
                if(userOk){
                    $('#testUsername').html("<span class='glyphicon glyphicon-ok'></span>");
                }else{
                    $('#testUsername').html("<span class='glyphicon glyphicon-remove'></span>");
                }

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
                    "userRoleId" : 2,
                    "userCollege" : $('#userCollege option:selected').val(),
                    "userClass" : $('#userClass option:selected').val()
                };
                if(userNumOk && passwordOk && emailOk && phonedOk && userOk){
                    $.ajax({
                        data: JSON.stringify(json),
                        dataType: "json",
                        contentType: "application/json",
                        url: "auth/register",
                        success: function (res) {
                            if(res.code == "ok"){
                                var msg = "注册成功，是否立即登录？";
                                if (confirm(msg)==true){
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
                                                if (res.code == "ok") {
                                                    let dataRes = res.data;
                                                    $.cookie('Authorization', ''+dataRes.token+'', {expires: 10, path: '/'});
                                                    if(userRole == 2){
                                                        window.location.href = "list?username="+$("#username").val();
                                                    }else {
                                                        window.location.href = "teacherList?username="+$("#username").val();
                                                    }
                                                }
                                            },
                                            type: "post"
                                        })
                                }else{
                                    return false;
                                }
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
                <div id="testUsername"></div><span class="input-group-addon">用户名</span>
                <input type="text" id="username" class="form-control" placeholder="请输入用户名...">
            </div>
            <br>
            <div class="input-group input-group-lg">
                <span class="input-group-addon">学院</span>
                <label for="userCollege"></label>
                <select class="form-control" id="userCollege">
                    <option value="0">请选择...</option>
                </select>
            </div>
            <br>
            <div class="input-group input-group-lg">
                <span class="input-group-addon">班级</span>
                <label for="userClass"></label>
                <select class="form-control" id="userClass">
                    <option value="物联网11702">物联网11702</option>
                    <option value="软件11701">软件11701</option>
                    <option value="计科11701">计科11701</option>
                    <option value="计科11703" selected>计科11703</option>
                </select>
            </div>
            <br>
            <div class="input-group input-group-lg">
                <div id="testUserNum"></div><span class="input-group-addon">工号</span>
                <input type="text" id="userNum" class="form-control" placeholder="请输入工号...">
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
            <!--  &nbsp;&nbsp;<span style="font-size: 18px">角色</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="userRoleId" value="2" ><span style="font-size: 18px">学生</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="userRoleId" value="1"><span style="font-size: 18px">教师</span>
              <br>-->
            <div class="input-group input-group-lg">
                <div id="testUserPhone"></div><span class="input-group-addon">手机</span>
                <input type="text" id="userPhone" class="form-control" placeholder="请输入手机号...">
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
