package com.lh.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.vo.QuestionAddVo;
import com.lh.exam.model.vo.QuestionFilterVo;
import com.lh.exam.model.vo.QuestionVo;
import com.lh.exam.model.vo.Result2Vo;


public interface QuestionManageService {
    Page<QuestionDto> getAllQuestion(Integer page, Integer limit);

    int updateQuestion(QuestionVo questionVo);

    Page<QuestionDto> getAllQuestionByFilter(QuestionFilterVo questionFilterVo);

    Result2Vo insertQuestion(QuestionAddVo questionAddVo);

}
