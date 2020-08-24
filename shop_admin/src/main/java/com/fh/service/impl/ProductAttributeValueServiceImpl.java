package com.fh.service.impl;

import com.fh.mapper.ProductAttributeValueMapper;
import com.fh.model.vo.ProductAttributeValue;
import com.fh.service.ProductAttributeValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductAttributeValueServiceImpl implements ProductAttributeValueService
{

    @Autowired
    private ProductAttributeValueMapper productAttributeValueMapper;

    @Override
    public void batchAddProductAttributeValue(List<ProductAttributeValue> productAttributeValueList) {
        productAttributeValueMapper.batchAddProductAttributeValue(productAttributeValueList);
    }

    @Override
    public List<ProductAttributeValue> getAttributeListByProductId(Integer id) {
        return productAttributeValueMapper.getAttributeListByProductId(id);
    }

    @Override
    public void deleteProductAttributeByProductId(Integer id) {

    }
}
