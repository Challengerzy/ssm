package com.itheima.service;

import com.itheima.pojo.User;

/**
 * @author Challenger
 * @date 2019/7/1 18:37
 * projectName ssm
 * description
 */
public interface UserService {

    /**
     * 登录检查
     *
     * @param user
     * @return
     */
    User loginCheck(User user);
}
