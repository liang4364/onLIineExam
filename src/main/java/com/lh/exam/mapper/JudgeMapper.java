package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.dto.JudgeDto;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.dto.SingleChoiceDto;
import com.lh.exam.model.entity.JudgeEntity;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface JudgeMapper extends BaseMapper<JudgeEntity> {

    @Select("select id,type,question,optionA,optionB,answer from judge where course_id = #{courseId} order by rand() limit 0,2")
    List<JudgeDto> queryAll(String courseId);

    @Insert("insert into judge (id,course_id,question,optionA,optionB,answer,type) values(#{id},#{courseId},#{question},#{optionA},#{optionB},#{answer},#{type})")
    void insertData(JudgeEntity judgeEntity);

    @Select("select id,type,question,optionA,optionB,answer,analysis from judge where id = #{id}")
    JudgeDto getJudgeQuestionById(String id);

    @Select({
            "<script>",
            "SELECT * FROM judge where id in",
            "<foreach collection='list' item='item' open='(' separator=',' close=')'>",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    List<QuestionDto> getJudgeQuestions(List<String> ids);

    @Select("select id,type,question,optionA,optionB,answer,analysis,create_time,update_time from judge where id = #{id}")
    QuestionDto getQuestionById(String id);
}
