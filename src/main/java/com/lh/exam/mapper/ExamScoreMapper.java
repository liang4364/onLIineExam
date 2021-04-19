package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.entity.ExamScoreEntity;
import com.lh.exam.model.vo.ExamFilterVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ExamScoreMapper extends BaseMapper<ExamScoreEntity> {
    @Select("select id,user_id,course_id,score,single_score,multiply_score,judge_score,create_time from exam_score where user_id = #{userId} order by score desc")
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



    @Select("select id,user_id,course_id,score,single_score,multiply_score,judge_score,create_time from exam_score where user_id = #{userId}")
    List<ExamScoreEntity> getExamDetail1(Page page, String userId);

    @Select("<script>select id,user_id,course_id,score,create_time from exam_score " +
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
    List<ExamScoreEntity> getExamDetailByFilter22(Page page,String userId,String courseId,Integer score,String beginTime,String endTime);

    @Select("<script>select id,user_id,course_id,score,single_score,multiply_score,judge_score,create_time from exam_score " +
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
    List<ExamScoreEntity> getExamDetailByFilter33(Page page,String userId,Integer score,String beginTime,String endTime);

    @Select("select * from exam_score order by create_time")
    List<ExamScoreEntity> getAll(Page page);

    @Select("<script>select id,user_id,course_id,score,single_score,multiply_score,judge_score,create_time from exam_score " +
            "<where>\n" +
            "\t<if test=\"examFilterVo.userId != ''\">\n" +
            "\t\tuser_id = #{examFilterVo.userId}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.courseId != ''\">\n" +
            "\t\tcourse_id = #{examFilterVo.courseId}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.score != ''\">\n" +
            " \t\tand score = #{examFilterVo.score}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.singleScore != ''\">\n" +
            " \t\tand single_score = #{examFilterVo.singleScore}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.multiplyScore != ''\">\n" +
            " \t\tand multiply_score = #{examFilterVo.multiplyScore}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.judgeScore != ''\">\n" +
            " \t\tand judge_score = #{examFilterVo.judgeScore}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.beginTime != ''\">\n" +
            " \t\tand create_time &gt; #{examFilterVo.beginTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.endTime != ''\">\n" +
            " \t\tand create_time &lt; #{examFilterVo.endTime}\n" +
            "\t</if>\n" +
            "\t</where>\n" +
            "order by score desc"+
            "</script>")
    List<ExamScoreEntity> getAllByFilter(Page page,ExamFilterVo examFilterVo);
}

