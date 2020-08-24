package com.fh.service.impl;

import com.fh.mapper.CarMapper;
import com.fh.model.Brand;
import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.service.CarService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarMapper mapper;

    @Override
    public DataTableResult queryList(ConditionQuery conditionQuery) {
        //查询总条数
        long count = mapper.queryCount(conditionQuery);

        //查询数据
        List<Car> dataList = mapper.queryList(conditionQuery);

        //组装分页数据
        DataTableResult dataTableResult = new DataTableResult(conditionQuery.getDraw(),count,count,dataList);

        return dataTableResult;
    }

    @Override
    public List<Brand> queryPullDownList() {
        return mapper.queryPullDownList();
    }

    @Override
    public void addEntity(Car car) {
        mapper.addEntity(car);
    }
}
