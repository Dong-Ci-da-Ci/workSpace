package com.fh.service.impl;

import com.fh.mapper.OrderMapper;
import com.fh.model.ConditionQuery;
import com.fh.model.Order;
import com.fh.model.Product;
import com.fh.service.OrderService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper mapper;


    @Override
    public DataTableResult queryList(ConditionQuery conditionQuery) {
        //查询总条数
        long count = mapper.queryCount(conditionQuery);

        //查询数据
        List<Order> dataList = mapper.queryList(conditionQuery);

        //组装分页数据
        DataTableResult dataTableResult = new DataTableResult(conditionQuery.getDraw(),count,count,dataList);

        return dataTableResult;
    }

    @Override
    public List<Product> queryPullDownList() {
        return mapper.queryPullDownList();
    }

    @Override
    public void addEntity(Order order) {
        mapper.addEntity(order);
    }

    @Override
    public void deleteEntity(int orderId) {
        mapper.deleteEntity(orderId);
    }
}
