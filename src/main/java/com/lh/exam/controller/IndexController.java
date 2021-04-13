package com.lh.exam.controller;

import com.alibaba.fastjson.JSONObject;
import com.lh.exam.model.dto.*;
import com.lh.exam.service.ExamService;
import com.lh.exam.service.JudgeService;
import com.lh.exam.service.MultiplyChoiceService;
import com.lh.exam.service.SingleChoiceService;
import com.lh.exam.utils.ExamUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IndexController {
    @Autowired
    ExamService examService;
    @Autowired
    SingleChoiceService singleChoiceService;
    @Autowired
    MultiplyChoiceService multiplyChoiceService;
    @Autowired
    JudgeService judgeService;

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("/list")
    public String list(HttpServletRequest request){
        request.setAttribute("username",request.getParameter("username"));
        return "list";
    }

    @RequestMapping("/exam")
    public String exam(HttpServletRequest request,HttpSession session){
        CourseDto courseDto = examService.queryCourse(request.getParameter("courseName"));
        List<SingleChoiceDto> singleChoiceDtos = singleChoiceService.querySingleChoice(ExamUtil.getCourseId(courseDto.getCourseName()));
        List<MultiplyDto> multiplyDtos = multiplyChoiceService.query(ExamUtil.getCourseId(courseDto.getCourseName()));
        List<JudgeDto> judgeDtos = judgeService.queryAll(ExamUtil.getCourseId(courseDto.getCourseName()));
        Map<String,List> resMap = new HashMap<>();
        resMap.put("单选题",singleChoiceDtos);
        resMap.put("多选题",multiplyDtos);
        resMap.put("判断题",judgeDtos);
        JSONObject jsonObject = (JSONObject) JSONObject.toJSON(resMap);
        session.setAttribute("resMap",jsonObject);
        session.setAttribute("courseMsg",courseDto);
        session.setAttribute("username",request.getParameter("username"));
        return "exam";
    }

    @RequestMapping("register")
    public String registerUser(){
        return "register";
    }

    @RequestMapping("/examDetail")
    public String examDetail(){
        return "examDetail";
    }

}
