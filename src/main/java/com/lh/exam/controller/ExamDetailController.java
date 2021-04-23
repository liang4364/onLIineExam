package com.lh.exam.controller;


import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.ExamScoreDto;
import com.lh.exam.model.enums.Result2Enum;
import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.service.ExamScoreService;
import com.lh.exam.utils.ResultVoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            res = examScoreService.getExamDetailByFilter(username,type,null,beginTime,endTime);
        }
        if(res != null){
            return ResultVoUtil.successResult2Vo(res);
        }
        return ResultVoUtil.errorResult2Vo(Result2Enum.UNKNOWN_EXCEPTION);
    }

    @RequestMapping("/getExamDetail1")
    public Map<String,Object> getExamDetail1(@RequestParam Integer page, @RequestParam Integer limit,String username){
        Page<ExamScoreDto> res = examScoreService.getExamDetail1(page,limit,username);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;

    }

    @RequestMapping("/queryByFilter1")
    public  Map<String,Object> getExamDetailByFilter1(@RequestParam Integer page, @RequestParam Integer limit,String username,String type,String score,String beginTime,String endTime){
        Map<String,Object> map = new HashMap<String,Object>();
        Page<ExamScoreDto>  res = new Page<>(page,limit);
        if(!"".equals(score)){
            res= examScoreService.getExamDetailByFilter1(username,type,Integer.valueOf(score),beginTime,endTime);
        }else {
            res =  examScoreService.getExamDetailByFilter1(username,type,null,beginTime,endTime);
        }
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;
    }

}
