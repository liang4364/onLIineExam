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
@TableName("multiply_choice")
public class MultiplyChoiceEntity {
    @TableId(value = "id", type = IdType.UUID)
    String id;
    String courseId;
    String creator;
    String multiplyDifficult;
    String question;
    String optionA;
    String optionB;
    String optionC;
    String optionD;
    Date createTime;
    String updateTime;
    String type;
    String analysis;
}
