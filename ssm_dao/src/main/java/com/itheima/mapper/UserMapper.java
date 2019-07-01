package com.itheima.mapper;

import com.itheima.pojo.User;

/**
 * @author Challenger
 * @date 2019/7/1 18:32
 * projectName ssm
 * description
 */
public interface UserMapper {

    /**
     * 登录检查
     * @param user
     * @return
     */
    User loginCheck(User user);
}
