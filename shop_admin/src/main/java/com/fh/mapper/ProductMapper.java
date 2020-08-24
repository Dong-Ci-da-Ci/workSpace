package com.fh.mapper;

import com.fh.model.po.ProductQuery;
import com.fh.model.vo.Attribute;
import com.fh.model.vo.Brand;
import com.fh.model.vo.Product;

import java.util.List;

public interface ProductMapper {
    long queryProductCount(ProductQuery productQuery);

    List<Product> queryProductList(ProductQuery productQuery);

    List<Brand> querybrandList();

    void addProduct(Product product);

    Product getProductById(Integer id);

    void updateProduct(Product product);
}
