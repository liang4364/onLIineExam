package com.lh.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.ExamScoreDto;
import com.lh.exam.model.dto.UserDto;
import com.lh.exam.model.enums.Result2Enum;
import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.model.vo.UserFilterVo;
import com.lh.exam.service.TeacherManageService;
import com.lh.exam.service.UserManageService;
import com.lh.exam.utils.ResultVoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class TeacherManageController {
    @Autowired
    TeacherManageService teacherManageService;

    @RequestMapping("/getAllTeacher")
    public Map<String,Object> getAllUser(Integer page, Integer limit){
        Page<UserDto> res = teacherManageService.getAllTeacher(page, limit);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;
    }

    @RequestMapping("/getAllTeacherByFilter")
    public Map<String,Object> getAllUserByFilter(UserFilterVo userFilterVo){
        Page<UserDto> res = teacherManageService.getAllTeacherByFilter(userFilterVo);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;
    }

    @RequestMapping("/addTeacher")
    public Result2Vo addTeacher(){
        return ResultVoUtil.successResult2Vo();
    }
}