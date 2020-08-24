package com.fh.service;

import com.fh.model.po.AttributeQuery;
import com.fh.model.po.RoleQuery;
import com.fh.model.vo.Role;
import com.fh.util.DataTableResult;

public interface RoleService {


    DataTableResult queryRoleList(RoleQuery roleQuery);

    void addRole(Role role);

    Role queryById(int roleId);
}
