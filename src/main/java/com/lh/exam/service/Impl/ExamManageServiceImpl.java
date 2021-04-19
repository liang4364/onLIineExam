package com.lh.exam.service.Impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.mapper.CourseMapper;
import com.lh.exam.mapper.ExamScoreMapper;
import com.lh.exam.mapper.UserInfoMapper;
import com.lh.exam.model.dto.ExamScoreDto;
import com.lh.exam.model.entity.ExamScoreEntity;
import com.lh.exam.model.vo.ExamFilterVo;
import com.lh.exam.service.ExamManageService;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ExamManageServiceImpl implements ExamManageService {
    @Autowired
    ExamScoreMapper examScoreMapper;

    @Autowired
    UserInfoMapper userInfoMapper;

    @Autowired
    CourseMapper courseMapper;

    @Override
    public Page<ExamScoreDto> getAllExam(Integer page, Integer limit) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Page<ExamScoreEntity> page1 = new Page(page, limit);
        Page<ExamScoreDto> page2 = new Page(page, limit);
        List<ExamScoreDto> resList = new ArrayList<>();
        page1.setRecords(examScoreMapper.getAll(page1));
        for (ExamScoreEntity examScoreEntity : page1.getRecords()) {
            ExamScoreDto examScoreDto = new ExamScoreDto();
            BeanUtils.copyProperties(examScoreEntity, examScoreDto);
            examScoreDto.setUserName(userInfoMapper.getUsernameById(examScoreEntity.getUserId()));
            examScoreDto.setCourseName(courseMapper.getCourseName(examScoreEntity.getCourseId()));
            examScoreDto.setCreateTime(sdf.format(examScoreEntity.getCreateTime()));
            resList.add(examScoreDto);
        }
        BeanUtils.copyProperties(page1, page2);
        page2.setRecords(resList);
        return page2;
    }

    @Override
    public Page<ExamScoreDto> getAllExamByFilter(ExamFilterVo examFilterVo) {
        if (!"".equals(examFilterVo.getBeginTime())) {
            examFilterVo.setBeginTime(examFilterVo.getBeginTime() + " 00:00:00");
        }
        if (!"".equals(examFilterVo.getEndTime())) {
            examFilterVo.setEndTime(examFilterVo.getEndTime() + " 23:59:59");
        }
        if(!"".equals(examFilterVo.getType())){
            examFilterVo.setCourseId(courseMapper.getCourseIdByLikeConcat(examFilterVo.getUsername()));
        }else {
            examFilterVo.setCourseId("");
        }
        if(!"".equals(examFilterVo.getUsername())){
            examFilterVo.setUserId(userInfoMapper.getIdByUsername(examFilterVo.getUsername()));
        }else {
            examFilterVo.setUserId("");
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Page<ExamScoreEntity> page1 = new Page(examFilterVo.getPage(), examFilterVo.getLimit());
        Page<ExamScoreDto> page2 = new Page(examFilterVo.getPage(), examFilterVo.getLimit());
        List<ExamScoreDto> resList = new ArrayList<>();
        page1.setRecords(examScoreMapper.getAllByFilter(page1, examFilterVo));
        for (ExamScoreEntity examScoreEntity : page1.getRecords()) {
            ExamScoreDto examScoreDto = new ExamScoreDto();
            BeanUtils.copyProperties(examScoreEntity, examScoreDto);
            examScoreDto.setUserName(userInfoMapper.getUsernameById(examScoreEntity.getUserId()));
            examScoreDto.setCourseName(courseMapper.getCourseName(examScoreEntity.getCourseId()));
            examScoreDto.setCreateTime(sdf.format(examScoreEntity.getCreateTime()));
            resList.add(examScoreDto);
        }
        BeanUtils.copyProperties(page1, page2);
        page2.setRecords(resList);
        return page2;
    }
}
