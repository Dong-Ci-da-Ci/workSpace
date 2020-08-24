package com.fh.controller;

import com.fh.model.Area;
import com.fh.model.ConditionQuery;
import com.fh.model.Movie;
import com.fh.service.MovieService;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;
import com.fh.util.FileUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("movieController")
public class MovieController {

    @Autowired
    private MovieService service;

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
    public List<Area> queryPullDownList(){
        List<Area> list = service.queryPullDownList();
        return list;
    }

    //新增数据addEntity
    @RequestMapping("addEntity")
    @ResponseBody
    public Map<String,Object> addEntity(Movie movie){
        Map<String,Object> map = new HashMap<>();
        try {
            service.addEntity(movie);
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

    //回显queryById
    @RequestMapping("queryById")
    @ResponseBody
    public Movie queryById(Integer mid) {
        return service.queryById(mid);
    }

  /*  //修改
    @RequestMapping("updateEntity")
    @ResponseBody
    public Map<String,Object> updateEntity(Movie movie){
        Map<String,Object> map = new HashMap<>();
        try {
            service.updateEntity(movie);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }*/

    //修改数据&&删除本地图片
    @RequestMapping("updateEntity")
    @ResponseBody
    public Map<String,Object> updateEntity(Movie movie,String picture,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        try {
            if(StringUtils.isNotBlank(picture)){
                if(StringUtils.isNotBlank(movie.getImgUrl())){
                    ServletContext path = request.getServletContext();
                    String[] oldFileName = movie.getImgUrl().split(",");
                    for (int i = 0; i < oldFileName.length; i++) {
                        File file = new File(path+"/"+oldFileName[i]);
                        file.delete();
                    }
                }
            }
            service.updateEntity(movie);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }




    //删除deleteDrug
    @RequestMapping("deleteEntity")
    @ResponseBody
    public void deleteEntity(int id){
        service.deleteEntity(id);
    }


    //批量删除deleteBatchDrug
    @RequestMapping("deleteBatchEntity")
    @ResponseBody
    public Map<String,Object> deleteBatchEntity(@RequestParam("ids[]") List<Integer> drugIdList){
        Map<String,Object> map = new HashMap<>();
        try {
            service.deleteBatchEntity(drugIdList);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }









}
