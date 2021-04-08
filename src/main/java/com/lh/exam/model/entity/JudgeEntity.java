package com.lh.exam.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("judge")
public class JudgeEntity {
    @TableId(value = "id", type = IdType.UUID)
    String id;
    String courseId;
    String question;
    String optionA;
    String optionB;
    String answer;
}
