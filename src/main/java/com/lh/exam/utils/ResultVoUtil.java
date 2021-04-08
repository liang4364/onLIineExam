package com.lh.exam.utils;


import com.lh.exam.model.enums.Result2Enum;
import com.lh.exam.model.vo.Result2Vo;

public class ResultVoUtil {

    private ResultVoUtil() {}



    public static Result2Vo successResult2Vo() {
        Result2Vo result = new Result2Vo();
        result.setCode("ok");
        result.setMessage("成功");
        return result;
    }

    public static <T> Result2Vo successResult2Vo(T object) {
        Result2Vo result = new Result2Vo();
        result.setCode("ok");
        result.setMessage("成功");
        result.setData(object);
        return result;
    }

    public static Result2Vo errorResult2Vo(Result2Enum resultEnum) {
        Result2Vo result = new Result2Vo();
        result.setCode(resultEnum.getCode().toString());
        result.setMessage(resultEnum.getMsg());
        return result;
    }
}
