package com.itheima.service.impl;

import com.itheima.mapper.UserMapper;
import com.itheima.pojo.User;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Challenger
 * @date 2019/7/1 18:39
 * projectName ssm
 * description
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 登录检查
     *
     * @param user
     * @return
     */
    @Override
    public User loginCheck(User user) {

        if (user == null) {
            return null;
        }
        return userMapper.loginCheck(user);
    }
}
