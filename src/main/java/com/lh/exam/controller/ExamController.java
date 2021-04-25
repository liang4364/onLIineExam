package com.lh.exam.controller;


import com.alibaba.fastjson.JSONObject;
import com.lh.exam.model.dto.*;
import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.service.ExamService;
import com.lh.exam.utils.ResultVoUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@RestController
public class ExamController {
    @Autowired
    ExamService examService;

    @RequestMapping("/insertExamMsg")
    public Result2Vo insertExamMsg(HttpServletRequest request, HttpSession session){
        int examScore = examService.insertExamMsg(request, session);
        return ResultVoUtil.successResult2Vo(examScore);
    }

    @RequestMapping("/lookDetail")
    public Result2Vo lookDetail(String examId,String userName,String courseName,HttpSession session){
        CourseDto courseDto = examService.queryCourse(courseName);
        List<UserSingleDto> userSingleDtos = examService.getUserSingleMsg(examId,userName,courseName);
        List<UserMultiplyDto> userMultiplyDtos = examService.getUserMultiplyMsg(examId,userName,courseName);
        List<UserJudgeDto> userJudgeDtos = examService.getUserJudgeMsg(examId,userName,courseName);
        List<UserShortDto> userShortDtos = examService.getUserShortMsg(examId, userName, courseName);
        Map<String,List> resMap = new HashMap<>();
        resMap.put("单选题",userSingleDtos);
        resMap.put("多选题",userMultiplyDtos);
        resMap.put("判断题",userJudgeDtos);
        resMap.put("简答题",userShortDtos);
        JSONObject jsonObject = (JSONObject) JSONObject.toJSON(resMap);
        session.setAttribute("resMap",jsonObject);
        session.setAttribute("courseMsg",courseDto);
        session.setAttribute("username",userName);
        return ResultVoUtil.successResult2Vo();
    }


}
