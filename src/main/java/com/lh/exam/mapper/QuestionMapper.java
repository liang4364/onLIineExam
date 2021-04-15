package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.entity.QuestionEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

@Mapper
public interface QuestionMapper extends BaseMapper<QuestionEntity> {

    @Select("select type_id from question where type = #{type}")
    List<String> getIds(String type);

    @Select("select * from question")
    List<QuestionEntity> getAll(Page<QuestionEntity> page);

}
