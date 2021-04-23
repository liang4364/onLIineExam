package com.lh.exam.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuestionDto {
    String id;
    String type;
    String difficult;
    String creator;
    String question;
    String optionA;
    String optionB;
    String optionC;
    String optionD;
    String answer;
    String analysis;
    Date createTime;
    String createTime1;
    String updateTime;
    String courseId;
    String courseName;
}
