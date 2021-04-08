package com.lh.exam.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("user")
public class UserEntity {

    @TableId(value = "id", type = IdType.UUID)
    String id;
    String username;
    String password;
    String nickname;
    int userRoleId;
    String userAvatar;
    String userDescription;
    String userEmail;
    String userPhone;
    Date createTime;
    Date updateTime;
}
