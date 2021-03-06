package com.lh.exam.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuestionFilterVo {
    int page;
    int limit;
    String type;
    String question;
    String courseName;
    String analysis;
    String beginTime;
    String endTime;
    String updateBeginTime;
    String updateEndTime;
}
