package com.why.common.exception.user;

import com.why.common.exception.base.BaseException;

/**
 * 用户信息异常类
 * 
 * @author why
 */
public class UserException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public UserException(String code, Object[] args)
    {
        super("user", code, args, null);
    }
}
