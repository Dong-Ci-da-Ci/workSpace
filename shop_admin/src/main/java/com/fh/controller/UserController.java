package com.fh.controller;

import com.fh.model.vo.User;
import com.fh.service.UserService;
import com.fh.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("UserController")
public class UserController {
    @Autowired
    private UserService userService;

    //加载验证码
    @RequestMapping("yan")
    public void yan(HttpServletRequest req,HttpServletResponse resp) {
        ValidateUtil.createImage(req, resp);
    }

    @RequestMapping("dengLu")
    @ResponseBody
    public Map<String,Object> dengLu(String username, String Ppassword, String code, HttpServletRequest request, HttpServletResponse resp){
        Map<String,Object> map=new HashMap<String, Object>();
        HttpSession session = request.getSession();
        String cords = (String) session.getAttribute("cords");
        if(!cords.equals(code)) {
            map.put("cord", 2);
        }else {
            //获取用户
            User regis=userService.selectByName(username);
            // 自动解锁
            if(regis==null) {
                map.put("cord", 3);
            }else{
                if(!regis.getPassword().equals(Ppassword)) {
                    map.put("cord", 4);

                }else {
                    map.put("cord", 1);
                    session.setAttribute("regis", regis);
                }
            }
        }

        return map;
    }




}
