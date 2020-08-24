package com.fh.service.impl;

import com.fh.mapper.ProductSkuMapper;
import com.fh.model.vo.ProductSku;
import com.fh.service.ProductSkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductSkuServiceImpl implements ProductSkuService {

    @Autowired
    private ProductSkuMapper productSkuMapper;


    @Override
    public void batchAddProductSku(List<ProductSku> productSkuList) {
        productSkuMapper.batchAddProductSku(productSkuList);
    }

    @Override
    public List<ProductSku> queryProductSkuList(Integer id) {
        return productSkuMapper.queryProductSkuList(id);

    }

    @Override
    public void deleteProductSkuByProductId(Integer id) {
        productSkuMapper.deleteProductSkuByProductId(id);
    }
}
