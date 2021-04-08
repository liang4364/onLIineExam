package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lh.exam.model.dto.JudgeDto;
import com.lh.exam.model.entity.JudgeEntity;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface JudgeMapper extends BaseMapper<JudgeEntity> {

    @Select("select id,type,question,optionA,optionB,answer from judge where course_id = #{courseId} order by rand() limit 0,2")
    List<JudgeDto> queryAll(String courseId);

    @Insert("insert into judge (id,course_id,question,optionA,optionB,answer,type) values(#{id},#{courseId},#{question},#{optionA},#{optionB},#{answer},#{type})")
    void insertData(JudgeEntity judgeEntity);
}
