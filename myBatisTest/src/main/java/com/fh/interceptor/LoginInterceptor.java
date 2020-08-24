package com.fh.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (request.getRequestURI().contains("login")) {
            return true;
        }
        HttpSession session = request.getSession();
        // 如果session中存在用户，正常登录，否则跳转到登录页面
        if(session.getAttribute("user") != null){
            return true;
        }else{
            String path = request.getContextPath();
            response.sendRedirect(path+"/"+"login.jsp");
            return false;
        }
    }
}
