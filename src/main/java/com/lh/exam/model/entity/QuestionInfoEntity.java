package com.lh.exam.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("question_filter")
public class QuestionInfoEntity {
    @TableId(value = "id", type = IdType.UUID)
    String id;
    String type;
    String typeId;
    String creator;
    String courseName;
    String question;
    String optionA;
    String optionB;
    String optionC;
    String optionD;
    String analysis;
    Date createTime;
    String updateTime;
}
