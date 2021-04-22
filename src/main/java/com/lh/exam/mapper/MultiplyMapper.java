package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.dto.MultiplyDto;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.entity.MultiplyChoiceEntity;
import com.lh.exam.model.entity.SingleChoiceEntity;
import org.apache.ibatis.annotations.*;

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

    @Select("select id,type,question,optionA,optionB,optionC,optionD,analysis,create_time,update_time,course_id,creator from multiply_choice where id = #{id}")
    QuestionDto getQuestionById(String id);

    @Update("<script>update multiply_choice " +
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
            " where id = #{typeId}"+
            "</script>")
    int updateMultiply(String field,String value,String typeId,String updateTime);

    @Delete("delete from multiply_answer where question_id = #{typeId}")
    int deleteOldAnswer(String typeId);

    @Insert("insert into multiply_answer (id,question_id,answer) values (#{id},#{questionId},#{answer})")
    int insertNewAnswer(String id,String questionId,String answer);

    @Insert("INSERT INTO multiply_choice  ( id, course_id, type, creator, question, optionA, optionB, optionC, optionD, analysis )  VALUES  ( #{id}, #{courseId},#{type},#{creator}, #{question}, #{optionA}, #{optionB}, #{optionC}, #{optionD},#{analysis} )")
    int insertQuestion(MultiplyChoiceEntity multiplyChoiceEntity);


}
