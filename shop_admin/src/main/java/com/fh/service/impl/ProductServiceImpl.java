package com.fh.service.impl;

import com.fh.mapper.ProductMapper;
import com.fh.model.po.ProductQuery;
import com.fh.model.vo.*;
import com.fh.service.ProductAttributeValueService;
import com.fh.service.ProductService;
import com.fh.service.ProductSkuService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ProductAttributeValueService productAttributeValueService;

    @Autowired
    private ProductSkuService productSkuService;

    @Override
    public DataTableResult queryProductList(ProductQuery productQuery) {
        //查询总条数
        long count =  productMapper.queryProductCount(productQuery);
        //查询数据
        List<Product> productList =  productMapper.queryProductList(productQuery);
        //组装分页数据

        DataTableResult dataTableResult = new DataTableResult(productQuery.getDraw(),count,count,productList);


        return dataTableResult;
    }

    @Override
    public List<Brand> querybrandList() {
        return productMapper.querybrandList();
    }

    //新增
    @Override
    public void addProduct(ProductInfo productInfo) {
        // 获取商品数据
        Product product = productInfo.getProduct();
        productMapper.addProduct(product);

        // 获取商品属性值数据
        List<ProductAttributeValue> productAttributeValueList = productInfo.getProductAttributeValueList();
        for (int i = 0; i< productAttributeValueList.size(); i++){
            productAttributeValueList.get(i).setProductId(product.getId());
        }
        productAttributeValueService.batchAddProductAttributeValue(productAttributeValueList);

        // 获取商品sku数据
        List<ProductSku> productSkuList = productInfo.getProductSkuList();
        for (int i = 0; i< productSkuList.size(); i++){
            productSkuList.get(i).setProductId(product.getId());
        }
        productSkuService.batchAddProductSku(productSkuList);
    }

    @Override
    public Product getProductById(Integer id) {
        return productMapper.getProductById(id);
    }

    @Override
    public void updateProduct(ProductInfo productInfo) {
        // 修改商品信息
        Product product = productInfo.getProduct();
        productMapper.updateProduct(product);

        // 通过商品id删除商品之前的所有属性
        productAttributeValueService.deleteProductAttributeByProductId(product.getId());

        // 通过商品id删除商品之前的所有SKU
        productSkuService.deleteProductSkuByProductId(product.getId());

        // 获取商品属性值数据
        List<ProductAttributeValue> productAttributeValueList = productInfo.getProductAttributeValueList();
        for (int i = 0; i< productAttributeValueList.size(); i++){
            productAttributeValueList.get(i).setProductId(product.getId());
        }
        productAttributeValueService.batchAddProductAttributeValue(productAttributeValueList);

        // 获取商品sku数据
        List<ProductSku> productSkuList = productInfo.getProductSkuList();
        for (int i = 0; i< productSkuList.size(); i++){
            productSkuList.get(i).setProductId(product.getId());
        }
        productSkuService.batchAddProductSku(productSkuList);
    }


}
