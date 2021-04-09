package com.lh.exam.service.Impl;

import cn.hutool.core.util.IdUtil;
import com.lh.exam.mapper.CourseMapper;
import com.lh.exam.mapper.ExamScoreMapper;
import com.lh.exam.mapper.UserInfoMapper;
import com.lh.exam.model.dto.ExamScoreDto;
import com.lh.exam.model.entity.ExamScoreEntity;
import com.lh.exam.service.ExamScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class ExamScoreServiceImpl implements ExamScoreService {

    @Autowired
    ExamScoreMapper examScoreMapper;

    @Autowired
    UserInfoMapper userInfoMapper;

    @Autowired
    CourseMapper courseMapper;

    @Override
    public List<ExamScoreDto> getExamDetail(String username) {
        List<ExamScoreEntity> examScoreEntities = examScoreMapper.getExamDetail(userInfoMapper.getIdByUsername(username));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<ExamScoreDto> examScoreDtos = new ArrayList<>();
        for(ExamScoreEntity examScoreEntity : examScoreEntities){
            ExamScoreDto scoreDto = new ExamScoreDto();
            scoreDto.setUserName(username);
            scoreDto.setCourseName(courseMapper.getCourseName(examScoreEntity.getCourseId()));
            scoreDto.setCreateTime(sdf.format(examScoreEntity.getCreateTime()));
            scoreDto.setScore(examScoreEntity.getScore());
            examScoreDtos.add(scoreDto);
        }
        return examScoreDtos;
    }

    @Override
    public List<ExamScoreDto> getExamDetailByFilter(String username,String type,int score,String beginTime,String endTime) {
        String scoreStr = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if(!"".equals(beginTime)){
            beginTime = beginTime+" 00:00:00";
        }
        if(!"".equals(endTime)){
            endTime = endTime +" 23:59:59";
        }
        if(score != -1){
           scoreStr = String.valueOf(score);
        }
        List<ExamScoreEntity> examScoreEntities = examScoreMapper.getExamDetailByFilter(userInfoMapper.getIdByUsername(username),courseMapper.getCourseId(type),scoreStr,beginTime,endTime);
        List<ExamScoreDto> examScoreDtos = new ArrayList<>();
        for(ExamScoreEntity examScoreEntity : examScoreEntities){
            ExamScoreDto scoreDto = new ExamScoreDto();
            scoreDto.setUserName(username);
            scoreDto.setCourseName(courseMapper.getCourseName(examScoreEntity.getCourseId()));
            scoreDto.setCreateTime(sdf.format(examScoreEntity.getCreateTime()));
            scoreDto.setScore(examScoreEntity.getScore());
            examScoreDtos.add(scoreDto);
        }
        return examScoreDtos;
    }
}
