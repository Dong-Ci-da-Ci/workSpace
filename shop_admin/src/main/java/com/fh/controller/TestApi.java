package com.fh.controller;


import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("TestApi")
public class TestApi {

    @RequestMapping("test")
    @ResponseBody
    public void test(@RequestBody JSONObject json, HttpServletRequest request){
        String name = request.getHeader("name");
        System.out.println(name);
        System.out.println(json.toString());
        System.out.println("接口调用成功!");


    }
}
