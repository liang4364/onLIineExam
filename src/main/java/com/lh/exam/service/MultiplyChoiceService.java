package com.lh.exam.service;

import com.lh.exam.model.dto.MultiplyDto;

import java.util.List;

public interface MultiplyChoiceService {
    List<MultiplyDto> query(String courseId);
}
