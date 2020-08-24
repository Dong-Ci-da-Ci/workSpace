package com.fh.service;

import com.fh.model.ConditionQuery;
import com.fh.model.Order;
import com.fh.model.Product;
import com.fh.util.DataTableResult;

import java.util.List;

public interface OrderService {
    DataTableResult queryList(ConditionQuery conditionQuery);

    List<Product> queryPullDownList();

    void addEntity(Order order);

    void deleteEntity(int orderId);
}
