package com.fh.service;

import com.fh.model.Brand;
import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;

import java.util.List;

public interface CarService {
    DataTableResult queryList( ConditionQuery conditionQuery);

    List<Brand> queryPullDownList();

    void addCar(Car car);

    void deleteCar(int carId);

    void deleteBatchCar(List<Integer> carIdList);

    Car queryById(Integer carId);

    void updateCar(Car car);

    List<Car> queryAllCarList();

    void batchAddCar(List<Car> carList);

    List<Car> queryCarListNoPage(ConditionQuery conditionQuery);


}
