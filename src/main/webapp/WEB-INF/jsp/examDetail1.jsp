<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/4/13
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>考试详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/css/layui.css"  media="all">
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
    <script type="text/javascript">
        $(function () {
            var picker1 = $('#datetimepicker1').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn'),
                //minDate: '2016-7-1'
            });
            var picker2 = $('#datetimepicker2').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });
            //动态设置最小值
            picker1.on('dp.change', function (e) {
                picker2.data('DateTimePicker').minDate(e.date);
            });
            //动态设置最大值
            picker2.on('dp.change', function (e) {
                picker1.data('DateTimePicker').maxDate(e.date);
            });
            $('#exit').click(function () {
                var msg = "确定退出登录吗？";
                if (confirm(msg)==true){
                    window.location.href = "index"
                }else{
                    return false;
                }
            })
        })
    </script>
</head>
<body>
<div class="ant-layout topmenu content-width-Fixed" style="padding-left: 0px; min-height: 100vh;">
    <!--导航部分-->
    <div class="header-animat">
        <div class="ant-layout-header ant-header-fixedHeader ant-header-side-opened" style="padding: 0px;">
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" style="font-size: 30px">计算机考试系统</a>
                    </div>
                    <div>
                        <!--向左对齐-->
                        <ul class="nav navbar-nav navbar-left">
                            <li id="homeLi"><a href = "${pageContext.request.contextPath}/list" style="font-size: 20px;cursor: pointer" id="home">
                                <span class="glyphicon glyphicon-home" style="font-size: 20px;"></span>首页</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                   style="font-size: 20px"><span
                                        class="glyphicon glyphicon-pencil" style="font-size: 20px"></span>
                                    开始考试 <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/exam?courseName=Java&username=${username}" target="_blank">Java</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">C语言</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Web前端</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/examDetail1?username=${username}" style="font-size: 20px;cursor: pointer"><span class="glyphicon glyphicon-align-center" style="font-size: 20px"></span>考试详情</a>
                            </li>
                        </ul>
                        <!--向右对齐-->
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <div class="content-box" style="position: absolute;right: 100px">
						<span class="action ant-dropdown-link user-dropdown-menu ant-dropdown-trigger">
							<span class="avatar ant-avatar ant-avatar-sm ant-avatar-circle ant-avatar-image">
								<img src="https://i.loli.net/2019/11/02/rCHKVJd4jTovzW9.jpg" class="img-circle"
                                     alt="Cinque Terre" width="34" height="34">
							</span>
							<span style="font-size: 22px;color:white;position: absolute;right:-50px;top: 5px">${username}</span>
						</span>
                                    </div>
                                </a>
                                <ul class="dropdown-menu" style="position: absolute;top: 55px">
                                    <%--<li><a href="#">账户设置</a></li>
                                    <li class="divider"></li>--%>
                                    <li><a id="exit" class="pointer">退出登录</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="panel panel-default" style="height: 120px">
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:15px">
                    <label class="control-label col-sm-1" for="type">试题类型</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control"  placeholder="请输入试题类型..." id="type">
                    </div>
                    <label class="control-label col-sm-1" for="grade">分数</label>
                    <div class="col-sm-1">
                        <input type="text" class="form-control" placeholder="请输入分数..." id="grade">
                    </div>
                    <label class="control-label col-sm-1">时间范围</label>
                    <div class='col-sm-2'>
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' class="form-control" id="beginTime" />
                                <span class="input-group-addon">
                                                 <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                            </div>
                        </div>
                    </div>
                    <div class='col-sm-2'>
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker2'>
                                <input type='text' class="form-control" id="endTime" />
                                <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                            </div>
                        </div>
                    </div>
                    <button type="reset" style="margin-left:50px"  class="layui-btn">清空</button>
                    <button type="button" style="margin-left:50px" id="query" class="layui-btn layui-inline" data-type="reload">查询</button>
                </div>
            </form>
        </div>
        <br>
    </div>
    <table class="layui-hide" id="test" lay-filter="test"></table>
    <script type="text/html" id="barDemo">
        <a id="lookDetail" class="layui-btn layui-btn-xs" lay-event="look">查看</a>
    </script>
    <script src="static/layui.js" charset="utf-8"></script>
    <script>
            layui.use('table', function(){
                let table = layui.table;
                table.render({
                    elem: '#test'
                    ,id: 'indent'
                    ,url:'/api/getExamDetail1?username=${username}'
                    ,port:8082
                    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                        title: '提示'
                        ,layEvent: 'LAYTABLE_TIPS'
                        ,icon: 'layui-icon-tips'
                    }]
                    ,title: '考试成绩表'
                    ,cols: [[
                        {field:'userName', title:'用户名', width:120, edit: 'text'}
                        ,{field:'userCollege', title:'所属学院', width:150, edit: 'text'}
                        ,{field:'userClass', title:'所在班级', width:150, edit: 'text'}
                        ,{field:'courseName', title:'考试类型', width:150, edit: 'text'}
                        ,{field:'singleScore', title:'单选题得分', width:130, sort: true}
                        ,{field:'multiplyScore', title:'多选题得分', width:130, sort: true}
                        ,{field:'judgeScore', title:'判断题得分', width:130, sort: true}
                        ,{field:'score', title:'考试总成绩', width:450, sort: true}
                        ,{field:'examTime', title:'考试时长', width:120, sort: true}
                        ,{field:'beginTime', title:'考试开始时间', width:180, sort: true}
                        ,{field:'createTime', title:'考试结束时间', width:180, sort: true}
                    ]]
                    ,page: true

                });
                //头工具栏事件
                table.on('toolbar(test)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                });

                //监听行工具事件
                table.on('tool(test)', function(obj){
                    var data=obj.data;
                    console.log(data);
                    var json = {
                        examId : data.id,
                        userName:data.userName,
                        courseName:data.courseName
                    };
                    $.ajax({
                        data: json,
                        dataType: "json",
                        url: "lookDetail",
                        success: function (res) {
                            if(res.code === "ok"){
                                window.open("examDetail")
                            }
                        },
                        type: "post"
                    })
                });
                var active = {
                    reload: function(){
                            var type = $('#type').val();
                            var score = $('#grade').val();
                            var beginTime = $('#beginTime').val();
                            var endTime = $('#endTime').val();

                        //执行重载
                        table.reload('indent', {
                            url : '/api/queryByFilter1',
                            method:'post',
                            page: {
                                curr: 1
                            }
                            ,where: {
                                username: '${username}',
                                type: type,
                                beginTime: beginTime,
                                endTime: endTime,
                                score:score
                            }
                        });
                    }
                };
                $('#query').on('click', function(){
                    var type = $(this).data('type');
                    if($('#type').val() == "" && $('#grade').val()=="" && $('#beginTime').val()=="" && $('#endTime').val()==""){
                        layer.msg('查询条件不能为空');
                        return false;
                    }
                    active[type] ? active[type].call(this) : '';
                });
            });
    </script>
</div>
</body>
</html>