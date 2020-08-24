package com.fh.service.impl;

import com.fh.mapper.AttributeMapper;
import com.fh.mapper.AttributeValueMapper;
import com.fh.model.vo.AttributeValue;
import com.fh.service.AttributeValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttributeValueServiceImpl implements AttributeValueService {

    @Autowired
    private AttributeValueMapper attributeValueMapper;


    @Override
    public void batchAddAttributeValue(List<AttributeValue> attributeValueList) {
        attributeValueMapper.batchAddAttributeValue(attributeValueList);
    }

    @Override
    public void addAttributeValue(AttributeValue attributeValue) {
        attributeValueMapper.addAttributeValue(attributeValue);
    }
}
