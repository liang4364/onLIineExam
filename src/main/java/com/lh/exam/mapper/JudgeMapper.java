package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.dto.JudgeDto;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.dto.SingleChoiceDto;
import com.lh.exam.model.entity.JudgeEntity;
import com.lh.exam.model.entity.MultiplyChoiceEntity;
import com.lh.exam.model.entity.SingleChoiceEntity;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

    @Select("select id,type,question,optionA,optionB,answer,analysis,create_time,update_time,course_id,creator from judge where id = #{id}")
    QuestionDto getQuestionById(String id);

    @Update("<script>update judge " +
            "\t<trim prefix='set' suffixOverrides=','>"+
            "\t<if test=\"field == 'optionA'\">\n" +
            "\t\toptionA = #{value}\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'optionB'\">\n" +
            "\t\toptionB = #{value}\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'answer'\">\n" +
            " \t\tanswer = #{value}\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'analysis'\">\n" +
            " \t\tanalysis = #{value}\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'type'\">\n" +
            " \t\ttype = #{value}\n" +
            "\t</if>\n" +
            "</trim>"+
            ",update_time = #{updateTime} where id = #{typeId}"+
            "</script>")
    int updateJudge(String field,String value,String typeId,String updateTime);

    @Select("select answer from judge where id = #{typeId}")
    String getAnswer(String typeId);

    @Insert("INSERT INTO single_choice  ( id, course_id, type, creator, question, optionA, optionB, answer, analysis )  VALUES  ( #{id}, #{courseId},#{type},#{creator}, #{question}, #{optionA}, #{optionB}, #{answer},#{analysis} )")
    int insertQuestion(JudgeEntity judgeEntity);
}
