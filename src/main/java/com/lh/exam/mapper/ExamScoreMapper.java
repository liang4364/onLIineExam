package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.ExamManageDto;
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

    @Select("<script>SELECT\n" +
            "\te.id AS id,\n" +
            "\tu.username AS userName,\n" +
            "\tu.user_email AS userEmail,\n" +
            "\tu.user_phone AS userPhone,\n" +
            "\tu.create_time AS userCreateTime,\n" +
            "\te.course_id AS courseId,\n" +
            "\te.score AS score,\n" +
            "\te.single_score AS singleScore,\n" +
            "\te.multiply_score AS multiplyScore,\n" +
            "\te.judge_score AS judgeScore,\n" +
            "\te.create_time AS examEndTime,\n" +
            "\te.begin_time AS examBeginTime\n" +
            "FROM\n" +
            "\texam_score e\n" +
            "\tLEFT JOIN USER u ON e.user_id = u.id " +
            "<where>\n" +
            "\t<if test=\"examFilterVo.username != ''\">\n" +
            "\t\tu.username like concat('%',#{examFilterVo.username},'%') \n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.userEmail != ''\">\n" +
            "\t\tu.user_email like concat('%',#{examFilterVo.userEmail},'%') \n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.userCreateBeginTime != ''\">\n" +
            " \t\tand u.create_time &gt; #{examFilterVo.beginTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.userCreateEndTime != ''\">\n" +
            " \t\tand u.create_time &lt; #{examFilterVo.userCreateEndTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.courseId != ''\">\n" +
            "\t\te.course_id = #{examFilterVo.courseId}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.score != ''\">\n" +
            " \t\tand e.score = #{examFilterVo.score}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.examBeginTime != ''\">\n" +
            " \t\tand e.create_time &gt; #{examFilterVo.examBeginTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"examFilterVo.examEndTime != ''\">\n" +
            " \t\tand e.create_time &lt; #{examFilterVo.examEndTime}\n" +
            "\t</if>\n" +
            "\t</where>\n" +
            "order by e.score desc"+
            "</script>")
    List<ExamManageDto> getAllByFilter(Page<ExamManageDto> page, ExamFilterVo examFilterVo);
}

