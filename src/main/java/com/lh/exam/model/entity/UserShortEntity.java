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
@TableName("user_short")
public class UserShortEntity {
    @TableId(value = "id", type = IdType.UUID)
    String id;
    String examId;
    String shortId;
    String userId;
    String courseId;
    String userAnswer;
    Date createTime;
}
