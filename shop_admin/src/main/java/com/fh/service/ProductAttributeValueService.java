package com.fh.service;

import com.fh.model.vo.ProductAttributeValue;

import java.util.List;

public interface ProductAttributeValueService {
    void batchAddProductAttributeValue(List<ProductAttributeValue> productAttributeValueList);

    List<ProductAttributeValue> getAttributeListByProductId(Integer id);

    void deleteProductAttributeByProductId(Integer id);
}
