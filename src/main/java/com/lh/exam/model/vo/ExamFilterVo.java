package com.lh.exam.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExamFilterVo {
    Integer page;
    Integer limit;
    String username;
    String userId;
    String courseId;
    String type;
    String score;
    String singleScore;
    String multiplyScore;
    String judgeScore;
    String beginTime;
    String EndTime;
}
