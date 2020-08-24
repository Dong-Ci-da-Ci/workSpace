package com.fh.action;

import com.fh.model.Area;
import com.fh.model.ConditionQuery;
import com.fh.model.Student;
import com.fh.service.PullDownListService;
import com.fh.service.ServiceStudent;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;
import com.fh.util.FileUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("actionSudent")
public class ActionSudent {

    @Autowired
    private ServiceStudent service;

    //前往列表显示页面
    @RequestMapping("toList")
    public String toList(){
        return "student-show";
    }

    //查询
    @RequestMapping("queryList")
    @ResponseBody
    public DataTableResult queryList(DataTablePageBean pageBean,ConditionQuery conditionQuery) {
        return service.queryList(pageBean,conditionQuery);
    }

    //queryPullDownList查询下拉
    @Autowired
    private PullDownListService sPullDownListService;
    @RequestMapping("queryPullDownList")
    @ResponseBody
    public List<Area> queryMovieAreaList(){
        List<Area> list = sPullDownListService.queryPullDownList();
        return list;
    }

    // 上传图片
    @RequestMapping("upload")
    @ResponseBody
    public Map<String,Object> upload(HttpServletRequest request, MultipartFile images){
        return FileUtil.uploadFile(request, images);
    }

    // 添加
    @RequestMapping("addStudent")
    @ResponseBody
    public Map<String,Object> addStudent(Student student){
        Map<String,Object> map = new HashMap<>();
        try {
            service.addStudent(student);
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
    public Student queryById(Integer id) {
        return service.queryById(id);
    }

    //批量删除
    @RequestMapping("allDelete")
    @ResponseBody
    public void allDelete(String ids,HttpServletRequest request) {
        //删除图片
        if(StringUtils.isNotBlank(ids)){
            String[] idarr = ids.split(",");
            for (int i = 0; i < idarr.length; i++) {
                Student s = service.queryById(Integer.parseInt(idarr[i]));
                if(StringUtils.isNotBlank(s.getStuImg())){
                    // 获取项目发布的路径
                    String path = request.getServletContext().getRealPath("images");

                    // 分隔图片名
                    String[] arr = s.getStuImg().split(",");

                    for (int j = 0; j < arr.length; j++) {

                        File file = new File(path +"/"+ arr[j]);

                        // 删除图片
                        file.delete();
                    }
                }

            }
            //删除
            service.alldelete(ids);
        }
    }















}
