package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.entity.QuestionInfoEntity;
import com.lh.exam.model.vo.QuestionFilterVo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface QuestionInfoMapper extends BaseMapper<QuestionInfoEntity> {
    @Select("<script>select * from question_filter " +
            "<where>\n" +
            "\t<if test=\"questionFilterVo.type != ''\">\n" +
            "\t\ttype like concat('%',#{questionFilterVo.type},'%')\n" +
            "\t</if>\n" +
            "\t<if test=\"questionFilterVo.question != ''\">\n" +
            "\t\tand question like concat('%',#{questionFilterVo.question},'%')\n" +
            "\t</if>\n" +
            "\t<if test=\"questionFilterVo.courseName != ''\">\n" +
            "\t\tand course_name like concat('%',#{questionFilterVo.courseName},'%')\n" +
            "\t</if>\n" +
            "\t<if test=\"questionFilterVo.analysis != ''\">\n" +
            " \t\tand analysis like concat('%',#{questionFilterVo.analysis},'%')\n" +
            "\t</if>\n" +
            "\t<if test=\"questionFilterVo.beginTime != ''\">\n" +
            " \t\tand create_time &gt; #{questionFilterVo.beginTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"questionFilterVo.endTime != ''\">\n" +
            " \t\tand create_time &lt; #{questionFilterVo.endTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"questionFilterVo.updateBeginTime != ''\">\n" +
            " \t\tand update_time &gt; #{questionFilterVo.updateBeginTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"questionFilterVo.updateEndTime != ''\">\n" +
            " \t\tand update_time &lt; #{questionFilterVo.updateEndTime}\n" +
            "\t</if>\n" +
            "\t</where>\n" +
            "\t order by create_time desc\n" +
            "</script>")
    List<QuestionInfoEntity> getQuestionByFilter(Page page, QuestionFilterVo questionFilterVo);

    @Update("<script>update question_filter " +
            "\t<trim prefix='set' suffixOverrides=','>"+
            "\t<if test=\"field == 'optionA'\">\n" +
            "\t\toptionA = #{value}\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'optionB'\">\n" +
            "\t\toptionB = #{value}\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'optionC'\">\n" +
            "\t\toptionC = #{value}\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'optionD'\">\n" +
            " \t\toptionD = #{value}\n" +
            "\t</if>\n" +
            "\t<if test=\"field == 'analysis'\">\n" +
            " \t\tanalysis = #{value}\n" +
            "\t</if>\n" +
            "</trim>"+
            ",update_time = #{updateTime} where type_id = #{typeId}"+
            "</script>")
    int updateQuestionFilter(String field, String value, String typeId, String updateTime);

    @Insert("insert into question_filter values(#{id},#{type},#{typeId},#{courseName},#{question},#{optionA},#{optionB},#{optionC},#{optionD},#{analysis},#{createTime},#{updateTime})")
    int test(QuestionInfoEntity questionInfoEntity);
}
