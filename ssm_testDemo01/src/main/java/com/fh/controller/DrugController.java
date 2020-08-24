package com.fh.controller;

import com.fh.model.Area;
import com.fh.model.Brand;
import com.fh.model.ConditionQuery;
import com.fh.model.Drug;
import com.fh.service.DrugService;
import com.fh.util.DataTableResult;
import com.fh.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("drugController")
public class DrugController {

    @Autowired
    private DrugService service;


    //前往列表显示页面
    @RequestMapping("toList")
    public String toList(){
        return "Drug-show";
    }

    //查询数据&&分页查询
    @RequestMapping("queryDrugList")
    @ResponseBody
    public DataTableResult queryDrugList(ConditionQuery conditionQuery){
        DataTableResult dataTableResult= service.queryDrugList(conditionQuery);
        return dataTableResult;
    }

    // 添加
    @RequestMapping("addDrug")
    @ResponseBody
    public Map<String,Object> addDrug(Drug drug){
        Map<String,Object> map = new HashMap<>();
        try {
            service.addDrug(drug);
            map.put("success" , true);

        } catch (Exception e) {
            e.printStackTrace();
            map.put("success" , false);
        }
        return map;
    }

    //queryById回显
    @RequestMapping("queryById")
    @ResponseBody
    public Drug queryById(Integer id) {
        return service.queryById(id);
    }


    //修改updateDrug
    @RequestMapping("updateDrug")
    @ResponseBody
    public Map<String,Object> updateDrug(Drug drug){
        Map<String,Object> map = new HashMap<>();
        try {
            service.updateDrug(drug);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }

    //删除deleteDrug
    @RequestMapping("deleteDrug")
    @ResponseBody
    public void deleteDrug(int id){
        service.deleteDrug(id);

    }

    //批量删除deleteBatchDrug
    @RequestMapping("deleteBatchDrug")
    @ResponseBody
    public Map<String,Object> deleteBatchDrug(@RequestParam("ids[]") List<Integer> drugIdList){
        Map<String,Object> map = new HashMap<>();
        try {
            service.deleteBatchDrug(drugIdList);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }


    // 上传图片
    @RequestMapping("upload")
    @ResponseBody
    public Map<String,Object> upload(HttpServletRequest request, MultipartFile images){
        return FileUtil.uploadFile(request, images);
    }

    // 查询下拉列表
    @RequestMapping("queryPullDownList")
    @ResponseBody
    public List<Area> queryMovieAreaList(){
        List<Area> list = service.queryPullDownList();
        return list;
    }














}
