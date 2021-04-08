package com.lh.exam.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "spring.cache")
public class CacheProperties {

    int expireTime;

    int initialCapacity;

    int maximumSize;

}
