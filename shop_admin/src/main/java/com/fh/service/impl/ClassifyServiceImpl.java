package com.fh.service.impl;

import com.fh.mapper.ClassifyMapper;
import com.fh.model.vo.Classify;
import com.fh.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassifyServiceImpl implements ClassifyService {

    @Autowired
    private ClassifyMapper classifyMapper;

    @Override
    public List<Classify> queryClassifyList() {
        return classifyMapper.queryClassifyList();

    }

    @Override
    public List<Classify> queryClassifyListByPid(Integer pId) {
        return classifyMapper.queryClassifyListByPid(pId);
    }
}
