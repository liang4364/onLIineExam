package com.lh.exam.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JudgeDto {
    String id;
    String type;
    String question;
    String optionA;
    String optionB;
    String answer;
    String analysis;
    String difficult;
}
