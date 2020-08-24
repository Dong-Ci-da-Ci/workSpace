package com.fh.service;

import com.fh.model.Area;
import com.fh.model.ConditionQuery;
import com.fh.model.Movie;
import com.fh.util.DataTableResult;

import java.util.List;

public interface MovieService {
    DataTableResult queryList(ConditionQuery conditionQuery);

    List<Area> queryPullDownList();


    void addEntity(Movie movie);

    Movie queryById(Integer mid);


    void updateEntity(Movie movie);

    void deleteEntity(int id);

    void deleteBatchEntity(List<Integer> drugIdList);
}
