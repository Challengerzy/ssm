package com.itheima.web.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Challenger
 * @date 2019/7/1 9:07
 * projectName ssm
 * description
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String uri = request.getRequestURI();
        if (uri.contains("login") || uri.contains("toLogin")) {
            System.out.println("登录页面,放行");
            return true;
        }
        String username = (String) request.getSession().getAttribute("username");
        if (username != null) {
            System.out.println("用户已经登录,放行");
            return true;
        }
        System.out.println("未登录!!!");
        request.setAttribute("msg", "您尚未登录,请先登录~");
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        return false;
    }
}
