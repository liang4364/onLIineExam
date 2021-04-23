package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.dto.SingleChoiceDto;
import com.lh.exam.model.entity.SingleChoiceEntity;
import org.apache.ibatis.annotations.*;
import java.util.List;

@Mapper
public interface SingleChoiceMapper  extends BaseMapper<SingleChoiceEntity> {
    @Select("(select id,type,question,optionA,optionB,optionC,optionD,answer,single_difficult as difficult  from single_choice where course_id = #{courseId} and single_difficult = '易' order by rand() limit 0,2)\n" +
            "\tUNION\n" +
            "(select id,type,question,optionA,optionB,optionC,optionD,answer,single_difficult as difficult from single_choice where course_id = #{courseId} and single_difficult = '中' order by rand() limit 0,2)\n" +
            "\tUNION\n" +
            "(select id,type,question,optionA,optionB,optionC,optionD,answer,single_difficult as difficult from single_choice where course_id = #{courseId} and single_difficult = '难' order by rand() limit 0,1)")
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

    @Select("select id,type,single_difficult as difficult,question,optionA,optionB,optionC,optionD,answer,analysis,create_time,update_time,course_id,creator from single_choice where id = #{id}")
    QuestionDto getQuestionById(String id);

    @Update("<script>update single_choice " +
            "\t<trim prefix='set' suffixOverrides=','>"+
            "\t<if test=\"field == 'question'\">\n" +
            "\t\tquestion = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'optionA'\">\n" +
            "\t\toptionA = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'optionB'\">\n" +
            "\t\toptionB = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'optionC'\">\n" +
            "\t\toptionC = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'optionD'\">\n" +
            " \t\toptionD = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'answer'\">\n" +
            " \t\tanswer = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'analysis'\">\n" +
            " \t\tanalysis = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'type'\">\n" +
            " \t\ttype = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"updateTime != '' \">\n" +
            " \t\tupdate_time = #{updateTime}\n" +
            "\t</if>\n" +
            "</trim>"+
            "  where id = #{typeId}"+
            "</script>")
    int updateSingle(String field, String value, String typeId, String updateTime);

    @Select("select answer from single_choice where id = #{typeId}")
    String getAnswer(String typeId);

    @Insert("INSERT INTO single_choice  ( id, course_id, type, creator, question, optionA, optionB, optionC, optionD, answer, analysis )  VALUES  ( #{id}, #{courseId},#{type},#{creator}, #{question}, #{optionA}, #{optionB},  #{optionC}, #{optionD}, #{answer},#{analysis} )")
    int insertQuestion(SingleChoiceEntity singleChoiceEntity);

    @Delete("delete from single_choice where id = #{questionId}")
    int deleteQuestion(String questionId);

}
