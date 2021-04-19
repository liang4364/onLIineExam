package com.lh.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.ExamScoreDto;
import com.lh.exam.model.vo.ExamFilterVo;

import java.util.List;

public interface ExamManageService {
    Page<ExamScoreDto> getAllExam(Integer page,Integer limit);
    Page<ExamScoreDto> getAllExamByFilter(ExamFilterVo examFilterVo);
}
