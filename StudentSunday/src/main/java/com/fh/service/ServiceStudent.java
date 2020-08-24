package com.fh.service;

import com.fh.model.ConditionQuery;
import com.fh.model.Student;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;

public interface ServiceStudent {
    DataTableResult queryList(DataTablePageBean pageBean, ConditionQuery conditionQuery);

    void addStudent(Student student);

    Student queryById(Integer id);

    void alldelete(String ids);
}
