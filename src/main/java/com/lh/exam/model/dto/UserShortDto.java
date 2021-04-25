package com.lh.exam.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserShortDto {
    String questionId;
    String type;
    String question;
    String answer;
    String userAnswer;
    String analysis;
}
