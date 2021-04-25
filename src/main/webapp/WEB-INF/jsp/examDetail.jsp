<%--
  Created by IntelliJ IDEA.
  User: liangheng
  Date: 2021/4/12
  Time: 9:56
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
            console.log(${resMap});
            $('#collapseTwo').collapse('show');
            let obj = JSON.stringify(${resMap});
            let json = JSON.parse(obj);
            if(json.单选题[0].userAnswer === "A"){
                $("#r1optionA").attr("checked",true);
            }else if(json.单选题[0].userAnswer === "B"){
                $("#r1optionB").attr("checked",true);
            }else if(json.单选题[0].userAnswer === "C"){
                $("#r1optionC").attr("checked",true);
            }else if(json.单选题[0].userAnswer === "D"){
                $("#r1optionD").attr("checked",true);
            };
            if(json.单选题[0].userAnswer !== json.单选题[0].answer){
                $("#1ok").attr("class","glyphicon glyphicon-remove")
            }else {
                $("#1ok").attr("class","glyphicon glyphicon-ok")
            }

            if(json.单选题[1].userAnswer === "A"){
                $("#r2optionA").attr("checked",true);
            }else if(json.单选题[1].userAnswer === "B"){
                $("#r2optionB").attr("checked",true);
            }else if(json.单选题[1].userAnswer === "C"){
                $("#r2optionC").attr("checked",true);
            }else if(json.单选题[1].userAnswer === "D"){
                $("#r2optionD").attr("checked",true);
            };
            if(json.单选题[1].userAnswer !== json.单选题[1].answer){
                $("#2ok").attr("class","glyphicon glyphicon-remove")
            }else {
                $("#2ok").attr("class","glyphicon glyphicon-ok")
            }

            if(json.单选题[2].userAnswer === "A"){
                $("#r3optionA").attr("checked",true);
            }else if(json.单选题[2].userAnswer === "B"){
                $("#r3optionB").attr("checked",true);
            }else if(json.单选题[2].userAnswer === "C"){
                $("#r3optionC").attr("checked",true);
            }else if(json.单选题[2].userAnswer === "D"){
                $("#r3optionD").attr("checked",true);
            };
            if(json.单选题[2].userAnswer !== json.单选题[2].answer){
                $("#3ok").attr("class","glyphicon glyphicon-remove")
            }else {
                $("#3ok").attr("class","glyphicon glyphicon-ok")
            }

            if(json.单选题[3].userAnswer === "A"){
                $("#r4optionA").attr("checked",true);
            }else if(json.单选题[3].userAnswer === "B"){
                $("#r4optionB").attr("checked",true);
            }else if(json.单选题[3].userAnswer === "C"){
                $("#r4optionC").attr("checked",true);
            }else if(json.单选题[3].userAnswer === "D"){
                $("#r4optionD").attr("checked",true);
            };
            if(json.单选题[3].userAnswer !== json.单选题[3].answer){
                $("#4ok").attr("class","glyphicon glyphicon-remove")
            }else {
                $("#4ok").attr("class","glyphicon glyphicon-ok")
            }

            if(json.单选题[4].userAnswer === "A"){
                $("#r5optionA").attr("checked",true);
            }else if(json.单选题[4].userAnswer === "B"){
                $("#r5optionB").attr("checked",true);
            }else if(json.单选题[4].userAnswer === "C"){
                $("#r5optionC").attr("checked",true);
            }else if(json.单选题[4].userAnswer === "D"){
                $("#r5optionD").attr("checked",true);
            };
            if(json.单选题[4].userAnswer !== json.单选题[4].answer){
                $("#5ok").attr("class","glyphicon glyphicon-remove")
            }else {
                $("#5ok").attr("class","glyphicon glyphicon-ok")
            }



            let multiplyAnswerArray1 = json.多选题[0].userAnswer.split(",");
            for(var i = 0;i<multiplyAnswerArray1.length;i++){
                if(multiplyAnswerArray1[i] === "A"){
                    $("#r6optionA").attr("checked",true);
                }else if(multiplyAnswerArray1[i] === "B"){
                    $("#r6optionB").attr("checked",true);
                }else if(multiplyAnswerArray1[i] === "C"){
                    $("#r6optionC").attr("checked",true);
                }else if(multiplyAnswerArray1[i] === "D"){
                    $("#r6optionD").attr("checked",true);
                }
            }
            if(json.多选题[0].userAnswer === json.多选题[0].answer){
                $("#6ok").attr("class","glyphicon glyphicon-ok")
            }else {
                $("#6ok").attr("class","glyphicon glyphicon-remove")
            }

            let multiplyAnswerArray2 = json.多选题[1].userAnswer.split(",");
            for(var i = 0;i<multiplyAnswerArray2.length;i++){
                if(multiplyAnswerArray2[i] === "A"){
                    $("#r7optionA").attr("checked",true);
                }else if(multiplyAnswerArray2[i] === "B"){
                    $("#r7optionB").attr("checked",true);
                }else if(multiplyAnswerArray2[i] === "C"){
                    $("#r7optionC").attr("checked",true);
                }else if(multiplyAnswerArray2[i] === "D"){
                    $("#r7optionD").attr("checked",true);
                }
            }
            if(json.多选题[1].userAnswer === json.多选题[1].answer){
                $("#7ok").attr("class","glyphicon glyphicon-ok")
            }else {
                $("#7ok").attr("class","glyphicon glyphicon-remove")
            }

            let multiplyAnswerArray3 = json.多选题[2].userAnswer.split(",");
            for(var i = 0;i<multiplyAnswerArray3.length;i++){
                if(multiplyAnswerArray3[i] === "A"){
                    $("#r8optionA").attr("checked",true);
                }else if(multiplyAnswerArray3[i] === "B"){
                    $("#r8optionB").attr("checked",true);
                }else if(multiplyAnswerArray3[i] === "C"){
                    $("#r8optionC").attr("checked",true);
                }else if(multiplyAnswerArray3[i] === "D"){
                    $("#r8optionD").attr("checked",true);
                }
            }
            if(json.多选题[2].userAnswer === json.多选题[2].answer){
                $("#8ok").attr("class","glyphicon glyphicon-ok")
            }else {
                $("#8ok").attr("class","glyphicon glyphicon-remove")
            }

            let multiplyAnswerArray4 = json.多选题[3].userAnswer.split(",");
            for(var i = 0;i<multiplyAnswerArray4.length;i++){
                if(multiplyAnswerArray4[i] === "A"){
                    $("#r9optionA").attr("checked",true);
                }else if(multiplyAnswerArray4[i] === "B"){
                    $("#r9optionB").attr("checked",true);
                }else if(multiplyAnswerArray4[i] === "C"){
                    $("#r9optionC").attr("checked",true);
                }else if(multiplyAnswerArray4[i] === "D"){
                    $("#r9optionD").attr("checked",true);
                }
            }
            if(json.多选题[3].userAnswer === json.多选题[3].answer){
                $("#9ok").attr("class","glyphicon glyphicon-ok")
            }else {
                $("#9ok").attr("class","glyphicon glyphicon-remove")
            }

            let multiplyAnswerArray5 = json.多选题[4].userAnswer.split(",");
            for(var i = 0;i<multiplyAnswerArray5.length;i++){
                if(multiplyAnswerArray5[i] === "A"){
                    $("#r10optionA").attr("checked",true);
                }else if(multiplyAnswerArray5[i] === "B"){
                    $("#r10optionB").attr("checked",true);
                }else if(multiplyAnswerArray5[i] === "C"){
                    $("#r10optionC").attr("checked",true);
                }else if(multiplyAnswerArray5[i] === "D"){
                    $("#r10optionD").attr("checked",true);
                }
            }
            if(json.多选题[4].userAnswer === json.多选题[4].answer){
                $("#10ok").attr("class","glyphicon glyphicon-ok")
            }else {
                $("#10ok").attr("class","glyphicon glyphicon-remove")
            }


            if(json.判断题[0].userAnswer === "A"){
                $("#r11optionA").attr("checked",true);
            }else if(json.判断题[0].userAnswer === "B"){
                $("#r11optionB").attr("checked",true);
            }
            if(json.判断题[0].userAnswer !== json.判断题[0].answer){
                $("#11ok").attr("class","glyphicon glyphicon-remove")
            }else {
                $("#11ok").attr("class","glyphicon glyphicon-ok")
            }

            if(json.判断题[1].userAnswer === "A"){
                $("#r12optionA").attr("checked",true);
            }else if(json.判断题[1].userAnswer === "B"){
                $("#r12optionB").attr("checked",true);
            }
            if(json.判断题[1].userAnswer !== json.判断题[1].answer){
                $("#12ok").attr("class","glyphicon glyphicon-remove")
            }else {
                $("#12ok").attr("class","glyphicon glyphicon-ok")
            }

            if(json.判断题[2].userAnswer === "A"){
                $("#r13optionA").attr("checked",true);
            }else if(json.判断题[2].userAnswer === "B"){
                $("#r13optionB").attr("checked",true);
            }
            if(json.判断题[2].userAnswer !== json.判断题[2].answer){
                $("#13ok").attr("class","glyphicon glyphicon-remove")
            }else {
                $("#13ok").attr("class","glyphicon glyphicon-ok")
            }

            $("#name").val(json.简答题[0].userAnswer);
            $("#name").attr("disabled","disabled");
            if(json.简答题[0].userAnswer.indexOf(json.简答题[0].answer) === -1){
                $("#14ok").attr("class","glyphicon glyphicon-remove")
            }else {
                $("#14ok").attr("class","glyphicon glyphicon-ok")
            }
            $('#1').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.单选题[0].type);
                $('#question').html(json.单选题[0].question);
                $('#t1optionA').html(json.单选题[0].optionA);
                $('#t1optionB').html(json.单选题[0].optionB);
                $('#t1optionC').html(json.单选题[0].optionC);
                $('#t1optionD').html(json.单选题[0].optionD);
            });
            $('#2').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.单选题[1].type);
                $('#question').html(json.单选题[1].question);
                $('#t2optionA').html(json.单选题[1].optionA);
                $('#t2optionB').html(json.单选题[1].optionB);
                $('#t2optionC').html(json.单选题[1].optionC);
                $('#t2optionD').html(json.单选题[1].optionD);
            });
            $('#3').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.单选题[2].type);
                $('#question').html(json.单选题[2].question);
                $('#t3optionA').html(json.单选题[2].optionA);
                $('#t3optionB').html(json.单选题[2].optionB);
                $('#t3optionC').html(json.单选题[2].optionC);
                $('#t3optionD').html(json.单选题[2].optionD);
            });
            $('#4').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.单选题[3].type);
                $('#question').html(json.单选题[3].question);
                $('#t4optionA').html(json.单选题[3].optionA);
                $('#t4optionB').html(json.单选题[3].optionB);
                $('#t4optionC').html(json.单选题[3].optionC);
                $('#t4optionD').html(json.单选题[3].optionD);
            });
            $('#5').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.单选题[4].type);
                $('#question').html(json.单选题[4].question);
                $('#t5optionA').html(json.单选题[4].optionA);
                $('#t5optionB').html(json.单选题[4].optionB);
                $('#t5optionC').html(json.单选题[4].optionC);
                $('#t5optionD').html(json.单选题[4].optionD);
            });
            $('#6').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.多选题[0].type);
                $('#question').html(json.多选题[0].question);
                $('#t6optionA').html(json.多选题[0].optionA);
                $('#t6optionB').html(json.多选题[0].optionB);
                $('#t6optionC').html(json.多选题[0].optionC);
                $('#t6optionD').html(json.多选题[0].optionD);
            });
            $('#7').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.多选题[1].type);
                $('#question').html(json.多选题[1].question);
                $('#t7optionA').html(json.多选题[1].optionA);
                $('#t7optionB').html(json.多选题[1].optionB);
                $('#t7optionC').html(json.多选题[1].optionC);
                $('#t7optionD').html(json.多选题[1].optionD);
            });
            $('#8').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.多选题[2].type);
                $('#question').html(json.多选题[2].question);
                $('#t8optionA').html(json.多选题[2].optionA);
                $('#t8optionB').html(json.多选题[2].optionB);
                $('#t8optionC').html(json.多选题[2].optionC);
                $('#t8optionD').html(json.多选题[2].optionD);
            });
            $('#9').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.多选题[3].type);
                $('#question').html(json.多选题[3].question);
                $('#t9optionA').html(json.多选题[3].optionA);
                $('#t9optionB').html(json.多选题[3].optionB);
                $('#t9optionC').html(json.多选题[3].optionC);
                $('#t9optionD').html(json.多选题[3].optionD);
            });
            $('#10').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.多选题[4].type);
                $('#question').html(json.多选题[4].question);
                $('#t10optionA').html(json.多选题[4].optionA);
                $('#t10optionB').html(json.多选题[4].optionB);
                $('#t10optionC').html(json.多选题[4].optionC);
                $('#t10optionD').html(json.多选题[4].optionD);
            });
            $('#11').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.判断题[0].type);
                $('#question').html(json.判断题[0].question);
                $('#t11optionA').html(json.判断题[0].optionA);
                $('#t11optionB').html(json.判断题[0].optionB);

            });
            $('#12').click(function () {
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
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:none");
                $('#type').html(json.判断题[1].type);
                $('#question').html(json.判断题[1].question);
                $('#t12optionA').html(json.判断题[1].optionA);
                $('#t12optionB').html(json.判断题[1].optionB);

            });
            $('#13').click(function () {
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
                $('#t12').attr("style","display:none");
                $('#t13').attr("style","display:block");
                $('#t14').attr("style","display:none");
                $('#type').html(json.判断题[2].type);
                $('#question').html(json.判断题[2].question);
                $('#t12optionA').html(json.判断题[2].optionA);
                $('#t12optionB').html(json.判断题[2].optionB);
            });
            $('#14').click(function () {
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
                $('#t12').attr("style","display:none");
                $('#t13').attr("style","display:none");
                $('#t14').attr("style","display:block");
                $('#type').html(json.简答题[0].type);
                $('#question').html(json.简答题[0].question);
            });
        });
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
                                    <li>
                                        <button type="button" id="13"
                                                style="border: none;color:#8A6D3B;font-size: 17px" >第3题<span id = "13ok"></span>
                                        </button>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne">
                                    简答题(每题20分)
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ol>
                                    <li>
                                        <button type="button" id="14"
                                                style="border: none;font-size: 17px;color:#8A6D3B" >第1题<span id = "14ok"></span>
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
                            参加Java考试，请点击左侧题目编号欢迎开始答题！<br/>
                        </span>
                        <strong data-v-94cd13fa="" id="type" style="font-size: 15px"></strong>
                        <p data-v-94cd13fa="" id="question" style="font-size: 15px"></p>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t1">
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r1optionA" disabled><span id="t1optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r1optionB" disabled><span  id="t1optionB"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" id="r1optionC" disabled><span  id="t1optionC"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r1optionD" disabled><span  id="t1optionD"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["单选题"][0].userAnswer}</td>
                                            <td>${resMap["单选题"][0].answer}</td>
                                            <td>${resMap["单选题"][0].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t2">
                            <div class="radio">
                                <label>
                                    <input type="radio"   value="A" id="r2optionA" disabled><span id="t2optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r2optionB" disabled><span  id="t2optionB"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r2optionC" disabled><span  id="t2optionC"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r2optionD" disabled><span  id="t2optionD"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["单选题"][1].userAnswer}</td>
                                            <td>${resMap["单选题"][1].answer}</td>
                                            <td>${resMap["单选题"][1].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t3">
                            <div class="radio">
                                <label>
                                    <input type="radio" id="r3optionA" disabled><span id="t3optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r3optionB" disabled><span  id="t3optionB"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" id="r3optionC" disabled><span  id="t3optionC"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r3optionD" disabled> <span  id="t3optionD"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["单选题"][2].userAnswer}</td>
                                            <td>${resMap["单选题"][2].answer}</td>
                                            <td>${resMap["单选题"][2].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t4">
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r4optionA" disabled><span id="t4optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r4optionB" disabled><span  id="t4optionB"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" id="r4optionC" disabled><span  id="t4optionC"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r4optionD" disabled><span  id="t4optionD"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["单选题"][3].userAnswer}</td>
                                            <td>${resMap["单选题"][3].answer}</td>
                                            <td>${resMap["单选题"][3].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t5">
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r5optionA" disabled><span id="t5optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" id="r5optionB" disabled><span  id="t5optionB"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r5optionC" disabled><span  id="t5optionC"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r5optionD" disabled><span  id="t5optionD"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["单选题"][4].userAnswer}</td>
                                            <td>${resMap["单选题"][4].answer}</td>
                                            <td>${resMap["单选题"][4].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t6">
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r6optionA" disabled><span id="t6optionA"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r6optionB" disabled><span  id="t6optionB"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r6optionC" disabled><span  id="t6optionC"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" id="r6optionD" disabled><span  id="t6optionD"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["多选题"][0].userAnswer}</td>
                                            <td>${resMap["多选题"][0].answer}</td>
                                            <td>${resMap["多选题"][0].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t7">
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r7optionA" disabled><span id="t7optionA"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r7optionB" disabled><span  id="t7optionB"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r7optionC" disabled><span  id="t7optionC"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r7optionD" disabled><span  id="t7optionD"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["多选题"][1].userAnswer}</td>
                                            <td>${resMap["多选题"][1].answer}</td>
                                            <td>${resMap["多选题"][1].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t8">
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"   value="A" id="r8optionA" disabled><span id="t8optionA"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  value="B" id="r8optionB" disabled><span  id="t8optionB"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"id="r8optionC" disabled><span  id="t8optionC"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r8optionD" disabled><span  id="t8optionD"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["多选题"][2].userAnswer}</td>
                                            <td>${resMap["多选题"][2].answer}</td>
                                            <td>${resMap["多选题"][2].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t9">
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r9optionA" disabled><span id="t9optionA"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r9optionB" disabled><span  id="t9optionB"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox" id="r9optionC" disabled><span  id="t9optionC"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r9optionD" disabled><span  id="t9optionD"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["多选题"][3].userAnswer}</td>
                                            <td>${resMap["多选题"][3].answer}</td>
                                            <td>${resMap["多选题"][3].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t10">
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r10optionA" disabled><span id="t10optionA"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r10optionB" disabled><span  id="t10optionB"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r10optionC" disabled><span  id="t10optionC"></span>
                                </label>
                            </div>
                            <div class="check-box">
                                <label>
                                    <input type="checkbox"  id="r10optionD" disabled><span  id="t10optionD"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["多选题"][4].userAnswer}</td>
                                            <td>${resMap["多选题"][4].answer}</td>
                                            <td>${resMap["多选题"][4].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t11">
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r11optionA" disabled><span id="t11optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r11optionB" disabled><span  id="t11optionB"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["判断题"][0].userAnswer}</td>
                                            <td>${resMap["判断题"][0].answer}</td>
                                            <td>${resMap["判断题"][0].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t12">
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r12optionA" disabled><span id="t12optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio"  id="r12optionB" disabled><span  id="t12optionB"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["判断题"][1].userAnswer}</td>
                                            <td>${resMap["判断题"][1].answer}</td>
                                            <td>${resMap["判断题"][1].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" class="ant-radio-group ant-radio-group-outline ant-radio-group-default" style="display: none" id="t13">
                            <div class="radio">
                                <label>
                                    <input type="radio" id="r13optionA"><span id="t13optionA"></span>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" id="r13optionB"><span  id="t13optionB"></span>
                                </label>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["判断题"][2].userAnswer}</td>
                                            <td>${resMap["判断题"][2].answer}</td>
                                            <td>${resMap["判断题"][2].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div data-v-94cd13fa="" style="display: none" id="t14">
                            <form role="form">
                                <div class="form-group">
                                    <label for="name">你的答案：</label>
                                    <textarea class="form-control" rows="3" id="name"></textarea>
                                </div>
                            </form>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">解析</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table">
                                        <tr>
                                            <th>您的答案</th>
                                            <th>正确答案</th>
                                            <th>解析</th>
                                        </tr>
                                        <tr>
                                            <td>${resMap["简答题"][0].userAnswer}</td>
                                            <td>${resMap["简答题"][0].answer}</td>
                                            <td>${resMap["简答题"][0].analysis}</td>
                                        <tr>
                                    </table>
                                </div>
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
