package com.lh.exam.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuestionAddVo {
    String type;
    String question;
    String course;
    String creator;
    String optionA;
    String optionB;
    String optionC;
    String optionD;
    String analysis;
    String answer;
}
