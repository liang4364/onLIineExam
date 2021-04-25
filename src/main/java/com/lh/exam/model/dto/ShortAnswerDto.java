package com.lh.exam.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShortAnswerDto {
    String id;
    String type;
    String question;
    String answer;
    String analysis;
    String createTime;
    String updateTime;
}
