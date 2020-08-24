package com.fh.service.impl;

import com.fh.mapper.CarMapper;
import com.fh.model.Brand;
import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.service.CarService;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Service
public class CarServiceImpl implements CarService {
    @Autowired
    private CarMapper carMapper;

    @Override
    public DataTableResult queryList(ConditionQuery conditionQuery) {
        if(StringUtils.isNotBlank(conditionQuery.getPerson())){
            conditionQuery.setPersonList(Arrays.asList(conditionQuery.getPerson().split(",")));
        }


        //1.查询总条数
        Long count =  carMapper.queryCount(conditionQuery);

        //2.当前页数据
        List<Car> carList = carMapper.queryCarList(conditionQuery);
        //创建分页对象
        DataTableResult dataTableResult = new DataTableResult();
        //查询总条数
        dataTableResult.setRecordsTotal(count);
        dataTableResult.setRecordsFiltered(count);
        dataTableResult.setDraw(conditionQuery.getDraw());
        //查出来的数据
        dataTableResult.setData(carList);
        return dataTableResult;
    }

    @Override
    public List<Brand> queryPullDownList() {
        return carMapper.queryPullDownList();
    }

    @Override
    public void addCar(Car car) {
        carMapper.addCar(car);
    }

    @Override
    public void deleteCar(int carId) {
        carMapper.deleteCar(carId);
    }

    @Override
    public void deleteBatchCar(List<Integer> carIdList) {
        carMapper.deleteBatchCar(carIdList);
    }

    @Override
    public Car queryById(Integer carId) {
        return carMapper.queryCarById(carId);
    }

    @Override
    public void updateCar(Car car) {
        car.setUpdateDate(new Date());
        carMapper.updateCar(car);

    }

    @Override
    public List<Car> queryAllCarList() {
        return carMapper.queryAllCarList();
    }
    @Override

    public void batchAddCar(List<Car> carList) {
        carMapper.batchAddCar(carList);
    }

    @Override
    public List<Car> queryCarListNoPage(ConditionQuery conditionQuery) {

        return carMapper.queryCarListNoPage(conditionQuery);
    }




}
