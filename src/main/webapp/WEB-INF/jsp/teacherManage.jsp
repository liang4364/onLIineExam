<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/4/22
  Time: 17:12
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
<ul class="layui-nav layui-bg-cyan">
    <li class="layui-nav-item"><span style="font-size: 25px">管理员权限</span></li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/stuManage" style="font-size: 15px;cursor: pointer">
        <span class="glyphicon glyphicon-th-large" style="font-size: 15px;"></span>学生信息管理</a>
    </li>
    <li class="layui-nav-item   layui-this"><a href="${pageContext.request.contextPath}/teacherManage" style="font-size: 15px;cursor: pointer">
        <span class="glyphicon glyphicon-file" style="font-size: 15px;"></span>教师信息管理</a>
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
                <label class="control-label col-sm-1" for="username">教师姓名</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" placeholder="请输入学生姓名..." id="username">
                </div>
                <label class="control-label col-sm-1" for="userPhone">手机号</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" placeholder="手机号..." id="userPhone">
                </div>
            </div>
            <div class="form-group" style="margin-top:15px">
                <label class="control-label col-sm-1" for="userNum">工号</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control"  placeholder="请输入工号..." id="userNum">
                </div>
                <label class="control-label col-sm-1" for="userEmail">邮箱</label>
                <div class="col-sm-1">
                    <input type="text" class="form-control"  placeholder="请输入所在班级..." id="userEmail">
                </div>
                <label class="control-label col-sm-1">创建时间范围</label>
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
                <button type="reset" style="margin-left:50px"  class="layui-btn" id="reset">清空</button>
                <button type="button" style="margin-left:50px" id="query" class="layui-btn layui-inline" data-type="reload">查询</button>
            </div>
        </form>
    </div>
    <br>
</div>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" id="insertData"><i class="layui-icon"></i></button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="checkboxTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="checkbox" name="userLock" value="{{d.username}}" title="锁定" lay-filter="lockDemo" {{ d.userLock == 0 ? 'checked' : '' }}>
</script>

<script src="static/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table
            ,form = layui.form;
        table.render({
            elem: '#test'
            ,id: 'indent'
            ,url:'/api/getAllTeacher'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '学生详情表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:80}
                ,{field:'username', title:'教师姓名', width:200,sort: true}
                ,{field:'userNum', title:'工号', width:200,sort: true}
                ,{field:'userPhone', title:'手机号', width:200, sort: true}
                ,{field:'userEmail', title:'邮箱', width:200,sort: true}
                ,{field:'userRole', title:'角色', width:200, sort: true}
                ,{field:'createTime', title:'创建时间', width:610, sort: true}
                ,{field:'userLock', title:'是否锁定', width:110, templet: '#checkboxTpl', unresize: true}
                ,{title:'操作', toolbar: '#barDemo', width:280}
            ]]
            ,page: true
        });
        //监听锁定操作
        form.on('checkbox(lockDemo)', function(obj){
            $.ajax({
                dataType: "json",
                contentType: "application/json",
                url: "updateUserLock?lock="+ obj.elem.checked+"&username="+obj.value,
                success: function (res) {
                    if(res.code == "ok"){
                        layer.tips(this.name + '：'+ obj.elem.checked, obj.othis);
                    }else {
                        layer.tips("更新数据库失败！");
                    }
                },
                type: "post"
            });

        });
        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
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
            var data = obj.data;
            console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('确定删除吗？', function(index){
                    obj.del();
                    $.ajax({
                        dataType: "json",
                        contentType: "application/json",
                        url: "deleteStu?username="+data.username,
                        success: function (res) {
                            if(res.code === "ok"){
                                layer.msg("删除成功！")
                            }
                        },
                        type: "post"
                    });
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 0
                    ,value: data.username
                }, function(value, index){
                    obj.update({
                        username: value
                    });
                    layer.close(index);
                });
            }
        });
        var active = {
            reload: function(){
                var username = $('#username').val();
                var userEmail = $('#userEmail').val();
                var userPhone = $('#userPhone').val();
                var beginTime = $('#beginTime').val();
                var endTime = $('#endTime').val();
                var userNum = $('#userNum').val();
                var userRole = "教师";
                //执行重载
                table.reload('indent', {
                    url : '/api/getAllTeacherByFilter',
                    method:'post',
                    page: {
                        curr: 1
                    }
                    ,where: {
                        username: username,
                        userEmail: userEmail,
                        userPhone: userPhone,
                        beginTime:beginTime,
                        endTime:endTime,
                        userNum:userNum,
                        userRole:userRole
                    }
                });
            }
        };
        $('#query').on('click', function(){
            var type = $(this).data('type');
            if($('#username').val() == "" && $('#userEmail').val()=="" && $('#userPhone').val()=="" && $('#beginTime').val()==""  && $('#endTime').val()=="" && $('#userNum').val()==""){
                layer.msg('查询条件不能为空');
                return false;
            }
            active[type] ? active[type].call(this) : '';
        });
        $('#insertData').on('click', function(){
            $.ajax({
                dataType: "json",
                contentType: "application/json",
                url: "addTeacher",
                success: function (res) {
                    if(res.code === "ok"){
                        window.location.href = "addTeacher1?username=${username}"
                    }
                },
                type: "post"
            })
        });
    });
</script>
</body>
</html>
