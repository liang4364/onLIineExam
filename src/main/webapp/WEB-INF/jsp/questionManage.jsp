<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/4/15
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>问题管理</title>
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
            var picker3 = $('#datetimepicker3').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn'),
                //minDate: '2016-7-1'
            });
            var picker4 = $('#datetimepicker4').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn'),
                //minDate: '2016-7-1'
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
    </script>
</head>
<body>
<ul class="layui-nav layui-bg-cyan">
    <li class="layui-nav-item"><span style="font-size: 25px">教师管理</span></li>
    <li class="layui-nav-item "><a href="${pageContext.request.contextPath}/teacherList" style="font-size: 15px;cursor: pointer" id="home">
        <span class="glyphicon glyphicon-home" style="font-size: 15px;"></span>首页</a>
    </li>
    <li class="layui-nav-item  layui-this"><a href="${pageContext.request.contextPath}/questionManage" style="font-size: 15px;cursor: pointer" id="questionManage">
        <span class="glyphicon glyphicon-th-large" style="font-size: 15px;"></span>问题管理</a>
    </li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/examManage" style="font-size: 15px;cursor: pointer" id="examManage">
        <span class="glyphicon glyphicon-file" style="font-size: 15px;"></span>学生考试管理</a>
    </li>
    <li class="layui-nav-item"><a  href="${pageContext.request.contextPath}/scoreAnalysis" style="font-size: 15px;cursor: pointer" id="stuManage">
        <span class="glyphicon glyphicon-user" style="font-size: 15px;"></span>成绩分析</a>
    </li>
    <li class="layui-nav-item" lay-unselect="">
        <a href="javascript:;"><img src="https://i.loli.net/2019/11/02/rCHKVJd4jTovzW9.jpg" class="layui-nav-img">${username}</a>
        <dl class="layui-nav-child">
<%--            <dd><a href="javascript:;">修改信息</a></dd>
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
                <label class="control-label col-sm-1" for="type">考试类型</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control"  placeholder="请输入考试类型..." id="type">
                </div>
                <label class="control-label col-sm-1" for="question">问题</label>
                <div class="col-sm-1">
                    <input type="text" class="form-control" placeholder="请输入问题描述..." id="question">
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
            </div>
            <div class="form-group" style="margin-top:15px">
                <label class="control-label col-sm-1" for="courseName">科目名称</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control"  placeholder="请输入课程名称..." id="courseName">
                </div>
                <label class="control-label col-sm-1" for="analysis">解析</label>
                <div class="col-sm-1">
                    <input type="text" class="form-control" placeholder="请输入解析描述..." id="analysis">
                </div>
                <label class="control-label col-sm-1">更新时间范围</label>
                <div class='col-sm-2'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker3'>
                            <input type='text' class="form-control" id="updateBeginTime" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div class='col-sm-2'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker4'>
                            <input type='text' class="form-control" id="updateEndTime" />
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
        <button class="layui-btn layui-btn-sm" id="insertData"><i class="layui-icon"></i></button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="static/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,id: 'indent'
            ,url:'/api/getAllQuestion'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '问题详情表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:80}
                ,{field:'courseName', title:'考试科目', width:110, sort: true}
                ,{field:'creator', title:'创建人', width:110,edit: 'text'}
                ,{field:'type', title:'考试类型', width:120,sort: true}
                ,{field:'difficult', title:'难易程度', width:90,edit: 'text',sort: true}
                ,{field:'question', title:'问题', width:150,edit: 'text'}
                ,{field:'optionA', title:'选项A', width:130, sort: true,edit: 'text'}
                ,{field:'optionB', title:'选项B', width:130, sort: true,edit: 'text'}
                ,{field:'optionC', title:'选项C', width:130, sort: true,edit: 'text'}
                ,{field:'optionD', title:'选项D', width:130, sort: true,edit: 'text'}
                ,{field:'answer', title:'正确答案', width:130, sort: true,edit: 'text'}
                ,{field:'analysis', title:'解析', width:130, sort: true,edit: 'text'}
                ,{field:'createTime1', title:'创建时间', width:170, sort: true}
                ,{field:'updateTime', title:'更新时间', width:170, sort: true}
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
                        url: "deleteQuestion?questionId="+data.id,
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
                    formType: 7
                    ,value: data.analysis
                }, function(value, index){
                    obj.update({
                        analysis: value
                    });
                    layer.close(index);
                });
            }
        });

        var active = {
            reload: function(){
                var type = $('#type').val();
                var question = $('#question').val();
                var beginTime = $('#beginTime').val();
                var endTime = $('#endTime').val();
                var courseName = $('#courseName').val();
                var analysis = $('#analysis').val();
                var updateBeginTime = $('#updateBeginTime').val();
                var updateEndTime = $('#updateEndTime').val();
                //执行重载
                table.reload('indent', {
                    url : '/api/getAllQuestionByFilter',
                    method:'post',
                    page: {
                        curr: 1
                    }
                    ,where: {
                        username: '${username}',
                        type: type,
                        beginTime: beginTime,
                        endTime: endTime,
                        question:question,
                        courseName:courseName,
                        analysis:analysis,
                        updateBeginTime:updateBeginTime,
                        updateEndTime:updateEndTime
                    }
                });
            }
        };
        $('#query').on('click', function(){
            var type = $(this).data('type');
            if($('#type').val() == "" && $('#courseName').val()=="" && $('#beginTime').val()=="" && $('#endTime').val()=="" && $('#question').val()=="" && $('#analysis').val()=="" && $('#updateBeginTime').val()=="" && $('#updateEndTime').val()==""){
                layer.msg('查询条件不能为空');
                return false;
            }
            active[type] ? active[type].call(this) : '';
        });

        $('#insertData').on('click', function(){
            /*var dataBak = [];
            var tableBak = table.cache.indent;
            for (var i = 0; i < tableBak.length; i++) {
                dataBak.push(tableBak[i]);      //将之前的数组备份
            }
            console.log(dataBak);
            dataBak.push({
                "question": ""
                ,"optionA": "1"
                ,"optionB": "2"
                ,"optionC": "3"
                ,"optionD": "4"
                ,"type": "1"
                ,"courseName": "2"
                ,"answer": "3"
                ,"analysis": "4"
            });
            console.log(dataBak);
            table.reload("indent",{
                data:dataBak
            });*/
            $.ajax({
                dataType: "json",
                contentType: "application/json",
                url: "/api/addQuestion",
                success: function (res) {
                    if(res.code == "ok"){
                        window.location.href = "questionAdd?username=${username}"
                    }
                },
                type: "post"
            })
        });

        //监听单元格编辑
        table.on('edit(test)', function(obj){
            let value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field//得到字段
                ,typeId = data.id;
            if(field === "difficult"){
                if(value != "难" || value != "中" || value!="易"){
                    layer.msg("难易程度设置只能为难或易或中其中一个！");
                    return;
                }
            }
            $.ajax({
                dataType: "json",
                url: "updateQuestion?"+field+"="+value+"&typeId="+typeId,
                success: function (res) {
                    if(res.code === "ok" && res.data != -1){
                        layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
                    }
                },
                type: "post"
            })
        });
    });
</script>

</body>
</html>
