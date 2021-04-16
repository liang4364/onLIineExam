package com.lh.exam.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuestionFilterVo {
    String type;
    String question;
    String beginTime;
    String endTime;
    String option;
    String analysis;
    String updateBeginTime;
    String updateEndTime;
}
