package com.lh.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.ScoreAnalysisDto;
import com.lh.exam.model.enums.Result2Enum;
import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.model.vo.ScoreFilterVo;
import com.lh.exam.service.ScoreAnalysisService;
import com.lh.exam.utils.ResultVoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ScoreAnalysisController {

    @Autowired
    ScoreAnalysisService scoreAnalysisService;

    @RequestMapping("/getScoreAnalysisByCourse")
    public Result2Vo getScoreAnalysisByCourse(@RequestParam("collegeName") String collegeName, @RequestParam("className")String className){
        List<Map<String, String>> res = scoreAnalysisService.getCourseAnalysisByClass(collegeName, className);
        if(res != null){
            return ResultVoUtil.successResult2Vo(res);
        }
        return ResultVoUtil.errorResult2Vo(Result2Enum.UNKNOWN_EXCEPTION);
    }

    @RequestMapping("/getTableData")
    public Map<String,Object> getTableData(Integer page, Integer limit){
        Page<ScoreAnalysisDto> res = scoreAnalysisService.getTableData(page,limit);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;
    }
    @RequestMapping("/getTableDataByFilter")
    public Map<String,Object> getTableData(ScoreFilterVo scoreFilterVo){
        Page<ScoreAnalysisDto> res = scoreAnalysisService.getTableDataByFilter(scoreFilterVo);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;
    }

    @RequestMapping("/queryCollege")
    public Result2Vo queryCollege(){
        List<String> res = scoreAnalysisService.queryCollege();
        if(res != null){
            return ResultVoUtil.successResult2Vo(res);
        }
        return ResultVoUtil.errorResult2Vo(Result2Enum.UNKNOWN_EXCEPTION);
    }

    @RequestMapping("/queryClass")
    public Result2Vo queryClass(HttpServletRequest request){
        List<String> res = scoreAnalysisService.queryClassByCollege(request.getParameter("college"));
        if(res != null){
            return ResultVoUtil.successResult2Vo(res);
        }
        return ResultVoUtil.errorResult2Vo(Result2Enum.UNKNOWN_EXCEPTION);
    }


}
