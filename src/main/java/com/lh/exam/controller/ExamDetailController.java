package com.lh.exam.controller;

import com.lh.exam.model.dto.ExamScoreDto;
import com.lh.exam.model.enums.Result2Enum;
import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.service.ExamScoreService;
import com.lh.exam.utils.ResultVoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class ExamDetailController {

    @Autowired
    ExamScoreService examScoreService;

    @RequestMapping("/getExamDetail")
    public Result2Vo getExamDetail(String username){
        List<ExamScoreDto> res = examScoreService.getExamDetail(username);
        if(res != null){
            return ResultVoUtil.successResult2Vo(res);
        }
           return ResultVoUtil.errorResult2Vo(Result2Enum.UNKNOWN_EXCEPTION);
    }

    @RequestMapping("/queryByFilter")
    public  Result2Vo getExamDetailByFilter(String username,String type,String score,String beginTime,String endTime){
        List<ExamScoreDto> res = new ArrayList<>();
        if(!"".equals(score)){
            res  = examScoreService.getExamDetailByFilter(username,type,Integer.valueOf(score),beginTime,endTime);
        }else {
            res = examScoreService.getExamDetailByFilter(username,type,-1,beginTime,endTime);
        }
        if(res != null){
            return ResultVoUtil.successResult2Vo(res);
        }
        return ResultVoUtil.errorResult2Vo(Result2Enum.UNKNOWN_EXCEPTION);
    }
}
