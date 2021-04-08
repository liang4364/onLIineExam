package com.lh.exam.service.Impl;

import com.lh.exam.mapper.MultiplyMapper;
import com.lh.exam.model.dto.MultiplyDto;
import com.lh.exam.service.MultiplyChoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MultiplyChoiceServiceImpl implements MultiplyChoiceService {

    @Autowired
    MultiplyMapper multiplyMapper;
    @Override
    public List<MultiplyDto> query(String courseId) {
        List<MultiplyDto> multiplyDtos = multiplyMapper.queryByCourseId(courseId);
        for(MultiplyDto multiplyDto : multiplyDtos){
           multiplyDto.setAnswer(multiplyMapper.getMultiplyAnswer(multiplyDto.getId()));
        }
        return multiplyDtos;
    }
}
