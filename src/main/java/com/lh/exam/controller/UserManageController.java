package com.lh.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.ExamScoreDto;
import com.lh.exam.model.dto.UserDto;
import com.lh.exam.model.enums.Result2Enum;
import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.model.vo.UserFilterVo;
import com.lh.exam.service.UserManageService;
import com.lh.exam.utils.ResultVoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class UserManageController {
    @Autowired
    UserManageService userManageService;

    @RequestMapping("/getAllUser")
    public Map<String,Object> getAllUser(Integer page, Integer limit){
        Page<UserDto> res = userManageService.getAllUser(page, limit);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;
    }

    @RequestMapping("/getAllUserByFilter")
    public Map<String,Object> getAllUserByFilter(UserFilterVo userFilterVo){
        Page<UserDto> res = userManageService.getAllUserByFilter(userFilterVo);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg","成功");
        map.put("count",res.getTotal());
        map.put("data",res.getRecords());
        return map;
    }

    @RequestMapping("/updateUserLock")
    public Result2Vo updateUserLock(boolean lock){
        int count = userManageService.updateUserLock(lock);
        if(count != -1){
            return ResultVoUtil.successResult2Vo(count);
        }
        return ResultVoUtil.errorResult2Vo(Result2Enum.UNKNOWN_EXCEPTION);
    }


}
