package com.lh.exam.service.Impl;

import com.lh.exam.mapper.JudgeMapper;
import com.lh.exam.model.dto.JudgeDto;
import com.lh.exam.model.entity.JudgeEntity;
import com.lh.exam.service.JudgeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JudgeServiceImpl implements JudgeService {

    @Autowired
    JudgeMapper judgeMapper;

    @Override
    public List<JudgeDto> queryAll(String courseId) {
        return judgeMapper.queryAll(courseId);
    }

    @Override
    public void insertData(JudgeEntity judgeEntity) {
        judgeMapper.insertData(judgeEntity);
    }
}
