package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.entity.UserJudgeEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserJudgeMapper extends BaseMapper<UserJudgeEntity> {

    @Select("select judge_id from user_judge where exam_id = #{examId} and user_id = #{userId} and course_id = #{courseId}")
    List<String> getJudgeQuestions(String examId, String userId, String courseId);

    @Select("select user_answer from user_judge where judge_id = #{questionId} and exam_id = #{examId}")
    String getUserAnswerById(String questionId,String examId);
}
