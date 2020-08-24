package com.fh.service.impl;

import com.fh.mapper.RoleMapper;
import com.fh.model.po.RoleQuery;
import com.fh.model.vo.Role;
import com.fh.service.RoleService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {


    @Autowired
    private RoleMapper roleMapper;


    //角色信息查询
    @Override
    public DataTableResult queryRoleList(RoleQuery roleQuery) {
        //1.查询总条数
        Long count = roleMapper.queryRoleCount(roleQuery);

        //2.查询当前页数据
        List<Role> roleList = roleMapper.queryRoleList(roleQuery);

        DataTableResult dataTableResult = new DataTableResult(roleQuery.getDraw(),count,count,roleList);

        return dataTableResult;
    }

    @Override
    public void addRole(Role role) {
        role.setCreateDate(new Date());
        roleMapper.addRole(role);

    }

    @Override
    public Role queryById(int roleId) {
        return roleMapper.queryById(roleId);
    }

}
