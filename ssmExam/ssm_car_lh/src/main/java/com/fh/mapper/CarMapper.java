package com.fh.mapper;

import com.fh.model.Brand;
import com.fh.model.Car;
import com.fh.model.ConditionQuery;

import java.util.List;

public interface CarMapper {
    long queryCount(ConditionQuery conditionQuery);

    List<Car> queryList(ConditionQuery conditionQuery);

    List<Brand> queryPullDownList();

    void addEntity(Car car);
}
