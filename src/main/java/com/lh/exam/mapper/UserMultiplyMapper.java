package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.entity.UserMultiplyEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMultiplyMapper extends BaseMapper<UserMultiplyEntity> {

    @Select("select multiply_id from user_multiply where exam_id = #{examId} and user_id = #{userId} and course_id = #{courseId}")
    List<String> getMultiplyQuestions(String examId,String userId,String courseId);

    @Select("select user_answer from user_multiply where multiply_id = #{questionId} and exam_id = #{examId}")
    String getUserAnswerById(String questionId,String examId);


}
