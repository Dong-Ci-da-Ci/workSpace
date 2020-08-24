package com.fh.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginLanjie extends HandlerInterceptorAdapter {

    //登陆拦截器类
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("regis")!=null) {
            return true;
        }else {
            String path = request.getContextPath();
            response.sendRedirect(path+"/"+"login.jsp");
            return false;
        }
    }
}
