package com.fh.service;

import com.fh.model.Book;
import com.fh.model.ConditionQuery;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;

public interface ServiceBook {
    DataTableResult queryList(DataTablePageBean pageBean, ConditionQuery conditionQuery);

    void addBook(Book book);

    Book queryById(Integer id);

    void alldelete(String ids);
}
