package com.fh.service.impl;

import com.fh.mapper.MovieMapper;
import com.fh.model.Area;
import com.fh.model.ConditionQuery;
import com.fh.model.Movie;
import com.fh.service.MovieService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieMapper mapper;

    @Override
    public DataTableResult queryList(ConditionQuery conditionQuery) {
        conditionQuery.setPersonList(Arrays.asList(conditionQuery.getPerson().split(",")));
        //查询总条数
        long count = mapper.queryCount(conditionQuery);

        //查询数据
        List<Movie> dataList = mapper.queryList(conditionQuery);

        //组装分页数据
        DataTableResult dataTableResult = new DataTableResult(conditionQuery.getDraw(),count,count,dataList);

        return dataTableResult;
    }

    @Override
    public List<Area> queryPullDownList() {
        return mapper.queryPullDownList();
    }

    @Override
    public void addEntity(Movie movie) {
        mapper.addEntity(movie);
    }

    @Override
    public Movie queryById(Integer mid) {
        return mapper.queryById(mid);
    }

    @Override
    public void updateEntity(Movie movie) {

       movie.setUpdateTime(new Date());

        mapper.updateEntity(movie);
    }

    @Override
    public void deleteEntity(int id) {
        mapper.deleteEntity(id);
    }

    @Override
    public void deleteBatchEntity(List<Integer> drugIdList) {

        mapper.deleteBatchEntity(drugIdList);
    }


}
