package com.lh.exam.service.Impl;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.mapper.*;
import com.lh.exam.model.dto.*;
import com.lh.exam.model.entity.*;
import com.lh.exam.model.enums.Result2Enum;
import com.lh.exam.model.vo.QuestionAddVo;
import com.lh.exam.model.vo.QuestionFilterVo;
import com.lh.exam.model.vo.QuestionVo;
import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.service.QuestionManageService;
import com.lh.exam.utils.ExamUtil;
import com.lh.exam.utils.ResultVoUtil;
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
    
    @Autowired
    QuestionFilterMapper questionInfoMapper;

    @Autowired
    CourseMapper courseMapper;

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
                questionDto.setCourseName(courseMapper.getCourseName(questionDto.getCourseId()));
                if(questionDto.getCreateTime() != null){
                    questionDto.setCreateTime1(sdf.format(questionDto.getCreateTime()));
                }
               singleChoiceDtos.add(questionDto);
            }else if("multiply".equals(type)){
                questionDto  =  multiplyMapper.getQuestionById(questionEntity.getTypeId());
                questionDto.setCourseName(courseMapper.getCourseName(questionDto.getCourseId()));
                if(questionDto.getCreateTime() != null){
                    questionDto.setCreateTime1(sdf.format(questionDto.getCreateTime()));
                }
                multiplyDtos.add(questionDto);
            }else if("judge".equals(type)){
                questionDto = judgeMapper.getQuestionById(questionEntity.getTypeId());
                questionDto.setCourseName(courseMapper.getCourseName(questionDto.getCourseId()));
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
        Date date = new Date();
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
        }else if(questionVo.getDifficult() != null){
            field = "difficult";
        }
        if("single".equals(type)){
            value = "single_difficult";
            count = singleChoiceMapper.updateSingle(field,value,questionVo.getTypeId(),sdf.format(date));
        }else if("judge".equals(type)){
            value = "judge_difficult";
            count = judgeMapper.updateJudge(field,value,questionVo.getTypeId(),sdf.format(date));
        }else if("multiply".equals(type)){
            value = "multiply_difficult";
            if(!"answer".equals(field)){
                count =  multiplyMapper.updateMultiply(field,value,questionVo.getTypeId(),sdf.format(date));
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
        questionInfoMapper.updateQuestionFilter(field,value,questionVo.getTypeId(),sdf.format(date));
        return count;
    }

    @Override
    public Page<QuestionDto> getAllQuestionByFilter(QuestionFilterVo questionFilterVo) {
        if(!"".equals(questionFilterVo.getBeginTime())){
            questionFilterVo.setBeginTime(questionFilterVo.getBeginTime()+" 00:00:00");
        }
        if(!"".equals(questionFilterVo.getEndTime())){
            questionFilterVo.setEndTime(questionFilterVo.getEndTime() +" 23:59:59");
        }
        if(!"".equals(questionFilterVo.getUpdateBeginTime())){
            questionFilterVo.setUpdateBeginTime(questionFilterVo.getUpdateBeginTime()+" 00:00:00");
        }
        if(!"".equals(questionFilterVo.getUpdateEndTime())){
            questionFilterVo.setUpdateEndTime(questionFilterVo.getUpdateEndTime() +" 23:59:59");
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Page<QuestionInfoEntity> page1 = new Page<>(questionFilterVo.getPage(),questionFilterVo.getLimit());
        Page<QuestionDto> resPage = new Page<>(questionFilterVo.getPage(),questionFilterVo.getLimit());
        page1.setRecords(questionInfoMapper.getQuestionByFilter(page1,questionFilterVo));
        List<QuestionDto> res = new ArrayList<>();
        List<QuestionInfoEntity> records = page1.getRecords();
        for(QuestionInfoEntity questionInfoEntity : records){
            QuestionDto questionDto = new QuestionDto();
            BeanUtils.copyProperties(questionInfoEntity,questionDto);
            questionDto.setId(questionInfoEntity.getTypeId());
            if(questionDto.getCreateTime() != null){
                questionDto.setCreateTime1(sdf.format(questionDto.getCreateTime()));
            }
            if("多选题".equals(questionInfoEntity.getType())){
                String multiplyAnswer = "";
                List<String> multiplyAnswers = multiplyMapper.getMultiplyAnswer(questionInfoEntity.getTypeId());
                Collections.sort(multiplyAnswers);
                for(String answer : multiplyAnswers){
                    multiplyAnswer = multiplyAnswer+ answer+",";
                }
                multiplyAnswer = multiplyAnswer.substring(0,multiplyAnswer.length()-1);
                questionDto.setAnswer(multiplyAnswer);
            }else if("单选题".equals(questionInfoEntity.getType())){
                questionDto.setAnswer(singleChoiceMapper.getAnswer(questionInfoEntity.getTypeId()));
            }else if("判断题".equals(questionInfoEntity.getType())){
                questionDto.setAnswer(judgeMapper.getAnswer(questionInfoEntity.getTypeId()));
            }
            res.add(questionDto);
        }
        BeanUtils.copyProperties(page1,resPage);
        resPage.setRecords(res);
        return resPage;
    }

    @Override
    public Result2Vo insertQuestion(QuestionAddVo questionAddVo) {
        String answer = questionAddVo.getAnswer();
        String type = questionAddVo.getType();
        int count = -1;
        answer = answer.substring(0,answer.length()-1);
        QuestionEntity questionEntity = new QuestionEntity();
        QuestionInfoEntity questionInfoEntity = new QuestionInfoEntity();
        if("single".equals(type)){
            if(answer.contains(",")){
                return ResultVoUtil.errorResult2Vo(Result2Enum.SINGLE_ERROR);
            }
            SingleChoiceEntity singleChoiceEntity = new SingleChoiceEntity();
            BeanUtils.copyProperties(questionAddVo,singleChoiceEntity);
            String typeId = IdUtil.simpleUUID();
            singleChoiceEntity.setId(typeId);
            singleChoiceEntity.setCourseId(courseMapper.getCourseIdByName(questionAddVo.getCourse()));
            singleChoiceEntity.setType("单选题");
            singleChoiceEntity.setAnswer(answer);
            count = singleChoiceMapper.insertQuestion(singleChoiceEntity);
            questionEntity.setId(IdUtil.simpleUUID());
            questionEntity.setType(type);
            questionEntity.setTypeId(typeId);

            BeanUtils.copyProperties(questionAddVo,questionInfoEntity);
            questionInfoEntity.setId(IdUtil.simpleUUID());
            questionInfoEntity.setType("单选题");
            questionInfoEntity.setCourseName(questionAddVo.getCourse());
            questionInfoEntity.setTypeId(typeId);
            questionInfoMapper.insertQuestion(questionInfoEntity);

        }else if("multiply".equals(type)){
            if(!answer.contains(",")){
                return ResultVoUtil.errorResult2Vo(Result2Enum.MULTIPLY_ERROR);
            }
            MultiplyChoiceEntity multiplyChoiceEntity = new MultiplyChoiceEntity();
            BeanUtils.copyProperties(questionAddVo,multiplyChoiceEntity);
            multiplyChoiceEntity.setCourseId(courseMapper.getCourseIdByName(questionAddVo.getCourse()));
            String questionId = IdUtil.simpleUUID();
            multiplyChoiceEntity.setId(questionId);
            multiplyChoiceEntity.setType("多选题");

            BeanUtils.copyProperties(questionAddVo,questionInfoEntity);
            questionInfoEntity.setId(IdUtil.simpleUUID());
            questionInfoEntity.setType("多选题");
            questionInfoEntity.setTypeId(questionId);
            questionInfoEntity.setCourseName(questionAddVo.getCourse());
            questionInfoMapper.insertQuestion(questionInfoEntity);

            questionEntity.setId(IdUtil.simpleUUID());
            questionEntity.setType(type);
            questionEntity.setTypeId(questionId);
            count = multiplyMapper.insertQuestion(multiplyChoiceEntity);
            String[] answerArray = answer.split(",");
            for(int i = 0;i<answerArray.length;i++){
                multiplyMapper.insertNewAnswer(IdUtil.simpleUUID(),questionId,answerArray[i]);
            }
        }else if("judge".equals(type)){
            if(answer.contains(",") || "C".equals(answer) ||"D".equals(answer)){
                return ResultVoUtil.errorResult2Vo(Result2Enum.JUDGE_ERROR);
            }

            JudgeEntity judgeEntity = new JudgeEntity();
            BeanUtils.copyProperties(questionAddVo,judgeEntity);
            judgeEntity.setType("判断题");
            String typeId = IdUtil.simpleUUID();
            judgeEntity.setCourseId(courseMapper.getCourseIdByName(questionAddVo.getCourse()));
            judgeEntity.setId(IdUtil.simpleUUID());
            judgeEntity.setAnswer(answer);
            count = judgeMapper.insertQuestion(judgeEntity);

            BeanUtils.copyProperties(questionAddVo,questionInfoEntity);
            questionInfoEntity.setId(IdUtil.simpleUUID());
            questionInfoEntity.setType("判断题");
            questionInfoEntity.setTypeId(typeId);
            questionInfoEntity.setCourseName(questionAddVo.getCourse());
            questionInfoMapper.insertQuestion(questionInfoEntity);

            questionEntity.setId(typeId);
            questionEntity.setType(type);
            questionEntity.setTypeId(typeId);
        }
        questionMapper.insert(questionEntity);
        return ResultVoUtil.successResult2Vo(count);
    }

    @Override
    public int deleteQuestion(String questionId) {
        String type = questionMapper.getTypeById(questionId);
        int typeCount = -1;
        int questionCount = -1;
        int questionFilterCount = -1;
        if("single".equals(type)){
            typeCount = singleChoiceMapper.deleteQuestion(questionId);
        }else if("multiply".equals(type)){
            typeCount = multiplyMapper.deleteQuestion(questionId);
        }else if("judge".equals(type)){
            typeCount = judgeMapper.deleteQuestion(questionId);
        }
        questionCount = questionMapper.deleteQuestion(questionId);
        questionFilterCount = questionInfoMapper.deleteQuestion(questionId);
        if(typeCount != -1 && questionCount != -1 && questionFilterCount != -1){
            return typeCount+questionCount+questionFilterCount;
        }
        return -1;
    }
}
