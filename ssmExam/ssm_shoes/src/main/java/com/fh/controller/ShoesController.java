package com.fh.controller;

import com.fh.model.ConditionQuery;
import com.fh.service.ShoesService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("shoesController")
public class ShoesController {

    @Autowired
    private ShoesService service;

    //前往展示页面
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

}
