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
    <li class="layui-nav-item"><a style="font-size: 15px;cursor: pointer" id="examManage">
        <span class="glyphicon glyphicon-file" style="font-size: 15px;"></span>考试管理</a>
    </li>
    <li class="layui-nav-item"><a style="font-size: 15px;cursor: pointer" id="stuManage">
        <span class="glyphicon glyphicon-user" style="font-size: 15px;"></span>学生管理</a>
    </li>
    <li class="layui-nav-item" lay-unselect="">
        <a href="javascript:;"><img src="https://i.loli.net/2019/11/02/rCHKVJd4jTovzW9.jpg" class="layui-nav-img">我</a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="javascript:;">安全管理</a></dd>
            <dd><a href="javascript:;">退了</a></dd>
        </dl>
    </li>
</ul>
<div class="panel panel-default" style="height: 120px">
    <div class="panel-heading">查询条件</div>
    <div class="panel-body">
        <form id="formSearch" class="form-horizontal">
            <div class="form-group" style="margin-top:15px">
                <label class="control-label col-sm-1" for="type">试题类型</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control"  placeholder="请输入试题类型..." id="type">
                </div>
                <label class="control-label col-sm-1" for="question">问题</label>
                <div class="col-sm-1">
                    <input type="text" class="form-control" placeholder="请输入问题描述..." id="question">
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

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
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
            ,url:'/api/getAllQuestion'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:80}
                ,{field:'type', title:'考试类型', width:120,sort: true}
                ,{field:'question', title:'问题', width:150,edit: 'text'}
                ,{field:'optionA', title:'选项A', width:130, sort: true,edit: 'text'}
                ,{field:'optionB', title:'选项B', width:130, sort: true,edit: 'text'}
                ,{field:'optionC', title:'选项C', width:130, sort: true,edit: 'text'}
                ,{field:'optionD', title:'选项D', width:130, sort: true,edit: 'text'}
                ,{field:'answer', title:'正确答案', width:130, sort: true,edit: 'text'}
                ,{field:'analysis', title:'解析', width:400, sort: true,edit: 'text'}
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
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
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
        //监听单元格编辑
        table.on('edit(test)', function(obj){
            let value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field//得到字段
                ,typeId = data.id;
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
