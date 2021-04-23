package com.lh.exam.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserFilterVo {
    String username;
    String userClass;
    String userNum;
    String userPhone;
    String beginTime;
    String endTime;
    Integer page;
    Integer limit;
    String userEmail;
    String userRole;
    int roleId;
}