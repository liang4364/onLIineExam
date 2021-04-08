package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.dto.MultiplyDto;
import com.lh.exam.model.entity.MultiplyChoiceEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MultiplyMapper extends BaseMapper<MultiplyChoiceEntity> {
    @Select("select id,type,question,optionA,optionB,optionC,optionD from multiply_choice where course_id = #{courseId} order by rand() limit 0,5")
    List<MultiplyDto> queryByCourseId(String courseId);

    @Select("select answer from multiply_answer where question_id = #{questionId}")
    List<String> getMultiplyAnswer(String questionId);
}
