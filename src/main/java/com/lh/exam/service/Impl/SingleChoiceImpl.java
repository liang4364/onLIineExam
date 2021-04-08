package com.lh.exam.service.Impl;

import com.lh.exam.mapper.SingleChoiceMapper;
import com.lh.exam.model.dto.SingleChoiceDto;
import com.lh.exam.service.SingleChoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SingleChoiceImpl implements SingleChoiceService {
    @Autowired
    SingleChoiceMapper singleChoiceMapper;

    @Override
    public List<SingleChoiceDto> querySingleChoice(String courseId) {
        return singleChoiceMapper.querySingleChoice(courseId);
    }
}
