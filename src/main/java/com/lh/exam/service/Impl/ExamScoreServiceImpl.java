package com.lh.exam.service.Impl;

import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lh.exam.mapper.*;
import com.lh.exam.model.dto.*;
import com.lh.exam.model.entity.ExamScoreEntity;
import com.lh.exam.model.entity.UserJudgeEntity;
import com.lh.exam.model.entity.UserMultiplyEntity;
import com.lh.exam.model.entity.UserSingleEntity;
import com.lh.exam.service.ExamScoreService;
import com.lh.exam.utils.ExamUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

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
            scoreDto.setId(examScoreEntity.getId());
            examScoreDtos.add(scoreDto);

        }
        return examScoreDtos;
    }

    @Override
    public List<ExamScoreDto> getExamDetailByFilter(String username,String type,Integer score,String beginTime,String endTime) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<ExamScoreEntity> examScoreEntities = new ArrayList<>();
        if(!"".equals(beginTime)){
            beginTime = beginTime+" 00:00:00";
        }
        if(!"".equals(endTime)){
            endTime = endTime +" 23:59:59";
        }
        if("".equals(type)){
            examScoreEntities = examScoreMapper.getExamDetailByFilter1(userInfoMapper.getIdByUsername(username),score,beginTime,endTime);
        }else {
            examScoreEntities = examScoreMapper.getExamDetailByFilter(userInfoMapper.getIdByUsername(username),courseMapper.getCourseId('%'+type+'%'),score,beginTime,endTime);
        }
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
