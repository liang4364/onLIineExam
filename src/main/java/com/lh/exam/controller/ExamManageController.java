package com.lh.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.ExamManageDto;
import com.lh.exam.model.dto.ExamScoreDto;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.vo.ExamFilterVo;
import com.lh.exam.service.ExamManageService;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class ExamManageController {
    @Autowired
    ExamManageService examManageService;

    @RequestMapping("/getAllExam")
    public Map<String,Object> getAllExam(Integer page, Integer limit){
        Page<ExamManageDto> res = examManageService.getAllExam(page, limit);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;
    }

    @RequestMapping("getAllExamByFilter")
    public Map<String,Object> getAllExamByFilter(ExamFilterVo examFilterVo){
        Page<ExamManageDto> res = examManageService.getAllExamByFilter(examFilterVo);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;
    }
}
