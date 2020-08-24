package com.fh.mapper;

import com.fh.model.po.RoleQuery;
import com.fh.model.vo.Role;

import java.util.List;

public interface RoleMapper {
    //查询总条数
    Long queryRoleCount(RoleQuery roleQuery);
    //查询当前页数据
    List<Role> queryRoleList(RoleQuery roleQuery);

    void addRole(Role role);

    Role queryById(int roleId);
}
