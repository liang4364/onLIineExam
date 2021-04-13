package com.lh.exam.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("user_single")
public class UserSingleEntity {
    @TableId(value = "id", type = IdType.UUID)
    String id;
    String examId;
    String singleId;
    String userId;
    String courseId;
    String userAnswer;
    Date createTime;
}
