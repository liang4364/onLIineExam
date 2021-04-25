package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.entity.UserShortEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserShortMapper extends BaseMapper<UserShortEntity> {

    @Select("select short_id from user_short where exam_id = #{examId} and user_id = #{userId} and course_id = #{courseId}")
    String getShortQuestions(String examId, String userId, String courseId);

    @Select("select user_answer from user_short where short_id = #{questionId} and exam_id = #{examId} ")
    String getUserAnswerById(String questionId,String examId);

}
