package com.fh.controller;

import com.fh.model.Brand;
import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.service.CarService;
import com.fh.util.DataTableResult;
import com.fh.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("carController")
public class CarController {

    @Autowired
    private CarService service;

    //跳转到查询页面
    @RequestMapping("toList")
    public String toList(){
        return "show";
    }

    //查询数据
    @RequestMapping("queryList")
    @ResponseBody
    public DataTableResult queryList(ConditionQuery conditionQuery){
        DataTableResult dataTableResult = service.queryList(conditionQuery);
        return dataTableResult;
    }

    //查询动态下拉列表queryPullDownList
    @RequestMapping("queryPullDownList")
    @ResponseBody
    public List<Brand> queryPullDownList(){
        List<Brand> list = service.queryPullDownList();
        return list;
    }

    //新增数据addEntity
    @RequestMapping("addEntity")
    @ResponseBody
    public Map<String,Object> addEntity(Car car){
        Map<String,Object> map = new HashMap<>();
        try {
            service.addEntity(car);
            map.put("success" , true);

        } catch (Exception e) {
            e.printStackTrace();
            map.put("success" , false);
        }
        return map;
    }

    // 上传图片
    @RequestMapping("upload")
    @ResponseBody
    public Map<String,Object> upload(HttpServletRequest request, MultipartFile images){
        return FileUtil.uploadFile(request, images);
    }












}
