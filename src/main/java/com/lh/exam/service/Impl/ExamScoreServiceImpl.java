package com.lh.exam.service.Impl;

import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lh.exam.mapper.*;
import com.lh.exam.model.dto.*;
import com.lh.exam.model.entity.ExamScoreEntity;
import com.lh.exam.model.entity.UserJudgeEntity;
import com.lh.exam.model.entity.UserMultiplyEntity;
import com.lh.exam.model.entity.UserSingleEntity;
import com.lh.exam.service.ExamScoreService;
import com.lh.exam.utils.ExamUtil;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ExamScoreServiceImpl extends ServiceImpl<ExamScoreMapper,ExamScoreEntity> implements ExamScoreService {

    @Autowired
    ExamScoreMapper examScoreMapper;

    @Autowired
    UserInfoMapper userInfoMapper;

    @Autowired
    CourseMapper courseMapper;

    @Autowired
    QuestionMapper questionMapper;
    @Autowired
    SingleChoiceMapper singleChoiceMapper;



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
    public Page<ExamScoreDto> getExamDetail1(Integer page, Integer limit, String username) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Page<ExamScoreEntity> page1 = new Page<>(page,limit);
        Page<ExamScoreDto> resPage = new Page<>(page,limit);
        Page<ExamScoreEntity> res = page1.setRecords(examScoreMapper.getExamDetail1(page1,userInfoMapper.getIdByUsername(username)));
        List<ExamScoreEntity> records = res.getRecords();
        List<ExamScoreDto> resRecords = new ArrayList<>();
        for(ExamScoreEntity examScoreEntity : records){
            ExamScoreDto scoreDto = new ExamScoreDto();
            scoreDto.setUserName(username);
            scoreDto.setCourseName(courseMapper.getCourseName(examScoreEntity.getCourseId()));
            scoreDto.setCreateTime(sdf.format(examScoreEntity.getCreateTime()));
            scoreDto.setScore(examScoreEntity.getScore());
            scoreDto.setId(examScoreEntity.getId());
            scoreDto.setSingleScore(examScoreEntity.getSingleScore());
            scoreDto.setMultiplyScore(examScoreEntity.getMultiplyScore());
            scoreDto.setJudgeScore(examScoreEntity.getJudgeScore());
            resRecords.add(scoreDto);
        }
        BeanUtils.copyProperties(page1,resPage);
        resPage.setRecords(resRecords);
        return resPage;
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
            examScoreEntities = examScoreMapper.getExamDetailByFilter(userInfoMapper.getIdByUsername(username),courseMapper.getCourseIdByLike('%'+type+'%'),score,beginTime,endTime);
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


    @Override
    public Page<ExamScoreDto> getExamDetailByFilter1(String username,String type,Integer score,String beginTime,String endTime) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Page<ExamScoreEntity> page1 = new Page<>(1,10);
        Page<ExamScoreDto> resPage = new Page<>(1,10);
        List<ExamScoreEntity> records = new ArrayList<>();
        if(!"".equals(beginTime)){
            beginTime = beginTime+" 00:00:00";
        }
        if(!"".equals(endTime)){
            endTime = endTime +" 23:59:59";
        }
        if("".equals(type)){
            records = examScoreMapper.getExamDetailByFilter33(page1,userInfoMapper.getIdByUsername(username),score,beginTime,endTime);
        }else {
            records = examScoreMapper.getExamDetailByFilter22(page1,userInfoMapper.getIdByUsername(username),courseMapper.getCourseIdByLike('%'+type+'%'),score,beginTime,endTime);
        }
        List<ExamScoreDto> resRecords = new ArrayList<>();
        for(ExamScoreEntity examScoreEntity : records){
            ExamScoreDto scoreDto = new ExamScoreDto();
            scoreDto.setUserName(username);
            scoreDto.setCourseName(courseMapper.getCourseName(examScoreEntity.getCourseId()));
            scoreDto.setCreateTime(sdf.format(examScoreEntity.getCreateTime()));
            scoreDto.setScore(examScoreEntity.getScore());
            scoreDto.setId(examScoreEntity.getId());
            scoreDto.setSingleScore(examScoreEntity.getSingleScore());
            scoreDto.setMultiplyScore(examScoreEntity.getMultiplyScore());
            scoreDto.setJudgeScore(examScoreEntity.getJudgeScore());
            resRecords.add(scoreDto);
        }
        resPage.setTotal(resRecords.size());
        resPage.setRecords(resRecords);
        return resPage;
    }
}
