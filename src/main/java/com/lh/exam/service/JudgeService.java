package com.lh.exam.service;


import com.lh.exam.model.dto.JudgeDto;
import com.lh.exam.model.entity.JudgeEntity;

import java.util.List;

public interface JudgeService {
    List<JudgeDto> queryAll(String courseId);
    void insertData(JudgeEntity judgeEntity);
}
