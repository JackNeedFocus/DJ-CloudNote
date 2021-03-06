package com.jack.CloudNote.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * 封装返回结果的类
 *      状态码
 *      提示信息
 *      返回的对象（字符串，JavaBean，集合，等）
 */

@Getter
@Setter
public class ResultInfo<T> {

    private Integer code; //状态码
    private String msg; //提示信息
    private T result; //返回的对象

}
