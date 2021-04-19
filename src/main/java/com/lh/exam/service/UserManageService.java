package com.lh.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.dto.UserDto;
import com.lh.exam.model.vo.UserFilterVo;

public interface UserManageService {
    Page<UserDto> getAllUser(Integer page,Integer limit);
    Page<UserDto> getAllUserByFilter(UserFilterVo userFilterVo);
}
