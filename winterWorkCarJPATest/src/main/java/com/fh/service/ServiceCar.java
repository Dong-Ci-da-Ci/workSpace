package com.fh.service;

import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;

public interface ServiceCar {
    DataTableResult queryList(DataTablePageBean pageBean, ConditionQuery conditionQuery);

    void addCar(Car car);

    Car queryById(Integer carId);


    void delete(String ids);

}
