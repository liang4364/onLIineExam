package com.lh.exam.service.Impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.mapper.JudgeMapper;
import com.lh.exam.mapper.MultiplyMapper;
import com.lh.exam.mapper.QuestionMapper;
import com.lh.exam.mapper.SingleChoiceMapper;
import com.lh.exam.model.dto.*;
import com.lh.exam.model.entity.QuestionEntity;
import com.lh.exam.service.QuestionManageService;
import com.lh.exam.utils.ExamUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
@Service
public class QuestionManageServiceImpl implements QuestionManageService {

    @Autowired
    QuestionMapper questionMapper;

    @Autowired
    SingleChoiceMapper singleChoiceMapper;

    @Autowired
    MultiplyMapper multiplyMapper;

    @Autowired
    JudgeMapper judgeMapper;

    @Override
    public Page<QuestionDto> getAllQuestion(Integer page,Integer limit) {
        List<QuestionDto> singleChoiceDtos = new ArrayList<>();
        List<QuestionDto> multiplyDtos = new ArrayList<>();;
        List<QuestionDto> judgeDtos = new ArrayList<>();;
        Page<QuestionEntity> page1 = new Page<>(page,limit);
        Page<QuestionDto> resPage = new Page<>(page,limit);
        Page<QuestionEntity> page2 = page1.setRecords(questionMapper.getAll(page1));
        List<QuestionEntity> records = page2.getRecords();
        for(QuestionEntity questionEntity : records){
            String type = questionEntity.getType();
            QuestionDto questionDto =null;
            if( "single".equals(type)){
                questionDto = singleChoiceMapper.getQuestionById(questionEntity.getTypeId());
               singleChoiceDtos.add(questionDto);
            }else if("multiply".equals(type)){
                questionDto  =  multiplyMapper.getQuestionById(questionEntity.getTypeId());
                multiplyDtos.add(questionDto);
            }else if("judge".equals(type)){
                questionDto = judgeMapper.getQuestionById(questionEntity.getTypeId());
                judgeDtos.add(questionDto);
            }
        }
        if(multiplyDtos.size()>0){
            for(QuestionDto multiplyDto : multiplyDtos){
                String multiplyAnswer = "";
                List<String> multiplyAnswers = multiplyMapper.getMultiplyAnswer(multiplyDto.getId());
                Collections.sort(multiplyAnswers);
                for(String answer : multiplyAnswers){
                    multiplyAnswer = multiplyAnswer+ answer+",";
                }
                multiplyAnswer = multiplyAnswer.substring(0,multiplyAnswer.length()-1);
                multiplyDto.setAnswer(multiplyAnswer);
            }
        }

        List<QuestionDto> questionDtoList = ExamUtil.mergeLists(singleChoiceDtos, multiplyDtos, judgeDtos);
        BeanUtils.copyProperties(page1,resPage);
        resPage.setRecords(questionDtoList);
        return resPage;
    }
}
