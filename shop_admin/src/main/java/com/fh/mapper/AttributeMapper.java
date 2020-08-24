package com.fh.mapper;

import com.fh.model.po.AttributeQuery;
import com.fh.model.vo.Attribute;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface AttributeMapper {

    long queryAttributeCount(AttributeQuery attributeQuery);

    List<Attribute> queryAttributeList(AttributeQuery attributeQuery);

    void addAttribute(Attribute attribute);

    Attribute queryAttributeById(int id);


    void updateAttribute(Attribute attribute);

    void deleteAttribute(int id);

    List<Attribute> queryAttributeListByClassifyId(Integer classifyId);
}
