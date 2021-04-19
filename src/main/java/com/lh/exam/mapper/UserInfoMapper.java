package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserInfoMapper extends BaseMapper<UserEntity> {
    @Select("select id from user where username = #{username}")
    String getIdByUsername(String username);

    @Select("select * from user where username = #{username} or user_email = #{userEmail} or user_phone = #{userPhone} ")
    UserEntity existUser(String username,String userEmail,String userPhone);

    @Select("select username from user where id = #{userId}")
    String getUsernameById(String userId);

    @Select("select username,user_role_id,user_num,user_email,user_phone,create_time from user where user_role_id = 2")
    List<UserEntity> getAllUsers(Page page);
}
