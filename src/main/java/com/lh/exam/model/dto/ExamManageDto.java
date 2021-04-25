package com.lh.exam.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExamManageDto {
    String id;
    String userName;
    String userEmail;
    String userPhone;
    String userCollege;
    String userClass;
    String courseName;
    String courseId;
    int score;
    int singleScore;
    int multiplyScore;
    int judgeScore;
    int shortScore;
    String examBeginTime;
    String examEndTime;
    String examTime;
    String userCreateTime;
}
