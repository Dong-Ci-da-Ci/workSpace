package com.fh.action;

import com.fh.model.Brand;
import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.service.PullDownListService;
import com.fh.service.ServiceCar;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("actionCar")
public class ActionCar {

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

    //queryPullDownList查询下拉
    @Autowired
    private PullDownListService sPullDownListService;
    @RequestMapping("queryPullDownList")
    @ResponseBody
    public List<Brand> queryMovieAreaList(){
        List<Brand> list = sPullDownListService.queryPullDownList();
        return list;
    }

    //addCar
    // 添加
    @RequestMapping("addCar")
    @ResponseBody
    public Map<String,Object> addCar(Car car){
        Map<String,Object> map = new HashMap<>();
        try {
            service.addCar(car);
            map.put("success" , true);

        } catch (Exception e) {
            e.printStackTrace();
            map.put("success" , false);
        }
        return map;
    }

    //回显queryById
    @RequestMapping("queryById")
    @ResponseBody
    public Car queryById(Integer carId) {
        return service.queryById(carId);
    }

    //批量删除
    @RequestMapping("allDelete")
    @ResponseBody
    public void allDelete(String ids) {
        //删除
        service.delete(ids);
    }










}
