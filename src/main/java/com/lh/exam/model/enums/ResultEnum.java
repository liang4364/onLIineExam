package com.lh.exam.model.enums;

import lombok.Getter;

@Getter
public enum ResultEnum {

    /**
     * 未知异常
     */
    UNKNOWN_EXCEPTION(100, "未知异常"),

    /**
     * 超时
     */
    TIME_OUT(102, "超时"),

    /**
     * 查找失败
     */
    LOGIN_ERROR(103, "账号或密码错误"),

    /**
     * 参数类型不匹配
     */
    ARGUMENT_TYPE_MISMATCH(104, "参数类型不匹配"),

    /**
     * 请求方式不支持
     */
    REQ_METHOD_NOT_SUPPORT(105,"请求方式不支持"),

    /**
     * 请求方式不支持
     */
    SESSION_ERROR(106,"权限不足"),
    /**
     * 文件为空
     */

    FILE_FORMAT_ERROR(108,"文件格式错误"),

    ARGUMENT_FORMAT_ERROR(109,"参数格式错误"),

    REQUEST_FIELDS_ERROR(110, "必填字段为空"),
    ;

    private Integer code;

    private String msg;

    ResultEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    /**
     * 通过状态码获取枚举对象
     * @param code 状态码
     * @return 枚举对象
     */
    public static ResultEnum getByCode(int code){
        for (ResultEnum resultEnum : ResultEnum.values()) {
            if(code == resultEnum.getCode()){
                return resultEnum;
            }
        }
        return null;
    }

}
