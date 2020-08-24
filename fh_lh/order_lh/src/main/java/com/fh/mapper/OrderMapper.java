package com.fh.mapper;

import com.fh.model.ConditionQuery;
import com.fh.model.Order;
import com.fh.model.Product;

import java.util.List;

public interface OrderMapper {
    long queryCount(ConditionQuery conditionQuery);

    List<Order> queryList(ConditionQuery conditionQuery);

    List<Product> queryPullDownList();

    void addEntity(Order order);

    void deleteEntity(int orderId);
}
