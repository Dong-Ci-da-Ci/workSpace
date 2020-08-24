package com.fh.controller;

import com.fh.model.po.AttributeQuery;
import com.fh.model.po.RoleQuery;
import com.fh.model.vo.Role;
import com.fh.service.RoleService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("RoleController")
public class RoleController {

    @Autowired
    private RoleService roleService;

    //前往列表显示页面
    @RequestMapping("toList")
    public String toList(){
        return "role/role-list";
    }



    //分页条件查询角色信息
    @RequestMapping("queryRoleList")
    @ResponseBody
    public DataTableResult queryRoleList(RoleQuery roleQuery){
        DataTableResult dataTableResult = roleService.queryRoleList(roleQuery);
        return dataTableResult;
    }

    // 添加角色
    @RequestMapping("addRole")
    @ResponseBody
    public Map<String,Object> addRole(Role role){
        Map<String,Object> map = new HashMap<>();
        try {
            roleService.addRole(role);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        return map;
    }

    /*//回显queryById
    @RequestMapping("queryById")
    @ResponseBody
    public Role queryById(Integer roleId) {
        return roleService.queryById(roleId);
    }*/

    //回显queryAttributeById根据id查询单条记录
    @RequestMapping("queryById")
    @ResponseBody
    public Map<String,Object> queryById(int roleId){
        Map<String,Object> map = new HashMap<>();
        try {
            Role role = roleService.queryById(roleId);
            map.put("success",true);
            map.put("role",role);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }




}
