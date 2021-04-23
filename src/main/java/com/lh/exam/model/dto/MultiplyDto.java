package com.lh.exam.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MultiplyDto {
    String id;
    String type;
    String question;
    String optionA;
    String optionB;
    String optionC;
    String optionD;
    List<String> answer;
    String analysis;
    String difficult;
}
