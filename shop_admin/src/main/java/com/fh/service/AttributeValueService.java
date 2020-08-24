package com.fh.service;

import com.fh.model.vo.AttributeValue;

import java.util.List;

public interface AttributeValueService {

    void batchAddAttributeValue(List<AttributeValue> attributeValueList);

    void addAttributeValue(AttributeValue attributeValue);
}
