package com.lh.exam.model.enums;

import lombok.Getter;

@Getter
public enum Result2Enum {

    ARGUMENT_FORMAT_ERROR("Invalid_argument_format","参数格式错误"),

    REQUIRED_FIELDS_ERROR("Invalid_required_field", "必填字段为空"),

    AUTHORIZATION_TOKEN_ERROR("Invalid_authorization_token", "token不存在或已失效"),

    TOO_MANY_REQUEST("too_many_request", "请求过于频繁"),

    AUTHORIZATION_PWD_ERROR("Invalid_username_pwd", "用户名或密码错误"),

    ARGUMENT_FORMAT_INVALID("Argument_format_invalid","参数不合法！"),
    ;

    private String code;

    private String msg;

    Result2Enum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    /**
     * 通过状态码获取枚举对象
     * @param code 状态码
     * @return 枚举对象
     */
    public static Result2Enum getByCode(String code){
        for (Result2Enum resultEnum : Result2Enum.values()) {
            if(code == resultEnum.getCode()){
                return resultEnum;
            }
        }
        return null;
    }
}
