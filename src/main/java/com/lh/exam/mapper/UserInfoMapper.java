package com.lh.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lh.exam.model.entity.QuestionInfoEntity;
import com.lh.exam.model.entity.UserEntity;
import com.lh.exam.model.vo.QuestionFilterVo;
import com.lh.exam.model.vo.UserFilterVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
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
    @Select("<script>select * from user " +
            "<where>\n" +
            "\t<if test=\"userFilterVo.username != ''\">\n" +
            "\t\tusername like concat('%',#{userFilterVo.username},'%')\n" +
            "\t</if>\n" +
            "\t<if test=\"userFilterVo.userEmail != ''\">\n" +
            "\t\tand user_mail like concat('%',#{userFilterVo.userEmail},'%')\n" +
            "\t</if>\n" +
            "\t<if test=\"userFilterVo.userPhone != ''\">\n" +
            " \t\tand user_phone like concat('%',#{userFilterVo.userPhone},'%')\n" +
            "\t</if>\n" +
            "\t<if test=\"userFilterVo.beginTime != ''\">\n" +
            " \t\tand create_time &gt; #{userFilterVo.beginTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"userFilterVo.endTime != ''\">\n" +
            " \t\tand create_time &lt; #{userFilterVo.endTime}\n" +
            "\t</if>\n" +
            "\t<if test=\"userFilterVo.page != ''\">\n" +
            " \t\tand user_role_id = 2\n" +
            "\t</if>\n" +
            "\t</where>\n" +
            "\t order by create_time desc\n" +
            "</script>")
    List<UserEntity> getUserByFilter(Page<UserEntity> page, UserFilterVo userFilterVo);

    @Select("select * from user where id = #{userId}")
    UserEntity getUserById(String userId);
}
