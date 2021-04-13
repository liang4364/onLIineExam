package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.entity.UserSingleEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserSingleMapper extends BaseMapper<UserSingleEntity> {

    @Select("select single_id from user_single where exam_id = #{examId} and user_id = #{userId} and course_id = #{courseId}")
    List<String> getSingleQuestions(String examId,String userId,String courseId);

    @Select("select user_answer from user_single where single_id = #{questionId} and exam_id = #{examId} ")
    String getUserAnswerById(String questionId,String examId);
}
