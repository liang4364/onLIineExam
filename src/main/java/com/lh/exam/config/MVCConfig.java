package com.lh.exam.config;

import com.lh.exam.interceptor.RateLimiterInterceptor;
import com.lh.exam.interceptor.TokenInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;
@Configuration
public class MVCConfig implements WebMvcConfigurer {

    @Resource
    private TokenInterceptor tokenInterceptor;

    @Resource
    private RateLimiterInterceptor rateLimiterInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] pathPatterns = {"/autonomous/**", "/chassis/**", "/proxy"};
        registry.addInterceptor(rateLimiterInterceptor).addPathPatterns(pathPatterns);
        //拦截除了index和static路径下的所有资源
       /* registry.addInterceptor(tokenInterceptor).addPathPatterns("/**")
                .excludePathPatterns("/index")
                .excludePathPatterns("/static/**")
                .excludePathPatterns("/auth/login")
                .excludePathPatterns("/auth/register")
                .excludePathPatterns("/register");*/
    }
}
