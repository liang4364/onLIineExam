package com.lh.exam.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserFilterVo {
    String username;
    String userEmail;
    String userPhone;
    String beginTime;
    String endTime;
    Integer page;
    Integer limit;
}
