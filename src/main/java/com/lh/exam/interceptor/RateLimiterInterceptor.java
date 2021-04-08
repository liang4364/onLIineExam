package com.lh.exam.interceptor;

import com.google.common.util.concurrent.RateLimiter;
import com.lh.exam.handle.TooManyRequestException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@Component
public class RateLimiterInterceptor extends HandlerInterceptorAdapter {
    //速率限制器
    @Autowired
    RateLimiter rateLimiter;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //尝试获取令牌
        if (!rateLimiter.tryAcquire()) {
            throw new TooManyRequestException("too many request");
        }
        return true;
    }
}
