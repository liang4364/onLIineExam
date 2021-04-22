package com.lh.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.ScoreAnalysisDto;
import com.lh.exam.model.vo.ScoreFilterVo;

import java.util.List;
import java.util.Map;

public interface ScoreAnalysisService {
    List<Map<String,String>> getCourseAnalysisByClass(String collegeName,String className);

    Page<ScoreAnalysisDto> getTableData(Integer page, Integer limit);

    Page<ScoreAnalysisDto> getTableDataByFilter(ScoreFilterVo scoreFilterVo);

    List<String> queryCollege();

    List<String> queryClassByCollege(String college);
}
