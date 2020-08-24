package com.fh.service;

import com.fh.model.po.ProductQuery;
import com.fh.model.vo.Brand;
import com.fh.model.vo.Product;
import com.fh.model.vo.ProductInfo;
import com.fh.util.DataTableResult;

import java.util.List;

public interface ProductService {
    DataTableResult queryProductList(ProductQuery productQuery);

    List<Brand> querybrandList();

    void addProduct(ProductInfo productInfo);

    Product getProductById(Integer id);

    void updateProduct(ProductInfo productInfo);
}
