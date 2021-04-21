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
@TableName("exam_score")
public class ExamScoreEntity {
    @TableId(value = "id", type = IdType.UUID)
    String id;
    String userId;
    String courseId;
    int score;
    Date createTime;
    String beginTime;
    int singleScore;
    int multiplyScore;
    int judgeScore;
}
