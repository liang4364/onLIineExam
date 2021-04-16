package com.lh.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.enums.Result2Enum;
import com.lh.exam.model.vo.QuestionFilterVo;
import com.lh.exam.model.vo.QuestionVo;
import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.service.QuestionManageService;
import com.lh.exam.utils.ExamUtil;
import com.lh.exam.utils.ResultVoUtil;
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

    @RequestMapping("getAllQuestionByFilter")
    public Map<String,Object> getAllQuestionByFilter(QuestionFilterVo questionFilterVo){
        return null;
    }

    @RequestMapping("/updateQuestion")
    public Result2Vo updateQuestion(HttpServletRequest request){
        QuestionVo questionVo = new QuestionVo();
        questionVo.setTypeId(request.getParameter("typeId"));
        questionVo.setQuestion(request.getParameter("question"));
        questionVo.setOptionA(request.getParameter("optionA"));
        questionVo.setOptionB(request.getParameter("optionB"));
        questionVo.setOptionC(request.getParameter("optionC"));
        questionVo.setOptionD(request.getParameter("optionD"));
        questionVo.setAnswer(request.getParameter("answer"));
        questionVo.setAnalysis(request.getParameter("analysis"));
        int count = questionManageService.updateQuestion(questionVo);
        if(count != -1){
            return ResultVoUtil.successResult2Vo(count);
        }
        return ResultVoUtil.errorResult2Vo(Result2Enum.UNKNOWN_EXCEPTION);
    }

}
