package com.lh.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.dto.SingleChoiceDto;
import com.lh.exam.model.vo.QuestionFilterVo;
import com.lh.exam.model.vo.QuestionVo;

import java.util.List;

public interface QuestionManageService {
    Page<QuestionDto> getAllQuestion(Integer page, Integer limit);

    int updateQuestion(QuestionVo questionVo);

    Page<QuestionDto> getAllQuestionByFilter(QuestionFilterVo questionFilterVo);
}
