package com.fh.service;

import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;

public interface ServiceCar {

    DataTableResult queryList(DataTablePageBean pageBean, ConditionQuery conditionQuery);

    void addCar(Car car);




    void delete(String ids);

    Car queryById(Integer id);

    void updateCar(Car car);
}
