package com.fh.mapper;

import com.fh.model.po.AttributeQuery;
import com.fh.model.vo.Attribute;
import com.fh.model.vo.AttributeValue;

import java.util.List;

public interface AttributeValueMapper {


    void batchAddAttributeValue(List<AttributeValue> attributeValueList);

    void addAttributeValue(AttributeValue attributeValue);
}
