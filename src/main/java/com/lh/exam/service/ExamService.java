package com.lh.exam.service;

import com.lh.exam.model.dto.CourseDto;
import com.lh.exam.model.entity.CourseEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface ExamService {
    CourseDto queryCourse(String courseName);

    void insertData(CourseEntity courseEntity);

    int getExamScore(HttpServletRequest request, HttpSession session);
}
