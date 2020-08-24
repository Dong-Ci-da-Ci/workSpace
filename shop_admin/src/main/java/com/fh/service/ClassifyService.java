package com.fh.service;

import com.fh.model.vo.Classify;

import java.util.List;

public interface ClassifyService {
    List<Classify> queryClassifyList();

    List<Classify> queryClassifyListByPid(Integer pId);
}
