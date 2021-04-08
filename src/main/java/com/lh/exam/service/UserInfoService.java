package com.lh.exam.service;

import com.lh.exam.model.vo.UserVo;

public interface UserInfoService {
    UserVo login(UserVo userVo);
    int registerUser(UserVo userVo);
}
