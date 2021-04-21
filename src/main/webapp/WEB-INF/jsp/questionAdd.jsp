<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/4/20
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加试题</title>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/layui.css"  media="all">

    <script>
        $(function () {
            $("#submit").click(function () {
                var answer = "";
                var checkBox = document.getElementsByName("answer");
                for (var i = 0; i < checkBox.length; i++) {
                    if (checkBox[i].checked) {
                        answer = answer + checkBox[i].value+",";
                    }
                }
                var course = document.getElementsByName("course");
                for (var i = 0; i < course.length; i++) { //遍历Radio
                    if (course[i].checked) {
                        course = course[i].value;
                    }
                }

                var type = document.getElementsByName("type");
                for (var i = 0; i < type.length; i++) { //遍历Radio
                    if (type[i].checked) {
                        type = type[i].value;
                    }
                }
                console.log(course)
                if(course == "" || answer == "" || type == "" || $('#title').val() == "" || $('#optionA').val() == "" || $('#optionB').val() == "" || $('#optionC').val() == "" || $('#optionD').val() == "" || $('#analysis').val() == ""){
                        alert("所有选项都为必选项！");
                }else {
                    var json = {
                        question : $('#title').val(),
                        type : type,
                        optionA : $("#optionA").val(),
                        optionB : $("#optionB").val(),
                        optionC : $('#optionC').val(),
                        optionD : $('#optionD').val(),
                        answer : answer,
                        course : course,
                        creator : '${username}',
                        analysis : $('#analysis').val()
                    };

                    $.ajax({
                        data: JSON.stringify(json),
                        dataType: "json",
                        contentType: "application/json",
                        url: "addQuestion1",
                        success: function (res) {
                            if (res.code != "ok") {
                                alert(res.message)
                            }else {
                                window.close();
                                window.location.href = "questionManage"
                            }
                        },
                        type: "post"
                    })
                }
            })
        })
    </script>
</head>
<body>
<table border="2" style="width: 600px;border-collapse: collapse; text-align: center;margin: 0 auto;">
    <tr>
        <td>科目</td>
        <td>
            <div class="layui-form-item">
                <input type="radio" name="course" value="Java" >Java
                <input type="radio" name="course" value="Web++" >Web++
                <input type="radio" name="course" value="C++" >C++
            </div>
        </td>
    </tr>
    <tr>
        <td>类型</td>
        <td>
            <div class="layui-form-item">
                <input type="radio" name="type" value="single" >单选题
                <input type="radio" name="type" value="multiply" >多选题
                <input type="radio" name="type" value="judge" >判断题
            </div>
        </td>
    </tr>
    <tr>
        <td>题目</td>
        <td><input type="tel"  lay-verify="required|phone" autocomplete="off" class="layui-input" id="title">
    </tr>
    <tr>
        <td>A</td>
        <td><input type="tel"  lay-verify="required|phone" autocomplete="off" class="layui-input" id="optionA">
    </tr>
    <tr>
        <td>B</td>
        <td><input type="tel"  lay-verify="required|phone" autocomplete="off" class="layui-input" id="optionB">
    </tr>
    <tr>
        <td>C</td>
        <td><input type="tel"  lay-verify="required|phone" autocomplete="off" class="layui-input" id="optionC">
    </tr>
    <tr>
        <td>D</td>
        <td><input type="tel"  lay-verify="required|phone" autocomplete="off" class="layui-input" id="optionD">
    </tr>
    <tr>
        <td>正确答案</td>
        <td>
            <div class="layui-form-item" pane="">
                <input type="checkbox" name="answer" lay-skin="primary"  value="A">A
                <input type="checkbox" name="answer" lay-skin="primary" value="B">B
                <input type="checkbox" name="answer" lay-skin="primary"  value="C">C
                <input type="checkbox" name="answer" lay-skin="primary" value="D" >D
            </div>
        </td>
    </tr>
    <tr>
        <td>解析</td>
        <td><input type="tel"  lay-verify="required|phone" autocomplete="off" class="layui-input" id="analysis">
    </tr>
    <tr align="center">
        <td colspan="2">
            <button type="submit" class="layui-btn" lay-submit="" id="submit">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </td>
    </tr>
</table>
</body>
</html>
