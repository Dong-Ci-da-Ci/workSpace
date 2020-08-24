package com.fh.Action;

import com.fh.Service.UserService;
import com.fh.model.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("actionUser")
public class ActionUser {

    private UserService service;
   public Map<String,Object> login(String username, String password, HttpSession session) throws IOException {
       Map<String,Object> map = new HashMap<>();
       if(StringUtils.isNotEmpty(username)){
          User user =  service.queryByName(username);
          if(user == null){
              //用户是否存在
              map.put("code",3);
          }else {
              if (StringUtils.isNotEmpty(password)){
                  if (!user.getPassword().equals(password)){
                      map.put("code",4);
                  }else{
                      map.put("code",1);
                      session.setAttribute("user",user);
                  }
              }
          }

       }
       return null;
   }



}
