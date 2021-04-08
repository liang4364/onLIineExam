package com.lh.exam.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lh.exam.mapper.UserInfoMapper;
import com.lh.exam.model.entity.UserEntity;
import com.lh.exam.model.vo.UserVo;
import com.lh.exam.service.UserInfoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    UserInfoMapper userInfoMapper;

    @Override
    public UserVo login(UserVo userVo) {
        QueryWrapper<UserEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", userVo.getUsername());
        List<UserEntity> userEntities = userInfoMapper.selectList(queryWrapper);
        for (UserEntity userEntity : userEntities) {
            if (userEntity.getPassword().equals(userVo.getPassword())) {
                UserVo userVo1 = new UserVo();
                BeanUtils.copyProperties(userEntity, userVo1);
                return userVo1;
            }
        }
        return null;
    }

    @Override
    public int registerUser(UserVo userVo) {
        UserEntity userEntity = new UserEntity();
        BeanUtils.copyProperties(userVo,userEntity);
        return userInfoMapper.insert(userEntity);
    }
}
