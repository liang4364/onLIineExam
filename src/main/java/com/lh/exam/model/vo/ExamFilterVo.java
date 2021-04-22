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
    String userClass;
    String userCreateBeginTime;
    String userCreateEndTime;
    String courseId;
    String course;
    String score;
    String examBeginTime;
    String examEndTime;
}
