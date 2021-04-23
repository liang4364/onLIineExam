<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/4/19
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>学生管理</title>
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
    <script type="text/javascript" src="static/js/echarts.min.js"></script>
    <script type="text/javascript">
        function init(college,userClass){
            var chartDom = document.getElementById('main');
            var myChart = echarts.init(chartDom, 'dark');
            var option;
            option = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    //data: ['直接访问', '搜索引擎', '百度', '谷歌', '必应', ]
                    data: ['平均成绩', '最高成绩', '最低成绩', '单选题平均成绩', '多选题平均成绩','判断题平均成绩' ]

                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        data: []
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '平均成绩',
                        type: 'bar',
                        emphasis: {
                            focus: 'series'
                        },
                        data: []
                    },
                    {
                        name: '最低成绩',
                        type: 'bar',
                        emphasis: {
                            focus: 'series'
                        },
                        data: []
                    },
                    {
                        name: '最高成绩',
                        type: 'bar',
                        data: [],
                        emphasis: {
                            focus: 'series'
                        },
                        markLine: {
                            lineStyle: {
                                type: 'dashed'
                            },
                            data: [
                                [{type: 'min'}, {type: 'max'}]
                            ]
                        }
                    },
                    {
                        name: '单选题平均成绩',
                        type: 'bar',
                        barWidth: 5,
                        stack: '题型',
                        emphasis: {
                            focus: 'series'
                        },
                        data: []
                    },
                    {
                        name: '多选题平均成绩',
                        type: 'bar',
                        stack: '题型',
                        emphasis: {
                            focus: 'series'
                        },
                        data: []
                    },
                    {
                        name: '判断题平均成绩',
                        type: 'bar',
                        stack: '题型',
                        emphasis: {
                            focus: 'series'
                        },
                        data: []
                    },
                ]
            };
            $.ajax({
                url: "getScoreAnalysisByCourse?collegeName="+college+"&className="+userClass+"",
                success: function (res) {
                    var result = res.data;
                    var courseName = [];
                    var avgScore = [];
                    var avgSingleScore = [];
                    var avgMultiplyScore = [];
                    var avgJudgeScore = [];
                    var maxScore = [];
                    var minScore = [];
                    for(var i = 0;i<result.length;i++){
                        courseName.push(result[i].courseName);
                        avgScore.push(result[i].avgScore);
                        avgSingleScore.push(result[i].avgSingleScore);
                        avgMultiplyScore.push(result[i].avgMultiplyScore);
                        avgJudgeScore.push(result[i].avgJudgeScore);
                        maxScore.push(result[i].maxScore);
                        minScore.push(result[i].minScore);
                    }
                    myChart.setOption({
                        xAxis:
                            {
                                data: courseName
                            },
                        series: [
                            {
                                name: '平均成绩',
                                data:avgScore
                            },
                            {
                                name: '最高成绩',
                                data:maxScore
                            },
                            {
                                name: '最低成绩',
                                data:minScore
                            },
                            {
                                name: '单选题平均成绩',
                                data:avgSingleScore
                            },
                            {
                                name: '多选题平均成绩',
                                data:avgMultiplyScore
                            },
                            {
                                name: '判断题平均成绩',
                                data:avgJudgeScore
                            },
                        ]
                    })
                },
                type: "post"
            });
            option && myChart.setOption(option);
        }
        $(function () {
            init("数学与计算机学院","计科11703");
            $("#query").click(function () {
                var college = document.getElementById("userCollege");
                for (var i = 0; i < college.length; i++) { //遍历Radio
                    if (college[i].selected) {
                        college = college[i].value;
                    }
                }
                var userClass = document.getElementById("userClass");
                for (var i = 0; i < userClass.length; i++) { //遍历Radio
                    if (userClass[i].selected) {
                        userClass = userClass[i].value;
                    }
                }
                init(college,userClass);
            });
            //级联查询
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
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/teacherList" style="font-size: 15px;cursor: pointer" id="home">
        <span class="glyphicon glyphicon-home" style="font-size: 15px;"></span>首页</a>
    </li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/questionManage" style="font-size: 15px;cursor: pointer" id="questionManage">
        <span class="glyphicon glyphicon-th-large" style="font-size: 15px;"></span>问题管理</a>
    </li>
    <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/examManage" style="font-size: 15px;cursor: pointer" id="examManage">
        <span class="glyphicon glyphicon-file" style="font-size: 15px;"></span>学生考试管理</a>
    </li>
    <li class="layui-nav-item  layui-this"><a href="${pageContext.request.contextPath}/scoreAnalysis" style="font-size: 15px;cursor: pointer" id="stuManage">
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
<div class="panel panel-default" style="height: 120px">
    <div class="panel-heading">查询条件</div>
    <div class="panel-body">
        <form id="formSearch" class="form-horizontal">
            <div class="form-group" style="margin-top:15px">
                <label class="control-label col-sm-1" for="userCollege">所属学院</label>
                <div class="col-sm-2">
                    <select class="form-control" id="userCollege">
                        <option value="0">请选择...</option>
                    </select>
                </div>
                <label class="control-label col-sm-1" for="userClass">所属班级</label>
                <div class="col-sm-2">
                    <select class="form-control" id="userClass">
                        <option value="物联网11702">物联网11702</option>
                        <option value="软件11701">软件11701</option>
                        <option value="计科11701">计科11701</option>
                        <option value="计科11703" selected>计科11703</option>
                    </select>
                </div>
                <button type="button" style="margin-left:50px" id="query" class="layui-btn layui-inline" data-type="reload">查询</button>
            </div>
        </form>
    </div>
    <br>
</div>
<div id="main" style="width: 1200px;height: 600px;margin: 0 auto;"></div>
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>
<script type="text/html" id="barDemo">
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
            ,url:'/api/getTableData'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '成绩分析表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:80}
                ,{field:'collegeName', title:'所属学院', width:130, sort: true}
                ,{field:'className', title:'所属班级', width:130}
                ,{field:'courseName', title:'科目名称', width:120,sort: true}
                ,{field:'avgScore', title:'平均总成绩', width:150}
                ,{field:'maxScore', title:'最高成绩', width:130, sort: true}
                ,{field:'minScore', title:'最低成绩', width:130, sort: true}
                ,{field:'avgSingleScore', title:'平均单选题成绩', width:130, sort: true}
                ,{field:'avgMultiplyScore', title:'平均多选题成绩', width:130, sort: true}
                ,{field:'avgJudgeScore', title:'平均判断题成绩', width:700, sort: true}
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
            layer.confirm('确定删除吗？', function(index){
                obj.del();
                layer.close(index);
            });
        });

        var active = {
            reload: function(){
                var collegeName = $('#userCollege option:selected').val();
                var className = $('#userClass option:selected').val();
                //执行重载
                table.reload('indent', {
                    url : '/api/getTableDataByFilter',
                    method:'post',
                    page: {
                        curr: 1
                    }
                    ,where: {
                        college : collegeName,
                        className : className
                    }
                });
            }
        };
        $('#query').on('click', function(){
            var type = $(this).data('type');
            if($('#userCollege option:selected').val() == "" || $('#userClass option:selected').val() == ""){
                layer.msg('请选择指定的学院和班级！');
                return false;
            }
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>
