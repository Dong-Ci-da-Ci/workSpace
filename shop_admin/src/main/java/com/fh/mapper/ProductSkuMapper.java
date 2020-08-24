package com.fh.mapper;

import com.fh.model.vo.ProductSku;

import java.util.List;

public interface ProductSkuMapper {
    void batchAddProductSku(List<ProductSku> productSkuList);

    List<ProductSku> queryProductSkuList(Integer id);

    void deleteProductSkuByProductId(Integer id);
}
