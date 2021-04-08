package com.lh.exam.service;

import com.lh.exam.model.dto.SingleChoiceDto;

import java.util.List;

public interface SingleChoiceService {
    List<SingleChoiceDto> querySingleChoice(String courseId);
}
