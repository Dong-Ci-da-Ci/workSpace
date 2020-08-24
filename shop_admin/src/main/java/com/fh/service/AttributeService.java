package com.fh.service;

import com.fh.model.po.AttributeQuery;
import com.fh.model.vo.Attribute;
import com.fh.util.DataTableResult;
import org.springframework.stereotype.Service;

import java.util.List;


public interface AttributeService {
    DataTableResult queryAttributeList(AttributeQuery attributeQuery);

    void addAttribute(Attribute attribute);

    Attribute queryAttributeById(int id);

    void updateAttribute(Attribute attribute);

    void deleteAttribute(int id);

    List<Attribute> queryAttributeListByClassifyId(Integer classifyId);
}
