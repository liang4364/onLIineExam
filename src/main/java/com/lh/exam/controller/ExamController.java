package com.lh.exam.controller;


import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.service.ExamService;
import com.lh.exam.utils.ResultVoUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



@Slf4j
@RestController
public class ExamController {
    @Autowired
    ExamService examService;

    @RequestMapping("/getExamResult")
    public Result2Vo getExamResult(HttpServletRequest request, HttpSession session){
        int examScore = examService.getExamScore(request, session);
        return ResultVoUtil.successResult2Vo(examScore);
    }
}
