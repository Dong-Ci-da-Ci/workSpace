package com.fh.controller;

import com.fh.model.vo.Classify;
import com.fh.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("ClassifyController")
public class ClassifyController {

    @Autowired
    private ClassifyService classifyService;

    //查询所有分类queryClassifyList
    @RequestMapping("queryClassifyList")
    @ResponseBody
    public Map<String,Object>  queryClassifyList(){
        Map<String,Object> map = new HashMap<>();
        try {
            List<Classify> classifyList =  classifyService.queryClassifyList();
            map.put("success",true);
            map.put("classifyList",classifyList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    // 根据Pid查询分类列表
    @RequestMapping("queryClassifyListByPid")
    @ResponseBody
    public Map<String,Object> queryClassifyListByPid(Integer pId){
        Map<String,Object> map = new HashMap<>();
        try {
            List<Classify> classifyList = classifyService.queryClassifyListByPid(pId);
            map.put("success",true);
            map.put("classifyList",classifyList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }



}
