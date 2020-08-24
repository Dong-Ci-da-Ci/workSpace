package com.fh.mapper;

import com.fh.model.vo.Classify;

import java.util.List;

public interface ClassifyMapper {
    List<Classify> queryClassifyList();

    List<Classify> queryClassifyListByPid(Integer pId);
}
