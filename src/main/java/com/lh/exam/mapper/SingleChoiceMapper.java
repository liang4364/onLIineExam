package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.dto.SingleChoiceDto;
import com.lh.exam.model.entity.SingleChoiceEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SingleChoiceMapper  extends BaseMapper<SingleChoiceEntity> {
    @Select("select id,type,question,optionA,optionB,optionC,optionD,answer from single_choice where course_id = #{courseId} order by rand() limit 0,5")
    List<SingleChoiceDto> querySingleChoice(String courseId);

    @Select("select id,type,question,optionA,optionB,optionC,optionD,answer,analysis,create_time,update_time from single_choice where id = #{id}")
    SingleChoiceDto getSingleQuestionById(String id);

    @Select("select id,type,question,optionA,optionB,optionC,optionD,answer,analysis from single_choice")
    List<SingleChoiceDto> getAllSingleChoices(Page<SingleChoiceEntity> page);

    @Select({
            "<script>",
            "SELECT * FROM single_choice where id in",
            "<foreach collection='list' item='item' open='(' separator=',' close=')'>",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    List<QuestionDto> getSingleQuestions(List<String> ids);

    @Select("select id,type,question,optionA,optionB,optionC,optionD,answer,analysis,create_time,update_time from single_choice where id = #{id}")
    QuestionDto getQuestionById(String id);

}
