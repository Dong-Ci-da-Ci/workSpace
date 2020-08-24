package com.fh.service;

import com.fh.model.vo.Product;
import com.fh.model.vo.ProductSku;

import java.util.List;

public interface ProductSkuService {
    void batchAddProductSku(List<ProductSku> productSkuList);


    List<ProductSku> queryProductSkuList(Integer id);

    void deleteProductSkuByProductId(Integer id);
}
