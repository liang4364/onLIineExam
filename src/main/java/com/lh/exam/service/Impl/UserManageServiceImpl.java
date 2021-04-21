package com.lh.exam.service.Impl;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.mapper.UserInfoMapper;
import com.lh.exam.model.dto.UserDto;
import com.lh.exam.model.entity.UserEntity;
import com.lh.exam.model.vo.UserFilterVo;
import com.lh.exam.service.UserManageService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserManageServiceImpl implements UserManageService {

    @Autowired
    UserInfoMapper userInfoMapper;

    @Override
    public Page<UserDto> getAllUser(Integer page,Integer limit) {
        Page<UserEntity> page1 = new Page<>(page,limit);
        Page<UserDto> page2 = new Page<>(page,limit);
        page1.setRecords(userInfoMapper.getAllUsers(page1));
        List<UserDto> userDtos = new ArrayList<>();
        for(UserEntity userEntity : page1.getRecords()){
            UserDto userDto = new UserDto();
            BeanUtils.copyProperties(userEntity,userDto);
            if(userEntity.getUserRoleId() == 2){
                userDto.setUserRole("学生");
            }
            userDtos.add(userDto);
        }
        BeanUtils.copyProperties(page1,page2);
        page2.setRecords(userDtos);
        return page2;
    }

    @Override
    public Page<UserDto> getAllUserByFilter(UserFilterVo userFilterVo) {
        if (!"".equals(userFilterVo.getBeginTime())) {
            userFilterVo.setBeginTime(userFilterVo.getBeginTime() + " 00:00:00");
        }
        if (!"".equals(userFilterVo.getEndTime())) {
            userFilterVo.setEndTime(userFilterVo.getEndTime() + " 23:59:59");
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Page<UserEntity> page1 = new Page<>(userFilterVo.getPage(), userFilterVo.getLimit());
        Page<UserDto> page2 = new Page<>(userFilterVo.getPage(), userFilterVo.getLimit());
        List<UserDto> resList = new ArrayList<>();
        page1.setRecords(userInfoMapper.getUserByFilter(page1,userFilterVo));
        for (UserEntity userEntity : page1.getRecords()) {
           UserDto userDto = new UserDto();
            BeanUtils.copyProperties(userEntity, userDto);
            userDto.setCreateTime(sdf.format(userEntity.getCreateTime()));
            resList.add(userDto);
        }
        BeanUtils.copyProperties(page1, page2);
        page2.setRecords(resList);
        return page2;
    }

    public static void main(String[] args) {
        System.out.println(IdUtil.simpleUUID());
    }
}
