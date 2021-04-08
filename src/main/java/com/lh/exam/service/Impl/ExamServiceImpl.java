package com.lh.exam.service.Impl;

import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lh.exam.mapper.CourseMapper;
import com.lh.exam.mapper.ExamScoreMapper;
import com.lh.exam.mapper.UserInfoMapper;
import com.lh.exam.model.dto.CourseDto;
import com.lh.exam.model.dto.JudgeDto;
import com.lh.exam.model.dto.MultiplyDto;
import com.lh.exam.model.dto.SingleChoiceDto;
import com.lh.exam.model.entity.CourseEntity;
import com.lh.exam.model.entity.ExamScoreEntity;
import com.lh.exam.service.ExamService;
import com.lh.exam.utils.ExamUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class ExamServiceImpl implements ExamService {

    @Autowired
    CourseMapper courseMapper;

    @Autowired
    ExamScoreMapper examScoreMapper;

    @Autowired
    UserInfoMapper userInfoMapper;

    @Override
    public CourseDto queryCourse(String courseName) {
        return courseMapper.queryCourse(courseName);
    }

    @Override
    public void insertData(CourseEntity courseEntity) {
        courseMapper.insertData(courseEntity);
    }

    @Override
    public int getExamScore(HttpServletRequest request, HttpSession session) {
        JSONObject jsonObject = JSONObject.parseObject(ExamUtil.readJSONStringFromRequestBody(request));
        Map<String, List> resMap = (Map<String, List>) session.getAttribute("resMap");
        JSONArray singleJsonArray = (JSONArray) resMap.get("单选题");
        JSONArray multiplyJsonArray = (JSONArray) resMap.get("多选题");
        JSONArray judgeJsonArray = (JSONArray) resMap.get("判断题");
        List<SingleChoiceDto> singleAnswer = singleJsonArray.toJavaList(SingleChoiceDto.class);
        List<MultiplyDto> multiplyAnswer = multiplyJsonArray.toJavaList(MultiplyDto.class);
        List<JudgeDto> judgeAnswer = judgeJsonArray.toJavaList(JudgeDto.class);
        int score = 0;
        //用户提交的答案和session中存储的题的答案进行比较（单选题评分逻辑）
        JSONObject userSingleAnswer = (JSONObject) jsonObject.get("single");
        Set<String> userSingleQuestionId = userSingleAnswer.keySet();
        Iterator<String> singleIterator = userSingleQuestionId.iterator();
        while (singleIterator.hasNext()){
            String questionId = singleIterator.next();
            for(SingleChoiceDto singleChoiceDto : singleAnswer){
                if(userSingleAnswer.get(questionId) != null && questionId.equals(singleChoiceDto.getId())){
                    if(singleChoiceDto.getAnswer().equals(userSingleAnswer.get(questionId))){
                        score = score+5;
                    }
                }
            }
        }
        //多选题评分逻辑
        JSONObject userMultiplyAnswer = (JSONObject) jsonObject.get("multiply");
        Set<String> userMultiplyQuestionId = userMultiplyAnswer.keySet();
        Iterator<String> multiplyIterator = userMultiplyQuestionId.iterator();
        while (multiplyIterator.hasNext()){
            String questionId = multiplyIterator.next();
            for(MultiplyDto multiplyDto : multiplyAnswer){
                if(questionId.equals(multiplyDto.getId())){
                    List<String> answer = multiplyDto.getAnswer();
                    JSONArray userArray = (JSONArray) userMultiplyAnswer.get(questionId);
                    int answerCount = 0;
                    for(String a : answer){
                        for(int i = 0;i<userArray.size();i++){
                            if(userArray.get(i) != null && a.equals(userArray.get(i))){
                                answerCount++;
                                if(answerCount == userArray.size()){
                                    score = score+5;
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
        //判断题评分逻辑(同选择题)
        JSONObject userJudgeAnswer = (JSONObject) jsonObject.get("judge");
        Set<String> userJudgeQuestionId = userJudgeAnswer.keySet();
        Iterator<String> judgeIterator = userJudgeQuestionId.iterator();
        while (judgeIterator.hasNext()){
            String questionId = judgeIterator.next();
            for(JudgeDto judgeDto : judgeAnswer){
                if(userJudgeAnswer.get(questionId) != null && questionId.equals(judgeDto.getId())){
                    if(judgeDto.getAnswer().equals(userJudgeAnswer.get(questionId))){
                        score = score+5;
                    }
                }
            }
        }
        //插入数据（exam_score）
        CourseDto courseDto = (CourseDto) session.getAttribute("courseMsg");
        ExamScoreEntity examScoreEntity = new ExamScoreEntity();
        examScoreEntity.setCourseId(courseDto.getId());
        examScoreEntity.setId(IdUtil.simpleUUID());
        examScoreEntity.setUserId(userInfoMapper.getIdByUsername((String) session.getAttribute("username")));
        examScoreEntity.setScore(score);
        examScoreMapper.insert(examScoreEntity);
        return score;
    }
}
