package com.fh.controller;

import com.fh.model.ConditionQuery;
import com.fh.model.Order;
import com.fh.model.Product;
import com.fh.service.OrderService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("orderController")
public class OrderController {

    @Autowired
    private OrderService service;

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
    public List<Product> queryPullDownList(){
        List<Product> list = service.queryPullDownList();
        return list;
    }

    //新增数据addEntity
    @RequestMapping("addEntity")
    @ResponseBody
    public Map<String,Object> addEntity(Order order){
        Map<String,Object> map = new HashMap<>();
        try {
            service.addEntity(order);
            map.put("success" , true);

        } catch (Exception e) {
            e.printStackTrace();
            map.put("success" , false);
        }
        return map;
    }

    //删除deleteDrug
    @RequestMapping("deleteEntity")
    @ResponseBody
    public void deleteEntity(int orderId){
        service.deleteEntity(orderId);
    }


}
