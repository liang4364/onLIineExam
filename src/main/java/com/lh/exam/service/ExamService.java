package com.lh.exam.service;

import com.lh.exam.model.dto.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface ExamService {
    CourseDto queryCourse(String courseName);

    int insertExamMsg(HttpServletRequest request, HttpSession session);

    List<UserSingleDto> getUserSingleMsg(String examId,String user,String courseName);

    List<UserMultiplyDto> getUserMultiplyMsg(String examId,String user,String courseName);

    List<UserJudgeDto> getUserJudgeMsg(String examId,String user,String courseName);

    List<UserShortDto> getUserShortMsg(String examId,String user,String courseName);

}
