package com.fh.mapper;

import com.fh.model.Car;

import com.fh.util.DataTablePageBean;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;


import java.awt.print.Pageable;
import java.util.List;


public interface CarMapper {


    Long queryCarCount();


    List<Car> queryCarList(DataTablePageBean pageBean);

    void addCar(Car car);


    void delete(int id);

    Car queryById(Integer id);

    void updateCar(Car car);
}
