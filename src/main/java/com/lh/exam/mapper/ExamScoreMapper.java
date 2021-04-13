package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.entity.ExamScoreEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface ExamScoreMapper extends BaseMapper<ExamScoreEntity> {
    @Select("select id,user_id,course_id,score,create_time from exam_score where user_id = #{userId} order by score desc")
    List<ExamScoreEntity> getExamDetail(String userId);

    @Select("<script>select user_id,course_id,score,create_time from exam_score " +
            "<where>\n" +
            "\t<if test=\"userId != null\">\n" +
            "\t\tuser_id = #{userId}\n" +
            "\t</if>\n" +
            "\t<if test=\"courseId == null\">\n" +
            "\t\tand course_id = #{courseId}\n" +
            "\t</if>\n" +
            "\t<if test=\"courseId != null\">\n" +
            "\t\tand course_id = #{courseId}\n" +
            "\t</if>\n" +
            "\t<if test=\"score != null\">\n" +
            " \t\tand score = #{score}\n" +
            "\t</if>\n" +
            "\t<if test=\"beginTime != ''\">\n" +
            " \t\tand create_time &gt; #{beginTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"endTime != ''\">\n" +
            " \t\tand create_time &lt; #{endTime}\n" +
            "\t</if>\n" +
            "\t</where>\n" +
            "order by score desc"+
            "</script>")
    List<ExamScoreEntity> getExamDetailByFilter(String userId,String courseId,Integer score,String beginTime,String endTime);

    @Select("<script>select user_id,course_id,score,create_time from exam_score " +
            "<where>\n" +
            "\t<if test=\"userId != null\">\n" +
            "\t\tuser_id = #{userId}\n" +
            "\t</if>\n" +
            "\t<if test=\"score != null\">\n" +
            " \t\tand score = #{score}\n" +
            "\t</if>\n" +
            "\t<if test=\"beginTime != ''\">\n" +
            " \t\tand create_time &gt; #{beginTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"endTime != ''\">\n" +
            " \t\tand create_time &lt; #{endTime}\n" +
            "\t</if>\n" +
            "\t</where>\n" +
            "order by score desc"+
            "</script>")
    List<ExamScoreEntity> getExamDetailByFilter1(String userId,Integer score,String beginTime,String endTime);
}

