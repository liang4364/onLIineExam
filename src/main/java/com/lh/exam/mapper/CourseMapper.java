package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.dto.CourseDto;
import com.lh.exam.model.entity.CourseEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
@Mapper
public interface CourseMapper extends BaseMapper<CourseEntity> {

    @Select("select id,course_name,course_describe,course_logo from course where course_name = #{courseName}")
    CourseDto queryCourse(String courseName);

    @Select("select course_name from course where id = #{courseId}")
    String getCourseName(String courseId);

    @Select("select id from course where course_name like #{courseName}")
    String getCourseIdByLike(String courseName);

    @Select("select id from course where course_name like concat('%',#{questionFilterVo.question},'%')")
    String getCourseIdByLikeConcat(String courseName);

    @Select("select id from course where course_name = {courseName}")
    String getCourseIdByName(String courseName);

}
