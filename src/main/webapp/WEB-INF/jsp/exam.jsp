<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/3/26
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎参加${courseMsg.courseName}考试</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="static/css/exam.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="static/js/md5.js"></script>

    <script type="text/javascript">
        var SysSecond;
        var InterValObj;
        var answerJson = null;
        //将时间减去1秒，计算天、时、分、秒
        function SetRemainTime() {
            if (SysSecond > 0) {
                SysSecond = SysSecond - 1;
                var second = Math.floor(SysSecond % 60);            // 计算秒
                var minite = Math.floor((SysSecond / 60) % 60);      //计算分
                var hour = Math.floor((SysSecond / 3600) % 24);      //计算小时
                var day = Math.floor((SysSecond / 3600) / 24);       //计算天

                var hourDiv = "<span id='hourSpan'>"+ hour + "小时"+"</span>";
                var dayDiv = "<span id='daySpan'>"+ day + "天"+"</span>";

                $("#remainTime").html(dayDiv + hourDiv + minite + "分" + second + "秒");

                if(hour === 0) {//当不足1小时时隐藏小时
                    $('#hourSpan').css('display','none');
                }
                if(day === 0) {//当不足1天时隐藏天
                    $('#daySpan').css('display','none');
                }

            } else {//剩余时间小于或等于0的时候，就停止间隔函数
                window.clearInterval(InterValObj);
                //这里可以添加倒计时时间为0后需要执行的事件
                alert("时间为0");
            }
        }
        function getSingleAnswer(radioName){
            var obj = document.getElementsByName(radioName);
            for (var i = 0; i < obj.length; i++) { //遍历Radio
                if (obj[i].checked) {
                    return  obj[i].value;
                }
            }
            return null;
        }
        function getMultiplyAnswer(multiplyName){
            var multiplyArray = new Array();
            var checkBox = document.getElementsByName(multiplyName);
            for (var i = 0; i < checkBox.length; i++) {
                if (checkBox[i].checked) {
                    multiplyArray.push(checkBox[i].value);
                }
            }
            if(multiplyArray != null){
                return multiplyArray;
            }else{
                return null;
            }
        }
        $(function () {
            SysSecond = parseInt($("#remainSeconds").html()); //这里获取倒计时的起始时间
            InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
            $('#collapseTwo').collapse('show');
            let obj = JSON.stringify(${resMap});
            let json = JSON.parse(obj);
            $('#1').click(function () {
                $("#t1 :radio").click(function(){
                    $("#1ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:block");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:none");
                $('#type').html(json.单选题[0].type);
                $('#question').html(json.单选题[0].question);
                $('#t1optionA').html(json.单选题[0].optionA);
                $('#t1optionB').html(json.单选题[0].optionB);
                $('#t1optionC').html(json.单选题[0].optionC);
                $('#t1optionD').html(json.单选题[0].optionD);
            });
            $('#2').click(function () {
                $("#t2 :radio").click(function(){
                    $("#2ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:block");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:none");
                $('#type').html(json.单选题[1].type);
                $('#question').html(json.单选题[1].question);
                $('#t2optionA').html(json.单选题[1].optionA);
                $('#t2optionB').html(json.单选题[1].optionB);
                $('#t2optionC').html(json.单选题[1].optionC);
                $('#t2optionD').html(json.单选题[1].optionD);
            });
            $('#3').click(function () {
                $("#t3 :radio").click(function(){
                    $("#3ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:block");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:none");
                $('#type').html(json.单选题[2].type);
                $('#question').html(json.单选题[2].question);
                $('#t3optionA').html(json.单选题[2].optionA);
                $('#t3optionB').html(json.单选题[2].optionB);
                $('#t3optionC').html(json.单选题[2].optionC);
                $('#t3optionD').html(json.单选题[2].optionD);
            });
            $('#4').click(function () {
                $("#t4 :radio").click(function(){
                    $("#4ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:block");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:none");
                $('#type').html(json.单选题[3].type);
                $('#question').html(json.单选题[3].question);
                $('#t4optionA').html(json.单选题[3].optionA);
                $('#t4optionB').html(json.单选题[3].optionB);
                $('#t4optionC').html(json.单选题[3].optionC);
                $('#t4optionD').html(json.单选题[3].optionD);
            });
            $('#5').click(function () {
                $("#t5 :radio").click(function(){
                    $("#5ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:block");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:none");
                $('#type').html(json.单选题[4].type);
                $('#question').html(json.单选题[4].question);
                $('#t5optionA').html(json.单选题[4].optionA);
                $('#t5optionB').html(json.单选题[4].optionB);
                $('#t5optionC').html(json.单选题[4].optionC);
                $('#t5optionD').html(json.单选题[4].optionD);
            });
            $('#6').click(function () {
                $("#t6 :checkbox").click(function(){
                    $("#6ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:block");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:none");
                $('#type').html(json.多选题[0].type);
                $('#question').html(json.多选题[0].question);
                $('#t6optionA').html(json.多选题[0].optionA);
                $('#t6optionB').html(json.多选题[0].optionB);
                $('#t6optionC').html(json.多选题[0].optionC);
                $('#t6optionD').html(json.多选题[0].optionD);
            });
            $('#7').click(function () {
                $("#t7 :checkbox").click(function(){
                    $("#7ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:block");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:none");
                $('#type').html(json.多选题[1].type);
                $('#question').html(json.多选题[1].question);
                $('#t7optionA').html(json.多选题[1].optionA);
                $('#t7optionB').html(json.多选题[1].optionB);
                $('#t7optionC').html(json.多选题[1].optionC);
                $('#t7optionD').html(json.多选题[1].optionD);
            });
            $('#8').click(function () {
                $("#t8 :checkbox").click(function(){
                    $("#8ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:block");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:none");
                $('#type').html(json.多选题[2].type);
                $('#question').html(json.多选题[2].question);
                $('#t8optionA').html(json.多选题[2].optionA);
                $('#t8optionB').html(json.多选题[2].optionB);
                $('#t8optionC').html(json.多选题[2].optionC);
                $('#t8optionD').html(json.多选题[2].optionD);
            });
            $('#9').click(function () {
                $("#t9 :checkbox").click(function(){
                    $("#9ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:block");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:none");
                $('#type').html(json.多选题[3].type);
                $('#question').html(json.多选题[3].question);
                $('#t9optionA').html(json.多选题[3].optionA);
                $('#t9optionB').html(json.多选题[3].optionB);
                $('#t9optionC').html(json.多选题[3].optionC);
                $('#t9optionD').html(json.多选题[3].optionD);
            });
            $('#10').click(function () {
                $("#t10 :checkbox").click(function(){
                    $("#10ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:block");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:none");
                $('#type').html(json.多选题[4].type);
                $('#question').html(json.多选题[4].question);
                $('#t10optionA').html(json.多选题[4].optionA);
                $('#t10optionB').html(json.多选题[4].optionB);
                $('#t10optionC').html(json.多选题[4].optionC);
                $('#t10optionD').html(json.多选题[4].optionD);
            });
            $('#11').click(function () {
                $("#t11 :radio").click(function(){
                    $("#11ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:block");
                $('#t12').attr("style","display:none");
                $('#type').html(json.判断题[0].type);
                $('#question').html(json.判断题[0].question);
                $('#t11optionA').html(json.判断题[0].optionA);
                $('#t11optionB').html(json.判断题[0].optionB);
                $('#t11optionC').html(json.判断题[0].optionC);
                $('#t11optionD').html(json.判断题[0].optionD);
            });
            $('#12').click(function () {
                $("#t12 :radio").click(function(){
                    $("#12ok").attr("class","glyphicon glyphicon-ok")
                });
                $('#index').attr("style", "display:none");
                $('#t1').attr("style","display:none");
                $('#t2').attr("style","display:none");
                $('#t3').attr("style","display:none");
                $('#t4').attr("style","display:none");
                $('#t5').attr("style","display:none");
                $('#t6').attr("style","display:none");
                $('#t7').attr("style","display:none");
                $('#t8').attr("style","display:none");
                $('#t9').attr("style","display:none");
                $('#t10').attr("style","display:none");
                $('#t11').attr("style","display:none");
                $('#t12').attr("style","display:block");
                $('#type').html(json.判断题[1].type);
                $('#question').html(json.判断题[1].question);
                $('#t12optionA').html(json.判断题[1].optionA);
                $('#t12optionB').html(json.判断题[1].optionB);
                $('#t12optionC').html(json.判断题[1].optionC);
                $('#t12optionD').html(json.判断题[1].optionD);
            });
        });
        function submitExam() {
            let answerJson={
                'single' : {
                    "${resMap["单选题"][0].id}":getSingleAnswer('${resMap["单选题"][0].id}'),
                    "${resMap["单选题"][1].id}":getSingleAnswer('${resMap["单选题"][1].id}'),
                    "${resMap["单选题"][2].id}":getSingleAnswer('${resMap["单选题"][2].id}'),
                    "${resMap["单选题"][3].id}":getSingleAnswer('${resMap["单选题"][3].id}'),
                    "${resMap["单选题"][4].id}":getSingleAnswer('${resMap["单选题"][4].id}')
                },
                "multiply" : {
                    "${resMap["多选题"][0].id}":getMultiplyAnswer('${resMap["多选题"][0].id}'),
                    "${resMap["多选题"][1].id}":getMultiplyAnswer('${resMap["多选题"][1].id}'),
                    "${resMap["多选题"][2].id}":getMultiplyAnswer('${resMap["多选题"][2].id}'),
                    "${resMap["多选题"][3].id}":getMultiplyAnswer('${resMap["多选题"][3].id}'),
                    "${resMap["多选题"][4].id}":getMultiplyAnswer('${resMap["多选题"][4].id}')
                },
                "judge" :{
                    "${resMap["判断题"][0].id}":getSingleAnswer('${resMap["判断题"][0].id}'),
                    "${resMap["判断题"][1].id}":getSingleAnswer('${resMap["判断题"][1].id}')
                }
            };
            $.ajax({
                data: JSON.stringify(answerJson),
                dataType: "json",
                contentType: "application/json",
                url: "getExamResult",
                success: function (res) {
                    console.log(res);
                    if(res.code == "ok"){
                        window.location.href = "list"
                    }
                },
                type: "post"
            })
        }
    </script>
</head>
<body>
<div id="app">
    <div data-v-94cd13fa="" class="ant-layout">
        <!--导航栏-->
        <div data-v-94cd13fa="" class="header ant-layout-header" style="color: rgb(255, 255, 255);">
        <span data-v-94cd13fa="" style="font-size: 25px; margin-left: 0px;"><span data-v-94cd13fa="" class="ant-avatar ant-avatar-lg ant-avatar-circle ant-avatar-image" slot="avatar"><img
                src="${courseMsg.courseLogo}" height="40px" width="40px"></span>
             ${courseMsg.courseName}
            <span data-v-94cd13fa="" style="font-size: 10px;">${courseMsg.courseDescribe}</span>
        </span>
        <span data-v-94cd13fa="" style="float:right">
            <%--倒计时--%>
            <span style="position:absolute;right: 710px;font-size: 18px">距离考试结束还剩</span>
           <span data-v-94cd13fa="" style="position:absolute;right:580px;font-size:18px;">
                <div id="remainSeconds" style="display:none">5400</div>
                <div id="remainTime" style="font-size:18px;font-weight:600;color:white"></div>
            </span>
             <button type="button" class="btn btn-info" style="position:absolute;right:280px;top:20px;" id="submit" onclick="submitExam()">交卷</button>
        </span>
        </div>
        <!--主体-->
        <div data-v-94cd13fa="" class="ant-layout ant-layout-has-sider">
            <!--主体左边-->
            <div data-v-94cd13fa="" class="ant-layout-sider ant-layout-sider-dark"
                 style="flex: 0 0 190px; max-width: 190px; min-width: 190px; width: 190px; background: rgb(68, 68, 68); overflow: auto; height: 100vh; position: fixed; left: 0px;">
                <div class="panel-group" id="accordion" style="width: 188px;">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseTwo">
                                    单选题(每题5分)
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ol>
                                    <li>
                                        <button type="button" id="1"
                                                style="border: none;font-size: 17px;color:green" >第1题<span id = "1ok"></span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button" id="2"
                                                style="border: none;color: green;font-size: 17px" >第2题<span id = "2ok"></span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button" id="3"
                                                style="border: none;color: green;font-size: 17px" >第3题<span id = "3ok"></span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button" id="4"
                                                style="border: none;color: green;font-size: 17px">第4题<span id = "4ok"></span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button" id="5" style="border: none;color: green;font-size: 17px">第5题<span id = "5ok"></span>
                                        </button>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseThree">
                                    多选题(每题5分)
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ol>
                                    <li>
                                        <button type="button" id="6"
                                                style="border: none;font-size: 17px;color:#31708F" >第1题<span id = "6ok"></span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button" id="7"
                                                style="border: none;color:#31708F;font-size: 17px" >第2题<span id = "7ok"></span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button" id="8"
                                                style="border: none;color:#31708F;font-size: 17px" >第3题<span id = "8ok"></span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button" id="9"
                                                style="border: none;color:#31708F;font-size: 17px">第4题<span id = "9ok"></span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button" id="10" style="border: none;color:#31708F;font-size: 17px">第5题<span id = "10ok"></span>
                                        </button>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseFour">
                                    判断题(每题5分)
                                </a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ol>
                                    <li>
                                        <button type="button" id="11"
                                                style="border: none;font-size: 17px;color:#8A6D3B" >第1题<span id = "11ok"></span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button" id="12"
                                                style="border: none;color:#8A6D3B;font-size: 17px" >第2题<span id = "12ok"></span>
                                        </button>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--主体左右-->
            <div data-v-94cd13fa="" class="ant-layout" style="margin-left: 200px;">
                <!--主体右边-->
                <div data-v-94cd13fa="" class="ant-layout-content"
                     style="margin: 24px 16px 0px; height: 84vh; overflow: initial;">
                    <div data-v-94cd13fa="" style="padding: 24px; background: rgb(255, 255, 255); height: 84vh;text-align: center">
                        <span data-v-94cd13fa="" style="font-size: 30px;color: #444444" id="index">
                            欢迎参加Java考试，请点击左侧题目编号开始答题！<br/>
                        </span>
                        <strong data-v-94cd13fa="" id="type" style="font-size: 15px"></strong>
                        <p data-v-94cd13fa="" id="question" style="font-size: 15px"></p>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t1">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][0].id}" value="A"><span id="t1optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][0].id}" value="B"><span  id="t1optionB"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][0].id}"  value="C"><span  id="t1optionC"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][0].id}"  value="D"><span  id="t1optionD"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t2">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][1].id}"  value="A"><span id="t2optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][1].id}"  value="B"><span  id="t2optionB"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][1].id}"  value="C"><span  id="t2optionC"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][1].id}" value="D"><span  id="t2optionD"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t3">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][2].id}"  value="A"><span id="t3optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][2].id}"  value="B"><span  id="t3optionB"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][2].id}"  value="C"><span  id="t3optionC"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][2].id}" value="D"><span  id="t3optionD"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t4">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][3].id}"  value="A"><span id="t4optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][3].id}"  value="B"><span  id="t4optionB"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][3].id}"  value="C"><span  id="t4optionC"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][3].id}" value="D"><span  id="t4optionD"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t5">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][4].id}"  value="A"><span id="t5optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][4].id}"  value="B"><span  id="t5optionB"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][4].id}"  value="C"><span  id="t5optionC"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["单选题"][4].id}" value="D"><span  id="t5optionD"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t6">
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][0].id}"  value="A"><span id="t6optionA"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][0].id}"  value="B"><span  id="t6optionB"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][0].id}"  value="C"><span  id="t6optionC"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][0].id}" value="D"><span  id="t6optionD"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t7">
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][1].id}"  value="A"><span id="t7optionA"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][1].id}"  value="B"><span  id="t7optionB"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][1].id}"  value="C"><span  id="t7optionC"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][1].id}" value="D"><span  id="t7optionD"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t8">
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][2].id}"  value="A"><span id="t8optionA"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][2].id}"  value="B"><span  id="t8optionB"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][2].id}"  value="C"><span  id="t8optionC"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][2].id}" value="D"><span  id="t8optionD"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t9">
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][3].id}"  value="A"><span id="t9optionA"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][3].id}"  value="B"><span  id="t9optionB"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][3].id}"  value="C"><span  id="t9optionC"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][3].id}" value="D"><span  id="t9optionD"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t10">
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][4].id}"  value="A"><span id="t10optionA"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][4].id}"  value="B"><span  id="t10optionB"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][4].id}"  value="C"><span  id="t10optionC"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" name="${resMap["多选题"][4].id}" value="D"><span  id="t10optionD"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t11">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["判断题"][0].id}" value="A"><span id="t11optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["判断题"][0].id}" value="B"><span  id="t11optionB"></span>
                                </label>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t12">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["判断题"][1].id}" value="A"><span id="t12optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="${resMap["判断题"][1].id}" value="B"><span  id="t12optionB"></span>
                                </label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
