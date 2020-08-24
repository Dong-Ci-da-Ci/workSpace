package com.fh.mapper;

import com.fh.model.vo.ProductAttributeValue;

import java.util.List;

public interface ProductAttributeValueMapper {
    void batchAddProductAttributeValue(List<ProductAttributeValue> productAttributeValueList);

    List<ProductAttributeValue> getAttributeListByProductId(Integer id);
}
