package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.entity.CollegeEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CollegeMapper extends BaseMapper<CollegeEntity> {
    @Select("select distinct(college) from college")
    List<String> getAllCollege();

    @Select("select distinct(className) from college where college = #{collegeName}")
    List<String> getAllClass(String collegeName);
}
