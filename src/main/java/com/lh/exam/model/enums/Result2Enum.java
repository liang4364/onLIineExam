package com.lh.exam.model.enums;

import lombok.Getter;

@Getter
public enum Result2Enum {

    UNKNOWN_EXCEPTION("100", "未知异常"),

    ARGUMENT_FORMAT_ERROR("Invalid_argument_format","参数格式错误"),

    REQUIRED_FIELDS_ERROR("Invalid_required_field", "必填字段为空"),

    AUTHORIZATION_TOKEN_ERROR("Invalid_authorization_token", "token不存在或已失效"),

    TOO_MANY_REQUEST("too_many_request", "请求过于频繁"),

    AUTHORIZATION_PWD_ERROR("Invalid_username_pwd", "用户名或密码错误"),

    ARGUMENT_FORMAT_INVALID("Argument_format_invalid","参数不合法！"),

    EXIST_USER_INFO("exist_user_info","用户信息已存在，请重新输入！"),

    SINGLE_ERROR("single_error","单选题答案必须唯一！"),

    JUDGE_ERROR("judge_error","判断题答案必须唯一，并且答案必须为A或者B！"),

    MULTIPLY_ERROR("multiply_error","多选题答案至少为两个以上！")

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
