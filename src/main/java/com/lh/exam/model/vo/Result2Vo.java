package com.lh.exam.model.vo;

import lombok.Data;

@Data
public class Result2Vo<T> {

    private String code;

    private String message;

    private T data;

}
