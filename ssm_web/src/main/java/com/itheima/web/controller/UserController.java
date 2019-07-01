package com.itheima.web.controller;

import com.itheima.pojo.User;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Challenger
 * @date 2019/7/1 9:30
 * projectName ssm
 * description
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 跳转到登录页面
     *
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin() {

        return "login";
    }


    @RequestMapping("/login")
    public String login(User user, HttpSession session, HttpServletRequest request) {
        User loginUser = userService.loginCheck(user);
        if (loginUser != null) {
            session.setAttribute("username", loginUser.getUsername());
        } else {
            request.setAttribute("msg", "账号或密码错误!");
            return "login";
        }
        return "toBookList";
    }

    /**
     * 退出
     *
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/index.jsp";
    }
}
