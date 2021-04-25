package com.lh.exam.service.Impl;

import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lh.exam.mapper.*;
import com.lh.exam.model.dto.*;
import com.lh.exam.model.entity.*;
import com.lh.exam.service.ExamService;
import com.lh.exam.utils.ExamUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ExamServiceImpl implements ExamService {

    @Autowired
    CourseMapper courseMapper;

    @Autowired
    ExamScoreMapper examScoreMapper;

    @Autowired
    UserInfoMapper userInfoMapper;

    @Autowired
    UserSingleMapper userSingleMapper;

    @Autowired
    UserMultiplyMapper userMultiplyMapper;

    @Autowired
    UserJudgeMapper userJudgeMapper;

    @Autowired
    SingleChoiceMapper singleChoiceMapper;

    @Autowired
    MultiplyMapper multiplyMapper;

    @Autowired
    JudgeMapper judgeMapper;

    @Autowired
    ShortAnswerMapper shortAnswerMapper;

    @Autowired
    UserShortMapper userShortMapper;


    @Override
    public CourseDto queryCourse(String courseName) {
        return courseMapper.queryCourse(courseName);
    }

    @Override
    public int insertExamMsg(HttpServletRequest request, HttpSession session) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        JSONObject jsonObject = JSONObject.parseObject(ExamUtil.readJSONStringFromRequestBody(request));
        Map<String, List> resMap = (Map<String, List>) session.getAttribute("resMap");
        Date beginTime = (Date) session.getAttribute("beginTime");
        //正确答案
        JSONArray singleJsonArray = (JSONArray) resMap.get("单选题");
        JSONArray multiplyJsonArray = (JSONArray) resMap.get("多选题");
        JSONArray judgeJsonArray = (JSONArray) resMap.get("判断题");
        JSONArray shortJsonArray = (JSONArray) resMap.get("简答题");
        //用户答案
        List<SingleChoiceDto> singleAnswer = singleJsonArray.toJavaList(SingleChoiceDto.class);
        List<MultiplyDto> multiplyAnswer = multiplyJsonArray.toJavaList(MultiplyDto.class);
        List<JudgeDto> judgeAnswer = judgeJsonArray.toJavaList(JudgeDto.class);
        List<ShortAnswerDto> shortAnswer = shortJsonArray.toJavaList(ShortAnswerDto.class);
        int score = 0;
        int singleScore = 0;
        int multiplyScore = 0;
        int judgeScore = 0;
        int shortScore = 0;
        String examId = IdUtil.simpleUUID();
        CourseDto courseDto = (CourseDto) session.getAttribute("courseMsg");
        String userId = userInfoMapper.getIdByUsername((String) session.getAttribute("username"));
        //用户提交的答案和session中存储的题的答案进行比较（单选题评分逻辑）
        JSONObject userSingleAnswer = (JSONObject) jsonObject.get("single");
        Set<String> userSingleQuestionId = userSingleAnswer.keySet();
        Iterator<String> singleIterator = userSingleQuestionId.iterator();
        while (singleIterator.hasNext()){
            String questionId = singleIterator.next();

            //插入数据（user_single）
            UserSingleEntity userSingleEntity = new UserSingleEntity();
            userSingleEntity.setExamId(examId);
            userSingleEntity.setId(IdUtil.simpleUUID());
            userSingleEntity.setSingleId(questionId);
            userSingleEntity.setUserId(userId);
            userSingleEntity.setCourseId(courseDto.getId());
            userSingleEntity.setUserAnswer((String)(userSingleAnswer.get(questionId)));
            userSingleMapper.insert(userSingleEntity);


            for(SingleChoiceDto singleChoiceDto : singleAnswer){
                if(userSingleAnswer.get(questionId) != null && questionId.equals(singleChoiceDto.getId())){
                    if(singleChoiceDto.getAnswer().equals(userSingleAnswer.get(questionId))){
                        singleScore = singleScore +5;
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
            UserMultiplyEntity userMultiplyEntity = new UserMultiplyEntity();
            userMultiplyEntity.setId(IdUtil.simpleUUID());
            userMultiplyEntity.setExamId(examId);
            userMultiplyEntity.setMultiplyId(questionId);
            userMultiplyEntity.setUserId(userId);
            userMultiplyEntity.setCourseId(courseDto.getId());
            String[] userAnswer = new String[4];
            for(MultiplyDto multiplyDto : multiplyAnswer){
                if(questionId.equals(multiplyDto.getId())){
                    List<String> answer = multiplyDto.getAnswer();
                    JSONArray userArray = (JSONArray) userMultiplyAnswer.get(questionId);
                    int answerCount = 0;
                    for(String a : answer){
                        for(int i = 0;i<userArray.size();i++){
                            if(userArray.get(i) != null){
                                userAnswer[i] = (String) userArray.get(i);
                            }
                            if(userArray.get(i) != null && a.equals(userArray.get(i))){
                                answerCount++;
                                if(answerCount == userArray.size()){
                                    multiplyScore = multiplyScore + 5;
                                    score = score+5;
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            String userAnswerStr = "";
            for(int i = 0;i<userAnswer.length;i++){
                if(userAnswer[i] != null){
                    userAnswerStr = userAnswerStr+userAnswer[i]+",";
                }
            }
            if(!"".equals(userAnswerStr)){
                userAnswerStr = userAnswerStr.substring(0,userAnswerStr.length()-1);
            }
            userMultiplyEntity.setUserAnswer(userAnswerStr);
            userMultiplyMapper.insert(userMultiplyEntity);
        }
        //判断题评分逻辑(同选择题)
        JSONObject userJudgeAnswer = (JSONObject) jsonObject.get("judge");
        Set<String> userJudgeQuestionId = userJudgeAnswer.keySet();
        Iterator<String> judgeIterator = userJudgeQuestionId.iterator();
        while (judgeIterator.hasNext()){
            String questionId = judgeIterator.next();
            UserJudgeEntity userJudgeEntity = new UserJudgeEntity();
            userJudgeEntity.setId(IdUtil.simpleUUID());
            userJudgeEntity.setExamId(examId);
            userJudgeEntity.setJudgeId(questionId);
            userJudgeEntity.setUserId(userId);
            userJudgeEntity.setCourseId(courseDto.getId());
            userJudgeEntity.setUserAnswer((String) userJudgeAnswer.get(questionId));
            userJudgeMapper.insert(userJudgeEntity);
            for(JudgeDto judgeDto : judgeAnswer){
                if(userJudgeAnswer.get(questionId) != null && questionId.equals(judgeDto.getId())){
                    if(judgeDto.getAnswer().equals(userJudgeAnswer.get(questionId))){
                        judgeScore = judgeScore + 5;
                        score = score+5;
                    }
                }
            }
        }

        //简答题评分逻辑
        JSONObject userShortAnswer = (JSONObject) jsonObject.get("short");
        Set<String> userShortQuestionId = userShortAnswer.keySet();
        Iterator<String> shortIterator = userShortQuestionId.iterator();
        while (shortIterator.hasNext()){
            String questionId = shortIterator.next();
            UserShortEntity userShortEntity = new UserShortEntity();
            userShortEntity.setId(IdUtil.simpleUUID());
            userShortEntity.setExamId(examId);
            userShortEntity.setShortId(questionId);
            userShortEntity.setUserId(userId);
            userShortEntity.setCourseId(courseDto.getId());
            userShortEntity.setUserAnswer((String) userShortAnswer.get(questionId));
            userShortMapper.insert(userShortEntity);
            for(ShortAnswerDto shortDto : shortAnswer){
                if(userShortAnswer.get(questionId) != null && questionId.equals(shortDto.getId())){
                    String[] answer = shortDto.getAnswer().split(",");
                    for(int i = 0;i<answer.length;i++){
                        if(((String) userShortAnswer.get(questionId)).contains(answer[i])){
                            shortScore = shortScore + 8;
                            score = score+8;
                        }
                    }
                }
            }
        }

        //插入数据（exam_score）
        ExamScoreEntity examScoreEntity = new ExamScoreEntity();
        examScoreEntity.setCourseId(courseDto.getId());
        examScoreEntity.setId(examId);
        UserEntity userEntity = userInfoMapper.getUserById(userId);
        examScoreEntity.setUserCollege(userEntity.getUserCollege());
        examScoreEntity.setUserClass(userEntity.getUserClass());
        examScoreEntity.setUserId(userId);
        examScoreEntity.setScore(score);
        examScoreEntity.setSingleScore(singleScore);
        examScoreEntity.setMultiplyScore(multiplyScore);
        examScoreEntity.setJudgeScore(judgeScore);
        examScoreEntity.setShortScore(shortScore);
        examScoreEntity.setBeginTime(sdf.format(beginTime));
        examScoreMapper.insert(examScoreEntity);
        return score;
    }

    @Override
    public List<UserSingleDto> getUserSingleMsg(String examId,String userName,String courseName) {
        List<UserSingleDto> userSingleDtos = new ArrayList<>();
        List<String> userSingleQuestions = userSingleMapper.getSingleQuestions(examId,userInfoMapper.getIdByUsername(userName),courseMapper.getCourseIdByName(courseName));
            for(String singleQuestionId : userSingleQuestions){
            UserSingleDto userSingleDto = new UserSingleDto();
            SingleChoiceDto singleChoiceDto = singleChoiceMapper.getSingleQuestionById(singleQuestionId);
            userSingleDto.setType(singleChoiceDto.getType());
            userSingleDto.setAnswer(singleChoiceDto.getAnswer());
            userSingleDto.setUserAnswer(userSingleMapper.getUserAnswerById(singleChoiceDto.getId(),examId));
            userSingleDto.setQuestion(singleChoiceDto.getQuestion());
            userSingleDto.setOptionB(singleChoiceDto.getOptionB());
            userSingleDto.setOptionA(singleChoiceDto.getOptionA());
            userSingleDto.setOptionC(singleChoiceDto.getOptionC());
            userSingleDto.setOptionD(singleChoiceDto.getOptionD());
            userSingleDto.setQuestionId(singleChoiceDto.getId());
            userSingleDto.setAnalysis(singleChoiceDto.getAnalysis());
            userSingleDtos.add(userSingleDto);
        }
        return userSingleDtos;
    }

    @Override
    public List<UserMultiplyDto> getUserMultiplyMsg(String examId,String userName,String courseName) {
        List<UserMultiplyDto> userMultiplyDtos = new ArrayList<>();
        List<String> userSingleQuestionIds = userMultiplyMapper.getMultiplyQuestions(examId,userInfoMapper.getIdByUsername(userName),courseMapper.getCourseIdByName(courseName));
        for(String multiplyQuestionId : userSingleQuestionIds){
            UserMultiplyDto userMultiplyDto = new UserMultiplyDto();
            String answer = "";
            MultiplyDto multiplyDto = multiplyMapper.getMultiplyQuestionById(multiplyQuestionId);
            List<String> multiplyAnswers = multiplyMapper.getMultiplyAnswer(multiplyQuestionId);
            Collections.sort(multiplyAnswers);
            for(String multiplyAnswer : multiplyAnswers){
                answer = answer + multiplyAnswer+",";
            }
            answer = answer.substring(0,answer.length()-1);
            userMultiplyDto.setType(multiplyDto.getType());
            userMultiplyDto.setQuestion(multiplyDto.getQuestion());
            userMultiplyDto.setAnswer(answer);
            userMultiplyDto.setUserAnswer(userMultiplyMapper.getUserAnswerById(multiplyQuestionId,examId));
            userMultiplyDto.setOptionA(multiplyDto.getOptionA());
            userMultiplyDto.setOptionB(multiplyDto.getOptionB());
            userMultiplyDto.setOptionC(multiplyDto.getOptionC());
            userMultiplyDto.setOptionD(multiplyDto.getOptionD());
            userMultiplyDto.setQuestionId(multiplyQuestionId);
            userMultiplyDto.setAnalysis(multiplyDto.getAnalysis());
            userMultiplyDtos.add(userMultiplyDto);
        }
        return userMultiplyDtos;
    }

    @Override
    public List<UserJudgeDto> getUserJudgeMsg(String examId,String userName,String courseName) {
        List<UserJudgeDto> userJudgeDtos = new ArrayList<>();
        List<String> userJudgeQuestions = userJudgeMapper.getJudgeQuestions(examId,userInfoMapper.getIdByUsername(userName),courseMapper.getCourseIdByName(courseName));
        for(String judgeQuestionId : userJudgeQuestions){
            UserJudgeDto userJudgeDto = new UserJudgeDto();
            JudgeDto judgeDto = judgeMapper.getJudgeQuestionById(judgeQuestionId);
            userJudgeDto.setType(judgeDto.getType());
            userJudgeDto.setAnswer(judgeDto.getAnswer());
            userJudgeDto.setUserAnswer(userJudgeMapper.getUserAnswerById(judgeDto.getId(),examId));
            userJudgeDto.setQuestion(judgeDto.getQuestion());
            userJudgeDto.setOptionB(judgeDto.getOptionB());
            userJudgeDto.setOptionA(judgeDto.getOptionA());
            userJudgeDto.setQuestionId(judgeQuestionId);
            userJudgeDto.setAnalysis(judgeDto.getAnalysis());
            userJudgeDtos.add(userJudgeDto);
        }
        return userJudgeDtos;
    }

    @Override
    public List<UserShortDto> getUserShortMsg(String examId, String userName, String courseName) {
        List<UserShortDto> userShortList = new ArrayList<>();
        String userShortQuestionId = userShortMapper.getShortQuestions(examId,userInfoMapper.getIdByUsername(userName),courseMapper.getCourseIdByName(courseName));
            UserShortDto userShortDto = new UserShortDto();
            ShortAnswerDto shortAnswerDto = shortAnswerMapper.getShortQuestionById(userShortQuestionId);
            BeanUtils.copyProperties(shortAnswerDto,userShortDto);
            userShortDto.setQuestionId(shortAnswerDto.getId());
            userShortDto.setUserAnswer(userShortMapper.getUserAnswerById(shortAnswerDto.getId(),examId));
            userShortList.add(userShortDto);
        return userShortList;
    }
}
