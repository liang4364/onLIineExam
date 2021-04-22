package com.lh.exam.service.Impl;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.mapper.CollegeMapper;
import com.lh.exam.mapper.CourseMapper;
import com.lh.exam.mapper.ExamScoreMapper;
import com.lh.exam.mapper.UserInfoMapper;
import com.lh.exam.model.dto.ScoreAnalysisDto;
import com.lh.exam.model.vo.ScoreFilterVo;
import com.lh.exam.service.ScoreAnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ScoreAnalysisServiceImpl implements ScoreAnalysisService {
    @Autowired
    ExamScoreMapper examScoreMapper;

    @Autowired
    CourseMapper courseMapper;

    @Autowired
    UserInfoMapper userInfoMapper;

    @Autowired
    CollegeMapper collegeMapper;

    @Override
    public List<Map<String, String>> getCourseAnalysisByClass( String collegeName,String className) {
        List<Map<String, String>> list = new ArrayList<>();
        List<ScoreAnalysisDto> scoreAnalysisDtoList = examScoreMapper.getScoreAnalysisByCourse(collegeName,className);
        for(ScoreAnalysisDto scoreAnalysisDto : scoreAnalysisDtoList){
            Map<String,String> map = new HashMap<>();
            map.put("courseName",courseMapper.getCourseName(scoreAnalysisDto.getCourseId()));
            map.put("avgScore",String.valueOf(scoreAnalysisDto.getAvgScore()));
            map.put("maxScore",String.valueOf(scoreAnalysisDto.getMaxScore()));
            map.put("minScore",String.valueOf(scoreAnalysisDto.getMinScore()));
            map.put("avgSingleScore",String.valueOf(scoreAnalysisDto.getAvgSingleScore()));
            map.put("avgMultiplyScore",String.valueOf(scoreAnalysisDto.getAvgMultiplyScore()));
            map.put("avgJudgeScore",String.valueOf(scoreAnalysisDto.getAvgJudgeScore()));
            list.add(map);
        }

        return list;
    }

    @Override
    public List<String> queryCollege() {
        return collegeMapper.getAllCollege();
    }

    @Override
    public List<String> queryClassByCollege(String college) {
       return collegeMapper.getAllClass(college);
    }

    @Override
    public Page<ScoreAnalysisDto> getTableData(Integer page, Integer limit) {
        Page<ScoreAnalysisDto> resPage = new Page<>(page,limit);
        resPage.setRecords(examScoreMapper.getTableData(resPage));
        for(ScoreAnalysisDto scoreAnalysisDto : resPage.getRecords()){
            scoreAnalysisDto.setCollegeName("数学与计算机学院");
            scoreAnalysisDto.setClassName("计科11703");
            scoreAnalysisDto.setCourseName(courseMapper.getCourseName(scoreAnalysisDto.getCourseId()));
        }
        return  resPage;
    }

    @Override
    public Page<ScoreAnalysisDto> getTableDataByFilter(ScoreFilterVo scoreFilterVo) {
        Page<ScoreAnalysisDto> resPage = new Page<>(scoreFilterVo.getPage(),scoreFilterVo.getLimit());
        resPage.setRecords(examScoreMapper.getTableDataByFilter(resPage,scoreFilterVo.getCollege(),scoreFilterVo.getClassName()));
        for(ScoreAnalysisDto scoreAnalysisDto : resPage.getRecords()){
            scoreAnalysisDto.setCollegeName(scoreFilterVo.getCollege());
            scoreAnalysisDto.setClassName(scoreFilterVo.getClassName());
            scoreAnalysisDto.setCourseName(courseMapper.getCourseName(scoreAnalysisDto.getCourseId()));
        }
        return  resPage;
    }

    public static void main(String[] args) {
        System.out.println(IdUtil.simpleUUID());
    }
}
