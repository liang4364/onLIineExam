package com.lh.exam.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;
import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVo {
    @NotEmpty
    String username;
    @NotEmpty
    String password;
    int userRoleId;
    String userAvatar;
    String userNum;
    String userEmail;
    String userPhone;
    Date createTime;
    Date updateTime;
}
