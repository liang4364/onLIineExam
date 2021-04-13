package com.lh.exam.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SingleChoiceDto {
    String id;
    String type;
    String question;
    String optionA;
    String optionB;
    String optionC;
    String optionD;
    String answer;
    String analysis;
}
