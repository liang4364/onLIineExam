<%@ page import="java.util.List" %>
<%@ page import="com.lh.exam.model.dto.ExamScoreDto" %><%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/3/23
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>在线考试系统首页</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <link href="static/css/list.css" rel="stylesheet" type="text/css"/>
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
            $('#detail').click(function () {
                $('#homePage').attr("style","display:none");
                $('#detailPage').attr("style","display:block");
                $('#foot').attr("style","display:none")
                $('#detailLi').attr("class","active");
                $('#homeLi').attr("class",'');
                $('#examDetail').html('');
                let json = {
                    'username' : '${username}'
                };
                $.ajax({
                    data: json,
                    dataType: "json",
                    url: "getExamDetail",
                    success: function (res) {
                        if (res.code == "ok") {
                            $.each(res.data,function (index,element) {
                                if(element.score <= 60){
                                    $('#examDetail').append("<tr class='danger'>\n" +
                                        "                <td>"+element.userName+"</td>\n" +
                                        "                <td>"+element.courseName+"</td>\n" +
                                        "                <td>"+element.score+"</td>\n" +
                                        "                <td>"+element.createTime+"</td>\n" +
                                        "                <td>\n" +
                                        "                    <button class=\"btn btn-primary\" type='button' onclick=\"lookDetail(\'"+element.id+"\',\'"+element.courseName+"')\">查看</button>\n" +
                                        "                </td>\n" +
                                        "</tr>")
                                }else if(element.score > 60 && element.score <80){
                                    $('#examDetail').append("<tr class='warning'>\n" +
                                        "                <td>"+element.userName+"</td>\n" +
                                        "                <td>"+element.courseName+"</td>\n" +
                                        "                <td>"+element.score+"</td>\n" +
                                        "                <td>"+element.createTime+"</td>\n" +
                                        "                <td>\n" +
                                        "                    <button class=\"btn btn-primary\" type='button' onclick=\"lookDetail(\'"+element.id+"\',\'"+element.courseName+"')\">查看</button>\n" +
                                        "                </td>\n" +
                                        "</tr>")
                                }else if(element.score >80){
                                    $('#examDetail').append("<tr class='success'>\n" +
                                        "                <td>"+element.userName+"</td>\n" +
                                        "                <td>"+element.courseName+"</td>\n" +
                                        "                <td>"+element.score+"</td>\n" +
                                        "                <td>"+element.createTime+"</td>\n" +
                                        "                <td>\n" +
                                        "                    <button class=\"btn btn-primary\" type='button' onclick=\"lookDetail(\'"+element.id+"\',\'"+element.courseName+"')\">查看</button>\n" +
                                        "                </td>\n" +
                                        "</tr>")
                                }

                            })
                        }
                    },
                    type: "post"
                })
            });
            $('#home').click(function () {
                $('#foot').attr("style","height: 100%; margin: -120px -120px 0px; padding-top: 80px;");
                $('#detailPage').attr("style","display:none");
                $('#homePage').attr("style","display:block");
                $('#homeLi').attr("class","active");
                $('#detailLi').attr("class",'');
            });
            $('#query').click(function () {
                $('#examDetail').html('');
                let json = {
                    "username":'${username}',
                    "type":$('#type').val(),
                    "score":$('#grade').val(),
                    "beginTime":$('#beginTime').val(),
                    "endTime":$('#endTime').val()
                };
                $.ajax({
                    data: json,
                    dataType: "json",
                    url: "queryByFilter",
                    success: function (res) {
                        if (res.code == "ok") {
                            $.each(res.data,function (index,element) {
                                if(element.score <= 60){
                                    $('#examDetail').append("<tr class='danger'>\n" +
                                        "                <td>"+element.userName+"</td>\n" +
                                        "                <td>"+element.courseName+"</td>\n" +
                                        "                <td>"+element.score+"</td>\n" +
                                        "                <td>"+element.createTime+"</td>\n" +
                                        "                <td>\n" +
                                        "                    <button class=\"btn btn-primary\" type='button' onclick=\"lookDetail(\'"+element.id+"\',\'"+element.courseName+"')\">查看</button>\n" +
                                        "                </td>\n" +
                                        "</tr>")
                                }else if(element.score > 60 && element.score <80){
                                    $('#examDetail').append("<tr class='warning'>\n" +
                                        "                <td>"+element.userName+"</td>\n" +
                                        "                <td>"+element.courseName+"</td>\n" +
                                        "                <td>"+element.score+"</td>\n" +
                                        "                <td>"+element.createTime+"</td>\n" +
                                        "                <td>\n" +
                                        "                    <button class=\"btn btn-primary\" type='button' onclick=\"lookDetail(\'"+element.id+"\',\'"+element.courseName+"')\">查看</button>\n" +
                                        "                </td>\n" +
                                        "</tr>")
                                }else if(element.score >80){
                                    $('#examDetail').append("<tr class='success'>\n" +
                                        "                <td>"+element.userName+"</td>\n" +
                                        "                <td>"+element.courseName+"</td>\n" +
                                        "                <td>"+element.score+"</td>\n" +
                                        "                <td>"+element.createTime+"</td>\n" +
                                        "                <td>\n" +
                                        "                    <button class=\"btn btn-primary\" type='button' onclick=\"lookDetail(\'"+element.id+"\',\'"+element.courseName+"')\">查看</button>\n" +
                                        "                </td>\n" +
                                        "</tr>")
                                }

                            })
                        }
                    },
                    type: "post"
                })
            });
            $('#exit').click(function () {
                var msg = "确定退出登录吗？";
                if (confirm(msg)==true){
                    window.location.href = "index"
                }else{
                    return false;
                }
            })

        });
        lookDetail = function (examId,course){
            var json = {
                examId : examId,
                userName:'${username}',
                courseName:course
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
        }

    </script>
</head>
<body>

<div class="ant-layout layout desktop">
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
                                <li id="homeLi"><a style="font-size: 20px;cursor: pointer" id="home">
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
<%--
                                <li id="detailLi"><a id="detail" style="font-size: 20px;cursor: pointer"><span class="glyphicon glyphicon-align-center" style="font-size: 20px"></span>考试详情</a>
--%>
                                <li id="detailLi"><a  href="${pageContext.request.contextPath}/examDetail1?username=${username}" style="font-size: 20px;cursor: pointer"><span class="glyphicon glyphicon-align-center" style="font-size: 20px"></span>考试详情</a>
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
        <!--首页主体部分-->
        <div class="ant-layout-content" style="height: 100%; margin: -120px -120px 0px; padding-top: 130px;" id="homePage">
            <!--考生须知部分-->
            <div class="container" align="center" style="padding: 30px 60px 0px; color: white">
                <h2>在线考试须知！</h2>
                <p1>1．考生应认真核实准考证各项信息是否准确，如有问题，应在考试之前向监考老师确认。</p1>
                <br/>
                <p1>2．考生进入本系统后，请不要退出该页面，防止考试中断,若考试中断，请联系监考老师。</p1>
                <br/>
                <p1>3．考试时间为90分钟，考生须在规定时间内完成答题，超过时间后将保留答案自动交卷 。</p1>
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
        </div>
        <br>
        <br>
        <br>
        <div style="display: none" id="detailPage">
            <div class="panel panel-default" style="height:1000px;margin-top: -10px">
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
                                <button type="reset" style="margin-left:50px"  class="btn btn-primary">清空</button>
                                <button type="button" style="margin-left:50px" id="query" class="btn btn-primary">查询</button>
                        </div>
                    </form>
                </div>
                <br>
                <table class="table" style= "border:1px solid #cccccc;">
                    <thead>
                    <tr class="info" style="font-size: 15px" >
                        <th>用户名</th>
                        <th>试题类型</th>
                        <th>分数</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="examDetail">
                    </tbody>
                </table>
            </div>

        </div>
        <!--页脚部分-->
        <div class="ant-layout-footer" align="center"
             style="height: 100%; margin: -120px -120px 0px; padding-top: 80px;" id="foot">
            <div data-v-feae73ec="" class="footer">
                <div data-v-feae73ec="" class="links">
                    <a data-v-feae73ec="" href="#" style="color: #444444">关于我</a>
                    <a data-v-feae73ec="" href="#" style="color: #444444">联系我</a>
                </div>
                <div data-v-feae73ec="" class="copyright">
                    Copyright
                    <i data-v-feae73ec="" class="anticon anticon-copyright">
                        <svg data-v-feae73ec="" viewbox="64 64 896 896" data-icon="copyright" width="1em" height="1em"
                             fill="currentColor" aria-hidden="true" class="">
                            <path d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372 372 166.6 372 372-166.6 372-372 372zm5.6-532.7c53 0 89 33.8 93 83.4.3 4.2 3.8 7.4 8 7.4h56.7c2.6 0 4.7-2.1 4.7-4.7 0-86.7-68.4-147.4-162.7-147.4C407.4 290 344 364.2 344 486.8v52.3C344 660.8 407.4 734 517.3 734c94 0 162.7-58.8 162.7-141.4 0-2.6-2.1-4.7-4.7-4.7h-56.8c-4.2 0-7.6 3.2-8 7.3-4.2 46.1-40.1 77.8-93 77.8-65.3 0-102.1-47.9-102.1-133.6v-52.6c.1-87 37-135.5 102.2-135.5z"></path>
                        </svg>
                    </i> 2021
                    <span data-v-feae73ec="">Liang Heng</span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>