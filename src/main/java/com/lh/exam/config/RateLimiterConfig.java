package com.lh.exam.config;
import com.google.common.util.concurrent.RateLimiter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RateLimiterConfig {

    @Value("${rateLimiterNum}")
    double rateLimiterNum;

    @Bean
    public RateLimiter create(){

        return RateLimiter.create(rateLimiterNum);
    }

}
