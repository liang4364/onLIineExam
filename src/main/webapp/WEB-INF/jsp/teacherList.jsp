<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/4/15
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>教师管理页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/css/layui.css"  media="all">
    <script src="static/layui.js" charset="utf-8"></script>
    <link href="static/css/list.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
<ul class="layui-nav layui-bg-cyan">
    <li class="layui-nav-item"><span style="font-size: 25px">教师管理</span></li>
    <li class="layui-nav-item layui-this"><a href="${pageContext.request.contextPath}/teacherList" style="font-size: 15px;cursor: pointer" id="home">
        <span class="glyphicon glyphicon-home" style="font-size: 15px;"></span>首页</a>
    </li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/questionManage" style="font-size: 15px;cursor: pointer" id="questionManage">
        <span class="glyphicon glyphicon-th-large" style="font-size: 15px;"></span>问题管理</a>
    </li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/examManage" style="font-size: 15px;cursor: pointer" id="examManage">
        <span class="glyphicon glyphicon-file" style="font-size: 15px;"></span>考试管理</a>
    </li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/studentManage" style="font-size: 15px;cursor: pointer" id="stuManage">
        <span class="glyphicon glyphicon-user" style="font-size: 15px;"></span>学生管理</a>
    </li>
    <li class="layui-nav-item" lay-unselect="">
        <a href="javascript:;"><img src="https://i.loli.net/2019/11/02/rCHKVJd4jTovzW9.jpg" class="layui-nav-img">${username}</a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="javascript:;">安全管理</a></dd>
            <dd><a href="javascript:;">退了</a></dd>
        </dl>
    </li>
</ul>
<div class="container" align="center" style="color: white">
    <h2>教师管理须知</h2>
    <p1>1．教师角色可有的权限分别为试题管理，考试管理，试题管理！</p1>
    <br/>
    <p1>2．教师管理考试信息时，应本着公平公正原则，不得徇私舞弊！</p1>
</div>
<div id="myCarousel" class="carousel slide" style="padding-top: 80px">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active" align="center">
            <img src="static/images/cover1.jpg" alt="First slide" width="1000px">
        </div>
        <div class="item" align="center">
            <img src="static/images/cover2.jpg" alt="Second slide" width="1000px">
        </div>
        <div class="item" align="center">
            <img src="static/images/cover3.jpg" alt="Third slide" width="1000px">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<br>
<br>
<!--页脚部分-->
<div style="text-align: center">
    <a  href="#" style="color: #444444">关于我</a>
    <a  href="#" style="color: #444444">联系我</a>
</div>
<div style="text-align: center">
    Copyright @2021 Liang Heng
</div>
</body>
</html>
