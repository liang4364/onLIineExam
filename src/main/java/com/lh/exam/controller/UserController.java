package com.lh.exam.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.benmanes.caffeine.cache.Cache;
import com.lh.exam.model.dto.TokenDto;
import com.lh.exam.model.enums.Result2Enum;
import com.lh.exam.model.vo.Result2Vo;
import com.lh.exam.model.vo.UserVo;
import com.lh.exam.service.UserInfoService;
import com.lh.exam.utils.ResultVoUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@Slf4j
@RestController
@RequestMapping("/auth")
public class UserController {
    @Autowired
    Cache<String,Object> caffeineCache;

    @Autowired
    UserInfoService userInfoService;

    @PostMapping("/login")
    public Result2Vo login(@RequestBody @Valid UserVo userVo) {
        log.info("get login data:{}", JSONObject.toJSONString(userVo));
        //userVo.setPassword(MD5Util.getMD5(userVo.getPassword()));
        UserVo info = userInfoService.login(userVo);
        if (info != null) {
            String tokenStr = info.getUsername() + "_" + info.getPassword();
            String token = DigestUtils.md5DigestAsHex(tokenStr.getBytes());
            caffeineCache.put(token, info);
            TokenDto tokenVo = TokenDto.builder().token(token).expires(7199000).build();
            return ResultVoUtil.successResult2Vo(tokenVo);
        }
        return ResultVoUtil.errorResult2Vo(Result2Enum.AUTHORIZATION_PWD_ERROR);
    }

    @RequestMapping("/register")
    public Result2Vo register(@RequestBody @Valid UserVo userVo){
        log.info("get login data:{}", JSONObject.toJSONString(userVo));
        int count = userInfoService.registerUser(userVo);
        if(count == 1){
            return ResultVoUtil.successResult2Vo(count);
        }
        return ResultVoUtil.errorResult2Vo(Result2Enum.ARGUMENT_FORMAT_INVALID);
    }
}
