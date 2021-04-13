package com.lh.exam.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExamScoreDto {
    String id;
    String userName;
    String courseName;
    int score;
    String createTime;
}
