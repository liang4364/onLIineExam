<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/4/19
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>学生考试管理</title>
    <link rel="stylesheet" href="static/css/layui.css"  media="all">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <SCRIPT TYPE="text/javascript">
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
            var picker3 = $('#datetimepicker3').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });
            var picker4 = $('#datetimepicker4').datetimepicker({
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
            picker3.on('dp.change', function (e) {
                picker1.data('DateTimePicker').maxDate(e.date);
            });
            picker4.on('dp.change', function (e) {
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
    </SCRIPT>
</head>
<body>
<ul class="layui-nav layui-bg-cyan">
    <li class="layui-nav-item"><span style="font-size: 25px">教师管理</span></li>
    <li class="layui-nav-item "><a href="${pageContext.request.contextPath}/teacherList" style="font-size: 15px;cursor: pointer" id="home">
        <span class="glyphicon glyphicon-home" style="font-size: 15px;"></span>首页</a>
    </li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/questionManage" style="font-size: 15px;cursor: pointer" id="questionManage">
        <span class="glyphicon glyphicon-th-large" style="font-size: 15px;"></span>问题管理</a>
    </li>
    <li class="layui-nav-item  layui-this"><a href="${pageContext.request.contextPath}/examManage" style="font-size: 15px;cursor: pointer" id="examManage">
        <span class="glyphicon glyphicon-file" style="font-size: 15px;"></span>学生考试管理</a>
    </li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/scoreAnalysis" style="font-size: 15px;cursor: pointer" id="stuManage">
        <span class="glyphicon glyphicon-user" style="font-size: 15px;"></span>成绩分析</a>
    </li>
    <li class="layui-nav-item" lay-unselect="">
        <a href="javascript:;"><img src="https://i.loli.net/2019/11/02/rCHKVJd4jTovzW9.jpg" class="layui-nav-img">${username}</a>
        <dl class="layui-nav-child">
            <%--<dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="javascript:;">安全管理</a></dd>--%>
            <dd><a href="javascript:;" id="exit">退了</a></dd>
        </dl>
    </li>
</ul>
<div class="panel panel-default" style="height: 180px">
    <div class="panel-heading">查询条件</div>
    <div class="panel-body">
        <form id="formSearch" class="form-horizontal">
            <div class="form-group" style="margin-top:15px">
                <label class="control-label col-sm-1" for="username">学生姓名</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control"  placeholder="请输入学生姓名..." id="username">
                </div>
                <label class="control-label col-sm-1" for="userClass">所属班级</label>
                <div class="col-sm-1">
                    <input type="text" class="form-control" placeholder="请输入问题描述..." id="userClass">
                </div>
                <label class="control-label col-sm-1">学生创建时间范围</label>
                <div class='col-sm-2'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker1'>
                            <input type='text' class="form-control" id="userCreateTimeBegin" />
                            <span class="input-group-addon">
                                                 <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                        </div>
                    </div>
                </div>
                <div class='col-sm-2'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker2'>
                            <input type='text' class="form-control" id="userCreateTimeEnd" />
                            <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                        </div>
                    </div>
                </div>

            </div>
            <div class="form-group" style="margin-top:15px">

                <label class="control-label col-sm-1" for="grade">总分数</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" placeholder="请输入分数..." id="grade">
                </div>
                <label class="control-label col-sm-1" for="course">考试科目</label>
                <div class="col-sm-1">
                    <input type="text" class="form-control"  placeholder="请输入考试科目..." id="course">
                </div>
                <label class="control-label col-sm-1">考试创建时间范围</label>
                <div class='col-sm-2'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker3'>
                            <input type='text' class="form-control" id="examBeginTime" />
                            <span class="input-group-addon">
                                                 <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                        </div>
                    </div>
                </div>
                <div class='col-sm-2'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker4'>
                            <input type='text' class="form-control" id="examEndTime" />
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

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a id="lookDetail" class="layui-btn layui-btn-xs" lay-event="look">查看</a>
</script>

<script src="static/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,id: 'indent'
            ,url:'/api/getAllExam'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '考试详情表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:80}
                ,{field:'userName', title:'学生姓名', width:110,sort: true}
                ,{field:'userCollege', title:'学院', width:130,sort: true}
                ,{field:'userClass', title:'班级', width:130,sort: true}
                ,{field:'userEmail', title:'学生邮箱', width:160,sort: true}
                ,{field:'userPhone', title:'学生手机号', width:130,sort: true}
                ,{field:'courseName', title:'考试科目', width:120, sort: true}
                ,{field:'singleScore', title:'单选题得分', width:130, sort: true}
                ,{field:'multiplyScore', title:'多选题得分', width:130, sort: true}
                ,{field:'shortScore', title:'简答题得分', width:130, sort: true}
                ,{field:'judgeScore', title:'判断题得分', width:130, sort: true}
                ,{field:'score', title:'总分数', width:100}
                ,{field:'examTime', title:'考试时长', width:100, sort: true}
                ,{field:'examBeginTime', title:'考试开始时间', width:180, sort: true}
                ,{field:'examEndTime', title:'考试结束时间', width:180, sort: true}
                ,{field:'userCreateTime', title:'用户创建时间', width:180, sort: true}
                ,{title:'操作', toolbar: '#barDemo', width:280}
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('点击你要修改的信息即可！');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
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
        });
        var active = {
            reload: function(){
                var username = $('#username').val();
                var userClass = $('#userClass').val();
                var userCreateBeginTime = $("#userCreateTimeBegin").val();
                var userCreateEndTime = $('#userCreateTimeEnd').val();
                var score = $('#grade').val();
                var course = $('#course').val();
                var examBeginTime = $('#examBeginTime').val();
                var examEndTime = $('#examEndTime').val();

                //执行重载
                table.reload('indent', {
                    url : '/api/getAllExamByFilter',
                    method:'post',
                    page: {
                        curr: 1
                    }
                    ,where: {
                        username: username,
                        userClass: userClass,
                        userCreateBeginTime: userCreateBeginTime,
                        userCreateEndTime: userCreateEndTime,
                        score:score,
                        course:course,
                        examBeginTime:examBeginTime,
                        examEndTime:examEndTime
                    }
                });
            }
        };
        $('#query').on('click', function(){
            var type = $(this).data('type');
            if($('#username').val() == "" && $('#userClass').val() == "" && $('#userCreateBeginTime').val()=="" && $('#userCreateEndTime').val()=="" && $('#grade').val()==""  && $('#course').val()=="" && $('#examBeginTime').val()=="" && $('#examEndTime').val()==""){
                layer.msg('查询条件不能为空');
                return false;
            }
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>
