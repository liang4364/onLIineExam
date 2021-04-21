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
                var type = $("#selectType option:selected").val();
                var course = $("#selectCourse option:selected").val();
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
    <table border="2" style="width: 600px;border-collapse: collapse; text-align: center;margin: 0 auto">
        <tr>
            <td>科目</td>
            <td>
                <select id="selectCourse">
                    <option value="">请选择..</option>
                    <option value="Java">Java</option>
                    <option value="Web前端">Web前端</option>
                    <option value="C++">C++</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>类型</td>
            <td>
                <select id="selectType">
                    <option value="">请选择..</option>
                    <option value="single">单选题</option>
                    <option value="multiply">多选题</option>
                    <option value="judge">判断题</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>题目</td>
            <td><input style="border:none;width: 522px;border-collapse: collapse;" type="text" id="title"/></td>
        </tr>
        <tr>
            <td>A</td>
            <td><input style="border:none;width: 522px;border-collapse: collapse;" type="text" id="optionA"/></td>
        </tr>
        <tr>
            <td>B</td>
            <td><input style="border:none;width: 522px;border-collapse: collapse;" type="text" id="optionB"/></td>
        </tr>
        <tr>
            <td>C</td>
            <td><input style="border:none;width: 522px;border-collapse: collapse;" type="text" id="optionC"/></td>
        </tr>
        <tr>
            <td>D</td>
            <td><input style="border:none;width: 522px;border-collapse: collapse;" type="text" id="optionD"/></td>
        </tr>
        <tr>
            <td>正确答案</td>
            <td><input type="checkbox" name="answer" value="A"/>A
                <input type="checkbox" name="answer" value="B"/>B
                <input type="checkbox" name="answer" value="C"/>C
                <input type="checkbox" name="answer" value="D"/>D
            </td>
        </tr>
        <tr>
            <td>解析</td>
            <td><input style="border:none;width: 522px;border-collapse: collapse;" type="text" id="analysis"/></td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <button id="submit" >提交</button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" value="清空"/>
            </td>
        </tr>
    </table>
</body>
</html>
