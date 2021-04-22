<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/4/22
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>管理员页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/css/layui.css"  media="all">
    <script src="static/layui.js" charset="utf-8"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <style type="text/css">
        .pointer{
            cursor: pointer;
        }
    </style>
</head>
<body>
<ul class="layui-nav layui-bg-cyan">
    <li class="layui-nav-item"><span style="font-size: 25px">管理员权限</span></li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/stuManage" style="font-size: 15px;cursor: pointer">
        <span class="glyphicon glyphicon-th-large" style="font-size: 15px;"></span>学生信息管理</a>
    </li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/teacherManage" style="font-size: 15px;cursor: pointer">
        <span class="glyphicon glyphicon-file" style="font-size: 15px;"></span>教师信息管理</a>
    </li>
    <li class="layui-nav-item" lay-unselect="">
        <a href="javascript:;"><img src="https://i.loli.net/2019/11/02/rCHKVJd4jTovzW9.jpg" class="layui-nav-img">${username}</a>
        <dl class="layui-nav-child">
            <%--<dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="javascript:;">安全管理</a></dd>--%>
            <dd><a id="exit" class="pointer">退了</a></dd>
        </dl>
    </li>
</ul>
</body>
</html>
