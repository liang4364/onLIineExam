package com.lh.exam.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScoreAnalysisDto {
    String courseName;
    String courseId;
    int avgScore;
    int maxScore;
    int minScore;
    int avgSingleScore;
    int avgMultiplyScore;
    int avgJudgeScore;
    int avgShortScore;
    String collegeName;
    String className;

}
