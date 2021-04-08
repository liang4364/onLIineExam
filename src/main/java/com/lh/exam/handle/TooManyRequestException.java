package com.lh.exam.handle;

public class TooManyRequestException extends Exception{

    public TooManyRequestException(String message) {
        super(message);
    }

}
