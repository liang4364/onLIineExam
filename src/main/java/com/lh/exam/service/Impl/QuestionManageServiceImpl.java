package com.lh.exam.service.Impl;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.mapper.JudgeMapper;
import com.lh.exam.mapper.MultiplyMapper;
import com.lh.exam.mapper.QuestionMapper;
import com.lh.exam.mapper.SingleChoiceMapper;
import com.lh.exam.model.dto.*;
import com.lh.exam.model.entity.QuestionEntity;
import com.lh.exam.model.vo.QuestionFilterVo;
import com.lh.exam.model.vo.QuestionVo;
import com.lh.exam.service.QuestionManageService;
import com.lh.exam.utils.ExamUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
                if(questionDto.getCreateTime() != null){
                    questionDto.setCreateTime1(sdf.format(questionDto.getCreateTime()));
                }
               singleChoiceDtos.add(questionDto);
            }else if("multiply".equals(type)){
                questionDto  =  multiplyMapper.getQuestionById(questionEntity.getTypeId());
                if(questionDto.getCreateTime() != null){
                    questionDto.setCreateTime1(sdf.format(questionDto.getCreateTime()));
                }
                multiplyDtos.add(questionDto);
            }else if("judge".equals(type)){
                questionDto = judgeMapper.getQuestionById(questionEntity.getTypeId());
                if(questionDto.getCreateTime() != null){
                    questionDto.setCreateTime1(sdf.format(questionDto.getCreateTime()));
                }
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

    @Override
    public int updateQuestion(QuestionVo questionVo) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String type = questionMapper.getTypeById(questionVo.getTypeId());
        String field = "";
        String value = "";
        int count = -1;
        if(questionVo.getQuestion() != null){
            field = "question";
            value = questionVo.getQuestion();
        }else if(questionVo.getOptionA() != null){
            field = "optionA";
            value = questionVo.getOptionA();
        }else if(questionVo.getOptionB() != null){
            field = "optionB";
            value = questionVo.getOptionB();
        }else if(questionVo.getOptionC() != null){
            field = "optionC";
            value = questionVo.getOptionC();
        }else if(questionVo.getOptionD() != null){
            field = "optionD";
            value = questionVo.getOptionD();
        }else  if(questionVo.getAnswer() != null){
            field = "answer";
            value = questionVo.getAnswer();
        }else if(questionVo.getAnalysis() != null){
            field = "analysis";
            value = questionVo.getAnalysis();
        }
        if("single".equals(type)){
            count = singleChoiceMapper.updateSingle(field,value,questionVo.getTypeId(),sdf.format(new Date()));
        }else if("judge".equals(type)){
            count = judgeMapper.updateJudge(field,value,questionVo.getTypeId(),sdf.format(new Date()));
        }else if("multiply".equals(type)){
            if(!"answer".equals(field)){
                count =  multiplyMapper.updateMultiply(field,value,questionVo.getTypeId(),sdf.format(new Date()));
            }else{
                int res = multiplyMapper.deleteOldAnswer(questionVo.getTypeId());
                if(res != -1){
                    String[] newAnswers = value.split(",");
                    for (String newAnswer : newAnswers) {
                        int r = multiplyMapper.insertNewAnswer(IdUtil.simpleUUID(), questionVo.getTypeId(), newAnswer);
                        if (r == 1) {
                            count++;
                        }
                    }
                }
            }
        }
        return count;
    }

    @Override
    public Page<QuestionDto> getAllQuestionByFilter(QuestionFilterVo questionFilterVo) {
        List<String> typeIdsByFilter = questionMapper.getIdsByFilter(questionFilterVo.getType());
        //TODO BY LH
        return null;
    }
}
