package com.lh.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.ExamScoreDto;
import com.lh.exam.model.entity.ExamScoreEntity;


import java.util.List;
import java.util.Map;

public interface ExamScoreService {
    List<ExamScoreDto>  getExamDetail(String username);

    List<ExamScoreDto> getExamDetailByFilter(String username,String type,Integer score,String beginTime,String endTime);

   Page<ExamScoreDto> getExamDetail1(Integer page, Integer limit, String username);

    Page<ExamScoreDto> getExamDetailByFilter1(String username,String type,Integer score,String beginTime,String endTime);
}
