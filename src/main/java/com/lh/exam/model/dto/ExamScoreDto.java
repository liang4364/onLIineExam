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
    String userCollege;
    String userClass;
    String courseName;
    int score;
    int singleScore;
    int multiplyScore;
    int shortScore;
    int judgeScore;
    String examTime;
    String beginTime;
    String createTime;
}
