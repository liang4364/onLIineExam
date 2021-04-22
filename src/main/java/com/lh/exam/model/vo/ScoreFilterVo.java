package com.lh.exam.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScoreFilterVo {
    Integer page;
    Integer limit;
    String college;
    String className;
}
