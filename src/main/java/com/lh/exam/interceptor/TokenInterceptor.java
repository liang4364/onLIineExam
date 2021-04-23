package com.lh.exam.interceptor;

import com.github.benmanes.caffeine.cache.Cache;
import com.lh.exam.model.vo.UserVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.naming.AuthenticationException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@Component
public class TokenInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    Cache<String, Object> caffeineCache;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("------------------拦截到了-------------------");
        //String authorization = request.getHeader("Cookie");
        String authorization = "";
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies) {
            if(c.getName().equals("Authorization")) {
                authorization =  c.getValue();
            }
        }
        log.info("request authorization data -> {}", authorization);
        if (StringUtils.isEmpty(authorization)) {
            throw new AuthenticationException("authorization is null");
        }
        UserVo userInfo = (UserVo) caffeineCache.asMap().get(authorization);
        if (userInfo == null) {
            throw new AuthenticationException("userInfo is null");
        }
        caffeineCache.put(authorization, userInfo);
        return true;
    }
}
