package com.fh.mapper;

import com.fh.model.Brand;
import com.fh.model.Car;
import com.fh.model.ConditionQuery;

import java.util.List;

public interface CarMapper {
    Long queryCount(ConditionQuery conditionQuery);

    List<Car> queryCarList(ConditionQuery conditionQuery);

    List<Brand> queryPullDownList();

    void addCar(Car car);


    void deleteCar(int carId);

    void deleteBatchCar(List<Integer> carIdList);

    Car queryCarById(Integer carId);

    void updateCar(Car car);

    List<Car> queryAllCarList();

    void batchAddCar(List<Car> carList);

    List<Car> queryCarListNoPage(ConditionQuery conditionQuery);

}
