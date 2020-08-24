package com.fh.service.impl;

import com.fh.mapper.ShoesMapper;
import com.fh.model.ConditionQuery;
import com.fh.model.Shoes;
import com.fh.service.ShoesService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoesServiceImpl implements ShoesService {

    @Autowired
    private ShoesMapper mapper;


    //查询数据库中的数据
    @Override
    public DataTableResult queryList(ConditionQuery conditionQuery) {
        //先查询总条数
        Long count =  mapper.queryCount(conditionQuery);
        //查询数据
        List<Shoes> dataList =  mapper.queryList(conditionQuery);
        //组装分页数据
        DataTableResult dataTableResult = new DataTableResult(conditionQuery.getDraw(),count,count,dataList);


        return dataTableResult;
    }
}
