package com.fh.controller;

import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.service.ServiceCar;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("carController")
public class CarController {

    @Autowired
    private ServiceCar service;

    //前往列表显示页面
    @RequestMapping("toList")
    public String toList(){
        return "car-show";
    }

    //查询
    @RequestMapping("queryList")
    @ResponseBody
    public DataTableResult queryList(DataTablePageBean pageBean, ConditionQuery conditionQuery) {
        return service.queryList(pageBean,conditionQuery);

    }

    //addCar新增
    @RequestMapping("addCar")
    @ResponseBody
    public Map<String,Object> addCar(Car car){
        Map<String,Object> map = new HashMap<>();
        try {
            service.addCar(car);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }

    //批量删除
    @RequestMapping("allDelete")
    @ResponseBody
    public void allDelete(String ids) {
        //删除
        service.delete(ids);
    }


    //回显queryById
    @RequestMapping("queryById")
    @ResponseBody
    public Car queryById(Integer id) {
        return service.queryById(id);
    }


    //addCar修改
    @RequestMapping("updateCar")
    @ResponseBody
    public Map<String,Object> updateCar(Car car){
        Map<String,Object> map = new HashMap<>();
        try {
            service.updateCar(car);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }













}
