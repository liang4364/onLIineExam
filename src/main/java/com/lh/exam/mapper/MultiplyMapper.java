package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.dto.MultiplyDto;
import com.lh.exam.model.dto.QuestionDto;
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

    @Select("select id,type,question,optionA,optionB,optionC,optionD,analysis from multiply_choice where id = #{id}")
    MultiplyDto getMultiplyQuestionById(String id);

    @Select({
            "<script>",
            "SELECT * FROM multiply_choice where id in",
            "<foreach collection='list' item='item' open='(' separator=',' close=')'>",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    List<QuestionDto> getMultiplyQuestions(List<String> ids);

    @Select("select id,type,question,optionA,optionB,optionC,optionD,analysis,create_time,update_time from multiply_choice where id = #{id}")
    QuestionDto getQuestionById(String id);
}
