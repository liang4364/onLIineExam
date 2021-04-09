package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.dto.CourseDto;
import com.lh.exam.model.entity.CourseEntity;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
@Mapper
public interface CourseMapper extends BaseMapper<CourseEntity> {

    @Select("select id,course_name,course_describe,course_logo from course where course_name = #{courseName}")
    CourseDto queryCourse(String courseName);

    @Insert("insert into course (id,course_name,course_describe,course_logo) values(#{id},#{courseName},#{courseDescribe},#{courseLogo})")
    void insertData(CourseEntity courseEntity);

    @Select("select course_name from course where id = #{courseId}")
    String getCourseName(String courseId);

    @Select("select id from course where course_name = #{courseName}")
    String getCourseId(String courseName);
}
