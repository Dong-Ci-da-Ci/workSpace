package com.fh.service.impl;

import com.fh.mapper.CarMapper;
import com.fh.model.Car;
import com.fh.model.ConditionQuery;
import com.fh.service.ServiceCar;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.awt.print.Pageable;
import java.util.List;


@Service
public class ServiceCarImpl implements ServiceCar {

    @Autowired
    private CarMapper carMapper;


    @Override
    public DataTableResult queryList(DataTablePageBean pageBean, ConditionQuery conditionQuery) {

        //1.查询总条数
        Long count = carMapper.queryCarCount();
        //2.查询当前页数据
        List<Car> drugList = carMapper.queryCarList(pageBean);
        DataTableResult dataTableResult = new DataTableResult();
        dataTableResult.setData(drugList); // page.getContent()：从Page对象中获取查询到的集合
        dataTableResult.setDraw(pageBean.getDraw());
        dataTableResult.setRecordsFiltered(count);
        dataTableResult.setRecordsTotal(count);
        return dataTableResult;
    }

    //新增
    @Override
    public void addCar(Car car) {
        carMapper.addCar(car);

    }
    //piliang删除
    @Override
    public void delete(String ids) {
        String[] idsArr = ids.split(",");
        for (int i = 0; i < idsArr.length;i++){
            carMapper.delete(Integer.parseInt(idsArr[i]));
        }


    }

    //回显
    @Override
    public Car queryById(Integer id) {
        return carMapper.queryById(id);
    }

    @Override
    public void updateCar(Car car) {
        carMapper.updateCar(car);
    }
}