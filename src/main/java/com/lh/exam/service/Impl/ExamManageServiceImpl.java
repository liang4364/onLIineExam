package com.lh.exam.service.Impl;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.mapper.CourseMapper;
import com.lh.exam.mapper.ExamScoreMapper;
import com.lh.exam.mapper.UserInfoMapper;
import com.lh.exam.model.dto.ExamManageDto;
import com.lh.exam.model.entity.ExamScoreEntity;
import com.lh.exam.model.entity.UserEntity;
import com.lh.exam.model.vo.ExamFilterVo;
import com.lh.exam.service.ExamManageService;
import com.lh.exam.utils.ExamUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
    public Page<ExamManageDto> getAllExam(Integer page, Integer limit) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Page<ExamScoreEntity> page1 = new Page<>(page, limit);
        Page<ExamManageDto> page2 = new Page<>(page, limit);
        List<ExamManageDto> resList = new ArrayList<>();
        page1.setRecords(examScoreMapper.getAll(page1));
        for (ExamScoreEntity examScoreEntity : page1.getRecords()) {
            ExamManageDto examManageDto = new ExamManageDto();
            UserEntity userEntity = userInfoMapper.getUserById(examScoreEntity.getUserId());
            BeanUtils.copyProperties(examScoreEntity, examManageDto);
            examManageDto.setUserName(userEntity.getUsername());
            examManageDto.setUserEmail(userEntity.getUserEmail());
            examManageDto.setUserPhone(userEntity.getUserPhone());
            examManageDto.setUserCollege(userEntity.getUserCollege());
            examManageDto.setUserClass(userEntity.getUserClass());
            examManageDto.setCourseName(courseMapper.getCourseName(examScoreEntity.getCourseId()));
            examManageDto.setExamEndTime(sdf.format(examScoreEntity.getCreateTime()));
            examManageDto.setExamBeginTime(examScoreEntity.getBeginTime());
            if(examScoreEntity.getBeginTime() != null && examScoreEntity.getCreateTime() != null){
                try {
                    examManageDto.setExamTime(ExamUtil.dateDiff(examScoreEntity.getBeginTime(),sdf.format(examScoreEntity.getCreateTime())));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            examManageDto.setUserCreateTime(sdf.format(userEntity.getCreateTime()));
            resList.add(examManageDto);
        }
        BeanUtils.copyProperties(page1, page2);
        page2.setRecords(resList);
        return page2;
    }

    @Override
    public Page<ExamManageDto> getAllExamByFilter(ExamFilterVo examFilterVo) {
        if (!"".equals(examFilterVo.getUserCreateBeginTime())) {
            examFilterVo.setUserCreateBeginTime(examFilterVo.getUserCreateBeginTime() + " 00:00:00");
        }
        if (!"".equals(examFilterVo.getUserCreateEndTime())) {
            examFilterVo.setUserCreateEndTime(examFilterVo.getUserCreateEndTime() + " 23:59:59");
        }
        if (!"".equals(examFilterVo.getExamBeginTime())) {
            examFilterVo.setExamBeginTime(examFilterVo.getExamBeginTime() + " 00:00:00");
        }
        if (!"".equals(examFilterVo.getExamEndTime())) {
            examFilterVo.setExamEndTime(examFilterVo.getExamEndTime() + " 23:59:59");
        }
        if(!"".equals(examFilterVo.getCourse())){
            examFilterVo.setCourseId(courseMapper.getCourseIdByLikeConcat(examFilterVo.getCourse()));
        }else {
            examFilterVo.setCourseId("");
        }
        Page<ExamManageDto> page = new Page<>(examFilterVo.getPage(), examFilterVo.getLimit());
        page.setRecords(examScoreMapper.getAllByFilter(page, examFilterVo));
        for (ExamManageDto examManageDto : page.getRecords()) {
            examManageDto.setCourseName(courseMapper.getCourseName(examManageDto.getCourseId()));
            if(examManageDto.getExamBeginTime() != null &&examManageDto.getExamEndTime() != null){
                try {
                    examManageDto.setExamTime(ExamUtil.dateDiff(examManageDto.getExamBeginTime(),examManageDto.getExamEndTime()));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        }
        return page;
    }
}
