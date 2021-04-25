package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.dto.QuestionDto;
import com.lh.exam.model.dto.ShortAnswerDto;
import com.lh.exam.model.dto.SingleChoiceDto;
import com.lh.exam.model.entity.ShortAnswerEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface ShortAnswerMapper extends BaseMapper<ShortAnswerEntity> {

    @Select("select * from short_answer where course_id = #{courseId} order by rand() limit 0,1 ")
    List<ShortAnswerDto> queryShortAnswer(String courseId);

    @Select("select * from short_answer where id = #{id}")
    ShortAnswerDto getShortQuestionById(String id);

    @Select("select * from short_answer where id = #{id}")
    QuestionDto getQuestionById(String id);

    @Select("select answer from short_answer where id = #{id}")
    String getAnswer(String id);

    @Update("<script>update short_answer " +
            "\t<trim prefix='set' suffixOverrides=','>"+
            "\t<if test=\"field == 'question'\">\n" +
            "\t\tquestion = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'answer'\">\n" +
            " \t\tanswer = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'analysis'\">\n" +
            " \t\tanalysis = #{value},\n" +
            "\t</if>\n" +
            "\t<if test=\"updateTime != '' \">\n" +
            " \t\tupdate_time = #{updateTime}\n" +
            "\t</if>\n" +
            "</trim>"+
            "  where id = #{typeId}"+
            "</script>")
    int updateShort(String field,String value,String typeId,String updateTime);
}
