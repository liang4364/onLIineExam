package com.lh.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.vo.QuestionVo;
import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.service.QuestionManageService;
import com.lh.exam.utils.ExamUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
public class QuestionManageController {

    @Autowired
    QuestionManageService questionManageService;

    @RequestMapping("/getAllQuestion")
    public Map<String,Object> getAllQuestion(Integer page,Integer limit){
        Page<QuestionDto> res = questionManageService.getAllQuestion(page,limit);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;
    }

    @RequestMapping("/updateQuestion")
    public Result2Vo updateQuestion(QuestionVo questionVo){
        System.out.println(questionVo);
        return null;

    }

}
