package com.fh.service;

import com.fh.model.Brand;
import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.util.DataTableResult;

import java.util.List;

public interface CarService {
    DataTableResult queryList(ConditionQuery conditionQuery);

    List<Brand> queryPullDownList();


    void addEntity(Car car);
}
