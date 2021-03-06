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
@TableName("judge")
public class JudgeEntity {
    @TableId(value = "id", type = IdType.UUID)
    String id;
    String type;
    String judgeDifficult;
    String creator;
    String courseId;
    String question;
    String optionA;
    String optionB;
    String answer;
    Date createTime;
    String updateTime;
    String analysis;
}
