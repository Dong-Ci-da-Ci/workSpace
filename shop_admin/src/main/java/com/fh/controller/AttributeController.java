package com.fh.controller;

import com.fh.model.po.AttributeQuery;
import com.fh.model.vo.Attribute;
import com.fh.model.vo.Classify;
import com.fh.service.AttributeService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("attributeController")
public class AttributeController {

    @Autowired
    private AttributeService attributeService;

    //前往列表显示页面
    @RequestMapping("toList")
    public String toList(){
        return "attribute/attribute-list";
    }


    //查询数据
    @RequestMapping("queryAttributeList")
    @ResponseBody
    public DataTableResult queryAttributeList(AttributeQuery attributeQuery){
       DataTableResult dataTableResult= attributeService.queryAttributeList(attributeQuery);
       return dataTableResult;
    }

    //新增数据addAttribute
    @RequestMapping("addAttribute")
    @ResponseBody
    public Map<String,Object> addAttribute(Attribute attribute){
        Map<String,Object> map = new HashMap<>();
        try {
            attributeService.addAttribute(attribute);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }

    // 根据分类id查询属性
    @RequestMapping("queryAttributeListByClassifyId")
    @ResponseBody
    public Map queryAttributeListByClassifyId(Integer classifyId){
        Map<String,Object> map = new HashMap<>();
        try {
            List<Attribute> arrributeList = attributeService.queryAttributeListByClassifyId(classifyId);
            map.put("arrributeList",arrributeList);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }

    //回显queryAttributeById根据id查询单条记录
    @RequestMapping("queryAttributeById")
    @ResponseBody
    public Map<String,Object> queryAttributeById(int id){
        Map<String,Object> map = new HashMap<>();
        try {
            Attribute attribute = attributeService.queryAttributeById(id);
            map.put("success",true);
            map.put("attribute",attribute);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }

    //修改updateAttribute
    @RequestMapping("updateAttribute")
    @ResponseBody
    public Map<String,Object> updateAttribute(Attribute attribute){
        Map<String,Object> map = new HashMap<>();
        try {
            attributeService.updateAttribute(attribute);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }


    // 删除属性
    @RequestMapping("deleteAttribute")
    @ResponseBody
    public Map<String,Object> deleteAttribute(int id){
        Map<String,Object> map = new HashMap<>();
        try {
            attributeService.deleteAttribute(id);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;

    }




}
