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
@TableName("single_choice")
public class SingleChoiceEntity {
    @TableId(value = "id", type = IdType.UUID)
    String id;
    String courseId;
    String type;
    String singleDifficult;
    String creator;
    String question;
    String optionA;
    String optionB;
    String optionC;
    String optionD;
    String answer;
    String analysis;
    Date createTime;
    String updateTime;
}
